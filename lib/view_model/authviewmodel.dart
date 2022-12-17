import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:socialapp/View/Homescreen.dart';
import 'package:socialapp/View/controlerview.dart';
import 'package:socialapp/models/usermodel.dart';
import 'package:socialapp/service/firstormodel.dart';
import 'package:socialapp/service/local_storage.dart';

class AuthViewModel extends GetxController{
GoogleSignIn _googleSignIn= GoogleSignIn();
//FacebookLogin facebookLogin=FacebookLogin();
FirebaseAuth _auth=FirebaseAuth.instance;

String email,password,name;

Rxn<User> _user= Rxn<User>();

 get user=> _user.value?.email;
 final LocalStorageDate localStorageDate = Get.find();
@override
  void onInit(){
  super.onInit();
  _user.bindStream(_auth.authStateChanges());
  if(_auth.currentUser != null) {
    getdata(_auth.currentUser.uid);
  }
  }

@override
void onReady(){
  super.onReady();
}
@override
void onClose(){
  super.onClose();
}
 void signinwithgoogle()async{
  GoogleSignInAccount googleuser=await _googleSignIn.signIn();
    final  googleSignInAuthentication=
    await googleuser.authentication;
   final AuthCredential credential= GoogleAuthProvider.credential(
      idToken:googleSignInAuthentication.idToken ,
      accessToken:googleSignInAuthentication.accessToken ,
    );
   await _auth.signInWithCredential(credential).
   then((value)async{
     saveuser(value);
   }).catchError((y){
     print("yerrror is $y");
   });
  Get.offAll(ControllerView());
   update();
 }
//void signinwithfacebook()async{
//  final FacebookLoginResult result=await facebookLogin.logIn();
//  final accestoken=result.accessToken.token;
//  if(result.status==FacebookLoginStatus.success){
//   final facebookcredentio= FacebookAuthProvider.credential(accestoken);
//    await _auth.signInWithCredential(facebookcredentio);
//  }
//}

void signinwithemailandpass()async{
  try{
    await _auth.signInWithEmailAndPassword(email: email, password: password)
    .then((value)async{
      await Firestormodel().currentuser(value.user.uid).then((value){
       setuser(UserModel.fromJson(value.data()));
      }).catchError((e){
        print("rrrr is $e");
      });
  });
      Get.offAll(ControllerView());

  }catch(e){
    Get.snackbar('Not Found', 'This account not found please register now',colorText: Colors.red,
    backgroundColor: Colors.grey,icon: Icon(Icons.error_outline));
    print("error login is$e");
  }
}

  void Createmailwithemailandpass()async{
    try{
      await _auth.createUserWithEmailAndPassword(email: email, password: password).
      then((user)async {
        saveuser(user);
      });
      Get.offAll(ControllerView());
      Get.snackbar('congratulations', 'You are logged in successfully',colorText: Colors.green,
      backgroundColor: Colors.grey[200],icon: Icon(Icons.done));

    }catch(e){
      print("error register is$e");
    }
  }

 void  saveuser(UserCredential user)async{
  UserModel userModel=UserModel(
    userId: user.user.uid,
    email: user.user.email,
    name: name==null?user.user.displayName:name,
    password: password,
    pic: 'https://www.skynewsarabia.com/images/v1/2021/06/16/1445027/800/450/1-1445027.jpg?squareBlurBg=true',
  );
   await Firestormodel().addtofirstore(userModel);
   setuser(userModel);
 }
 void setuser(UserModel userModel)async{
   await localStorageDate.setuser(userModel);
 }

 void getdata(String uid)async{
   await Firestormodel().currentuser(uid).then((value){
     setuser(UserModel.fromJson(value.data()));
   });
 }
}