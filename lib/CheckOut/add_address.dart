import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:socialapp/view_model/CheckViewModel.dart';
import 'package:socialapp/widgets/customtext.dart';
import 'package:socialapp/widgets/customtextform.dart';

class AddAddress extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CheckViewModel>(
      init: Get.find(),
      builder:(controller)=> Form(
        key:controller.formkey,
        child: Expanded(
          child: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.all(10),
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomText(text: 'Billing address is the same as delivery address ',),
                  SizedBox(height: 10,),
                  CustomTextForm(
                    onsave: (value){
                      controller.street1=value;
                    },
                    validator: (value){
                      if(value.isEmpty){
                        return 'please enter your steer1 address';
                      }
                      return null;
                    },
                    text: 'Street1',
                    hint: '21,Asuit alnemas',),
                  SizedBox(height: 10,),
                  CustomTextForm(
                    onsave: (value){
                      controller.street2=value;
                    },
                    validator: (value){
                      if(value.isEmpty){
                        return 'please enter your steer2 address';
                      }
                      return null;
                    },
                    text: 'Street2',hint: '21,Asuit alnemas',),
                  SizedBox(height: 10,),
                  CustomTextForm(
                    onsave: (value){
                      controller.city=value;
                    },
                    validator: (value){
                      if(value.isEmpty){
                        return 'please enter your city address';
                      }
                      return null;
                    },
                    text: 'City',hint: 'Asuit ',),
                  SizedBox(height: 10,),
                  Container(
                    width: Get.width,
                    child: Row(
                      children: [
                        Expanded(child: CustomTextForm(
                          onsave: (value){
                            controller.state=value;
                          },
                          validator: (value){
                            if(value.isEmpty){
                              return 'please enter your state';
                            }
                            return null;
                          },
                          text: 'State',
                          hint: 'asuit',
                        )),
                        SizedBox(width: 10,),
                        Expanded(child: CustomTextForm(
                          onsave: (value){
                            controller.country=value;
                          },
                          validator: (value){
                            if(value.isEmpty){
                              return 'please enter your country';
                            }
                            return null;
                          },
                          text: 'Country',
                        hint: 'Egypt',)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}