import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:octo_image/octo_image.dart';
import 'package:smartkit_pro/ui/fullApps/pureBeauty/helper/DataConfig.dart';
import 'package:smartkit_pro/ui/fullApps/pureBeauty/helper/DesignConfig.dart';
import 'package:smartkit_pro/ui/fullApps/pureBeauty/styles/colors.dart';

import 'SalonDetailPage.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController edtsearch = TextEditingController();
  int slidercurrimg = 0, selectedserviceid = 1;
  late Timer slidertimer;

  @override
  void initState() {
    super.initState();
    slidertimer = Timer.periodic(Duration(seconds: 5), (Timer timer) {
      if (slidercurrimg < DataConfig.sliderList.length - 1) {
        slidercurrimg++;
      } else {
        slidercurrimg = 0;
      }

      setState(() {});
    });
  }

  @override
  void dispose() {
    slidertimer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.light,
      ),
      child: Scaffold(
        backgroundColor: salonbgcolor,
        appBar: DesignConfig.setAppbar("Find Specialist", context, true)
            as PreferredSizeWidget?,
        body: SingleChildScrollView(
          physics:
              BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(children: [
            searchWidget(),
            sliderWidget(),
            SizedBox(height: 15),
            serviceWidget(),
            SizedBox(height: 15),
            popularSpecialistWidget(),
            SizedBox(height: 25),
            featuredSalonWidget(),
            SizedBox(height: 25),
            dailyDealsWidget(),
            SizedBox(height: 25),
            recentlyVisitedWidget(),
            SizedBox(height: 25),
            allShopWidget(),
          ]),
        ),
      ),
    );
  }

  Widget searchWidget() {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          alignment: Alignment.centerLeft,
          decoration: DesignConfig.newInnerDecoration(30),
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: TextFormField(
            style: TextStyle(color: salonappcolor),
            cursorColor: salonappcolor,
            decoration: InputDecoration(
              hintText: "What do you want to do ?",
              hintStyle: Theme.of(context)
                  .textTheme
                  .subtitle2!
                  .merge(TextStyle(color: salonlightfont, letterSpacing: 0.5)),
              border: InputBorder.none,
            ),
            keyboardType: TextInputType.emailAddress,
            controller: edtsearch,
          ),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: IntrinsicWidth(
            child: Container(
              //margin: EdgeInsets.only(top: 16),
              decoration: DesignConfig.outerDecoration(10),
              alignment: Alignment.center,

              padding:
                  EdgeInsets.only(bottom: 10, top: 10, left: 10, right: 10),
              child: SvgPicture.asset(
                  "assets/images/fullApps/pureBeauty/svgimg/search.svg"),
            ),
          ),
        ),
      ],
    );
  }

  Widget sliderWidget() {
    return Column(children: [
      AnimatedContainer(
        curve: Curves.elasticInOut,
        duration: Duration(milliseconds: 600),
        margin: EdgeInsets.only(top: 20, bottom: 15),
        //decoration: DesignConfig.sliderInnerDecoration(10),
        decoration: DesignConfig.newInnerDecoration(10),
        padding: EdgeInsets.all(8),
        child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Stack(
              children: [
                OctoImage(
                  image: CachedNetworkImageProvider(
                      DataConfig.sliderList[slidercurrimg]['imgurl']),
                  placeholderBuilder: OctoPlaceholder.blurHash(
                      DataConfig.sliderList[slidercurrimg]['hash']),
                  errorBuilder: OctoError.icon(color: Colors.black),
                  height: 180,
                  width: double.maxFinite,
                  fit: BoxFit.fill,
                ),
                Positioned.fill(
                    child: Align(
                        alignment: Alignment.bottomLeft,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            DataConfig.sliderList[slidercurrimg]['title'],
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        )))
              ],
            )),
      ),
      Wrap(
          spacing: 15,
          runSpacing: 10,
          alignment: WrapAlignment.center,
          direction: Axis.horizontal,
          children: List.generate(DataConfig.sliderList.length, (index) {
            return GestureDetector(
              onTap: () {
                if (slidercurrimg != index) {
                  setState(() {
                    slidercurrimg = index;
                  });
                }
              },
              child: AnimatedContainer(
                duration: DesignConfig.animationtime,
                decoration: slidercurrimg == index
                    ? DesignConfig.newInnerDecorationCircle()
                    : DesignConfig.outersliderCircularDecoration(salonbgcolor),
                padding: EdgeInsets.all(slidercurrimg == index ? 10 : 8),
                child: Text(
                  "${index + 1}",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: slidercurrimg == index
                          ? salonappcolor
                          : salonmainlight,
                      fontWeight: FontWeight.bold),
                ),
              ),
            );
          })),
    ]);
  }

  Widget serviceWidget() {
    return Column(children: [
      Row(children: [
        Text(
          "Choose Service",
          style: Theme.of(context).textTheme.headline6!.merge(TextStyle(
              color: salonappcolor,
              fontWeight: FontWeight.bold,
              letterSpacing: 0.5)),
        ),
        Spacer(),
        Text(
          "See all",
          style: Theme.of(context).textTheme.subtitle1!.merge(TextStyle(
              color: salonlightfont,
              fontWeight: FontWeight.bold,
              letterSpacing: 0.5)),
        ),
      ]),
      Container(
        height: 100,
        margin: EdgeInsets.only(top: 20, bottom: 20),
        color: salonbgcolor,
        child: ListView(
            scrollDirection: Axis.horizontal,
            children: List.generate(DataConfig.serviceList.length, (index) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedserviceid = DataConfig.serviceList[index]['id'];
                  });
                },
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: AnimatedContainer(
                        duration: DesignConfig.animationtime,
                        width: 110,
                        height: 100,
                        padding: EdgeInsets.only(left: 12, right: 12),
                        margin: EdgeInsets.only(
                            bottom: 10,
                            right: index == DataConfig.serviceList.length - 1
                                ? 10
                                : 30),
                        decoration: selectedserviceid ==
                                DataConfig.serviceList[index]['id']
                            ? DesignConfig.newInnerDecoration(10)
                            : DesignConfig.outerDecorationService(
                                10, salonbgcolor),
                        //decoration: DesignConfig.outerDecorationService(10, salonbgcolor),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                  DataConfig.serviceList[index]['img']),
                              SizedBox(height: 15),
                              Text(
                                DataConfig.serviceList[index]['title'],
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle1!
                                    .merge(TextStyle(
                                        color: salonlightfont,
                                        fontWeight: FontWeight.bold,
                                        letterSpacing: 0.5)),
                              ),
                            ]))),
              );
            })),
      ),
    ]);
  }

  Widget popularSpecialistWidget() {
    return Column(children: [
      Row(children: [
        Text(
          "Popular Specialists",
          style: Theme.of(context).textTheme.headline6!.merge(TextStyle(
              color: salonappcolor,
              fontWeight: FontWeight.bold,
              letterSpacing: 0.5)),
        ),
        Spacer(),
        Text(
          "See all",
          style: Theme.of(context).textTheme.subtitle1!.merge(TextStyle(
              color: salonlightfont,
              fontWeight: FontWeight.bold,
              letterSpacing: 0.5)),
        ),
      ]),
      SizedBox(height: 10),
      Row(children: [
        Expanded(
            child: Container(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 15),
          decoration: DesignConfig.outerDecorationService(10, salonbgcolor),
          child: Column(children: [
            Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      colors: [salonlightfont.withOpacity(0.5), Colors.white],
                    ),
                  ),
                  padding: EdgeInsets.all(8),
                  child: CircleAvatar(
                    radius: 40,
                    child: ClipOval(
                      child: OctoImage(
                        image: CachedNetworkImageProvider(
                            'https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/salonapp%2Fuser_2.jpg?alt=media&token=27018286-9cf1-4774-abb2-8cc676342235'),
                        placeholderBuilder: OctoPlaceholder.blurHash(
                            'L56*XM-o0157~Bt60fEL57NG-U\$*'),
                        errorBuilder: OctoError.icon(color: Colors.black),
                      ),
                    ),
                  ),
                ),
                Positioned.fill(
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 5, right: 5),
                      child: CircleAvatar(
                        radius: 12,
                        backgroundColor: salonappcolor,
                        child: Text(
                          "4.5",
                          style: TextStyle(color: Colors.white, fontSize: 10),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(height: 10),
            Text(
              "WRTeam",
              style: Theme.of(context).textTheme.subtitle1!.merge(
                  TextStyle(color: salonappcolor, fontWeight: FontWeight.bold)),
            ),
            SizedBox(height: 5),
            Text(
              "Hairdresser",
              style: Theme.of(context)
                  .textTheme
                  .caption!
                  .merge(TextStyle(color: salonlightfont, letterSpacing: 0.5)),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                    child: GestureDetector(
                  onTap: () {},
                  child: Card(
                    color: salonappcolor,
                    elevation: 5,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(
                              Icons.send,
                              color: Colors.white,
                              size: 13.0,
                            ),
                            SizedBox(width: 5),
                            Text(
                              'Chat',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 10),
                            ),
                          ]),
                    ),
                  ),
                )),
                SizedBox(width: 10),
                Expanded(
                    child: GestureDetector(
                  onTap: () {},
                  child: Card(
                    elevation: 5,
                    color: salonbgcolor,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.favorite,
                              color: salonappcolor,
                              size: 13.0,
                            ),
                            SizedBox(width: 5),
                            Text(
                              'Follow',
                              style:
                                  TextStyle(color: salonappcolor, fontSize: 10),
                            ),
                          ]),
                    ),
                  ),
                )),
              ],
            ),
          ]),
        )),
        SizedBox(width: 20),
        Expanded(
            child: Container(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 15),
          decoration: DesignConfig.outerDecorationService(10, salonbgcolor),
          child: Column(children: [
            Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      colors: [salonlightfont.withOpacity(0.5), Colors.white],
                    ),
                  ),
                  padding: EdgeInsets.all(8),
                  child: CircleAvatar(
                    radius: 40,
                    child: ClipOval(
                      child: OctoImage(
                        image: CachedNetworkImageProvider(
                            'https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/salonapp%2Fuser_8.jpg?alt=media&token=615e1f47-6ec6-4003-9571-77ef54ce8265'),
                        placeholderBuilder: OctoPlaceholder.blurHash(
                            'L7E.X|of0NkD0%M{JCRj_3t7~Aof'),
                        errorBuilder: OctoError.icon(color: Colors.black),
                      ),
                    ),
                  ),
                ),
                Positioned.fill(
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 5, right: 5),
                      child: CircleAvatar(
                        radius: 12,
                        backgroundColor: salonappcolor,
                        child: Text(
                          "4.5",
                          style: TextStyle(color: Colors.white, fontSize: 10),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(height: 10),
            Text(
              "WRTeam",
              style: Theme.of(context).textTheme.subtitle1!.merge(
                  TextStyle(color: salonappcolor, fontWeight: FontWeight.bold)),
            ),
            SizedBox(height: 5),
            Text(
              "Hairdresser",
              style: Theme.of(context)
                  .textTheme
                  .caption!
                  .merge(TextStyle(color: salonlightfont, letterSpacing: 0.5)),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                    child: GestureDetector(
                  onTap: () {},
                  child: Card(
                    color: salonappcolor,
                    elevation: 5,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(
                              Icons.send,
                              color: Colors.white,
                              size: 13.0,
                            ),
                            SizedBox(width: 5),
                            Text(
                              'Chat',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 10),
                            ),
                          ]),
                    ),
                  ),
                )),
                SizedBox(width: 10),
                Expanded(
                    child: GestureDetector(
                  onTap: () {},
                  child: Card(
                    elevation: 5,
                    color: salonbgcolor,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.favorite,
                              color: salonappcolor,
                              size: 13.0,
                            ),
                            SizedBox(width: 5),
                            Text(
                              'Follow',
                              style:
                                  TextStyle(color: salonappcolor, fontSize: 10),
                            ),
                          ]),
                    ),
                  ),
                )),
              ],
            ),
          ]),
        )),
      ]),
    ]);
  }

  Widget featuredSalonWidget() {
    return Column(mainAxisSize: MainAxisSize.min, children: [
      Row(children: [
        Text(
          "Featured Salon",
          style: Theme.of(context).textTheme.headline6!.merge(TextStyle(
              color: salonappcolor,
              fontWeight: FontWeight.bold,
              letterSpacing: 0.5)),
        ),
        Spacer(),
        Text(
          "See all",
          style: Theme.of(context).textTheme.subtitle1!.merge(TextStyle(
              color: salonlightfont,
              fontWeight: FontWeight.bold,
              letterSpacing: 0.5)),
        ),
      ]),
      SizedBox(height: 10),
      Row(children: [
        Expanded(
            child: GestureDetector(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => SalonDetailPage(
                      img: "assets/images/fullApps/pureBeauty/shop_1.jpg",
                      imgurl:
                          'https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/salonapp%2Fshop_1.jpg?alt=media&token=7b922a8b-bca8-4121-915f-c1561c8b78f6',
                      hash: 'LVO.B|%NQ-Di~VI:NG\$kM{njsoX8',
                    )));
          },
          child: Container(
            decoration: DesignConfig.outerDecorationService(10, salonbgcolor),
            child: Column(children: [
              SizedBox(
                height: 130,
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: const Radius.circular(10),
                    topRight: const Radius.circular(10),
                  ),
                  child: OctoImage(
                    image: CachedNetworkImageProvider(
                        'https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/salonapp%2Fshop_1.jpg?alt=media&token=7b922a8b-bca8-4121-915f-c1561c8b78f6'),
                    placeholderBuilder: OctoPlaceholder.blurHash(
                        'LVO.B|%NQ-Di~VI:NG\$kM{njsoX8'),
                    errorBuilder: OctoError.icon(color: Colors.black),
                    width: double.maxFinite,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: 10),
              Text(
                "Hair. Nails. Facial",
                style: Theme.of(context).textTheme.bodyText2!.merge(TextStyle(
                    color: salonmainlight,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.5)),
              ),
              SizedBox(height: 5),
              Text(
                "Four Season Fashion",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.subtitle1!.merge(TextStyle(
                    color: salonappcolor,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.5)),
              ),
              SizedBox(height: 5),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 5),
                child: Text(
                  "Street no 7, plot no 94, hirani park, 380001",
                  style: Theme.of(context).textTheme.caption!.merge(
                      TextStyle(color: salonlightfont, letterSpacing: 0.5)),
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => SalonDetailPage(
                                  img:
                                      "assets/images/fullApps/pureBeauty/18.png",
                                )));
                      },
                      child: IntrinsicWidth(
                        child: Container(
                          decoration: DesignConfig.outerDecoration(10),
                          padding: EdgeInsets.only(
                              bottom: 10, top: 10, left: 13, right: 13),
                          child: Text(
                            "Learn More",
                            style: //Theme.of(context).textTheme.caption.merge(
                                TextStyle(
                                    color: salonappcolor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 10), //),
                          ),
                        ),
                      ),
                    ),
                    // SizedBox(width: 5),
                    Spacer(),
                    // SizedBox(width: 5),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        decoration: DesignConfig.outerCircularDecoration(),
                        padding: EdgeInsets.all(8),
                        child: Icon(
                          Icons.send,
                          size: 16,
                          color: salonappcolor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ]),
          ),
        )),
        SizedBox(width: 20),
        Expanded(
            child: GestureDetector(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => SalonDetailPage(
                      img: "assets/images/fullApps/pureBeauty/shop_2.jpg",
                      imgurl:
                          'https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/salonapp%2Fshop_2.jpg?alt=media&token=adcc28cf-7b87-404a-ac69-2ca50018022b',
                      hash: 'LYKJV[DOpHE1yCE1w|-p~VD*bYxZ',
                    )));
          },
          child: Container(
            decoration: DesignConfig.outerDecorationService(10, salonbgcolor),
            child: Column(children: [
              SizedBox(
                height: 130,
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: const Radius.circular(10),
                    topRight: const Radius.circular(10),
                  ),
                  child: OctoImage(
                    image: CachedNetworkImageProvider(
                        'https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/salonapp%2Fshop_2.jpg?alt=media&token=adcc28cf-7b87-404a-ac69-2ca50018022b'),
                    placeholderBuilder: OctoPlaceholder.blurHash(
                        'LYKJV[DOpHE1yCE1w|-p~VD*bYxZ'),
                    errorBuilder: OctoError.icon(color: Colors.black),
                    width: double.maxFinite,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: 10),
              Text(
                "Hair. Nails. Facial",
                style: Theme.of(context).textTheme.bodyText2!.merge(TextStyle(
                    color: salonmainlight,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.5)),
              ),
              SizedBox(height: 5),
              Text(
                "Plus Beauty Lounge",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.subtitle1!.merge(TextStyle(
                    color: salonappcolor,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.5)),
              ),
              SizedBox(height: 5),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 5),
                child: Text(
                  "Street no 7, plot no 94, hirani park, 380001",
                  style: Theme.of(context).textTheme.caption!.merge(
                      TextStyle(color: salonlightfont, letterSpacing: 0.5)),
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => SalonDetailPage(
                                  img:
                                      "assets/images/fullApps/pureBeauty/36.jpg",
                                )));
                      },
                      child: IntrinsicWidth(
                        child: Container(
                          decoration: DesignConfig.outerDecoration(10),
                          padding: EdgeInsets.only(
                              bottom: 10, top: 10, left: 13, right: 13),
                          child: Text(
                            "Learn More",
                            style: //Theme.of(context).textTheme.caption.merge(
                                TextStyle(
                                    color: salonappcolor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 10), //),
                          ),
                        ),
                      ),
                    ),
                    // SizedBox(width: 5),
                    Spacer(),
                    // SizedBox(width: 5),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        decoration: DesignConfig.outerCircularDecoration(),
                        padding: EdgeInsets.all(8),
                        child: Icon(
                          Icons.send,
                          size: 16,
                          color: salonappcolor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ]),
          ),
        )),
      ]),
    ]);
  }

  Widget dailyDealsWidget() {
    return Column(children: [
      Row(children: [
        Text(
          "Daily Deals",
          style: Theme.of(context).textTheme.headline6!.merge(TextStyle(
              color: salonappcolor,
              fontWeight: FontWeight.bold,
              letterSpacing: 0.5)),
        ),
        Spacer(),
        Text(
          "See all",
          style: Theme.of(context).textTheme.subtitle1!.merge(TextStyle(
              color: salonlightfont,
              fontWeight: FontWeight.bold,
              letterSpacing: 0.5)),
        ),
      ]),
      SizedBox(height: 10),
      Row(children: [
        Expanded(
            child: Container(
          decoration: DesignConfig.outerDecorationService(10, salonbgcolor),
          child: Column(children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: const Radius.circular(10),
                topRight: const Radius.circular(10),
              ),
              child: OctoImage(
                image: CachedNetworkImageProvider(
                    'https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/salonapp%2Fshop_4.jpg?alt=media&token=108f0397-40fc-4db0-9d8e-c5bc5a1ccae1'),
                placeholderBuilder:
                    OctoPlaceholder.blurHash('L7IN]b0000?]?vtS00yX.54U-n^+'),
                errorBuilder: OctoError.icon(color: Colors.black),
                width: double.maxFinite,
                fit: BoxFit.cover,
                height: 90,
              ),
            ),
            SizedBox(height: 10),
            Text(
              "50% Discount on All kind of Massage",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.caption!.merge(TextStyle(
                  color: salonappcolor,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.5)),
            ),
            SizedBox(height: 5),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 5),
              child: Text(
                "By Port Sans Massage Center\n",
                maxLines: 2,
                style: Theme.of(context).textTheme.caption!.merge(
                    TextStyle(color: salonlightfont, letterSpacing: 0.5)),
              ),
            ),
            SizedBox(height: 10),
          ]),
        )),
        SizedBox(width: 20),
        Expanded(
            child: Container(
          decoration: DesignConfig.outerDecorationService(10, salonbgcolor),
          child: Column(children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: const Radius.circular(10),
                topRight: const Radius.circular(10),
              ),
              child: OctoImage(
                image: CachedNetworkImageProvider(
                    'https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/salonapp%2Fshop_6.jpg?alt=media&token=ebb4ec58-eec3-4a81-ac12-c93698177d90'),
                placeholderBuilder:
                    OctoPlaceholder.blurHash('LCG[1Z~V-o-T01s+?Fxa004.MyjZ'),
                errorBuilder: OctoError.icon(color: Colors.black),
                width: double.maxFinite,
                fit: BoxFit.cover,
                height: 90,
              ),
            ),
            SizedBox(height: 10),
            Text(
              "50% OFF on All type of Haircuts",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.caption!.merge(TextStyle(
                  color: salonappcolor,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.5)),
            ),
            SizedBox(height: 5),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 5),
              child: Text(
                "By Floyd Barber Shop\n",
                maxLines: 2,
                style: Theme.of(context).textTheme.caption!.merge(
                    TextStyle(color: salonlightfont, letterSpacing: 0.5)),
              ),
            ),
            SizedBox(height: 10),
          ]),
        )),
      ]),
    ]);
  }

  Widget recentlyVisitedWidget() {
    double iheight = 180;
    return Column(mainAxisSize: MainAxisSize.min, children: [
      Row(children: [
        Text(
          "Recently Visited",
          style: Theme.of(context).textTheme.headline6!.merge(TextStyle(
              color: salonappcolor,
              fontWeight: FontWeight.bold,
              letterSpacing: 0.5)),
        ),
        Spacer(),
        Text(
          "See all",
          style: Theme.of(context).textTheme.subtitle1!.merge(TextStyle(
              color: salonlightfont,
              fontWeight: FontWeight.bold,
              letterSpacing: 0.5)),
        ),
      ]),
      Container(
        padding: EdgeInsets.symmetric(vertical: 24.0),
        height: iheight,
        color: salonbgcolor,
        //height: MediaQuery.of(context).size.height * 0.30,
        child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: DataConfig.recentlyvisitedlist.length,
            itemBuilder: (context, index) {
              return Container(
                width: 200,
                decoration:
                    DesignConfig.outerDecorationService(10, salonbgcolor),
                margin: EdgeInsets.only(
                    bottom: 10,
                    right: index == DataConfig.recentlyvisitedlist.length - 1
                        ? 10
                        : 20),
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: OctoImage(
                        image: CachedNetworkImageProvider(
                            DataConfig.recentlyvisitedlist[index]['imgurl']),
                        placeholderBuilder: OctoPlaceholder.blurHash(
                            DataConfig.recentlyvisitedlist[index]['hash']),
                        errorBuilder: OctoError.icon(color: Colors.black),
                        width: double.maxFinite,
                        height: iheight,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned.fill(
                        child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                        child: Text(
                          DataConfig.recentlyvisitedlist[index]['title'],
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 0.5),
                        ),
                      ),
                    )),
                  ],
                ),
              );
            }),
      ),
    ]);
  }

  Widget allShopWidget() {
    return Column(mainAxisSize: MainAxisSize.min, children: [
      Row(children: [
        Text(
          "All Shop",
          style: Theme.of(context).textTheme.headline6!.merge(TextStyle(
              color: salonappcolor,
              fontWeight: FontWeight.bold,
              letterSpacing: 0.5)),
        ),
        Spacer(),
        Text(
          "See all",
          style: Theme.of(context).textTheme.subtitle1!.merge(TextStyle(
              color: salonlightfont,
              fontWeight: FontWeight.bold,
              letterSpacing: 0.5)),
        ),
      ]),
      ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          padding: EdgeInsets.symmetric(vertical: 24.0),
          shrinkWrap: true,
          itemCount: DataConfig.shoplist.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => SalonDetailPage(
                          img: DataConfig.shoplist[index]['img'],
                          imgurl: DataConfig.shoplist[index]['imgurl'],
                          hash: DataConfig.shoplist[index]['hash'],
                        )));
              },
              child: Container(
                width: double.maxFinite,
                decoration:
                    DesignConfig.outerDecorationService(10, salonbgcolor),
                margin: EdgeInsets.only(bottom: 25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 150,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: OctoImage(
                          image: CachedNetworkImageProvider(
                              DataConfig.shoplist[index]['imgurl']),
                          placeholderBuilder: OctoPlaceholder.blurHash(
                              DataConfig.shoplist[index]['hash']),
                          errorBuilder: OctoError.icon(color: Colors.black),
                          width: double.maxFinite,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 10),
                      child: Text(
                        DataConfig.shoplist[index]['title'],
                        style: Theme.of(context).textTheme.subtitle1!.merge(
                            TextStyle(
                                color: salonappcolor,
                                letterSpacing: 0.5,
                                fontWeight: FontWeight.bold)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Row(
                        children: [
                          Text(
                            DataConfig.shoplist[index]['price'],
                            style: Theme.of(context).textTheme.bodyText2!.merge(
                                TextStyle(
                                    color: salonmainlight,
                                    letterSpacing: 0.5,
                                    fontWeight: FontWeight.bold)),
                          ),
                          SizedBox(width: 10),
                          SvgPicture.asset(
                              "assets/images/fullApps/pureBeauty/svgimg/rating.svg"),
                          SizedBox(width: 8),
                          Text(
                            DataConfig.shoplist[index]['rating'],
                            style: Theme.of(context).textTheme.bodyText2!.merge(
                                TextStyle(
                                    color: salonmainlight,
                                    letterSpacing: 0.5,
                                    fontWeight: FontWeight.bold)),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 15),
                      child: Row(
                        children: [
                          SvgPicture.asset(
                              "assets/images/fullApps/pureBeauty/svgimg/location.svg"),
                          SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              DataConfig.shoplist[index]['address'],
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText2!
                                  .merge(TextStyle(
                                      color: salonmainlight,
                                      letterSpacing: 0.5,
                                      fontWeight: FontWeight.bold)),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
    ]);
  }
}
