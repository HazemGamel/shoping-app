import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:socialapp/models/categoriesmodel.dart';
import 'package:socialapp/models/productmodel.dart';

class HomeViewModel extends GetxController{
  ValueNotifier<bool> get loading=> _loading;
  ValueNotifier<bool>_loading=ValueNotifier(false);


  CategoriesModel categoriesModel;
  List<CategoriesModel> _categorieslist= [];
  List<CategoriesModel> get categorieslist =>_categorieslist;
 ProductModel productModel;
 List<ProductModel> _productlist=[];
 List<ProductModel> get productlist=>_productlist;

  final CollectionReference categoriesRef=
  FirebaseFirestore.instance.collection('categories');

  final CollectionReference productRef=
  FirebaseFirestore.instance.collection('products');

  HomeViewModel(){
    getcategories();
    getproducts();
  }
  getcategories()async{
    _loading.value= true;
   await categoriesRef.get().then((value){
         for(int i=0;i<value.docs.length;i++){
           _categorieslist.add(CategoriesModel.fromJson(value.docs[i].data()));
          //print(_categorieslist.length);
           _loading.value=false;
         }
         update();
    });
  }

  getproducts()async{
    _loading.value=true;
    await productRef.get().then((value) {
      for(int i=0;i<value.docs.length;i++){
        _productlist.add(ProductModel.fromJson(value.docs[i].data()));
        _loading.value=false;
      }
      update();
    });

  }
}