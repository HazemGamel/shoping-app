import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:socialapp/View/Homescreen.dart';
import 'package:socialapp/View/accountview.dart';
import 'package:socialapp/View/cartview.dart';

class ControlViewModel extends GetxController{
  int _indexnav=0;
  get indexnav=>_indexnav;

  Widget _currentscrren =HomeScreen();
  get currentscrren=>_currentscrren;

  void changeNav(int select){
    _indexnav=select;
    switch(select){
      case 0:{
        _currentscrren=HomeScreen();
        break;
      }
      case 1:{
        _currentscrren=CartView();
        break;
      }
      case 2:{
        _currentscrren=AccountView();
        break;
      }
    }
    update();
  }
}