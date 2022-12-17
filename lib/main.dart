import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:socialapp/service/local_storage.dart';
import 'package:socialapp/view_model/authviewmodel.dart';
import 'package:socialapp/view_model/cartviewmodel.dart';
import 'package:socialapp/view_model/controllviewmodel.dart';

import 'Binding/helper.dart';
import 'View/controlerview.dart';
import 'View/loginscreen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Get.put(CartViewModel());
  Get.put(ControlViewModel());
  //Get.put(LocalStorageDate());
  runApp(MyApp());
  }

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: Binding(),
      debugShowCheckedModeBanner: false,
      home: ControllerView(),
    );
  }
}

