import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:socialapp/view_model/CheckViewModel.dart';
import 'package:socialapp/view_model/cartviewmodel.dart';
import 'package:socialapp/widgets/customtext.dart';

import '../constants.dart';

class Summary extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GetBuilder<CartViewModel>(
        builder:(controller)=>SingleChildScrollView(
          child: Column(
            children: [
             Container(
               height: 200,
               //color: Colors.red,
               padding: EdgeInsets.only(left: 10,right: 10,top: 0),
               child: ListView.separated(
                 scrollDirection: Axis.horizontal,
                   itemBuilder: (context,index){
                     return Container(
                       child: Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                           Container(
                             child: Image.network(controller.cartproductlist[index].image,fit: BoxFit.cover,),
                             width: 150,
                             height: 120,
                           ),
                           SizedBox(height: 10,),
                           CustomText(text: controller.cartproductlist[index].name,
                             fontsize: 20,
                           ),
                           SizedBox(height: 5,),
                           CustomText(text: '\$ ${controller.cartproductlist[index].price.toString()}',
                           color: primarycolor,
                           ),

                         ],
                       ),

                     );
                   },
                   separatorBuilder:(context,index)=>SizedBox(width: 10,),
                   itemCount: controller.cartproductlist.length),
             ),
              SizedBox(height: 5,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomText(text: 'Total Price is\$ ${controller.totalprice.toString()} + \$5 delivery',
                  color: primarycolor,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomText(text: 'Shipping Address',fontsize: 25,),
              ),
              GetBuilder<CheckViewModel>(
                init: CheckViewModel(),
                builder:(controller)=> Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomText(text: controller.street1 + '\n'+controller.street2 +'\n'+controller.city+'\n'+controller.state +','+controller.country,
                  fontsize: 20,),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}