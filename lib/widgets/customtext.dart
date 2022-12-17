import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final Color color;
  final double fontsize;
  final String fontfamily;
  final Alignment alignment;
  final int max;

  const CustomText({
    this.alignment=Alignment.topLeft,
    this.text='',
    this.color=Colors.black,
    this.fontsize=16,
    this.max,
    this.fontfamily=''});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: alignment,
      child: Text(text,
        maxLines: max,
        style: TextStyle(color: color,
            fontSize:fontsize,

            fontFamily: fontfamily),),
    );
  }
}
