import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:octo_image/octo_image.dart';
import 'package:smartkit_pro/ui/fullApps/furnitureHub/helper/ColorsRes.dart';
import 'package:smartkit_pro/ui/fullApps/furnitureHub/helper/DesignConfig.dart';
import 'package:smartkit_pro/ui/fullApps/furnitureHub/helper/StringsRes.dart';

import '../../widgets/slideAnimation.dart';

class ShippingAddressActivity extends StatefulWidget {
  const ShippingAddressActivity({Key? key}) : super(key: key);

  @override
  _ShippingAddressActivityState createState() =>
      _ShippingAddressActivityState();
}

class _ShippingAddressActivityState extends State<ShippingAddressActivity>
    with SingleTickerProviderStateMixin {
  AnimationController? _animationController;
  String? addressType = StringsRes.homeText;
  bool isSwitched = false;

  @override
  void initState() {
    _animationController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 2000));
    selectLocationController = TextEditingController(text: "Select Location");
    yourLocationController =
        TextEditingController(text: "72 Markham Apt, Ontario, CA");
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _animationController!.dispose();
  }

  late TextEditingController selectLocationController,
      yourLocationController,
      cVVController,
      cardHolderController;

  Widget showSelectLocation() {
    return Container(
      margin: EdgeInsets.only(
          left: MediaQuery.of(context).size.width / 15,
          right: MediaQuery.of(context).size.width / 15,
          top: MediaQuery.of(context).size.height / 50),
      child: TextFormField(
        controller: selectLocationController,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.normal,
          color: ColorsRes.purpalColor,
        ),
        decoration: InputDecoration(
            labelText: StringsRes.selectLocationText,
            labelStyle: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.normal,
              color: ColorsRes.greyColor,
            ),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: ColorsRes.greyColor),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: ColorsRes.greyColor),
            )),
      ),
    );
  }

  Widget showYourLocation() {
    return Container(
      margin: EdgeInsets.only(
          left: MediaQuery.of(context).size.width / 15,
          right: MediaQuery.of(context).size.width / 15,
          top: MediaQuery.of(context).size.height / 40),
      child: TextFormField(
        controller: yourLocationController,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.normal,
          color: ColorsRes.purpalColor,
        ),
        decoration: InputDecoration(
            contentPadding: EdgeInsets.zero,
            labelText: StringsRes.yourLocationText,
            prefixIcon: Icon(Icons.location_on, color: ColorsRes.black),
            suffix: Text(
              StringsRes.changeText,
              style: TextStyle(
                  fontSize: 10,
                  color: ColorsRes.yellowColor,
                  fontWeight: FontWeight.bold),
            ),
            labelStyle: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.normal,
              color: ColorsRes.greyColor,
            ),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: ColorsRes.greyColor),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: ColorsRes.greyColor),
            )),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsRes.backgroundColor,
      appBar: AppBar(
        backgroundColor: ColorsRes.backgroundColor,
        shadowColor: Colors.transparent,
        title: Text(
          StringsRes.shippingAddressText,
          style: TextStyle(
              color: ColorsRes.violateColor,
              fontSize: 18,
              fontWeight: FontWeight.bold),
        ),
        bottom: PreferredSize(
          child: Divider(
            color: ColorsRes.greyColor,
            height: 2.3,
          ),
          preferredSize: Size(50, 5),
        ),
        centerTitle: true,
        leading: Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: SlideAnimation(
              position: 1,
              itemCount: 11,
              slideDirection: SlideDirection.fromTop,
              animationController: _animationController,
              child: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(Icons.arrow_back_ios,
                      color: ColorsRes.purpalColor))),
        ),
      ),
      body: Stack(children: [
        OctoImage(
          image: CachedNetworkImageProvider(
              'https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/salonapp%2Fmap.jpg?alt=media&token=eec4db0c-7c3e-4301-aee7-e2b31a0943f6'),
          placeholderBuilder:
              OctoPlaceholder.blurHash('L3Qm9i%gJF-:~q9F-;%M4^?H\$uNG'),
          errorBuilder: OctoError.icon(color: Colors.black),
          height: double.maxFinite,
          width: double.maxFinite,
          fit: BoxFit.cover,
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: bottomWidget(),
        ),
      ]),
    );
  }

  Widget bottomWidget() {
    return IntrinsicHeight(
      child: Column(children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            GestureDetector(
              onTap: () {},
              child: Container(
                padding: EdgeInsets.all(15),
                child: SvgPicture.asset(
                    "assets/images/fullApps/furnitureHub/gps.svg"),
              ),
            ),
          ]),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: GestureDetector(
            onTap: () {},
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              padding: EdgeInsets.all(15),
              child: SvgPicture.asset(
                  "assets/images/fullApps/furnitureHub/current_loc.svg"),
            ),
          ),
        ),
        SlideAnimation(
          position: 2,
          itemCount: 11,
          slideDirection: SlideDirection.fromBottom,
          animationController: _animationController,
          child: Container(
            height: MediaQuery.of(context).size.height / 2.2,
            decoration: DesignConfig.halfCurve(ColorsRes.white, 30.0, 30.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //SizedBox(height : MediaQuery.of(context).size.height/60),
                  showSelectLocation(),
                  showYourLocation(),
                  Padding(
                    padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width / 15,
                        right: MediaQuery.of(context).size.width / 15,
                        top: MediaQuery.of(context).size.width / 20),
                    child: Text(
                      StringsRes.tagThisLocationForLaterText,
                      style: TextStyle(
                          fontSize: 16,
                          color: ColorsRes.greyColor,
                          fontWeight: FontWeight.normal),
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height / 60),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              addressType = StringsRes.homeText;
                            });
                          },
                          child: Container(
                            margin: EdgeInsets.only(
                                left: MediaQuery.of(context).size.width / 15),
                            alignment: Alignment.center,
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height / 15,
                            decoration: addressType == StringsRes.homeText
                                ? DesignConfig.boxDecorationContainer(
                                    ColorsRes.yellowColor, 10.0)
                                : DesignConfig.boxDecorationBorderButtonColor(
                                    ColorsRes.deactiveColor, 10.0),
                            child: Text(
                              StringsRes.homeText,
                              style: TextStyle(
                                  fontSize: 16,
                                  color: addressType == StringsRes.homeText
                                      ? ColorsRes.white
                                      : ColorsRes.deactiveColor,
                                  fontWeight: FontWeight.normal),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                          child: GestureDetector(
                        onTap: () {
                          setState(() {
                            addressType = StringsRes.workText;
                          });
                        },
                        child: Container(
                          margin: EdgeInsets.only(
                              left: MediaQuery.of(context).size.width / 20),
                          alignment: Alignment.center,
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height / 15,
                          decoration: addressType == StringsRes.workText
                              ? DesignConfig.boxDecorationContainer(
                                  ColorsRes.yellowColor, 10.0)
                              : DesignConfig.boxDecorationBorderButtonColor(
                                  ColorsRes.deactiveColor, 10.0),
                          child: Text(
                            StringsRes.workText,
                            style: TextStyle(
                                fontSize: 16,
                                color: addressType == StringsRes.workText
                                    ? ColorsRes.white
                                    : ColorsRes.deactiveColor,
                                fontWeight: FontWeight.normal),
                          ),
                        ),
                      )),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              addressType = StringsRes.otherText;
                            });
                          },
                          child: Container(
                            margin: EdgeInsets.only(
                                left: MediaQuery.of(context).size.width / 15,
                                right: MediaQuery.of(context).size.width / 15),
                            alignment: Alignment.center,
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height / 15,
                            decoration: addressType == StringsRes.otherText
                                ? DesignConfig.boxDecorationContainer(
                                    ColorsRes.yellowColor, 10.0)
                                : DesignConfig.boxDecorationBorderButtonColor(
                                    ColorsRes.deactiveColor, 10.0),
                            child: Text(
                              StringsRes.otherText,
                              style: TextStyle(
                                  fontSize: 16,
                                  color: addressType == StringsRes.otherText
                                      ? ColorsRes.white
                                      : ColorsRes.deactiveColor,
                                  fontWeight: FontWeight.normal),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      margin: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width / 15,
                          right: MediaQuery.of(context).size.width / 15,
                          top: MediaQuery.of(context).size.width / 15),
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height / 15,
                      decoration: DesignConfig.boxDecorationContainer(
                          ColorsRes.greenColor, 10.0),
                      child: Text(
                        StringsRes.saveAddressText,
                        style: TextStyle(
                            fontSize: 14,
                            color: ColorsRes.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
