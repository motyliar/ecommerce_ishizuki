import 'package:flutter/material.dart';

BoxDecoration shadeBox = BoxDecoration(boxShadow: [
  BoxShadow(
      offset: Offset(2, 3),
      blurRadius: 5.0,
      spreadRadius: 3.0,
      color: Colors.grey.withOpacity(0.2)),
], color: Colors.white, borderRadius: BorderRadius.circular(20));

BoxShadow boxShadowCustom = BoxShadow(
    offset: Offset(2, 3),
    blurRadius: 5.0,
    spreadRadius: 3.0,
    color: Colors.black.withOpacity(0.5));

BoxShadow boxShadowLight = BoxShadow(
    offset: Offset(4, -4),
    blurRadius: 3.0,
    spreadRadius: 2.0,
    color: Colors.grey.withOpacity(0.2));
