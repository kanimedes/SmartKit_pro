import 'package:flutter/material.dart';

import 'GoRideDrawerScreen.dart';
import 'GoRideHomeScreen.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: const [DrawerScreen(), GoRideHomeScreen()],
      ),
    );
  }
}
