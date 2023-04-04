// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smartkit_pro/ui/fullApps/goRide/GoRideApp/Helper/GoRIdeConstant.dart';
import 'package:smartkit_pro/ui/fullApps/goRide/GoRideApp/Helper/GoRideColor.dart';

class AppBarDesign extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  late final height;
  AppBarDesign({Key? key, this.height}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
        height: height,
        decoration: BoxDecoration(
          color: GoRideColors.yellow,
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(60)),
        ));
  }
}

class AppbarImageDesign extends StatelessWidget {
  late final String image;
  late final VoidCallback onPress;
  final double? bottomPadding;
  late final bool showBackBtn;
  AppbarImageDesign(
      {Key? key,
      required this.image,
      required this.onPress,
      this.bottomPadding,
      required this.showBackBtn})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * .24,
      width: MediaQuery.of(context).size.width,
      color: GoRideColors.yellow,
      child: Stack(
        children: [
          Container(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * .05,
                  bottom: bottomPadding!),
              alignment: Alignment.center,
              child: SvgPicture.asset(
                GoRideConstant.getSvgImagePath(image),
              )),
          showBackBtn
              ? Padding(
                  padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * .06,
                      top: MediaQuery.of(context).size.height * .07),
                  child: CircleAvatar(
                    radius: 15,
                    child: FloatingActionButton(
                      onPressed: onPress,
                      // Navigator.pop(context);
                      mini: true,
                      backgroundColor: GoRideColors.white, elevation: 3,
                      child: Icon(
                        Icons.arrow_back_ios_outlined,
                        color: GoRideColors.black,
                      ),
                    ),
                  ),
                )
              : Container(),
        ],
      ),
    );
  }
}

class PreferredSizeAppBar extends StatelessWidget {
  late final String title;
  PreferredSizeAppBar({Key? key, required this.title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height * .15,
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * .02),
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Expanded(
            flex: 3,
            child: Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * .05,
                  top: MediaQuery.of(context).size.height * .03),
              child: CircleAvatar(
                radius: 15,
                child: FloatingActionButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  mini: true,
                  backgroundColor: GoRideColors.white,
                  elevation: 3,
                  child: Icon(
                    Icons.arrow_back_ios_outlined,
                    color: GoRideColors.black,
                  ),
                ),
              ),
            ),
          ),
          // SizedBox(width: MediaQuery.of(context).size.width * .24,),
          Expanded(
            flex: 15,
            child: Container(
              alignment: Alignment.center,
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * .03,
              ),
              child: Text(
                title,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
            ),
          )
        ]));
  }
}
