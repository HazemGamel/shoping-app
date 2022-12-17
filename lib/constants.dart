import 'package:flutter/material.dart';

const primarycolor= Color.fromRGBO(0, 197, 105, 1);

final String TabelCartProduct ='CartProduct';
final String columnName ='name';
final String columnimage ='image';
final String columnprice ='price';
final String columnQuantity ='quantity';
final String columnProductId ='productId';

const kTileHeight = 50.0;
const inProgressColor = Colors.black87;
const todoColor = Color(0xffd1d2d7);

enum Pages {
  DeliveryTime,
  AddAddress,
  Summary,
}

enum Deliver{
  StandardDelivery,
  NextDayDelivery,
  NominatedDelivery,
}