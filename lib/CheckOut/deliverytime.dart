import 'package:flutter/material.dart';
import 'package:socialapp/constants.dart';
import 'package:socialapp/widgets/customtext.dart';

class DeliveryTime extends StatefulWidget {
  @override
  State<DeliveryTime> createState() => _DeliveryTimeState();
}

class _DeliveryTimeState extends State<DeliveryTime> {
  @override
  Widget build(BuildContext context) {
    Deliver delivery= Deliver.StandardDelivery;
    return Expanded(
      child: Column(
        //mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RadioListTile(
              value: Deliver.StandardDelivery,
              groupValue: delivery,
              onChanged: (value){
             setState(() {
               delivery = value;
             });
              },
          title: CustomText(text: 'Standard Delivery',fontsize: 20,),
            subtitle: CustomText(text: '\n Order will be delivered between 3-5 business days ',
            fontsize: 16,),
            activeColor: primarycolor,
          ),
          SizedBox(height: 10,),
          RadioListTile(
              value: Deliver.NextDayDelivery,
              groupValue: delivery,
              onChanged: (value){
             setState(() {
               delivery = value;
             });
              },
          title: CustomText(text: 'Next Day Delivery',fontsize: 20,),
            subtitle: CustomText(text: '\n Place your order before 6pm and your items will be delivered next day ',
            fontsize: 16,),
            activeColor: primarycolor,
          ),
          SizedBox(height: 10,),
          RadioListTile(
              value: Deliver.NominatedDelivery,
              groupValue: delivery,
              onChanged: (value){
             setState(() {
               delivery = value;
             });
              },
          title: CustomText(text: 'Nominated Delivery',fontsize: 20,),
            subtitle: CustomText(text: '\n Pick a particular from the calender to recive your order  ',
            fontsize: 16,),
            activeColor: primarycolor,
          ),
        ],
      ),
    );
  }
}