import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'ColorsRes.dart';

class DesignConfig {
  static RoundedRectangleBorder roundedrectangleshape = RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(8),
  );

  static RoundedRectangleBorder colorroundedrectangleshape =
      RoundedRectangleBorder(
          side: new BorderSide(color: ColorsRes.firstgradientcolor, width: 1.0),
          borderRadius: BorderRadius.circular(4.0));

  static RoundedRectangleBorder SetRoundedBorder(
      Color bordercolor, double bradius) {
    return RoundedRectangleBorder(
        side: new BorderSide(color: bordercolor, width: 1.0),
        borderRadius: BorderRadius.circular(bradius));
  }

  static BoxDecoration BoxDecorationContainer(Color color, double radius) {
    return BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(radius),
    );
  }

  static BoxDecoration BoxDecorationContainerSide(Color color, double radius,
      bool istopleft, bool istopright, bool isbtmleft, bool isbtmright) {
    Radius zero = Radius.circular(3);
    Radius nonzero = Radius.circular(radius);
    return BoxDecoration(
      color: color,
      borderRadius: BorderRadius.only(
          topRight: istopright ? nonzero : zero,
          topLeft: istopleft ? nonzero : zero,
          bottomRight: isbtmright ? nonzero : zero,
          bottomLeft: isbtmleft ? nonzero : zero),
    );
  }

  static BoxDecoration BoxDecorationBorderContainer(
      Color bcolor, double radius) {
    return BoxDecoration(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(radius),
      border: Border.all(color: bcolor),
      boxShadow: const [
        boxShadow,
      ],
    );
  }

  static const Gradient gradient = LinearGradient(
    colors: [
      ColorsRes.secondgradientcolor,
      ColorsRes.firstgradientcolor,
    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  static const Gradient btngradient = LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [ColorsRes.secondgradientcolor, ColorsRes.firstgradientcolor]);

  static Widget SetButtonUI(String title, bool isrighticon) {
    return new Container(
        width: double.infinity,
        margin: EdgeInsets.all(5),
        padding: EdgeInsets.all(5),
        decoration: DesignConfig.circulargradient_btn,
        child: isrighticon
            ? Row(children: <Widget>[
                Expanded(
                  child: Text(
                    "\t\t\t\t$title",
                    style: TextStyle(
                        color: ColorsRes.white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
                CircleAvatar(
                    backgroundColor: ColorsRes.white,
                    radius: 15,
                    child: Icon(Icons.navigate_next))
              ])
            : Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  title,
                  style: TextStyle(
                      color: ColorsRes.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ));
  }

  static Widget SetAppbar(String bartitle) {
    return AppBar(
      iconTheme: IconThemeData(
        color: ColorsRes.white,
      ),
      elevation: 0.0,
      /*  flexibleSpace: Container(
        width: double.infinity,
        decoration: BoxDecoration(gradient: DesignConfig.appbargradient),
      ), */
      systemOverlayStyle: SystemUiOverlayStyle.light,
      backgroundColor: ColorsRes.statusbarcolor,
      centerTitle: true,
      title: Text(bartitle, style: TextStyle(color: ColorsRes.white)),
    );
  }

  static Widget ButtonWithShadow(
      String btntext, Color btncolor, BuildContext context) {
    return SizedBox(
      height: 55.0,
      width: double.maxFinite,
      child: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              color: btncolor,
              boxShadow: const [
                BoxShadow(
                  color: ColorsRes.btndarkshadow,
                  offset: Offset(4, 4),
                  blurRadius: 10,
                ),
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              color: btncolor,
              boxShadow: const [
                BoxShadow(
                  color: ColorsRes.btnlightshadow,
                  offset: Offset(-4, -4),
                  blurRadius: 10,
                ),
              ],
            ),
          ),
          Center(
              child: Text(btntext,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.subtitle1!.merge(TextStyle(
                      color: ColorsRes.white,
                      decoration: TextDecoration.none,
                      fontWeight: FontWeight.w900,
                      fontFamily: 'MyFont')))),
        ],
      ),
    );
  }

  static Widget ButtonWithShadowNew(String btntext, BuildContext context) {
    return Container(
      height: 55,
      width: double.maxFinite,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(
            20,
          )),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: const [
              ColorsRes.secondgradientcolor,
              ColorsRes.appcolor,
            ],
          )),
      child: Center(
          child: Text(btntext,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.subtitle1!.merge(TextStyle(
                  color: ColorsRes.white,
                  decoration: TextDecoration.none,
                  fontWeight: FontWeight.w900,
                  fontFamily: 'MyFont')))),
    );
  }

  static Widget EnDisButton(
      String btntext, Color textcolor, BuildContext context) {
    return IntrinsicWidth(
      stepWidth: 150,
      stepHeight: 55,
      child: Container(
          decoration: BoxDecoration(
              gradient: gradient,
              boxShadow: [
                BoxShadow(
                  blurRadius: 10,
                  color: ColorsRes.profileshade2.withOpacity(0.5),
                  offset: Offset(
                    /*  5,
                    5, */
                    3,
                    3,
                  ),
                ),
                BoxShadow(
                  blurRadius: 10,
                  color: ColorsRes.profileshade3.withOpacity(0.5),
                  offset: Offset(
                    /*  -5,
                    -5, */
                    -3,
                    -3,
                  ),
                ),
              ],
              borderRadius: BorderRadius.all(Radius.circular(
                15,
              ))),
          child: Center(
              child: Text(btntext,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.button!.merge(TextStyle(
                      color: textcolor,
                      decoration: TextDecoration.none,
                      fontWeight: FontWeight.w900,
                      fontFamily: 'MyFont'))))),
    );
  }

  static SetStatusbarColor(Color color) {
    return SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: color, statusBarBrightness: Brightness.dark));
  }

  static const BoxShadow boxShadow = BoxShadow(
    color: Colors.black12,
    offset: Offset(3, 3),
    blurRadius: 5,
  );

  static BoxDecoration circulargradient_btn = BoxDecoration(
    gradient: btngradient,
    borderRadius: BorderRadius.circular(30),
    boxShadow: const [
      boxShadow,
    ],
  );

  static OutlineInputBorder Setoutlineborderedittext(
      Color bordercolor, double bradius) {
    return OutlineInputBorder(
        borderSide: BorderSide(width: 0.5, color: bordercolor),
        borderRadius: BorderRadius.circular(bradius));
  }

  static BoxDecoration outlineboxtext = BoxDecoration(
    color: Colors.transparent,
    borderRadius: BorderRadius.circular(10),
    border: Border.all(color: ColorsRes.appcolor, width: 0.5),
  );

  static BoxDecoration circulargradient_box = BoxDecoration(
    gradient: gradient,
    borderRadius: BorderRadius.circular(10),
    boxShadow: const [
      boxShadow,
    ],
  );
}
