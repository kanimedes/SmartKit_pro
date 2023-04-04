import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:octo_image/octo_image.dart';
import 'package:smartkit_pro/ui/fullApps/dreamHome/models/CategoryModel.dart';
import 'package:smartkit_pro/ui/fullApps/dreamHome/models/FeatureViewModel.dart';
import 'package:smartkit_pro/ui/fullApps/dreamHome/models/NearYouModel.dart';
import 'package:smartkit_pro/ui/fullApps/dreamHome/models/RecommendedModel.dart';

import '../../widgets/slideAnimation.dart';
import '../helper/DHomeColors.dart';
import '../helper/DHomeString.dart';
import '../helper/DHomeconstant.dart';
import 'dHomeAddProperty.dart';
import 'dHomeAllProperty.dart';
import 'dHomeHomeDetail.dart';
import 'dHomeNotification.dart';
import 'dHomeSerchProperty.dart';
import 'menu/DHomeMenu.dart';

class DHomeHomeScreen extends StatefulWidget {
  const DHomeHomeScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return DHomeHomeScreenState();
  }
}

class DHomeHomeScreenState extends State<DHomeHomeScreen>
    with SingleTickerProviderStateMixin {
  AnimationController? _animationController;
  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 2000));
  }

  List<CategoryModel> location = [
    CategoryModel(
      title: "Home",
      imageUrl: DHomeConstant.getSvgImagePath("cat.home.svg"),
    ),
    CategoryModel(
        title: "Apartment",
        imageUrl: DHomeConstant.getSvgImagePath("cat.apartment.svg")),
    CategoryModel(
        title: "Commercial",
        imageUrl: DHomeConstant.getSvgImagePath("cat.commercial.svg"))
  ];
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
        des: "Alpha Home",
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
        rs: "\$6,600",
        like: true),
  ];
  List<NearYou> nearYouList = [
    NearYou(
        blurUrl: "LSHVJIjbI.axyZs+s8WYkXfkWCj[",
        localImage: DHomeConstant.getPngImagePath("near_img_1.png"),
        des: "Krishna Home",
        address: "35, New No 19, 25 Street, Mount Road",
        image:
            "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/dreamhomeapp%2Fnear_img_1.png?alt=media&token=2d477646-cb44-492e-8fb7-8b654e63dd40",
        title: "Home",
        like: true,
        rs: "\$16,000"),
    NearYou(
        blurUrl: "LYG]diawNGs:%%bIs8odXpazV?WC",
        localImage: DHomeConstant.getPngImagePath("near_img_-1.png"),
        des: "Best Home",
        address: "25, New No 19, 25 Street, Mount Road",
        image:
            "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/dreamhomeapp%2Fnear_img_-1.png?alt=media&token=835d33eb-303f-42bc-9d2e-416f64ef9aab",
        title: "Home",
        like: false,
        rs: "\$11,000"),
    NearYou(
        blurUrl: "LbHy5rxZR*o#?wf5nhR*n\$a#W=Rj",
        localImage: DHomeConstant.getPngImagePath("near_img_-2.png"),
        des: "Alpha Towers",
        address: "10, New No 19, 25 Street, Mount Road",
        image:
            "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/dreamhomeapp%2Fnear_img_-2.png?alt=media&token=9217aa86-10e5-40f2-bd78-07e1546f073c",
        title: "Apartment",
        like: true,
        rs: "\$5,000")
  ];
  List<Recommended> recommendedList = [
    Recommended(
        title: "Home",
        image:
            "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/dreamhomeapp%2Ff_img_2.png?alt=media&token=990c5817-dafc-4046-b4e4-4fe1448cff0e",
        address: "45, New No 19, 25 Street, Mount Road",
        baths: "2",
        bed: "3",
        des: "Alpha Home",
        sqft: "1250 sqft",
        localImage: DHomeConstant.getPngImagePath("f_img_2.png"),
        blurUrl: "LSHK%?M{-oNG~DawxFbI\$*%2M{s;",
        rs: "\$11,000",
        like: true),
    Recommended(
        title: "Apartments",
        image:
            "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/dreamhomeapp%2Ff_img_7.png?alt=media&token=9652d7a8-19fb-4340-a3e0-00203566ebdc",
        address: "35, New No 19, 25 Street, Mount Road",
        baths: "3",
        bed: "2",
        des: "Alpha Towers",
        sqft: "1650 sqft",
        localImage: DHomeConstant.getPngImagePath("f_img_7.png"),
        blurUrl: "LnGvx0yERkM{yGNIWFaKRPM_WBs+",
        rs: "\$6,000",
        like: false),
    Recommended(
        title: "Home",
        image:
            "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/dreamhomeapp%2Ff_img_6.png?alt=media&token=5fe93eb9-0c8f-4334-a218-8d84f0afeebb",
        address: "11, New No 19, 25 Street, Mount Road",
        baths: "2",
        bed: "3",
        des: "Best Home",
        sqft: "1350 sqft",
        localImage: DHomeConstant.getPngImagePath("f_img_6.png"),
        blurUrl: "LUJ[I@p0bdXA.AM}WFRj%MD%M{fR",
        rs: "\$15,000",
        like: true)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: DHomeColors.white,
        extendBody: true,
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          child: Stack(
            children: [topDesign(), middleDesign()],
          ),
        ));
  }

  Widget topDesign() {
    return Container(
      color: DHomeColors.bgColor,
      child: Stack(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * .35,
            width: MediaQuery.of(context).size.width,
            child: Image.asset(
              DHomeConstant.getPngImagePath("vector_city.png"),
              fit: BoxFit.fill,
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height,
            padding:
                EdgeInsets.only(left: MediaQuery.of(context).size.width * .07),
            child: Column(
              children: [
                const SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const DHomeMenu(),
                          ),
                        );
                      },
                      child: Container(
                        height: 50,
                        width: 50,
                        margin: const EdgeInsets.only(top: 20),
                        decoration: const BoxDecoration(
                          color: Color(0xffefefef),
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        child: ClipRRect(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10)),
                            child: OctoImage(
                              image: const CachedNetworkImageProvider(
                                  "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/travelapp%2Ftoptrip_b.jpg?alt=media&token=cd01d6b2-2892-4da7-bfee-4069e2e4f7e8"),
                              placeholderBuilder: OctoPlaceholder.blurHash(
                                "L5Jk_:009FDi00oJ-oRj00~VMwM{",
                              ),
                              errorBuilder:
                                  OctoError.icon(color: DHomeColors.black),
                              fit: BoxFit.contain,
                            )),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(left: 10, top: 25),
                          alignment: Alignment.topLeft,
                          child: const Text(
                            "Hi,",
                            style: TextStyle(
                                color: Color(0xff818181), fontSize: 12),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 10),
                          child: const Text(
                            "Divy Jani",
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w500),
                          ),
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const DHomeNotification(),
                          ),
                        );
                      },
                      child: Container(
                          alignment: Alignment.topRight,
                          padding: EdgeInsets.only(
                              left: MediaQuery.of(context).size.width * .47,
                              top: 20),
                          child: SvgPicture.asset(DHomeConstant.getSvgImagePath(
                              "notification_white_bg.svg"))),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: const [
                        Text(
                          DHomeString.findBest,
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                        Text(
                          DHomeString.dreamHome,
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * .25,
                      width: MediaQuery.of(context).size.width * .5,
                      // alignment: Alignment.centerRight,
                      padding: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width * .13,
                          top: 20),
                      child: OctoImage(
                        image: const CachedNetworkImageProvider(
                            "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/dreamhomeapp%2Fvector_person.png?alt=media&token=bf8c83cb-b6ae-4784-9368-586f03b882ab"),
                        placeholderBuilder: OctoPlaceholder.blurHash(
                            "LLK1%ap007\$y~9t6E,Vr0osk=;Nf"),
                        // height: MediaQuery.of(context).size.height,
                        errorBuilder: OctoError.icon(color: DHomeColors.black),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget middleDesign() {
    return Container(
      margin: const EdgeInsets.only(top: 250, bottom: 100),
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(50), topRight: Radius.circular(50))),
      child: Column(
        children: [
          search(),
          const SizedBox(
            height: 15,
          ),
          bannerImage(),
          const SizedBox(
            height: 15,
          ),
          Container(
            margin: EdgeInsets.only(
              left: MediaQuery.of(context).size.width * .07,
            ),
            alignment: Alignment.topLeft,
            child: const Text(
              DHomeString.Categories,
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          categoryList(),
          const SizedBox(
            height: 15,
          ),
          featureAndViewText(),
          const SizedBox(
            height: 15,
          ),
          CarouselSlider(
              items: featureListData(),
              options: CarouselOptions(
                autoPlay: true,
                // enlargeCenterPage: true,
                reverse: false, viewportFraction: 0.9,
                autoPlayAnimationDuration: const Duration(milliseconds: 1000),
                aspectRatio: 1.3, initialPage: 0,
                onPageChanged: (index, reason) {},
              )),

          //  featureListData(),
          const SizedBox(
            height: 15,
          ),
          nearYouAndViewText(),
          const SizedBox(
            height: 15,
          ),
          nearYouListData(),
          const SizedBox(
            height: 15,
          ),
          postAndAd(),
          const SizedBox(
            height: 15,
          ),
          recomAndViewText(),
          const SizedBox(
            height: 15,
          ),
          recommendedListData()
        ],
      ),
    );
  }

  Widget search() {
    return Container(
        margin: EdgeInsets.only(
            left: MediaQuery.of(context).size.width * .05,
            right: MediaQuery.of(context).size.width * .05,
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
            hintText: "Search Property",
            hintStyle: const TextStyle(color: Color(0xff565656)),
            border: InputBorder.none,
          ),
          keyboardType: TextInputType.emailAddress,
        ));
  }

  Widget bannerImage() {
    return SlideAnimation(
        position: 5,
        itemCount: 15,
        slideDirection: SlideDirection.fromRight,
        animationController: _animationController,
        child: Stack(
          children: [
            Container(
              height: 100,
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.only(
                left: MediaQuery.of(context).size.width * .02,
                right: MediaQuery.of(context).size.width * .02,
              ),
              child: OctoImage(
                image: const CachedNetworkImageProvider(
                    "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/dreamhomeapp%2Fbanner.png?alt=media&token=e167668b-ae7e-483c-9741-b3b726674b7c"),
                placeholderBuilder:
                    OctoPlaceholder.blurHash("LdNK0G~q9aD%-:V@XSsm9cIAbFxv"),
                errorBuilder: OctoError.icon(color: DHomeColors.black),
                fit: BoxFit.cover,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                    padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * .1, top: 15),
                    child: const Text(
                      "Find a Perfect",
                      style: TextStyle(fontSize: 11, color: Color(0xff565656)),
                    )),
                Container(
                    //margin: EdgeInsets.only(bottom: 10),
                    padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * .1,
                    ),
                    child: const Text(
                      "House",
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                    )),
                Container(
                    //margin: EdgeInsets.only(bottom: 10),
                    padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * .1),
                    child: Row(
                      children: const [
                        Text(
                          "For Your",
                          style:
                              TextStyle(fontSize: 9, color: Color(0xff565656)),
                        ),
                        Text(
                          " Family",
                          style: TextStyle(
                              fontSize: 10, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ))
              ],
            )
          ],
        ));
  }

  Widget categoryList() {
    return SlideAnimation(
        position: 5,
        itemCount: 15,
        slideDirection: SlideDirection.fromRight,
        animationController: _animationController,
        child: Container(
            height: MediaQuery.of(context).size.height * .08,
            padding:
                EdgeInsets.only(left: MediaQuery.of(context).size.width * .03),
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: location.length,
                scrollDirection: Axis.horizontal,
                physics: const AlwaysScrollableScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    width: MediaQuery.of(context).size.width * .3,
                    margin: const EdgeInsets.only(
                        left: 15, right: 15, top: 8, bottom: 8),
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
                    child: GestureDetector(
                        onTap: () {
                          // Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => GoRideChooseDesScreen(),),);
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(location[index].imageUrl),
                            Text(location[index].title),
                          ],
                        )),
                  );
                })));
  }

  Widget featureAndViewText() {
    return Row(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width * .07,
        ),
        const Text(
          DHomeString.FeaturedListings,
          style: TextStyle(
              fontSize: 14,
              color: Color(0xff141529),
              fontWeight: FontWeight.w600),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * .45,
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const DHomeAllProperty(),
              ),
            );
          },
          child: const Text(
            DHomeString.ViewAll,
            style: TextStyle(
                fontSize: 12,
                color: Color(0xff5b5b5b),
                fontWeight: FontWeight.w600),
          ),
        )
      ],
    );
  }

  List<T?> map<T>(Function handler) {
    List<T?> result = [];
    for (var i = 0; i < featureList.length; i++) {
      result.add(handler(i));
    }

    return result;
  }

  List<Widget>? featureListData() {
    return map<Widget>((index) {
      return SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * .415,
          // padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * .01,right: MediaQuery.of(context).size.width * .01),
          child: /*ListView.builder(shrinkWrap: true,
                itemCount: featureList.length,
                scrollDirection: Axis.horizontal,
                physics: AlwaysScrollableScrollPhysics(),
                padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * .03, top: 20, bottom: 20, right: MediaQuery.of(context).size.width * .05),
                itemBuilder: (BuildContext context, int index) {
                  return*/
              GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DHomeHomeDetail(
                          title: featureList[index].title,
                          subTitle: featureList[index].des,
                          address: featureList[index].address,
                          bath: featureList[index].baths,
                          bed: featureList[index].bed,
                          rs: featureList[index].rs,
                          localImg: featureList[index].localImage,
                          blurUrl: featureList[index].blurUrl,
                          image: featureList[index].image,
                          sqft: featureList[index].sqft,
                        ),
                      ),
                    );
                  },
                  child: Container(
                      width: MediaQuery.of(context).size.width,
                      margin: const EdgeInsets.only(
                          left: 5, right: 5, top: 8, bottom: 8),
                      //margin: EdgeInsets.only(left: 10, top: 8,right: 10, bottom: 8),
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
                                  height:
                                      MediaQuery.of(context).size.height * .186,
                                  width: MediaQuery.of(context).size.width,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: OctoImage(
                                      image: CachedNetworkImageProvider(
                                        featureList[index].image,
                                      ),
                                      placeholderBuilder:
                                          OctoPlaceholder.blurHash(
                                        featureList[index].blurUrl,
                                      ),
                                      errorBuilder: OctoError.icon(
                                          color: DHomeColors.black),
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
                                  padding: const EdgeInsets.only(
                                      top: 100, right: 10),
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
                                  padding:
                                      const EdgeInsets.only(left: 10, top: 8),
                                  child: Text(
                                    featureList[index].title,
                                    style: const TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xffa2a2a2)),
                                  )),
                              Container(
                                  padding:
                                      const EdgeInsets.only(right: 10, top: 8),
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
                                    DHomeConstant.getSvgImagePath(
                                        "ho.address.svg"),
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
                                    DHomeConstant.getSvgImagePath(
                                        "ho.beds.svg"),
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
                                  padding:
                                      const EdgeInsets.only(left: 25, top: 2),
                                  child: SvgPicture.asset(
                                    DHomeConstant.getSvgImagePath(
                                        "ho.baths.svg"),
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
                                    DHomeConstant.getSvgImagePath(
                                        "ho.sqft.svg"),
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
                      ))));
    }).cast<Widget>().toList();
  }

  Widget nearYouAndViewText() {
    return Row(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width * .07,
        ),
        const Text(
          DHomeString.NearYou,
          style: TextStyle(
              fontSize: 14,
              color: Color(0xff141529),
              fontWeight: FontWeight.w600),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * .59,
        ),
        const Text(
          DHomeString.ViewAll,
          style: TextStyle(
              fontSize: 12,
              color: Color(0xff5b5b5b),
              fontWeight: FontWeight.w600),
        )
      ],
    );
  }

  Widget nearYouListData() {
    return Container(
        height: MediaQuery.of(context).size.height * .15,
        padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * .03),
        child: ListView.builder(
            shrinkWrap: true,
            itemCount: nearYouList.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                  width: MediaQuery.of(context).size.width * .9,
                  margin: const EdgeInsets.only(
                      left: 10, top: 8, bottom: 8, right: 10),
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
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                            height: MediaQuery.of(context).size.height * .13,
                            width: MediaQuery.of(context).size.width * .28,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: OctoImage(
                                image: CachedNetworkImageProvider(
                                    nearYouList[index].image),
                                placeholderBuilder: OctoPlaceholder.blurHash(
                                  nearYouList[index].blurUrl,
                                ),
                                errorBuilder:
                                    OctoError.icon(color: DHomeColors.black),
                                fit: BoxFit.fill,
                              ),
                            )),
                        Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                  padding:
                                      const EdgeInsets.only(left: 5, top: 13),
                                  child: Text(
                                    nearYouList[index].title,
                                    style: const TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xffa2a2a2)),
                                  )),
                              Container(
                                  padding: const EdgeInsets.only(
                                    left: 5,
                                  ),
                                  child: Text(nearYouList[index].des,
                                      style: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600))),
                              Row(
                                children: [
                                  Container(
                                      padding: const EdgeInsets.only(
                                          left: 5, top: 5),
                                      child: SvgPicture.asset(
                                        DHomeConstant.getSvgImagePath(
                                            "ho.address.svg"),
                                        fit: BoxFit.scaleDown,
                                        height: 20,
                                        width: 20,
                                      )),
                                  Container(
                                      padding: const EdgeInsets.only(left: 10),
                                      child: Text(
                                        nearYouList[index].address,
                                        style: const TextStyle(
                                          fontSize: 10,
                                        ),
                                      ))
                                ],
                              ),
                              Container(
                                  padding:
                                      const EdgeInsets.only(left: 10, top: 5),
                                  child: Text(
                                    nearYouList[index].rs,
                                    style: const TextStyle(
                                        fontSize: 12, color: DHomeColors.red),
                                  ))
                            ]),
                        Container(
                            alignment: Alignment.topRight,
                            padding: const EdgeInsets.only(
                              top: 10,
                            ),
                            child: nearYouList[index].like
                                ? SvgPicture.asset(
                                    DHomeConstant.getSvgImagePath(
                                        "wishlist_like.svg"))
                                : SvgPicture.asset(
                                    DHomeConstant.getSvgImagePath(
                                        "wishlist_unlike.svg"))),
                      ]));
            }));
  }

  Widget postAndAd() {
    return Container(
        height: MediaQuery.of(context).size.height * .17,
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
        margin: EdgeInsets.only(
            left: MediaQuery.of(context).size.width * .05,
            right: MediaQuery.of(context).size.width * .05,
            top: 10),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        padding: const EdgeInsets.only(left: 22),
                        child: const Text(
                          "Sell or Rent Out Your",
                          style: TextStyle(fontSize: 14),
                        )),
                    Container(
                        padding: const EdgeInsets.only(left: 22),
                        child: const Text(
                          "Property?",
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.w700),
                        )),
                  ],
                ),
                Container(
                    padding: const EdgeInsets.only(top: 5, right: 30),
                    height: 89,
                    width: 130,
                    child: OctoImage(
                      image: const CachedNetworkImageProvider(
                          "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/dreamhomeapp%2FAdd_post.png?alt=media&token=a2bb7deb-f273-4db7-b352-e3ccd94a166e"),
                      placeholderBuilder: OctoPlaceholder.blurHash(
                          "LMMtQ{-o00WC~qn#%Mxa5FS6%LRj"),
                      errorBuilder: OctoError.icon(color: DHomeColors.black),
                      fit: BoxFit.fill,
                    )),
              ],
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const DHomeAddProperty(),
                  ),
                );
              },
              child: const Text(
                DHomeString.postnAd,
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: DHomeColors.white,
                    fontSize: 12),
              ),
              style: ElevatedButton.styleFrom(
                alignment: Alignment.center,
                minimumSize: const Size(305, 35),
                // shape: StadiumBorder(),
                primary: DHomeColors.red,
              ),
            )
          ],
        ));
  }

  Widget recomAndViewText() {
    return Row(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width * .07,
        ),
        const Text(
          DHomeString.Rrecommended,
          style: TextStyle(
              fontSize: 14,
              color: Color(0xff141529),
              fontWeight: FontWeight.w600),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * .45,
        ),
        const Text(
          DHomeString.ViewAll,
          style: TextStyle(
              fontSize: 12,
              color: Color(0xff5b5b5b),
              fontWeight: FontWeight.w600),
        )
      ],
    );
  }

  Widget recommendedListData() {
    return Container(
        height: MediaQuery.of(context).size.height * .37,
        padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * .03),
        child: ListView.builder(
            shrinkWrap: true,
            itemCount: recommendedList.length,
            scrollDirection: Axis.horizontal,
            physics: const AlwaysScrollableScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              return Container(
                  width: MediaQuery.of(context).size.width * .88,
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
                                      recommendedList[index].image),
                                  placeholderBuilder: OctoPlaceholder.blurHash(
                                    recommendedList[index].blurUrl,
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
                              child: recommendedList[index].like
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
                                    //Color(0xff95a360)
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
                                recommendedList[index].title,
                                style: const TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xffa2a2a2)),
                              )),
                          Container(
                              padding: const EdgeInsets.only(right: 10, top: 8),
                              child: Text(
                                recommendedList[index].rs,
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
                                recommendedList[index].des,
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
                                recommendedList[index].address,
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
                                recommendedList[index].bed,
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
                                recommendedList[index].baths,
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
                                recommendedList[index].sqft,
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
