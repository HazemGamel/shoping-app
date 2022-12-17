import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:socialapp/models/usermodel.dart';
import 'package:socialapp/service/local_storage.dart';

class ProfileModel extends GetxController{

  ValueNotifier<bool> get loeading => _loeading;
  ValueNotifier<bool> _loeading=ValueNotifier(false);
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getcurrrentuser();
  }
  final LocalStorageDate localStorageDate=Get.find();
  UserModel get usermodel => _userModel;
  UserModel _userModel;
  Future<void> singout()async{
    GoogleSignIn().signOut();
    FirebaseAuth.instance.signOut();
     localStorageDate.deletuser();
     update();
  }

  getcurrrentuser()async{
    _loeading.value=true;
    await localStorageDate.userdata.then((value) {
      _userModel=value;
      print(value);
    });
    _loeading.value=false;
    update();
  }
}