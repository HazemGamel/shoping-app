import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:socialapp/View/cartview.dart';
import 'package:socialapp/View/controlerview.dart';
import 'package:socialapp/constants.dart';

class CheckViewModel extends GetxController{

  int _index=0;
  int get index=>_index;

  Pages _pages = Pages.DeliveryTime;
  Pages get pages => _pages;
  String street1,street2,city,state,country;
  GlobalKey<FormState> formkey=GlobalKey<FormState>();

  Color getColor(int i) {
    if (i == _index) {
      return inProgressColor;
    } else if (i < _index) {
      return Colors.green;
    } else {
      return todoColor;
    }
  }

  void changIndex(int i){
    if(i==0 || i<0){
      //Get.to(ControllerView());
      _pages=Pages.DeliveryTime;
      _index=i;
    }
    else if(i==1){
      _pages=Pages.AddAddress;
      _index=i;
    }
    else if(i==2){
      formkey.currentState.save();
      if(formkey.currentState.validate()){
        _pages=Pages.Summary;
        _index=i;
      }
    }else if(i==3){
      Get.to(ControllerView());
      _pages=Pages.DeliveryTime;
      _index=0;
      Get.snackbar('Successfully', 'Your request is in progress',
      snackPosition: SnackPosition.TOP,
      duration: Duration(milliseconds: 3000),
      icon: Icon(Icons.done,color: Colors.green,),
      backgroundColor: Colors.grey[200]);
    }
    update();
  }
}