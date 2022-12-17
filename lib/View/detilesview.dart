import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:socialapp/View/Homescreen.dart';
import 'package:socialapp/models/Cartproductmodel.dart';
import 'package:socialapp/models/productmodel.dart';
import 'package:socialapp/view_model/cartviewmodel.dart';
import 'package:socialapp/widgets/customfbutton.dart';
import 'package:socialapp/widgets/customtext.dart';

import '../constants.dart';

class DeteilsView extends StatelessWidget {
  ProductModel model;
  DeteilsView({this.model});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        //padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 250,
              padding: EdgeInsets.only(top: 22),
              child: Image.network(model.image,fit: BoxFit.cover,),

            ),
            SizedBox(height: 10,),
           Expanded(
             child: SingleChildScrollView(
               child: Container(
                 padding: EdgeInsets.all(10),
                 child: Column(
                   children: [
                     CustomText(text: model.name,
                       fontsize: 30,
                       alignment: Alignment.center,fontfamily: 'Signatra',),
                     SizedBox(height: 10,),
                     CustomText(text: 'Details of This meal',
                       fontsize: 30,
                       fontfamily: 'Signatra',),
                     SizedBox(height: 10,),
                     CustomText(text: model.description,
                       fontsize: 18,
                     ),
                   ],
                 ),
               ),
             ),
           ),
           Row(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
             children: [
               Container(
                 padding: EdgeInsets.only(left: 20,top: 10,),
                 child: Column(
                   children: [
                     CustomText(text: 'PRICE',color: Colors.grey,fontsize: 20,),
                     CustomText(text:'\$'+ model.price,
                       color: primarycolor,fontsize: 18,),
                   ],
                 ),
               ),
               GetBuilder<CartViewModel>(
                 init: Get.find(),
                 builder:(controller)=> Container(
                   padding: EdgeInsets.only(right: 20),
                   child: CustomButton(onpressed: (){
                     controller.addproduct(CartProductModel(
                       name: model.name,
                       image: model.image,
                       price: model.price,
                       quantity: 1,
                       productId: model.productId,
                     ));
                   },text: 'Add To Cart',),
                 ),
               ),
             ],
           ),
          ],
        ),
      ),


    );
  }
}
