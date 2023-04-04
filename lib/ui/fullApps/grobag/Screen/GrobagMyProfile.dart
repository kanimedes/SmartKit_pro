import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:octo_image/octo_image.dart';
import 'package:smartkit_pro/ui/fullApps/grobag/Helper/GrobagColor.dart';
import 'package:smartkit_pro/ui/fullApps/grobag/Screen/GrobagHome.dart';
import 'package:smartkit_pro/ui/fullApps/grobag/Screen/GrobagMyOrder.dart';

class GrobagMyProfile extends StatefulWidget {
  const GrobagMyProfile({Key? key}) : super(key: key);

  @override
  _GrobagMyProfileState createState() => _GrobagMyProfileState();
}

class _GrobagMyProfileState extends State<GrobagMyProfile> {
  String user = 'Abcdd', email = 'abc@gmail.com';
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => GrobagHome(),
            )) as Future<bool>;
      } as Future<bool> Function()?,
      child: Scaffold(
          body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              _getHeader(),
              Divider(),
              _myOrder(),
              _profile(),
              _manageAddress(),
              _setting(),
              _changePwd(),
              _coupens(),
              _logout()
            ],
          ),
        ),
      )),
    );
  }

  Widget _getHeader() {
    return Padding(
        padding: const EdgeInsetsDirectional.only(bottom: 10.0, top: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsetsDirectional.only(bottom: 17),
              height: 64,
              width: 64,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(width: 1.0, color: white)),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(100.0),
                  child: OctoImage(
                    image: CachedNetworkImageProvider(
                        "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/salonapp%2Fuser_2.jpg?alt=media&token=27018286-9cf1-4774-abb2-8cc676342235"),
                    placeholderBuilder: OctoPlaceholder.blurHash(
                        "L56*XM-o0157~Bt60fEL57NG-U\$*"),
                    errorBuilder: OctoError.icon(color: Colors.black),
                  )),
            ),
            Row(
              children: [
                Padding(
                    padding: const EdgeInsetsDirectional.only(start: 10),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Hi,$user',
                          style: Theme.of(context)
                              .textTheme
                              .subtitle1!
                              .copyWith(color: fontColor),
                        ),
                        email != null
                            ? Text(
                                email,
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle2!
                                    .copyWith(color: fontColor),
                              )
                            : Container(),
                      ],
                    )),
              ],
            ),
          ],
        ));
  }

  _myOrder() {
    return Container(
      margin: EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: lightBack)),
      child: ListTile(
        dense: true,
        title: Text(
          'My Orders',
          style: TextStyle(fontSize: 15),
        ),
        leading: Container(
            decoration: BoxDecoration(
                color: primary.withOpacity(0.2),
                borderRadius: BorderRadius.circular(5)),
            child: Icon(
              Icons.card_giftcard_outlined,
              color: primary,
            )),
        trailing: Icon(
          Icons.keyboard_arrow_right,
          color: primary,
        ),
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => GrobagMyOrder()));
        },
      ),
    );
  }

  _profile() {
    return Container(
      margin: EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: lightBack)),
      child: ListTile(
        dense: true,
        title: Text(
          'Profile Edit',
          style: TextStyle(fontSize: 15),
        ),
        leading: Container(
            decoration: BoxDecoration(
                color: primary.withOpacity(0.2),
                borderRadius: BorderRadius.circular(5)),
            child: Icon(
              Icons.person_outline,
              color: primary,
            )),
        trailing: Icon(
          Icons.keyboard_arrow_right,
          color: primary,
        ),
        onTap: () {},
      ),
    );
  }

  _changePwd() {
    return Container(
      margin: EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: lightBack)),
      child: ListTile(
        dense: true,
        title: Text(
          'Change Password',
          style: TextStyle(fontSize: 15),
        ),
        leading: Container(
            decoration: BoxDecoration(
                color: primary.withOpacity(0.2),
                borderRadius: BorderRadius.circular(5)),
            child: Icon(
              Icons.lock_outline,
              color: primary,
            )),
        trailing: Icon(
          Icons.keyboard_arrow_right,
          color: primary,
        ),
        onTap: () {},
      ),
    );
  }

  _setting() {
    return Container(
      margin: EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: lightBack)),
      child: ListTile(
        dense: true,
        title: Text(
          'Setting',
          style: TextStyle(fontSize: 15),
        ),
        leading: Container(
            decoration: BoxDecoration(
                color: primary.withOpacity(0.2),
                borderRadius: BorderRadius.circular(5)),
            child: Icon(
              Icons.settings_outlined,
              color: primary,
            )),
        trailing: Icon(
          Icons.keyboard_arrow_right,
          color: primary,
        ),
        onTap: () {},
      ),
    );
  }

  _coupens() {
    return Container(
      margin: EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: lightBack)),
      child: ListTile(
        dense: true,
        title: Text(
          'Coupons',
          style: TextStyle(fontSize: 15),
        ),
        leading: Container(
            decoration: BoxDecoration(
                color: primary.withOpacity(0.2),
                borderRadius: BorderRadius.circular(5)),
            child: Icon(
              Icons.payment_outlined,
              color: primary,
            )),
        trailing: Icon(
          Icons.keyboard_arrow_right,
          color: primary,
        ),
        onTap: () {},
      ),
    );
  }

  _logout() {
    return Container(
      margin: EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: lightBack)),
      child: ListTile(
        dense: true,
        title: Text(
          'Logout',
          style: TextStyle(fontSize: 15),
        ),
        leading: Container(
            decoration: BoxDecoration(
                color: primary.withOpacity(0.2),
                borderRadius: BorderRadius.circular(5)),
            child: Icon(
              Icons.logout,
              color: primary,
            )),
        trailing: Icon(
          Icons.keyboard_arrow_right,
          color: primary,
        ),
        onTap: () {},
      ),
    );
  }

  _manageAddress() {
    return Container(
      margin: EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: lightBack)),
      child: ListTile(
        dense: true,
        title: Text(
          'Manage Address',
          style: TextStyle(fontSize: 15),
        ),
        leading: Container(
            decoration: BoxDecoration(
                color: primary.withOpacity(0.2),
                borderRadius: BorderRadius.circular(5)),
            child: Icon(
              Icons.location_on_outlined,
              color: primary,
            )),
        trailing: Icon(
          Icons.keyboard_arrow_right,
          color: primary,
        ),
        onTap: () {},
      ),
    );
  }
}
