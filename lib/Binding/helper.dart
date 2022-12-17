import 'package:get/get.dart';
import 'package:socialapp/service/local_storage.dart';
import 'package:socialapp/view_model/CheckViewModel.dart';
import 'package:socialapp/view_model/HomeViewModel.dart';
import 'package:socialapp/view_model/authviewmodel.dart';
import 'package:socialapp/view_model/cartviewmodel.dart';
import 'package:socialapp/view_model/controllviewmodel.dart';
import 'package:socialapp/view_model/profilemodel.dart';

class Binding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => AuthViewModel());
    Get.lazyPut(() => ControlViewModel());
    Get.lazyPut(() => HomeViewModel());
    Get.lazyPut(() => CartViewModel());
    Get.lazyPut(() => LocalStorageDate());
    Get.lazyPut(() => CheckViewModel());
    //Get.lazyPut(() => ProfileModel());
  }

}