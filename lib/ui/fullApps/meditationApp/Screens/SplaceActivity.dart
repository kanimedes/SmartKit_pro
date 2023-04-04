import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:octo_image/octo_image.dart';
import 'package:smartkit_pro/ui/fullApps/meditationApp/Screens/LoginActivity.dart';
import 'package:smartkit_pro/ui/fullApps/meditationApp/helper/ColorsRes.dart';
import 'package:smartkit_pro/ui/fullApps/meditationApp/helper/DesignConfig.dart';
import 'package:smartkit_pro/ui/fullApps/meditationApp/helper/StringsRes.dart';

class SplashActivity extends StatelessWidget {
  const SplashActivity({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        OctoImage(
          image: CachedNetworkImageProvider(
            "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/meditation%2Fbackground_image.jpg?alt=media&token=43a9e6c2-d53d-449a-bd35-a372dce98f8b",
          ),
          placeholderBuilder: OctoPlaceholder.blurHash(
            "LeONwYI=%Lt6YkoeayWCM^oLM{WC",
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
              Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height / 20),
                child: SvgPicture.asset(
                    "assets/images/fullApps/meditationApp/meditationLogo.svg",
                    height: MediaQuery.of(context).size.height / 10.9),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: 15.0,
                    left: MediaQuery.of(context).size.height / 18,
                    right: MediaQuery.of(context).size.height / 18),
                child: Text(
                  StringsRes.startTitle,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: ColorsRes.textColor,
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                    fontFamily: "Lato",
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginActivity(),
                    ),
                  );
                },
                child: Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height / 1.7),
                  height: MediaQuery.of(context).size.height / 14,
                  width: MediaQuery.of(context).size.width / 2.4,
                  decoration: DesignConfig.buttonShadowColor(
                      ColorsRes.gradientColor1,
                      30.0,
                      ColorsRes.gradientColor2,
                      ColorsRes.gradientColor3),
                  child: Text(
                    StringsRes.start,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                      color: ColorsRes.white,
                      fontWeight: FontWeight.normal,
                      fontFamily: "TrebuchetMS",
                    ),
                  ),
                ),
              ),
            ])
      ]),
    );
  }
}
