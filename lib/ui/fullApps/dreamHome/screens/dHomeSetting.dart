import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smartkit_pro/ui/fullApps/dreamHome/screens/profile/DHomeProfile.dart';

import '../helper/DHomeColors.dart';
import '../helper/DHomeString.dart';
import '../helper/DHomeconstant.dart';
import 'login/DHomePasswordUpdate.dart';

class DHomeSetting extends StatefulWidget {
  const DHomeSetting({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return DHomeSettingState();
  }
}

class DHomeSettingState extends State<DHomeSetting> {
  bool notificationSwitch = true,
      appNotificationSwitch = false,
      tLogin = true,
      fLogin = false,
      gLogin = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: DHomeColors.bgColor,
        body: SingleChildScrollView(
            child: Stack(fit: StackFit.loose, children: [
          AppBar(
            elevation: 0,
            toolbarHeight: 133,
            backgroundColor: DHomeColors.bgColor,
            leadingWidth: 80,
            centerTitle: true,
            title: const Text(
              DHomeString.Settings,
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.black),
            ),
            leading: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: SvgPicture.asset(
                  DHomeConstant.getSvgImagePath("back_arrow.svg"),
                  fit: BoxFit.scaleDown,
                )),
          ),
          settingDta()
        ])));
  }

  Widget settingDta() {
    return Container(
      height: MediaQuery.of(context).size.height,
      margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * .2),
      padding: const EdgeInsets.only(
        left: 30,
        right: 30,
      ),
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(50),
            topRight: Radius.circular(50),
          )),
      child: Column(
        children: [
          account(),
          line(),
          editPro(),
          changePwd(),
          notification(),
          line(),
          notificationData(),
          appNotificationData(),
          linkedAccount(),
          line(),
          twitterLogin(),
          fbLogin(),
          googleLogin(),
          more(),
          line(),
          language(),
          aboutUs(),
          contactUs(),
          feedBack(),
          term()
        ],
      ),
    );
  }

  Widget account() {
    return Padding(
        padding: const EdgeInsets.only(top: 20),
        child: titleName(DHomeConstant.getSvgImagePath("set.user.svg"),
            DHomeString.Account));
  }

  Widget line() {
    return Container(
      padding: const EdgeInsets.only(
        top: 10,
      ),
      child: const Divider(
        height: 1,
        color: Color(0xffacacac),
      ),
    );
  }

  Widget editPro() {
    return arrowTile(
        name: DHomeString.EditProfile,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const DHomeProfile(),
            ),
          );
        });
  }

  Widget changePwd() {
    return arrowTile(
        name: DHomeString.ChangePassword,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const DHomePasswordUpdate(),
            ),
          );
        });
  }

  Widget notification() {
    return titleName(DHomeConstant.getSvgImagePath("set.noti.svg"),
        DHomeString.Notifications);
  }

  Widget notificationData() {
    return switchTile(DHomeString.Notifications, notificationSwitch, 1);
  }

  Widget appNotificationData() {
    return switchTile(DHomeString.AppNotifications, appNotificationSwitch, 2);
  }

  Widget linkedAccount() {
    return titleName(DHomeConstant.getSvgImagePath("set.link.svg"),
        DHomeString.LinkedAccount);
  }

  Widget twitterLogin() {
    return switchTile(DHomeString.TwitterLogin, tLogin, 3);
  }

  Widget fbLogin() {
    return switchTile(DHomeString.FacebookLogin, fLogin, 4);
  }

  Widget googleLogin() {
    return switchTile(DHomeString.GoogleLogin, gLogin, 5);
  }

  Widget more() {
    return titleName(
        DHomeConstant.getSvgImagePath("set.more.svg"), DHomeString.More);
  }

  Widget language() {
    return arrowTile(name: DHomeString.Language, onPressed: () {});
  }

  Widget aboutUs() {
    return arrowTile(name: DHomeString.AboutUs, onPressed: () {});
  }

  Widget contactUs() {
    return arrowTile(name: DHomeString.ContactUs, onPressed: () {});
  }

  Widget feedBack() {
    return arrowTile(name: DHomeString.Feedback, onPressed: () {});
  }

  Widget term() {
    return arrowTile(name: DHomeString.TermsNConditions, onPressed: () {});
  }

  Widget switchTile(String name, bool switchData, int index) {
    return ListTile(
      dense: true,
      contentPadding: EdgeInsets.zero,
      visualDensity: const VisualDensity(horizontal: 0, vertical: -4),
      title: Text(
        name,
        style: const TextStyle(fontSize: 14, color: Color(0xff818181)),
      ),
      trailing: Container(
        padding: const EdgeInsets.only(left: 45),
        child: Transform.scale(
          alignment: Alignment.centerRight,
          scale: 0.7,
          child: CupertinoSwitch(
            activeColor: const Color(0xff141529),
            value: index == 1
                ? notificationSwitch
                : index == 2
                    ? appNotificationSwitch
                    : index == 3
                        ? tLogin
                        : index == 4
                            ? fLogin
                            : gLogin,
            onChanged: (value) {
              setState(() {
                index == 1
                    ? notificationSwitch = !notificationSwitch
                    : index == 2
                        ? appNotificationSwitch = !appNotificationSwitch
                        : index == 3
                            ? tLogin = !tLogin
                            : index == 4
                                ? fLogin = !fLogin
                                : gLogin = !gLogin;
                /* switchData = !switchData;
                print(switchData);*/
              });
            },
          ),
        ),
      ),
    );
  }

  Widget titleName(String image, String name) {
    return Container(
      padding: const EdgeInsets.only(top: 10),
      child: Row(
        children: [
          SvgPicture.asset(image),
          const SizedBox(
            width: 5,
          ),
          Text(
            name,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          )
        ],
      ),
    );
  }

  Widget arrowTile({String? name, VoidCallback? onPressed}) {
    return GestureDetector(
      onTap: onPressed,
      child: ListTile(
          dense: true,
          contentPadding: EdgeInsets.zero,
          visualDensity: const VisualDensity(horizontal: 0, vertical: -4),
          title: Text(
            name!,
            style: const TextStyle(fontSize: 14, color: Color(0xff818181)),
          ),
          trailing: IconButton(
              onPressed: onPressed,
              padding: const EdgeInsets.only(left: 40),
              icon: const Icon(Icons.arrow_forward_ios,
                  size: 15, color: Color(0xff818181)))),
    );
  }
}
