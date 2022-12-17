import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:socialapp/CheckOut/add_address.dart';
import 'package:socialapp/CheckOut/deliverytime.dart';
import 'package:socialapp/CheckOut/summery_widget.dart';
import 'package:socialapp/View/cartview.dart';
import 'package:socialapp/constants.dart';
import 'package:socialapp/view_model/CheckViewModel.dart';
import 'package:socialapp/widgets/customfbutton.dart';
import 'package:status_change/status_change.dart';


class CheckOutView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CheckViewModel>(
      init: CheckViewModel(),
      builder:(controller)=> Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0.0,
          title: Text(
            "Order Status",
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
        backgroundColor: Colors.white,
        body: Container(
          padding: EdgeInsets.only(top: 20),
          child: Column(
            children: [
              Container(
                height: 125,
                child: StatusChange.tileBuilder(
                  theme: StatusChangeThemeData(
                    direction: Axis.horizontal,
                    connectorTheme:
                    ConnectorThemeData(space: 1.0, thickness: 1.0),
                  ),
                  builder: StatusChangeTileBuilder.connected(
                    itemWidth: (_) =>
                    MediaQuery.of(context).size.width / _processes.length,
                    contentWidgetBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all( 15.0),
                        child: Text(
                          _processes[index],
                          style: TextStyle(
                            color: Colors
                                .blue, // change color with dynamic color --> can find it with example section
                          ),
                        ),
                      );
                    },
//                  nameWidgetBuilder: (context, index) {
//                    return Padding(
//                      padding: const EdgeInsets.all(20),
//                      child: Text(
//                        _processes[index],
//                        style: TextStyle(
//                          fontWeight: FontWeight.bold,
//                          color: getColor(index),
//                        ),
//                      ),
//                    );
//                  },
                    indicatorWidgetBuilder: (_, index) {
                      if (index <= controller.index) {
                        return DotIndicator(
                          size: 35.0,
                          border: Border.all(color: Colors.green, width: 1),
                          child: Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.green,
                              ),
                            ),
                          ),
                        );
                      } else {
                        return OutlinedDotIndicator(
                          size: 30,
                          borderWidth: 1.0,
                          color: todoColor,
                        );
                      }
                    },
                    lineWidgetBuilder: (index) {
                      if (index > 0) {
                        if (index == controller.index) {
                          final prevColor = controller.getColor(index - 1);
                          final color = controller.getColor(index);
                          var gradientColors;
                          gradientColors = [
                            prevColor,
                            Color.lerp(prevColor, color, 0.5)
                          ];
                          return DecoratedLineConnector(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: gradientColors,
                              ),
                            ),
                          );
                        } else {
                          return SolidLineConnector(
                            color: controller.getColor(index),
                          );
                        }
                      } else {
                        return null;
                      }
                    },
                    itemCount: _processes.length,
                  ),
                ),
              ),
              controller.pages == Pages.DeliveryTime ?
              DeliveryTime():controller.pages==Pages.AddAddress ?
              AddAddress():Summary(),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                 controller.index==0?Container(): Align(
                    alignment: Alignment.bottomRight,
                    child: Container(
                      padding: EdgeInsets.all(10),
                      height: 70,
                      width: 120,
                      child: CustomButton(
                        text: 'Back',onpressed: (){
                        controller.changIndex(controller.index-1);
                      },
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Container(
                      padding: EdgeInsets.all(10),
                      height: 70,
                      width: 120,
                      child: CustomButton(text:controller.index==2?'Done': 'Next',onpressed: (){
                        controller.changIndex(controller.index+1);
                      },),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),

      ),
    );
  }
}

final _processes = [
  'Delivery',
  'Address',
  'Summery ',
];

//final _content = [
//  '20/18',
//  '20/18',
//  '20/18',
//  '20/18',
//  '20/18',
//];
