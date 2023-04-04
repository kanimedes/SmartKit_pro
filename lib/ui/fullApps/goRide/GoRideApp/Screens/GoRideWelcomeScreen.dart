// ignore_for_file: unused_field

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:octo_image/octo_image.dart';
import 'package:smartkit_pro/ui/fullApps/goRide/GoRideApp/Helper/GoRIdeConstant.dart';
import 'package:smartkit_pro/ui/fullApps/goRide/GoRideApp/Helper/GoRideColor.dart';
import 'package:smartkit_pro/ui/fullApps/goRide/GoRideApp/Helper/GoRideStringRes.dart';

import '../../../widgets/slideAnimation.dart';
import 'GoRideIntroSlider.dart';

class GopRideWelcomeScreen extends StatefulWidget {
  const GopRideWelcomeScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return GopRideWelcomeScreenState();
  }
}

class GopRideWelcomeScreenState extends State<GopRideWelcomeScreen>
    with TickerProviderStateMixin {
  late AnimationController _scaleController;

  late AnimationController _scale2Controller;

  late AnimationController _widthController;

  late AnimationController _positionController;

  late Animation<double> _scaleAnimation;

  late Animation<double> _scale2Animation;

  late Animation<double> _widthAnimation;

  late Animation<double> _positionAnimation;
  AnimationController? _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 2000));
    _scaleController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));

    _scaleAnimation =
        Tween<double>(begin: 1.0, end: 0.8).animate(_scaleController)
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              _widthController.forward();
            }
          });

    _widthController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 600));

    _widthAnimation =
        Tween<double>(begin: 80.0, end: 500.0).animate(_widthController)
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              _positionController.forward();
            }
          });
    _positionController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1000));

    _positionAnimation =
        Tween<double>(begin: 0.0, end: 260.0).animate(_positionController)
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              _scale2Controller.forward();
            }
          });

    _scale2Controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));

    _scale2Animation =
        Tween<double>(begin: 1.0, end: 32.0).animate(_scale2Controller)
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              /* _positionController.reverse();
        _scale2Controller.reverse();
        _widthController.reverse();*/
            }
          });
    _scaleController.forward();
  }

  @override
  void dispose() {
    _positionController.dispose();
    _scale2Controller.dispose();
    _widthController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Stack(
          children: [
            RotatedBox(
              quarterTurns: -8,
              child: OctoImage(
                image: CachedNetworkImageProvider(
                    "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/goride%2Fsplash_background.png?alt=media&token=3589ea4f-d610-4dd2-9a0d-6655ac8d37b8"),
                placeholderBuilder: OctoPlaceholder.blurHash(
                  "LEHV6nWB2yk8pyoJadR*.7kCMdnj",
                ),
                errorBuilder: OctoError.icon(color: Colors.black),
                height: MediaQuery.of(context).size.height * .25,
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.fill,
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * .16),
              child: SvgPicture.asset(
                  GoRideConstant.getSvgImagePath("appicon.svg")),
            ),
            Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * .285),
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    children: const <TextSpan>[
                      TextSpan(
                          text: GoRideStringRes.go + " ",
                          style: TextStyle(
                              color: GoRideColors.black,
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                              height: 1.2)),
                      TextSpan(
                          text: GoRideStringRes.ride,
                          style: TextStyle(
                              color: GoRideColors.black, fontSize: 40)),
                    ],
                  ),
                )),
          ],
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * .09,
        ),
        Expanded(
          child: Container(
            width: MediaQuery.of(context).size.width,
            decoration: GoRideConstant.boxDecorationContainer(
                GoRideColors.yellow, false),
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * .04,
                ),
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    children: const <TextSpan>[
                      TextSpan(
                          text: GoRideStringRes.welcome + " ",
                          style: TextStyle(
                              color: GoRideColors.black,
                              fontSize: 24,
                              fontWeight: FontWeight.w500)),
                      TextSpan(
                          text: GoRideStringRes.go + " ",
                          style: TextStyle(
                              color: GoRideColors.black,
                              fontSize: 24,
                              fontWeight: FontWeight.bold)),
                      TextSpan(
                          text: GoRideStringRes.ride + "!",
                          style: TextStyle(
                              color: GoRideColors.black,
                              fontSize: 24,
                              fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
                Text(GoRideStringRes.welcomeSub),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .08,
                ),
                SlideAnimation(
                    position: 10,
                    itemCount: 20,
                    slideDirection: SlideDirection.fromLeft,
                    animationController: _animationController,
                    child: SvgPicture.asset(
                      GoRideConstant.getSvgImagePath("welcome.svg"),
                      height: MediaQuery.of(context).size.height * .2,
                    )),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .1,
                ),
                Stack(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => GoRideIntroSlider(),
                            ));
                      },
                      child: Text(
                        GoRideStringRes.letsGo,
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(310, 50),
                        shadowColor: Color(0x33212121),
                        elevation: 12,
                        primary: GoRideColors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                      ),
                    ),
                    AnimatedBuilder(
                        animation: _positionController,
                        builder: (context, child) => Positioned(
                            left: _positionAnimation.value,
                            child: Padding(
                              padding: EdgeInsets.only(top: 5),
                              child: CircleAvatar(
                                  radius: 20,
                                  backgroundColor: GoRideColors.white,
                                  child: IconButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                GoRideIntroSlider(),
                                          ));
                                    },
                                    icon: Icon(
                                      Icons.arrow_forward,
                                      color: GoRideColors.black,
                                    ),
                                  )),
                            )))
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    ));
  }
}
