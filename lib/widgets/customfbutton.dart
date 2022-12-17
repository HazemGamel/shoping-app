import 'package:flutter/material.dart';

import '../constants.dart';
import 'customtext.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Function onpressed;

  const CustomButton({ this.text, this.onpressed});

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed:onpressed,
      padding: EdgeInsets.all(10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      color: primarycolor,
      child: CustomText(text: text,color: Colors.white,alignment: Alignment.center,),
    );
  }
}
