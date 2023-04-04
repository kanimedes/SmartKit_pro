import 'package:flutter/material.dart';

List<BoxShadow> boxShadow(){
  return [
    BoxShadow(
      color: Colors.white,
      offset: Offset(-5.0, -5.0),
      blurRadius: 15.0,
    ),
    BoxShadow(
      color: Colors.black.withOpacity(0.1),
      offset: Offset(5.0, 5.0),
      blurRadius: 10.0,
    ),
  ];
}