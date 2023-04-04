import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:octo_image/octo_image.dart';
import 'package:smartkit_pro/ui/fullApps/furnitureHub/helper/ColorsRes.dart';
import 'package:smartkit_pro/ui/fullApps/furnitureHub/helper/DesignConfig.dart';
import 'package:smartkit_pro/ui/fullApps/furnitureHub/helper/StringsRes.dart';

import '../../widgets/slideAnimation.dart';
import 'MyOrdersActivity.dart';
import 'PaymentsActivity.dart';
import 'ShippingAddressActivity.dart';

class ProfileActivity extends StatefulWidget {
  const ProfileActivity({Key? key}) : super(key: key);

  @override
  _ProfileActivityState createState() => _ProfileActivityState();
}

class _ProfileActivityState extends State<ProfileActivity>
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
    return Scaffold(
        backgroundColor: ColorsRes.backgroundColor,
        appBar: AppBar(
          backgroundColor: ColorsRes.backgroundColor,
          shadowColor: Colors.transparent,
          title: Text(
            StringsRes.profileText,
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
          automaticallyImplyLeading: false,
        ),
        body: SingleChildScrollView(
          child: Container(
            color: ColorsRes.backgroundColor,
            child: Column(children: [
              SlideAnimation(
                position: 1,
                itemCount: 8,
                slideDirection: SlideDirection.fromTop,
                animationController: _animationController,
                child: Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height / 99.0),
                  child: Container(
                      alignment: Alignment.topCenter,
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * .01),
                      child: CircleAvatar(
                        radius: 60,
                        backgroundColor:
                            ColorsRes.backgroundColor.withOpacity(0.5),
                        child: Container(
                          padding: EdgeInsets.all(5),
                          child: ClipOval(
                            child: OctoImage(
                              image: CachedNetworkImageProvider(
                                  "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/furnitureapp%2Fprofile_pic.jpg?alt=media&token=12f7ac95-5f2f-4789-9f36-d5ebe08792eb"),
                              placeholderBuilder: OctoPlaceholder.blurHash(
                                "L\$NmczIV_N%LofWBWBofXTt7xaay",
                              ),
                              errorBuilder: OctoError.icon(color: Colors.black),
                              width: 135,
                              height: 135,
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      )),
                ),
              ),
              SlideAnimation(
                position: 2,
                itemCount: 8,
                slideDirection: SlideDirection.fromBottom,
                animationController: _animationController,
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height / 40.4),
                    child: Text(
                      "Alexander Margarita",
                      style: TextStyle(
                          fontSize: 18,
                          color: ColorsRes.purpalColor,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
              SlideAnimation(
                position: 3,
                itemCount: 8,
                slideDirection: SlideDirection.fromBottom,
                animationController: _animationController,
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height / 99.0),
                    child: Text(
                      "alexandermargarita@gmail.com",
                      style: TextStyle(
                          fontSize: 14,
                          color: ColorsRes.purpalColor,
                          fontWeight: FontWeight.normal),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height / 99),
              SlideAnimation(
                position: 5,
                itemCount: 8,
                slideDirection: SlideDirection.fromBottom,
                animationController: _animationController,
                child: Container(
                    margin: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height / 40),
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height / 40,
                        bottom: MediaQuery.of(context).size.height / 40),
                    decoration:
                        DesignConfig.halfCurve(ColorsRes.white, 30.0, 30.0),
                    height: MediaQuery.of(context).size.height / 1.5,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ListTile(
                            dense: true,
                            contentPadding: EdgeInsets.only(
                                left: MediaQuery.of(context).size.width / 15,
                                right: MediaQuery.of(context).size.width / 15),
                            title: Row(
                              children: [
                                SvgPicture.asset(
                                    "assets/images/fullApps/furnitureHub/pro_order.svg"),
                                SizedBox(width: 18.0),
                                Text(
                                  StringsRes.myCartText,
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    color: ColorsRes.textColor,
                                    fontSize: 19,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ],
                            ),
                            trailing: SvgPicture.asset(
                                "assets/images/fullApps/furnitureHub/back.svg"),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => MyOrdersActivity(),
                                ),
                              );
                            },
                          ),
                          Divider(
                            color: ColorsRes.greyColor,
                            indent: MediaQuery.of(context).size.width / 18,
                            endIndent: MediaQuery.of(context).size.width / 18,
                          ),
                          ListTile(
                            dense: true,
                            contentPadding: EdgeInsets.only(
                                left: MediaQuery.of(context).size.width / 15,
                                right: MediaQuery.of(context).size.width / 15),
                            title: Row(
                              children: [
                                SvgPicture.asset(
                                    "assets/images/fullApps/furnitureHub/pro_fav.svg"),
                                SizedBox(width: 18.0),
                                Text(
                                  StringsRes.myFavouritesText,
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    color: ColorsRes.textColor,
                                    fontSize: 19,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ],
                            ),
                            trailing: SvgPicture.asset(
                                "assets/images/fullApps/furnitureHub/back.svg"),
                            onTap: () {},
                          ),
                          Divider(
                            color: ColorsRes.greyColor,
                            indent: MediaQuery.of(context).size.width / 18,
                            endIndent: MediaQuery.of(context).size.width / 18,
                          ),
                          ListTile(
                            dense: true,
                            contentPadding: EdgeInsets.only(
                                left: MediaQuery.of(context).size.width / 15,
                                right: MediaQuery.of(context).size.width / 15),
                            title: Row(
                              children: [
                                SvgPicture.asset(
                                    "assets/images/fullApps/furnitureHub/pro_shipadd.svg"),
                                SizedBox(width: 18.0),
                                Text(
                                  StringsRes.shippingAddressText,
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    color: ColorsRes.textColor,
                                    fontSize: 19,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ],
                            ),
                            trailing: SvgPicture.asset(
                                "assets/images/fullApps/furnitureHub/back.svg"),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      ShippingAddressActivity(),
                                ),
                              );
                            },
                          ),
                          Divider(
                            color: ColorsRes.greyColor,
                            indent: MediaQuery.of(context).size.width / 18,
                            endIndent: MediaQuery.of(context).size.width / 18,
                          ),
                          ListTile(
                            dense: true,
                            contentPadding: EdgeInsets.only(
                                left: MediaQuery.of(context).size.width / 15,
                                right: MediaQuery.of(context).size.width / 15),
                            title: Row(
                              children: [
                                SvgPicture.asset(
                                    "assets/images/fullApps/furnitureHub/pro_card.svg"),
                                SizedBox(width: 18.0),
                                Text(
                                  StringsRes.mySavedCardsText,
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    color: ColorsRes.textColor,
                                    fontSize: 19,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ],
                            ),
                            trailing: SvgPicture.asset(
                                "assets/images/fullApps/furnitureHub/back.svg"),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => PaymentsActivity(),
                                ),
                              );
                            },
                          ),
                          Divider(
                            color: ColorsRes.greyColor,
                            indent: MediaQuery.of(context).size.width / 18,
                            endIndent: MediaQuery.of(context).size.width / 18,
                          ),
                          ListTile(
                            dense: true,
                            contentPadding: EdgeInsets.only(
                                left: MediaQuery.of(context).size.width / 15,
                                right: MediaQuery.of(context).size.width / 15),
                            title: Row(
                              children: [
                                SvgPicture.asset(
                                    "assets/images/fullApps/furnitureHub/pro_gift.svg"),
                                SizedBox(width: 18.0),
                                Text(
                                  StringsRes.giftCardsVouchersText,
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    color: ColorsRes.textColor,
                                    fontSize: 19,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ],
                            ),
                            trailing: SvgPicture.asset(
                                "assets/images/fullApps/furnitureHub/back.svg"),
                            onTap: () {},
                          ),
                          Divider(
                            color: ColorsRes.greyColor,
                            indent: MediaQuery.of(context).size.width / 18,
                            endIndent: MediaQuery.of(context).size.width / 18,
                          ),
                          ListTile(
                            dense: true,
                            contentPadding: EdgeInsets.only(
                                left: MediaQuery.of(context).size.width / 15,
                                right: MediaQuery.of(context).size.width / 15),
                            title: Row(
                              children: [
                                SvgPicture.asset(
                                    "assets/images/fullApps/furnitureHub/pro_logout.svg"),
                                SizedBox(width: 18.0),
                                Text(
                                  StringsRes.logoutText,
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    color: ColorsRes.textColor,
                                    fontSize: 19,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ],
                            ),
                            trailing: SvgPicture.asset(
                                "assets/images/fullApps/furnitureHub/back.svg"),
                            onTap: () {},
                          ),
                        ])),
              ),
            ]),
          ),
        ));
  }
}
