import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:octo_image/octo_image.dart';
import 'package:smartkit_pro/ui/fullApps/goRide/GoRideApp/Helper/GoRIdeConstant.dart';
import 'package:smartkit_pro/ui/fullApps/goRide/GoRideApp/Helper/GoRideColor.dart';
import 'package:smartkit_pro/ui/fullApps/goRide/GoRideApp/Helper/GoRideStringRes.dart';
import 'package:smartkit_pro/ui/fullApps/goRide/GoRideApp/Screens/Payment/GoRideChooseDesScreen.dart';
import 'package:smartkit_pro/ui/fullApps/widgets/slideAnimation.dart';
import '../GoRideDrawerHome.dart';
import '../GoRideHomeScreen.dart';
import 'GoRideNewPayMethod.dart';

class GoRidePaymentMethod extends StatefulWidget {
  const GoRidePaymentMethod({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return GoRidePaymentMethodState();
  }
}

class GoRidePaymentMethodState extends State<GoRidePaymentMethod>
    with SingleTickerProviderStateMixin {
  AnimationController? _animationController;
  bool a = true, b = false, c = false;
  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 2000));
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () {
          xOffset = 0;
          yOffset = 0;
          scaleFactor = 1;
          isDrawerOpen = false;
          return Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => HomePage(),
            ),
          ) as Future<bool>;
        },
        child: Scaffold(
            backgroundColor: GoRideColors.yellow,
            resizeToAvoidBottomInset: false,
            appBar: PreferredSize(
              preferredSize: Size(
                MediaQuery.of(context).size.width,
                MediaQuery.of(context).size.height * .15,
              ),
              child: Container(
                  height: MediaQuery.of(context).size.height * .15,
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * .02),
                  child: Row(children: [
                    Padding(
                      padding: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width * .05,
                          top: MediaQuery.of(context).size.height * .05),
                      child: CircleAvatar(
                        radius: 15,
                        child: FloatingActionButton(
                          onPressed: () {
                            xOffset = 0;
                            yOffset = 0;
                            scaleFactor = 1;
                            isDrawerOpen = false;
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HomePage()));
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
                    SizedBox(
                      width: MediaQuery.of(context).size.width * .27,
                    ),
                    Container(
                      padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * .05,
                      ),
                      child: Text(
                        GoRideStringRes.paymentMethod,
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w600),
                      ),
                    )
                  ])),

              //PreferredSizeAppBar(title: GoRideStringRes.paymentMethod,)
            ),
            body: Container(
                height: MediaQuery.of(context).size.height,
                decoration: GoRideConstant.boxDecorationContainer(
                    GoRideColors.white, false),
                child: Column(children: [
                  paymentText(),
                  SizedBox(
                    height: 15,
                  ),
                  masterCardDetail(),
                  SizedBox(
                    height: 15,
                  ),
                  visaCardDetail(),
                  SizedBox(
                    height: 15,
                  ),
                  cashDetail(),
                  SizedBox(
                    height: 15,
                  ),
                  addDetail(),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .28,
                  ),
                  applyBtn()
                ]))));
  }

  Widget paymentText() {
    return Container(
        alignment: Alignment.topLeft,
        padding: EdgeInsets.only(
            left: MediaQuery.of(context).size.width * .1,
            top: MediaQuery.of(context).size.height * .05),
        child: Text(
          GoRideStringRes.paymentMethod.toUpperCase(),
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ));
  }

  Widget masterCardDetail() {
    return SlideAnimation(
        position: 5,
        itemCount: 15,
        slideDirection: SlideDirection.fromLeft,
        animationController: _animationController,
        child: GestureDetector(
          onTap: () {
            setState(() {
              a = true;
              b = false;
              c = false;
            });
          },
          child: Container(
              decoration: BoxDecoration(
                  color: Color(0xfff6f6f6),
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              margin: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * .1,
                  right: MediaQuery.of(context).size.width * .1),
              child: ListTile(
                contentPadding: EdgeInsets.only(left: 10, right: 10),
                leading: OctoImage(
                  image: CachedNetworkImageProvider(
                      "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/goride%2Fmaster_card.png?alt=media&token=b58d63b0-7df3-4934-a1b9-c98c633647c6"),
                  placeholderBuilder: OctoPlaceholder.blurHash(
                    "LGJP-}5aLg?D%MOFxuM{0.?D^+a2",
                  ),
                  errorBuilder: OctoError.icon(color: GoRideColors.black),
                  fit: BoxFit.scaleDown,
                  height: 12,
                  width: 20,
                ),
                title: Text('   **** **** 0568',
                    style: TextStyle(
                        fontWeight: FontWeight.w600, color: Color(0xff707070))),
                trailing: a
                    ? SvgPicture.asset(
                        GoRideConstant.getSvgImagePath("check_icon.svg"),
                        fit: BoxFit.scaleDown,
                      )
                    : SizedBox(
                        height: 0,
                        width: 0,
                      ),
              )),
        ));
  }

  Widget visaCardDetail() {
    return SlideAnimation(
        position: 5,
        itemCount: 15,
        slideDirection: SlideDirection.fromLeft,
        animationController: _animationController,
        child: GestureDetector(
          onTap: () {
            setState(() {
              a = false;
              b = true;
              c = false;
            });
          },
          child: Container(
              decoration: BoxDecoration(
                  color: Color(0xfff6f6f6),
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              margin: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * .1,
                  right: MediaQuery.of(context).size.width * .1),
              child: ListTile(
                contentPadding: EdgeInsets.only(left: 10, right: 10),
                leading: OctoImage(
                  image: CachedNetworkImageProvider(
                      "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/goride%2Fvisa_card.png?alt=media&token=30948d76-6ea3-4c13-9bfa-cc43692b702c"),
                  placeholderBuilder: OctoPlaceholder.blurHash(
                    "LEG@#_EUy?--%NOZxuM{2rx@-?n5",
                  ),
                  errorBuilder: OctoError.icon(color: GoRideColors.black),
                  fit: BoxFit.scaleDown,
                  height: 12,
                  width: 20,
                ),
                title: Text('   **** **** 0568',
                    style: TextStyle(
                        fontWeight: FontWeight.w600, color: Color(0xff707070))),
                trailing: b
                    ? SvgPicture.asset(
                        GoRideConstant.getSvgImagePath("check_icon.svg"),
                        fit: BoxFit.scaleDown,
                      )
                    : SizedBox(
                        height: 0,
                        width: 0,
                      ),
              )),
        ));
  }

  Widget cashDetail() {
    return SlideAnimation(
        position: 5,
        itemCount: 15,
        slideDirection: SlideDirection.fromLeft,
        animationController: _animationController,
        child: GestureDetector(
          onTap: () {
            setState(() {
              a = false;
              b = false;
              c = true;
            });
          },
          child: Container(
              decoration: BoxDecoration(
                  color: Color(0xfff6f6f6),
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              margin: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * .1,
                  right: MediaQuery.of(context).size.width * .1),
              child: ListTile(
                contentPadding: EdgeInsets.only(left: 10, right: 10),
                leading: OctoImage(
                  image: CachedNetworkImageProvider(
                      "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/goride%2Fcash.png?alt=media&token=f4faac4c-1c2d-498f-96e2-18b2f207891c"),
                  placeholderBuilder: OctoPlaceholder.blurHash(
                    "LGB|1;Os_Nt7x]S\$tRM{.St7t-w]",
                  ),
                  errorBuilder: OctoError.icon(color: GoRideColors.black),
                  fit: BoxFit.scaleDown,
                  height: 12,
                  width: 20,
                ),
                title: Text('   Cash',
                    style: TextStyle(
                        fontWeight: FontWeight.w600, color: Color(0xff707070))),
                trailing: c
                    ? SvgPicture.asset(
                        GoRideConstant.getSvgImagePath("check_icon.svg"),
                        fit: BoxFit.scaleDown,
                      )
                    : SizedBox(
                        height: 0,
                        width: 0,
                      ),
              )),
        ));
  }

  Widget addDetail() {
    return SlideAnimation(
        position: 5,
        itemCount: 15,
        slideDirection: SlideDirection.fromLeft,
        animationController: _animationController,
        child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => GoRideNewPayMethod(),
                ),
              );
            },
            child: Container(
                decoration: BoxDecoration(
                    color: Color(0xfff6f6f6),
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                margin: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * .1,
                    right: MediaQuery.of(context).size.width * .1),
                child: ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: SvgPicture.asset(
                    GoRideConstant.getSvgImagePath("add_icon.svg"),
                    fit: BoxFit.scaleDown,
                    height: 40,
                  ),
                  title: Text("Add Payment Method",
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Color(0xff707070))),
                  trailing: IconButton(
                      icon: Icon(
                        Icons.arrow_forward_ios,
                        color: GoRideColors.black,
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) =>
                                GoRideNewPayMethod(),
                          ),
                        );
                      }),
                ))));
  }

  Widget applyBtn() {
    return SlideAnimation(
        position: 5,
        itemCount: 15,
        slideDirection: SlideDirection.fromBottom,
        animationController: _animationController,
        child: Container(
          padding:
              EdgeInsets.only(top: MediaQuery.of(context).size.height * .07),
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => GoRideChooseDesScreen(),
                ),
              );
            },
            child: Text(
              GoRideStringRes.applyBtn,
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: GoRideColors.black,
                  fontSize: 16),
            ),
            style: ElevatedButton.styleFrom(
              minimumSize: Size(310, 50),
              primary: GoRideColors.yellow,
            ),
          ),
        ));
  }
}
