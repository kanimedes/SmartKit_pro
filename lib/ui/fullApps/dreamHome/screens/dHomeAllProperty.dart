import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:octo_image/octo_image.dart';
import 'package:smartkit_pro/ui/fullApps/dreamHome/models/FeatureViewModel.dart';

import '../helper/DHomeColors.dart';
import '../helper/DHomeString.dart';
import '../helper/DHomeconstant.dart';
import 'dHomeSerchProperty.dart';

class DHomeAllProperty extends StatefulWidget {
  const DHomeAllProperty({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return DHomeAllPropertyState();
  }
}

class DHomeAllPropertyState extends State<DHomeAllProperty> {
  final _formKeyDialog = GlobalKey<FormState>();
  List<FeatureView> featureList = [
    FeatureView(
        title: "Apartments",
        image:
            "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/dreamhomeapp%2Ff_img_1.png?alt=media&token=dd049a12-7bf9-491f-b1c0-73c3cbb3cb73",
        localImage: DHomeConstant.getPngImagePath("f_img_1.png"),
        blurUrl: "LHH3R0E31+~V0Os.M{E1nh-o-PRj",
        address: "35, New No 19, 25 Street, Mount Road",
        baths: "3",
        bed: "2",
        des: "Alpha Towers",
        sqft: "1650 sqft",
        rs: "\$5,000",
        like: true),
    FeatureView(
        title: "Home",
        image:
            "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/dreamhomeapp%2Ff_img_2.png?alt=media&token=990c5817-dafc-4046-b4e4-4fe1448cff0e",
        localImage: DHomeConstant.getPngImagePath("f_img_2.png"),
        blurUrl: "LSHK%?M{-oNG~DawxFbI\$*%2M{s;",
        address: "25, New No 19, 25 Street, Mount Road",
        baths: "2",
        bed: "3",
        des: "Alpha Towers",
        sqft: "1650 sqft",
        rs: "\$5,500",
        like: false),
    FeatureView(
        title: "Apartments",
        image:
            "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/dreamhomeapp%2Ff_img_3.png?alt=media&token=336ed81d-07b4-4fe7-912e-da8dc2d883d9",
        localImage: DHomeConstant.getPngImagePath("f_img_3.png"),
        blurUrl: "LYF%cCNLyER36qtSM{xBohw]oHo#",
        address: "15, New No 19, 25 Street, Mount Road",
        baths: "3",
        bed: "2",
        des: "Alpha Towers",
        sqft: "1650 sqft",
        rs: "\$5,600",
        like: true),
    FeatureView(
        title: "Apartments",
        image:
            "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/dreamhomeapp%2Ff_img_4.png?alt=media&token=f6c8c9bd-234e-42ed-b5ab-760d065af9f4",
        localImage: DHomeConstant.getPngImagePath("f_img_4.png"),
        blurUrl: "LVKB5K~8_3NHE8R-IVs.S5axRjju",
        address: "20, New No 19, 25 Street, Mount Road",
        baths: "4",
        bed: "3",
        des: "Alpha Towers",
        sqft: "1650 sqft",
        rs: "\$6,000",
        like: false),
    FeatureView(
        title: "Home",
        image:
            "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/dreamhomeapp%2Ff_img_6.png?alt=media&token=5fe93eb9-0c8f-4334-a218-8d84f0afeebb",
        localImage: DHomeConstant.getPngImagePath("f_img_6.png"),
        blurUrl: "LUJ[I@p0bdXA.AM}WFRj%MD%M{fR",
        address: "22, New No 19, 25 Street, Mount Road",
        baths: "3",
        bed: "2",
        des: "Alpha Towers",
        sqft: "1650 sqft",
        rs: "\$6,500",
        like: true),
    FeatureView(
        title: "Apartments",
        image:
            "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/dreamhomeapp%2Ff_img_7.png?alt=media&token=9652d7a8-19fb-4340-a3e0-00203566ebdc",
        localImage: DHomeConstant.getPngImagePath("f_img_7.png"),
        blurUrl: "LnGvx0yERkM{yGNIWFaKRPM_WBs+",
        address: "45, New No 19, 25 Street, Mount Road",
        baths: "1",
        bed: "3",
        des: "Alpha Towers",
        sqft: "1650 sqft",
        rs: "\$6,600",
        like: false),
    FeatureView(
        title: "Apartments",
        image:
            "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/dreamhomeapp%2Ff_img_1.png?alt=media&token=dd049a12-7bf9-491f-b1c0-73c3cbb3cb73",
        localImage: DHomeConstant.getPngImagePath("f_img_1.png"),
        blurUrl: "LHH3R0E31+~V0Os.M{E1nh-o-PRj",
        address: "10, New No 19, 25 Street, Mount Road",
        baths: "2",
        bed: "2",
        des: "Alpha Towers",
        sqft: "1650 sqft",
        rs: "\$7,000",
        like: true),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DHomeColors.bgColor,
      extendBodyBehindAppBar: true,
      body: Stack(children: [
        AppBar(
          toolbarHeight: 133,
          backgroundColor: DHomeColors.bgColor,
          centerTitle: true,
          leadingWidth: 70,
          title: const Text(
            DHomeString.AllProperties,
            style: TextStyle(
                fontSize: 14, fontWeight: FontWeight.w500, color: Colors.black),
          ),
          leading: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: SvgPicture.asset(
                DHomeConstant.getSvgImagePath("close.svg"),
                fit: BoxFit.scaleDown,
              )),
        ),
        allPropertyData()
      ]),
    );
  }

  Widget allPropertyData() {
    return Container(
        height: MediaQuery.of(context).size.height,
        margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * .2),
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(50),
              topRight: Radius.circular(50),
            )),
        child: Column(children: [
          search(),
          const SizedBox(
            height: 20,
          ),
          result(),
          featureListData()
        ]));
  }

  Widget search() {
    return Container(
        margin: EdgeInsets.only(
            left: MediaQuery.of(context).size.width * .04,
            right: MediaQuery.of(context).size.width * .04,
            top: 30),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
          boxShadow: const [
            BoxShadow(
              color: Color(0x0f000000),
              blurRadius: 10.0,
            ),
          ],
        ),
        child: TextFormField(
          cursorColor: const Color(0xffa2a2a2),
          decoration: InputDecoration(
            prefixIcon: SvgPicture.asset(
              DHomeConstant.getSvgImagePath("search.svg"),
              fit: BoxFit.scaleDown,
            ),
            suffixIcon: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const DHomeSearchProperty(),
                    ),
                  );
                },
                child: SvgPicture.asset(
                    DHomeConstant.getSvgImagePath("filter.svg"))),
            contentPadding: const EdgeInsets.only(top: 10),
            isDense: true,
            hintText: "Mumbai",
            hintStyle: const TextStyle(color: Color(0xff565656)),
            border: InputBorder.none,
          ),
          keyboardType: TextInputType.emailAddress,
        ));
  }

  Widget result() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
            padding:
                EdgeInsets.only(left: MediaQuery.of(context).size.width * .05),
            child: const Text(
              "7 Result Founds",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
            )),
        GestureDetector(
          onTap: () {
            sortBy();
          },
          child: Container(
              padding: EdgeInsets.only(
                  right: MediaQuery.of(context).size.width * .05),
              child: Image.asset(
                DHomeConstant.getPngImagePath("sort_by.png"),
                height: 24,
                width: 24,
              )),
        )
      ],
    );
  }

  sortBy() {
    return showModalBottomSheet(
        elevation: 0,
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          topLeft: Radius.circular(50.0),
          topRight: Radius.circular(50.0),
        )),
        context: context,
        builder: (context) => BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 20.0, sigmaY: 20.0),
            child: Padding(
                padding: MediaQuery.of(context).viewInsets,
                child: Container(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  decoration: const BoxDecoration(
                      // gradient: UiUtils.buildLinerGradient([Theme.of(context).scaffoldBackgroundColor, Theme.of(context).canvasColor], Alignment.topCenter, Alignment.bottomCenter),
                      color: DHomeColors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50),
                        topRight: Radius.circular(50.0),
                      )),
                  constraints: BoxConstraints(
                      maxHeight: MediaQuery.of(context).size.height * (0.45)),
                  child: Form(
                    key: _formKeyDialog,
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 30,
                        ),
                        Row(
                          children: [
                            const SizedBox(
                              width: 5,
                            ),
                            IconButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                icon: const Icon(
                                  Icons.arrow_back_ios,
                                  color: Color(0xff200e32),
                                )),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * .25,
                            ),
                            const Text(
                              DHomeString.SortBy,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          alignment: Alignment.topLeft,
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          child: const Text(
                            DHomeString.NewestFirst,
                            style: TextStyle(fontSize: 14),
                          ),
                        ),
                        line(),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          alignment: Alignment.topLeft,
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          child: const Text(
                            DHomeString.OldestFirst,
                            style: TextStyle(fontSize: 14),
                          ),
                        ),
                        line(),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          alignment: Alignment.topLeft,
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text(
                                DHomeString.NearYou,
                                style: TextStyle(fontSize: 14),
                              ),
                              CircleAvatar(
                                backgroundColor: DHomeColors.black,
                                radius: 10,
                                child: Icon(
                                  Icons.check,
                                  color: Colors.white,
                                  size: 15,
                                ),
                              )
                            ],
                          ),
                        ),
                        line(),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          alignment: Alignment.topLeft,
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          child: const Text(
                            DHomeString.price1,
                            style: TextStyle(fontSize: 14),
                          ),
                        ),
                        line(),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          alignment: Alignment.topLeft,
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          child: const Text(
                            DHomeString.price2,
                            style: TextStyle(fontSize: 14),
                          ),
                        ),
                        line()
                      ],
                    ),
                  ),
                ))));
  }

  Widget line() {
    return Container(
      padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
      child: const Divider(
        height: 1,
        color: Color(0xffacacac),
      ),
    );
  }

  Widget featureListData() {
    return SizedBox(
        height: MediaQuery.of(context).size.height * .65,
        child: ListView.builder(
            shrinkWrap: true,
            itemCount: featureList.length,
            physics: const AlwaysScrollableScrollPhysics(),
            padding: EdgeInsets.only(
                left: MediaQuery.of(context).size.width * .03,
                top: 20,
                bottom: 20,
                right: MediaQuery.of(context).size.width * .05),
            itemBuilder: (BuildContext context, int index) {
              return Container(
                  height: MediaQuery.of(context).size.height * .35,
                  margin: const EdgeInsets.only(left: 10, top: 8, bottom: 8),
                  decoration: BoxDecoration(
                    color: DHomeColors.bgColor,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: const [
                      BoxShadow(
                        color: Color(0x0f000000),
                        blurRadius: 10.0, // soften the shadow
                        spreadRadius: 0.0, //extend the shadow
                      )
                    ],
                  ),
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          SizedBox(
                              height: MediaQuery.of(context).size.height * .187,
                              width: MediaQuery.of(context).size.width,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: OctoImage(
                                  image: CachedNetworkImageProvider(
                                      featureList[index].image),
                                  placeholderBuilder: OctoPlaceholder.blurHash(
                                    featureList[index].blurUrl,
                                  ),
                                  errorBuilder:
                                      OctoError.icon(color: DHomeColors.black),
                                  fit: BoxFit.fill,
                                ),
                              )),
                          Container(
                              alignment: Alignment.topRight,
                              padding:
                                  const EdgeInsets.only(top: 10, right: 10),
                              child: featureList[index].like
                                  ? SvgPicture.asset(
                                      DHomeConstant.getSvgImagePath(
                                          "wishlist_like.svg"))
                                  : SvgPicture.asset(
                                      DHomeConstant.getSvgImagePath(
                                          "wishlist_unlike.svg"))),
                          Container(
                              alignment: Alignment.bottomRight,
                              padding:
                                  const EdgeInsets.only(top: 100, right: 10),
                              child: ElevatedButton(
                                onPressed: () {
                                  // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => DHomeHomeScreen(),),);
                                },
                                child: const Text(
                                  "Rent",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      color: DHomeColors.black,
                                      fontSize: 12),
                                ),
                                style: ElevatedButton.styleFrom(
                                    alignment: Alignment.center,
                                    minimumSize: const Size(20, 35),
                                    shape: const StadiumBorder(),
                                    primary: Colors.white54
                                    //93a15f)
                                    ),
                              )),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                              padding: const EdgeInsets.only(left: 10, top: 8),
                              child: Text(
                                featureList[index].title,
                                style: const TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xffa2a2a2)),
                              )),
                          Container(
                              padding: const EdgeInsets.only(right: 10, top: 8),
                              child: Text(
                                featureList[index].rs,
                                style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: DHomeColors.red),
                              ))
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                              padding: const EdgeInsets.only(
                                left: 10,
                              ),
                              child: Text(
                                featureList[index].des,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              )),
                          Container(
                              padding: const EdgeInsets.only(
                                right: 10,
                              ),
                              child: const Text(
                                "/Month",
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xffa2a2a2)),
                              ))
                        ],
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Row(
                        children: [
                          Container(
                              padding: const EdgeInsets.only(
                                left: 10,
                              ),
                              child: SvgPicture.asset(
                                DHomeConstant.getSvgImagePath("ho.address.svg"),
                                fit: BoxFit.scaleDown,
                              )),
                          Container(
                              padding: const EdgeInsets.only(left: 10),
                              child: Text(
                                featureList[index].address,
                                style: const TextStyle(
                                  fontSize: 14,
                                ),
                              ))
                        ],
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Row(
                        children: [
                          Container(
                              padding: const EdgeInsets.only(
                                left: 10,
                              ),
                              child: SvgPicture.asset(
                                DHomeConstant.getSvgImagePath("ho.beds.svg"),
                                fit: BoxFit.scaleDown,
                              )),
                          Container(
                              padding: const EdgeInsets.only(
                                left: 10,
                              ),
                              child: Text(
                                featureList[index].bed,
                                style: const TextStyle(
                                  fontSize: 14,
                                ),
                              )),
                          Container(
                              padding: const EdgeInsets.only(left: 25, top: 2),
                              child: SvgPicture.asset(
                                DHomeConstant.getSvgImagePath("ho.baths.svg"),
                                fit: BoxFit.scaleDown,
                              )),
                          Container(
                              padding: const EdgeInsets.only(
                                left: 10,
                              ),
                              child: Text(
                                featureList[index].baths,
                                style: const TextStyle(
                                  fontSize: 14,
                                ),
                              )),
                          Container(
                              padding: const EdgeInsets.only(
                                left: 25,
                              ),
                              child: SvgPicture.asset(
                                DHomeConstant.getSvgImagePath("ho.sqft.svg"),
                                fit: BoxFit.scaleDown,
                              )),
                          Container(
                              padding: const EdgeInsets.only(left: 10),
                              child: Text(
                                featureList[index].sqft,
                                style: const TextStyle(
                                  fontSize: 14,
                                ),
                              ))
                        ],
                      )
                    ],
                  ));
            }));
  }
}
