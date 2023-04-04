import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:octo_image/octo_image.dart';

import 'package:smartkit_pro/ui/fullApps/happyShop/Helper/HappyShopColor.dart';
import 'package:smartkit_pro/ui/fullApps/happyShop/Helper/HappyShopString.dart';
import 'package:smartkit_pro/ui/fullApps/happyShop/Screen/HappyShopCart.dart';
import 'package:smartkit_pro/ui/fullApps/happyShop/Screen/HappyShopFavrite.dart';
import 'package:smartkit_pro/ui/fullApps/happyShop/Screen/HappyShopHome.dart';
import 'package:smartkit_pro/ui/fullApps/happyShop/Screen/HappyShopLogin.dart';
import 'package:smartkit_pro/ui/fullApps/happyShop/Screen/HappyShopNotification.dart';
import 'package:smartkit_pro/ui/fullApps/happyShop/Screen/HappyShopOrderDetails.dart';
import 'package:smartkit_pro/ui/fullApps/happyShop/Screen/HappyShopProfile.dart';
import 'package:smartkit_pro/ui/fullApps/happyShop/Screen/HappyShopSingUp.dart';
import 'package:smartkit_pro/ui/fullApps/happyShop/Screen/HappyShopTrackOrder.dart';

class HappyShopDrawer extends StatelessWidget {
  const HappyShopDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.all(0),
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        children: <Widget>[
          HappyShopDrawerHeader(),
          HappyShopDrawerListTile(
            title: HOME_LBL,
            icon: Icons.home,
            route: () {
              Navigator.of(context).pop();
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => HappyShopHome(),
                ),
              );
            },
          ),
          //_getDivider(),
          HappyShopDrawerListTile(
            title: CART,
            icon: Icons.add_shopping_cart,
            route: () {
              Navigator.of(context).pop();
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HappyShopCart(),
                ),
              );
            },
          ),
          //_getDivider(),
          HappyShopDrawerListTile(
            img: true,
            imgurl: "assets/images/fullApps/happyshop/pro_trackorder.svg",
            title: TRACK_ORDER,
            icon: Icons.bike_scooter,
            route: () {
              Navigator.of(context).pop();
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HappyShopTreackOrder(
                    appbar: true,
                  ),
                ),
              );
            },
          ),
          //_getDivider(),
          HappyShopDrawerListTile(
            img: true,
            imgurl: "assets/images/fullApps/happyshop/profile.svg",
            title: PROFILE,
            icon: Icons.person,
            route: () {
              Navigator.of(context).pop();
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HappyShopPeofile(),
                ),
              );
            },
          ),
          //_getDivider(),
          HappyShopDrawerListTile(
            img: true,
            imgurl: "assets/images/fullApps/happyshop/pro_od.svg",
            title: ORDER_DETAIL,
            icon: Icons.content_paste_sharp,
            route: () {
              Navigator.of(context).pop();
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HappyShopOrderDetails(),
                ),
              );
            },
          ),
          //_getDivider(),
          HappyShopDrawerListTile(
            img: true,
            imgurl: "assets/images/fullApps/happyshop/pro_notification.svg",
            title: NOTIFICATION,
            icon: Icons.notification_important,
            route: () {
              Navigator.of(context).pop();
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => HappyShopNotification(
                    appbar: true,
                  ),
                ),
              );
            },
          ),
          //_getDivider(),
          HappyShopDrawerListTile(
            img: true,
            imgurl: "assets/images/fullApps/happyshop/pro_favourite.svg",
            title: FAVORITE,
            icon: Icons.favorite,
            route: () {
              Navigator.of(context).pop();
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => HappyShopFavrite(
                    appbar: true,
                  ),
                ),
              );
            },
          ),
          //_getDivider(),
          HappyShopDrawerListTile(
            title: "Login",
            icon: Icons.login,
            route: () {
              Navigator.of(context).pop();
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HappyShopLogin(),
                ),
              );
            },
          ),
          //_getDivider(),
          HappyShopDrawerListTile(
            title: "SingUp",
            icon: Icons.account_box_rounded,
            route: () {
              Navigator.of(context).pop();
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => HappyShopSingUp(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class HappyShopDrawerListTile extends StatelessWidget {
  final IconData icon;
  final String? title, imgurl;
  final Function route;
  final bool img;
  const HappyShopDrawerListTile({
    Key? key,
    required this.icon,
    required this.title,
    required this.route,
    this.img = false,
    this.imgurl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
        contentPadding: EdgeInsets.only(left: 25.0),
        /*leading: img == true
            ? SvgPicture.asset(
                imgurl,
                width: 28.0,
                color: happyshopcolor2,
              )
            : Icon(
                icon,
                color: happyshopcolor2,
              ),*/
        title: Row(
          children: [
            img == true
                ? SvgPicture.asset(
                    imgurl!,
                    width: 28.0,
                    color: happyshopcolor2,
                  )
                : Icon(
                    icon,
                    color: happyshopcolor2,
                  ),
            SizedBox(width: 15.0),
            Text(
              title!,
              style: TextStyle(color: textcolor),
            ),
          ],
        ),
        /*trailing: Icon(
          Icons.keyboard_arrow_right,
          color: happyshopcolor2,
        ),*/
        onTap: route as void Function()?);
  }
}

class HappyShopDrawerHeader extends StatelessWidget {
  const HappyShopDrawerHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(gradient: happyshopgradient),
      padding: EdgeInsets.only(
          top: MediaQuery.of(context).size.height / 15,
          left: 25.0,
          bottom: 20.0),
      child: InkWell(
        child: Align(
          alignment: Alignment.topLeft,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Platform.isIOS
                  ? BackButton(
                      color: white,
                    )
                  : Text(""),
              CircleAvatar(
                radius: 40,
                child: ClipOval(
                  child: OctoImage(
                    image: CachedNetworkImageProvider(
                        "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/cryptotech%2Fprofilepic.jpg?alt=media&token=2be2819f-6007-4763-a727-cb93f08f460c"),
                    placeholderBuilder: OctoPlaceholder.blurHash(
                      "LNIX]g_3.TIU%NRjRPxukXR*s9of",
                    ),
                    errorBuilder: OctoError.icon(color: textcolor),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Text("Hi, Blacksmith",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontFamily: 'Open sans',
                      fontWeight: FontWeight.bold)),
              Text(
                "Bhuj - Gujarat 370001",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontFamily: 'Open sans',
                    fontWeight: FontWeight.normal),
              )
            ],
          ),
        ),
        onTap: () {},
      ),
    );
  }
}
