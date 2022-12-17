
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:socialapp/View/registerview.dart';
import 'package:socialapp/constants.dart';
import 'package:socialapp/view_model/authviewmodel.dart';
import 'package:socialapp/widgets/customfbutton.dart';
import 'package:socialapp/widgets/customtext.dart';
import 'package:socialapp/widgets/customtextform.dart';

class LoginScreen extends GetWidget<AuthViewModel> {
final _formkey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
     appBar: AppBar(
       elevation: 0,
       backgroundColor: Colors.white,
     ),
      body: Padding(
        padding: const EdgeInsets.only(top:20,right: 20,left: 20),
        child: SingleChildScrollView(
          child: Form(
            key:_formkey ,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(text: 'Welcome,',fontsize: 30,
                      fontfamily: 'Signatra',),
                    GestureDetector(
                      onTap: (){
                        Get.to(RegisterView());
                      },
                        child: CustomText(text: 'Sign Up',color: primarycolor,fontsize: 20,)),
                  ],
                ),
                CustomText(text: 'sign in to continue',
                  fontsize: 15,color: Colors.grey,alignment: Alignment.topLeft,),
                SizedBox(height: 20,),
                CustomTextForm(text: 'Email',hint: 'mm@gmail.com',
                  onsave: (value){
                    controller.email=value;
                  },validator: (value){
                  if(value.isEmpty){
                    return 'Please enter your email';
                  }
                  return null;
                  },),
                SizedBox(height: 10,),
                CustomTextForm(text: 'Password',
                  hint: '********',onsave: (value){
                  controller.password=value;
                  },
                  validator: (value){
                    if(value.isEmpty){
                      return 'Please enter your password';
                    }
                    return null;
                  },),
                SizedBox(height: 10,),
                CustomText(text: 'Forget Password ?',alignment: Alignment.topRight,),
                SizedBox(height: 10,),
                CustomButton(text: 'Sign in',onpressed: (){
                  _formkey.currentState.save();
                  if(_formkey.currentState.validate()){
                    controller.signinwithemailandpass();
                  }
                },),
                SizedBox(height: 10,),
                CustomText(text: '-OR-',alignment: Alignment.center,),
                SizedBox(height: 10,),
                FlatButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),

                  ),
                    color: Colors.grey[200],
                    onPressed:(){
                    controller.signinwithgoogle();
                    },
                    child: Row(
                      children: [
                        Container(
                            child:Image.asset('assets/images/google.jpg'),
                          height: 40,
                          width: 40,
                        ),
                        SizedBox(width: 40,),
                        CustomText(text: 'sign in by Google',alignment: Alignment.center,),
                      ],
                    ),
                ),
                SizedBox(height: 10,),
                FlatButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),

                  ),
                  color: Colors.grey[200],
                  onPressed:(){},
                  child: Row(
                    children: [
                      Container(
                        child:Image.asset('assets/images/facebook.png'),
                        height: 40,
                        width: 40,
                      ),
                      SizedBox(width: 40,),
                      CustomText(text: 'sign in by FaceBook',alignment: Alignment.center,),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
