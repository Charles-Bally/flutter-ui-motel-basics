import 'package:flutter/material.dart';

class AppShadow {
  static BoxShadow primaryShadowMedium = const BoxShadow(
    color: Color(0x198a6aff),
    blurRadius: 16.0,
    spreadRadius: 0,
    offset: Offset(
      0,
      0,
    ),
  );
  static BoxShadow cardShadow = const BoxShadow(
    color: Color.fromARGB(30, 138, 106, 255),
    blurRadius: 15.0,
    spreadRadius: 0,
    offset: Offset(
      16,
      15,
    ),
  );
}
