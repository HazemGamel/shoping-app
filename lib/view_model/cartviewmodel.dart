import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:socialapp/models/Cartproductmodel.dart';
import 'package:socialapp/service/cartdatabashelper.dart';

class CartViewModel extends GetxController{
  ValueNotifier<bool> get loading=> _loading;
  ValueNotifier<bool>_loading=ValueNotifier(false);
  double _totalprice=0.0;
  double get totalprice=> _totalprice;

  List<CartProductModel> _cartproductlist=[];
  List<CartProductModel>get cartproductlist=>_cartproductlist;
  var dbHelper = CartDatabaseHelper.db;
  CartViewModel(){
    getallproduct();
  }
  Future<List<CartProductModel>> getallproduct()async{
    _loading.value=true;
    var dbhelper =CartDatabaseHelper.db;
    _cartproductlist=await dbhelper.getallproducts();
    print(_cartproductlist.length);
    _loading.value=false;
    gettotalprice();
    update();
  }
  gettotalprice(){
    for(int i=0;i<_cartproductlist.length;i++){
      _totalprice+=(double.parse(_cartproductlist[i].price)*
          _cartproductlist[i].quantity);
      //print(_totalprice);
    }
    update();
  }
  addproduct(CartProductModel cartProductModel)async
  {
      for(int i=0;i<_cartproductlist.length;i++){
        try{
          if(_cartproductlist[i].productId == cartProductModel.productId){
          }
        }catch(e){
          print("error is $e");
        }
      }
      await dbHelper.insert(cartProductModel);
      _cartproductlist.add(cartProductModel);
      _totalprice+=(double.parse(cartProductModel.price)*
          cartProductModel.quantity);
    update();
  }

increaseprice(int index)async{
    _cartproductlist[index].quantity++;
    _totalprice+=
        double.parse(_cartproductlist[index].price);
   await dbHelper.updateprice(_cartproductlist[index]);
 update();
}
  decreaseprice(int index)async{
    if(_cartproductlist[index].quantity==1){
      return ;
    }else{
    _cartproductlist[index].quantity--;
    _totalprice -= ( double.parse(_cartproductlist[index].price));
    }
   await dbHelper.updateprice(_cartproductlist[index]);
      update();
  }


}