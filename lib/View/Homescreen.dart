import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:socialapp/View/detilesview.dart';
import 'package:socialapp/View/loginscreen.dart';
import 'package:socialapp/constants.dart';
import 'package:socialapp/view_model/HomeViewModel.dart';
import 'package:socialapp/view_model/controllviewmodel.dart';
import 'package:socialapp/widgets/customtext.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeViewModel>(
      init: Get.find(),
      builder:(controller)=>controller.loading.value ?
      Center(child: CircularProgressIndicator()): Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(top: 50,right: 10,left: 10),
            child: Column(
              children: [
                Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.grey[300],
                    ),
                    child: TextFormField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        prefixIcon: Icon(Icons.search,color: Colors.black,),
                      ),
                    )),
                SizedBox(height: 10,),
                CustomText(text: "Categories",fontsize: 30,fontfamily: 'Signatra',),
                SizedBox(height: 10,),
                Container(
                  height: 100,
                  child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context,index){
                        return Column(
                          children: [
                            Container(
                              child: Image.network(
                                controller.categorieslist[index].image,fit: BoxFit.cover,),
                              height: 50,
                              width: 50,
                              color: Colors.grey[200],
                            ),
                            SizedBox(height: 10,),
                            CustomText(text: controller.categorieslist[index].name,),

                          ],
                        );
                      },
                      separatorBuilder: (context,index)=>SizedBox(width: 8,),
                      itemCount: controller.categorieslist.length),
                ),
                SizedBox(height: 1,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(text: 'BestSeller',fontsize: 30,fontfamily: 'Signatra',),
                    CustomText(text: 'SeeAll',fontsize: 30,fontfamily: 'Signatra',),
                  ],
                ),
                SizedBox(height: 5,),
                Container(
                  height: 240,
                  child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context,index){
                        return GestureDetector(
                          onTap: (){
                            Get.to(DeteilsView(
                            model: controller.productlist[index],
                            ));
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width*0.4,
                            child: Column(
                              children: [
                                Container(
                                  child: Column(
                                    children: [
                                      Container(
                                        child: Container(
                                          child: Image.network(controller.productlist[index].image,
                                          fit: BoxFit.cover,),
                                          height: 150,

                                          width: MediaQuery.of(context).size.width*0.4,
                                          //color: Colors.grey[200],
                                        ),
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(20),
                                            color: Colors.grey[300]
                                        ),
                                      ),

                                    ],
                                  ),

                                ),
                                SizedBox(height: 10,),
                                CustomText(text: controller.productlist[index].name,),
                                SizedBox(height: 10,),
                                CustomText(text: controller.productlist[index].description,
                                  color: Colors.grey[400],max: 1,),
                                SizedBox(height: 10,),
                                CustomText(text: '\$'+controller.productlist[index].price.toString(),color: primarycolor,),
                              ],
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (context,index)=>SizedBox(width: 10,),
                      itemCount: controller.productlist.length),
                ),
              ],
            ),
          ),
        ),
      ),
    );

  }


}
