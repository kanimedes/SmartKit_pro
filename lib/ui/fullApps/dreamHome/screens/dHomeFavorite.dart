import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:octo_image/octo_image.dart';
import '../helper/DHomeColors.dart';
import '../helper/DHomeString.dart';
import '../helper/DHomeconstant.dart';
import 'package:smartkit_pro/ui/fullApps/dreamHome/models/FeatureViewModel.dart';

class DHomeFavorite extends StatefulWidget {
  const DHomeFavorite({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return DHomeFavoriteState();
  }
}

class DHomeFavoriteState extends State<DHomeFavorite> {
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
        like: true),
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
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        AppBar(
          toolbarHeight: 133,
          backgroundColor: DHomeColors.bgColor,
          centerTitle: true,
          title: const Text(
            DHomeString.Favorite,
            style: TextStyle(
                fontSize: 14, fontWeight: FontWeight.w500, color: Colors.black),
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
        featureListData()
      ],
    ));
  }

  Widget featureListData() {
    return Container(
        height: MediaQuery.of(context).size.height,
        margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * .19),
        padding: EdgeInsets.only(
            left: MediaQuery.of(context).size.width * .03,
            right: MediaQuery.of(context).size.width * .05),
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(50),
              topRight: Radius.circular(50),
            )),
        child: ListView.builder(
            shrinkWrap: true,
            itemCount: featureList.length,
            scrollDirection: Axis.vertical,
            physics: const AlwaysScrollableScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              return Container(
                  width: MediaQuery.of(context).size.width * .88,
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
                              /* decoration: BoxDecoration(
                                gradient: LinearGradient(colors: [Color(0xffc3bdb0), Color(0xffc2cece)])
                            ),*/
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
