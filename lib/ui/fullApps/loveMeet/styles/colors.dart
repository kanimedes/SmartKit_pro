// VPN //
// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

final Color vpn11 = Color(0xffFEFAF1);
final Color vpn22 = Color(0xffF7C331);
final Color vpn33 = Color(0xffF7882F);
final Color vpn44 = Color(0xfff7f1ff);
final Color vpn55 = Color(0x33FFA7A7);
final Color vpn66 = Color(0xFFFAE9BB);
final Color vpn77 = Color(0xFF777777);

Gradient vpntopgradient = LinearGradient(
  colors: [
    vpn22,
    vpn33,
  ],
  stops: const [0.7, 0.3],
  begin: Alignment(-0.91, -0.42),
  end: Alignment(0.91, 0.42),
);

BoxDecoration vpncirculargradient_box = BoxDecoration(
  gradient: vpngradient,
  borderRadius: BorderRadius.circular(10),
  // ignore: prefer_const_literals_to_create_immutables
  boxShadow: [
    BoxShadow(
      color: Colors.black12,
      offset: Offset(3, 3),
      blurRadius: 5,
    )
  ],
);

Gradient vpngradient = LinearGradient(
  colors: [
    vpn22,
    vpn33,
  ],
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
);
