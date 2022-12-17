import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:socialapp/View/loginscreen.dart';
import 'package:socialapp/view_model/profilemodel.dart';
import 'package:socialapp/widgets/customtext.dart';

class AccountView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileModel>(
      init: ProfileModel(),
      builder:(controller)=>controller.loeading.value?Center(child: CircularProgressIndicator()): Scaffold(
        body: Container(
          padding: EdgeInsets.only(top: 40),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: Colors.red,
                          image: DecorationImage(
                            image: controller.usermodel==null?
                            AssetImage('assets/images/mR.jpg'):
                            controller.usermodel.pic=='def'?
                            AssetImage('assets/images/mR.jpg'):
                                    NetworkImage(controller.usermodel.pic),
                            fit: BoxFit.fill,
                          )
                        ),

                      ),
                      Column(
                        children: [
                          CustomText(text: controller.usermodel.name,fontsize: 30,color: Colors.black,),
                          CustomText(text: controller.usermodel.email,fontsize: 20,color: Colors.grey,),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 30,),
                Container(
                  padding: EdgeInsets.only(left: 70),
                  child: CustomText(text: 'TRUST IN GOD SUCCESS',color: Colors.redAccent[100],),
                ),
                SizedBox(height: 30,),
                Container(
                  child: FlatButton(
                    onPressed: (){},
                    child: ListTile(
                      title: Text("Edit Profile"),
                      leading: Icon(Icons.edit,color: Colors.greenAccent,),
                      trailing: Icon(Icons.navigate_next),
                    ),
                  ),
                ),
                SizedBox(height: 5,),
                Container(
                  child: FlatButton(
                    onPressed: (){},
                    child: ListTile(
                      title: Text("Shipping Address"),
                      leading: Icon(Icons.location_on_outlined,color: Colors.greenAccent,),
                      trailing: Icon(Icons.navigate_next),
                    ),
                  ),
                ),
                SizedBox(height: 5,),
                Container(
                  child: FlatButton(
                    onPressed: (){},
                    child: ListTile(
                      title: Text("Order History"),
                      leading: Icon(Icons.access_time,color: Colors.greenAccent,),
                      trailing: Icon(Icons.navigate_next),
                    ),
                  ),
                ),
                SizedBox(height: 5,),
                Container(
                  child: FlatButton(
                    onPressed: (){},
                    child: ListTile(
                      title: Text("Cards"),
                      leading: Icon(Icons.card_giftcard,color: Colors.greenAccent,),
                      trailing: Icon(Icons.navigate_next),
                    ),
                  ),
                ),
                SizedBox(height: 5,),
                Container(
                  child: FlatButton(
                    onPressed: (){},
                    child: ListTile(
                      title: Text("Notification"),
                      leading: Icon(Icons.notification_important_rounded,color: Colors.greenAccent,),
                      trailing: Icon(Icons.navigate_next),
                    ),
                  ),
                ),
                SizedBox(height: 5,),
                Container(
                  child: FlatButton(
                    onPressed: (){
                      controller.singout();
                      Get.offAll(LoginScreen());
                    },
                    child: ListTile(
                      title: Text("Log Out"),
                      leading: Icon(Icons.logout,color: Colors.greenAccent,),
                      trailing: Icon(Icons.navigate_next),
                    ),
                  ),
                ),
                SizedBox(height: 5,),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
