import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:octo_image/octo_image.dart';
import 'package:smartkit_pro/ui/fullApps/foodMaster/activity/authentication/LoginHomePage.dart';
import 'package:smartkit_pro/ui/fullApps/foodMaster/helper/ColorsRes.dart';
import 'package:smartkit_pro/ui/fullApps/foodMaster/helper/StringsRes.dart';

class IntroSliderScreens extends StatefulWidget {
  const IntroSliderScreens({Key? key}) : super(key: key);

  @override
  IntroSliderState createState() => IntroSliderState();
}

class IntroSliderState extends State<IntroSliderScreens>
    with SingleTickerProviderStateMixin {
  final _controller = PageController();
  double? toppading;
  int currentpage = 0;
  late AnimationController animationController;

  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      duration: Duration(
        milliseconds: 500,
      ),
      lowerBound: 0.0,
      upperBound: 0.1,
    )..addListener(() {
        setState(() {});
      });
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  Widget button() {
    return Transform.scale(
      scale: 1 - animationController.value,
      child: Card(
        elevation: 10,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18.0),
        ),
        child: Container(
          height: 70,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18.0),
            gradient: LinearGradient(
              colors: [
                Colors.white,
                currentpage == 0
                    ? ColorsRes.intro1buttonColor
                    : currentpage == 1
                        ? ColorsRes.intro2buttonColor
                        : ColorsRes.intro3buttonColor,
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: const [0, 2],
              tileMode: TileMode.clamp,
            ),
          ),
          child: Center(
            child: Text('Next',
                style: TextStyle(
                  fontSize: 20.0,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.bold,
                  color: currentpage == 0
                      ? ColorsRes.intro1buttonTextColor
                      : currentpage == 1
                          ? ColorsRes.intro2buttonTextColor
                          : ColorsRes.intro3buttonTextColor,
                )),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    toppading = kToolbarHeight;

    return Container(
      //color: ColorsRes.bgcolor,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            currentpage == 0
                ? ColorsRes.intro1Sed1Color
                : currentpage == 1
                    ? ColorsRes.intro2Sed1Color
                    : ColorsRes.intro3Sed1Color,
            currentpage == 0
                ? ColorsRes.intro1Sed2Color
                : currentpage == 1
                    ? ColorsRes.intro2Sed2Color
                    : ColorsRes.intro3Sed2Color,
            currentpage == 0
                ? ColorsRes.intro1Sed3Color
                : currentpage == 1
                    ? ColorsRes.intro2Sed3Color
                    : ColorsRes.intro3Sed3Color,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Stack(
        children: <Widget>[
          Card(
            margin: EdgeInsets.zero,
            shadowColor: currentpage == 0
                ? ColorsRes.intro1ShadowColor
                : currentpage == 1
                    ? ColorsRes.intro2ShadowColor
                    : ColorsRes.intro3ShadowColor,
            elevation: 15,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(80),
                  bottomRight: Radius.circular(80)),
            ),
            child: ClipRRect(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(80),
                    bottomRight: Radius.circular(80)),
                child: SizedBox(
                  child: OctoImage(
                    image: CachedNetworkImageProvider(currentpage == 0
                        ? "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/foodmaster%2Fonboarding_one.jpg?alt=media&token=323ffdda-eac3-472c-8254-b8b8c456b6e0"
                        : currentpage == 1
                            ? "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/foodmaster%2Fonboarding_two.jpg?alt=media&token=c87f18b5-b9d2-4717-b486-02b281a0eeb6"
                            : "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/foodmaster%2Fonboarding_three.jpg?alt=media&token=e32327fc-828c-444d-a98f-3dab2b4a40c1"),
                    placeholderBuilder: OctoPlaceholder.blurHash(
                      currentpage == 0
                          ? "LESN_M\$\$~mRk=ZRkK5R-xrs:ENR-"
                          : currentpage == 1
                              ? "LHSEE*xa~DxG?wR*KPW=%3s:EKW;"
                              : "LWFu.[;1P.GaqEVta#XmC+KPZ%r=",
                    ),
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    errorBuilder: OctoError.icon(color: ColorsRes.black),
                    fit: BoxFit.fill,
                  ),
                  height: MediaQuery.of(context).size.height / 1.6,
                )),
          ),
          PageView(
            controller: _controller,
            children: <Widget>[
              pageData(StringsRes.introtitle1, StringsRes.intro1, 0),
              pageData(StringsRes.introtitle2, StringsRes.intro2, 1),
              pageData(StringsRes.introtitle3, StringsRes.intro3, 2),
            ],
            onPageChanged: (int pageno) {
              setState(() {
                currentpage = pageno;
              });
            },
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding:
                  const EdgeInsets.only(bottom: 30.0, left: 30, right: 30.0),
              child: GestureDetector(
                  onTap: () {
                    if (currentpage == 2) {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => LoginHomePage(
                                  from: "intro",
                                )),
                      );
                    } else {
                      _controller.jumpToPage(currentpage + 1);
                    }
                  },
                  child: button()),
            ),
          ),
        ],
      ),
    );
  }

  Widget pageData(String title, String desc, int pageindex) {
    var height = MediaQuery.of(context).size.height;
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(height: 5),
          SizedBox(height: height / 2.1),
          title.trim().isEmpty
              ? Container()
              : Text(title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 30,
                      color: ColorsRes.white,
                      fontWeight: FontWeight.normal,
                      decoration: TextDecoration.none,
                      fontFamily: 'Poppins')),
          Padding(
            padding: const EdgeInsetsDirectional.only(
                start: 30.0, end: 30.0, top: 10, bottom: 20),
            child: Text(
              desc,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 16,
                  color: ColorsRes.white,
                  decoration: TextDecoration.none,
                  fontWeight: FontWeight.normal,
                  fontFamily: 'Poppins'),
            ),
          ),
        ]);
  }
}
