import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:socialapp/View/Homescreen.dart';
import 'package:socialapp/View/loginscreen.dart';
import 'package:socialapp/view_model/authviewmodel.dart';
import 'package:socialapp/view_model/controllviewmodel.dart';

import '../constants.dart';

class ControllerView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Obx(
        (){
          return (Get.find<AuthViewModel>().user == null)
              ?LoginScreen():GetBuilder<ControlViewModel>(
            init: ControlViewModel(),
               builder: (controller)=>
                  Scaffold(
                body: controller.currentscrren,
            bottomNavigationBar: bottomnavigationBar(),
          ),
              );
        }
    );
  }
  Widget bottomnavigationBar(){
    return GetBuilder<ControlViewModel>(
      init: Get.find(),
      builder: (controller)=>
          BottomNavigationBar(
            items: [
              BottomNavigationBarItem(
                activeIcon: Text("Explore",style: TextStyle(color: Colors.black,fontSize: 20),),
                icon: Icon(Icons.whatshot),
                label: '',
              ),
              BottomNavigationBarItem(
                activeIcon: Text("Cart",style: TextStyle(color: Colors.black,fontSize: 20)),
                icon: Icon(Icons.shopping_cart),
                label: '',
              ),
              BottomNavigationBarItem(
                activeIcon: Text("Account",style: TextStyle(color: Colors.black,fontSize: 20)),
                icon: Icon(Icons.person),
                label: '',
              ),
            ],
            elevation: 0,
            selectedItemColor: primarycolor,
            backgroundColor: Colors.grey[100],
            currentIndex: controller.indexnav,
            onTap: (index){
              controller.changeNav(index);
            },
          ),
    );
  }
}
