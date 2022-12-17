import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:socialapp/View/loginscreen.dart';
import 'package:socialapp/view_model/authviewmodel.dart';
import 'package:socialapp/widgets/customfbutton.dart';
import 'package:socialapp/widgets/customtext.dart';
import 'package:socialapp/widgets/customtextform.dart';

class RegisterView extends GetWidget<AuthViewModel> {
  final _formkey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(icon: Icon(Icons.arrow_back_ios),color: Colors.black,
        onPressed: (){
          Get.to(LoginScreen());
        },),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top:20,right: 20,left: 20),
        child: SingleChildScrollView(
          child: Form(
            key:_formkey ,
            child: Column(
              children: [
                CustomText(text: 'Sign Up,',fontsize: 40,
                  fontfamily: 'Signatra',),
                SizedBox(height: 20,),
                CustomTextForm(text: 'Name',hint: 'mmm',
                  onsave: (value){
                    controller.name=value;
                  },validator: (value){
                    if(value.isEmpty){
                      return 'Please enter your name';
                    }
                    return null;
                  },),
                SizedBox(height: 10,),
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
                CustomButton(text: 'Sign Up',onpressed: (){
                  _formkey.currentState.save();
                  if(_formkey.currentState.validate()){
                    controller.Createmailwithemailandpass();
                  }
                },),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
