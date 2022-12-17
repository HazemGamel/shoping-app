import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:socialapp/CheckOut/CheckOutView.dart';
import 'package:socialapp/constants.dart';
import 'package:socialapp/view_model/cartviewmodel.dart';
import 'package:socialapp/widgets/customfbutton.dart';
import 'package:socialapp/widgets/customtext.dart';

class CartView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartViewModel>(
      init: Get.find(),
      builder:(controller)=> Scaffold(
        body:controller.cartproductlist.length==0?Column(
          mainAxisAlignment: MainAxisAlignment.center,
          //crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset('assets/images/cart.svg',width: 200,height: 200,),
            SizedBox(height: 20,),
            CustomText(text: 'Your Cart is Empty',color: Colors.black,fontsize: 25,
              alignment: Alignment.center,)
          ],
        ): Column(
          children: [
            Expanded(
              child: Container(
                  child: ListView.separated(
                      itemBuilder: (context,index){
                        return Container(
                          height: 140,
                          child: Row(
                            children: [
                              Container(
                                  child: Image.network(
                                    controller.cartproductlist[index].image,
                                    fit: BoxFit.cover,),
                                width: 140,
                                height: 125,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 30,top: 5),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CustomText(text:controller.cartproductlist[index].name,fontsize: 20,),
                                    SizedBox(height: 10,),
                                    CustomText(text: '\$ ${controller.cartproductlist[index].price.toString()}',color: primarycolor,),
                                    SizedBox(height: 10,),
                                    Container(
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          IconButton(onPressed: (){
                                            controller.increaseprice(index);
                                          },
                                              icon:Icon(Icons.add,color: Colors.black,)),
                                          //SizedBox(width: 5,),
                                          CustomText(
                                            text: controller.cartproductlist[index].quantity.toString(),
                                            color: Colors.black,
                                            alignment: Alignment.center,
                                            fontsize: 18,
                                          ),
                                          SizedBox(width: 20,),
                                          InkWell(
                                            onTap:(){
                                              controller.decreaseprice(index);
                                            },
                                            child: Container(
                                             child: Icon(
                                               Icons.minimize,color: Colors.black,),
                                              padding: EdgeInsets.only(bottom: 30),
                                            ),
                                          ),
                                        ],
                                      ),
                                      color: Colors.grey[200],
                                      height: 40,
                                      width: 130,

                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                      separatorBuilder: (context,index)=>SizedBox(height: 20,),
                      itemCount: controller.cartproductlist.length),
                ),
              ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GetBuilder<CartViewModel>(
                  init: Get.find(),
                  builder:(controller)=> Container(
                    padding: EdgeInsets.only(left: 20,top: 10,),
                    child: Column(
                      children: [
                        CustomText(text: 'TOTAL',color: Colors.grey,fontsize: 20,),
                        SizedBox(height: 10,),
                        CustomText(text:'\$ ${controller.totalprice}',
                          color: primarycolor,fontsize: 18,),
                      ],
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(right: 20),
                  child: CustomButton(onpressed: (){
                    Get.to(CheckOutView());
                  },text: 'CheckOut',),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
