import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:octo_image/octo_image.dart';
import 'package:smartkit_pro/ui/fullApps/furnitureHub/helper/ColorsRes.dart';
import 'package:smartkit_pro/ui/fullApps/furnitureHub/helper/DesignConfig.dart';
import 'package:smartkit_pro/ui/fullApps/furnitureHub/helper/StringsRes.dart';

import '../../widgets/slideAnimation.dart';
import 'SignInActivity.dart';
import 'SignUpActivity.dart';

class LoginActivity extends StatefulWidget {
  const LoginActivity({Key? key}) : super(key: key);

  @override
  State<LoginActivity> createState() => _LoginActivityState();
}

class _LoginActivityState extends State<LoginActivity>
    with SingleTickerProviderStateMixin {
  AnimationController? _animationController;
  @override
  void initState() {
    _animationController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 2000));
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _animationController!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _animationController!.repeat();
    return Scaffold(
      body: Stack(children: [
        OctoImage(
          image: CachedNetworkImageProvider(
            "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/furnitureapp%2Fimage_d.jpg?alt=media&token=40cf920f-d88d-41c2-ad68-9edaefe7feba",
          ),
          placeholderBuilder: OctoPlaceholder.blurHash(
            "LFKd@^RTV]M_-;M{fkt7^-9Yt6t8",
          ),
          errorBuilder: OctoError.icon(color: ColorsRes.black),
          fit: BoxFit.cover,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
        ),
        Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SlideAnimation(
                position: 1,
                itemCount: 8,
                slideDirection: SlideDirection.fromTop,
                animationController: _animationController,
                child: Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height / 8),
                  child: SvgPicture.asset(
                      "assets/images/fullApps/furnitureHub/logo.svg"),
                ),
              ),
              SlideAnimation(
                position: 2,
                itemCount: 8,
                slideDirection: SlideDirection.fromBottom,
                animationController: _animationController,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SignupActivity(),
                      ),
                    );
                  },
                  child: Container(
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height / 1.8,
                        left: MediaQuery.of(context).size.width / 10,
                        right: MediaQuery.of(context).size.width / 10),
                    padding: EdgeInsets.only(top: 14.0, bottom: 14.0),
                    decoration: DesignConfig.boxDecorationBorderButtonColor(
                        ColorsRes.greenColor, 10.0),
                    child: Text(
                      StringsRes.signUpText,
                      style: TextStyle(
                          fontSize: 14,
                          color: ColorsRes.greenColor,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              SlideAnimation(
                position: 3,
                itemCount: 8,
                slideDirection: SlideDirection.fromBottom,
                animationController: _animationController,
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SignInActivity(),
                      ),
                    );
                  },
                  child: Container(
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height / 50,
                        left: MediaQuery.of(context).size.width / 10,
                        right: MediaQuery.of(context).size.width / 10),
                    padding: EdgeInsets.only(top: 14.0, bottom: 14.0),
                    decoration: DesignConfig.boxDecorationContainer(
                        ColorsRes.greenColor, 10.0),
                    child: Text(
                      StringsRes.loginText,
                      style: TextStyle(
                          fontSize: 14,
                          color: ColorsRes.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ])
      ]),
    );
  }
}
