import 'dart:convert';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:socialapp/models/usermodel.dart';

class LocalStorageDate extends GetxController{

  Future<UserModel> get userdata async{
    try {
      UserModel userModel = await _getuserdate();
      if(userModel== null){
        return null;
      }
      return userModel;
    }catch(e){
      print("error sh is $e");
      return null;
    }

  }

  setuser(UserModel userModel)async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('user', json.encode(userModel.toJson()));
  }

  _getuserdate()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
   var value= await prefs.getString('user');
   return UserModel.fromJson(json.decode(value.toString()));

  }

  deletuser()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
       await prefs.clear();
  }
}