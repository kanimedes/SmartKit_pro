import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:octo_image/octo_image.dart';

import '../bottombar/bottomPage.dart';
import '../helper/DHomeAnimation.dart';
import '../helper/DHomeColors.dart';
import '../helper/DHomeconstant.dart';

class DHomeHomeDetail extends StatefulWidget {
  final String title,
      subTitle,
      rs,
      address,
      bed,
      bath,
      sqft,
      image,
      blurUrl,
      localImg;
  const DHomeHomeDetail(
      {required this.title,
      required this.rs,
      required this.sqft,
      required this.bed,
      required this.address,
      required this.bath,
      required this.subTitle,
      required this.localImg,
      required this.image,
      required this.blurUrl,
      Key? key})
      : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return DHomeHomeDetailState();
  }
}

class DHomeHomeDetailState extends State<DHomeHomeDetail> {
  bool like = false;
  final int delayedAmount = 200;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          topImage(),
          middleDesign(),
          rent(),
        ],
      ),
    );
  }

  Widget rent() {
    return Container(
      margin: EdgeInsets.only(
          top: MediaQuery.of(context).size.height * .26, left: 20),
      child: ElevatedButton(
        onPressed: () {},
        child: const Text(
          "Rent",
          style: TextStyle(color: DHomeColors.white, fontSize: 12),
        ),
        style: ElevatedButton.styleFrom(
          elevation: 0,
          shape: const StadiumBorder(),
          minimumSize: const Size(45, 25),
          primary: DHomeColors.black,
        ),
      ),
    );
  }

  Widget topImage() {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .33,
      width: MediaQuery.of(context).size.width,
      child: Stack(
        children: [
          SizedBox(
              height: MediaQuery.of(context).size.height * .33,
              width: MediaQuery.of(context).size.width,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: OctoImage(
                  image: CachedNetworkImageProvider(
                    widget.image,
                  ),
                  placeholderBuilder: OctoPlaceholder.blurHash(
                    widget.blurUrl,
                  ),
                  errorBuilder: OctoError.icon(color: DHomeColors.black),
                  height: MediaQuery.of(context).size.height * .5,
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.fill,
                ),
              )),
          Container(
            alignment: Alignment.topRight,
            padding: const EdgeInsets.only(top: 40, right: 20),
            child: CircleAvatar(
                radius: 15,
                backgroundColor: Colors.white38,
                child: GestureDetector(
                  child: like
                      ? const Icon(
                          Icons.favorite_rounded,
                          color: Colors.red,
                        )
                      : const Icon(
                          Icons.favorite_border,
                          size: 20,
                          color: Colors.white,
                        ),
                  onTap: () {
                    setState(() {
                      like = !like;
                    });
                  },
                )),
          ),
          Container(
              alignment: Alignment.topLeft,
              padding: const EdgeInsets.only(top: 40, left: 20),
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.white38,
                    ),
                    child: const Icon(Icons.arrow_back_ios_new_outlined,
                        size: 20, color: Colors.white)),
              )),
        ],
      ),
    );
  }

  Widget middleDesign() {
    return Container(
        margin: const EdgeInsets.only(top: 240),
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40), topRight: Radius.circular(40))),
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: SingleChildScrollView(
          child: Column(children: [
            const SizedBox(
              height: 35,
            ),
            DHomeAnimation(
              child: userDetail(),
              delay: delayedAmount,
            ),
            const SizedBox(
              height: 20,
            ),
            homeDetail()
          ]),
        ));
  }

  Widget userDetail() {
    return GestureDetector(
      onTap: () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) =>
                BottomPage(from: 2, to: 3, body: BottomPage.defaultPages[3]),
          ),
        );
      },
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.only(left: 12, right: 12),
        height: MediaQuery.of(context).size.height * .09,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: DHomeColors.bgColor),
        child: ListTile(
          contentPadding: EdgeInsets.zero,
          dense: true,
          leading: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: OctoImage(
              image: const CachedNetworkImageProvider(
                  "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/dreamhomeapp%2Fchat_1.png?alt=media&token=91373d51-2519-4757-9dc7-c1d99ddfb4a8"),
              placeholderBuilder: OctoPlaceholder.blurHash(
                'LAATs900Ne~q_3D%WW-;EM-;%hRj',
              ),
              errorBuilder: OctoError.icon(color: DHomeColors.black),
              fit: BoxFit.scaleDown,
              height: 45,
              width: 45,
            ),
          ),
          title: const Text(
            "Albert C. Verdin",
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
          ),
          subtitle: const Text(
            "Property Owner",
            style: TextStyle(fontSize: 10, color: Color(0xff818181)),
          ),
          trailing: Container(
            height: 30,
            width: 30,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10), color: Colors.black),
            child: SvgPicture.asset(
                DHomeConstant.getSvgImagePath("navi.chat.svg")),
          ),
        ),
      ),
    );
  }

  Widget homeDetail() {
    return Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.only(left: 12, right: 12),
        height: MediaQuery.of(context).size.height * .54,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: DHomeColors.bgColor),
        child: SingleChildScrollView(
          child: Column(
            children: [
              DHomeAnimation(
                child: ListTile(
                  dense: true,
                  contentPadding:
                      const EdgeInsets.only(left: 8, top: 10, right: 8),
                  visualDensity:
                      const VisualDensity(horizontal: 0, vertical: -3),
                  title: Text(
                    widget.title,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.w700),
                  ),
                  subtitle: Text(
                    widget.subTitle,
                    style: const TextStyle(
                        fontSize: 12, fontWeight: FontWeight.w700),
                  ),
                  trailing: Column(
                    children: [
                      Text(
                        widget.rs,
                        style: const TextStyle(
                            fontSize: 12, color: DHomeColors.red),
                      ),
                      const Text(
                        "/Month",
                        style:
                            TextStyle(fontSize: 10, color: Color(0xffa2a2a2)),
                      )
                    ],
                  ),
                ),
                delay: delayedAmount + 200,
              ),
              DHomeAnimation(
                child: line(),
                delay: delayedAmount + 200,
              ),
              const SizedBox(
                height: 8,
              ),
              DHomeAnimation(
                child: Row(
                  children: [
                    SvgPicture.asset(
                      DHomeConstant.getSvgImagePath("ho.address.svg"),
                      fit: BoxFit.scaleDown,
                    ),
                    Container(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text(
                          widget.address,
                          style: const TextStyle(
                            fontSize: 14,
                          ),
                        ))
                  ],
                ),
                delay: delayedAmount + 300,
              ),
              const SizedBox(
                height: 8,
              ),
              DHomeAnimation(
                child: Row(
                  children: [
                    SvgPicture.asset(
                      DHomeConstant.getSvgImagePath("ho.beds.svg"),
                      fit: BoxFit.scaleDown,
                    ),
                    Container(
                        padding: const EdgeInsets.only(
                          left: 10,
                        ),
                        child: Text(
                          widget.bed,
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
                          widget.bath,
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
                          widget.sqft,
                          style: const TextStyle(
                            fontSize: 14,
                          ),
                        ))
                  ],
                ),
                delay: delayedAmount + 300,
              ),
              DHomeAnimation(
                child: line(),
                delay: delayedAmount + 300,
              ),
              DHomeAnimation(
                child: const ListTile(
                  contentPadding: EdgeInsets.zero,
                  dense: true,
                  title: Text(
                    "Property Description",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                  ),
                  subtitle: Text(
                      "4BHK Apartment with 4 Beds and 3 Bath with great Balcony View. "),
                ),
                delay: delayedAmount + 400,
              ),
              DHomeAnimation(
                child: line(),
                delay: delayedAmount + 400,
              ),
              DHomeAnimation(
                child: Container(
                    alignment: Alignment.topLeft,
                    child: const Text(
                      "Furnishing",
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                    )),
                delay: delayedAmount + 500,
              ),
              DHomeAnimation(
                child: Row(
                  children: [
                    Container(
                      alignment: Alignment.topLeft,
                      child: Image.asset(
                        DHomeConstant.getPngImagePath("detail.check.png"),
                        height: 30,
                        width: 30,
                      ),
                    ),
                    const Text(
                      "Furnished",
                      style: TextStyle(fontSize: 12, color: Color(0xff6b6b6b)),
                    )
                  ],
                ),
                delay: delayedAmount + 500,
              ),
              DHomeAnimation(
                child: line(),
                delay: delayedAmount + 500,
              ),
              DHomeAnimation(
                child: Container(
                    alignment: Alignment.topLeft,
                    child: const Text(
                      "Amenities",
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                    )),
                delay: delayedAmount + 600,
              ),
              DHomeAnimation(
                child: Row(
                  children: [
                    Container(
                      alignment: Alignment.topLeft,
                      child: Image.asset(
                        DHomeConstant.getPngImagePath("detail.check.png"),
                        height: 30,
                        width: 30,
                      ),
                    ),
                    const Text(
                      "Gym",
                      style: TextStyle(fontSize: 12, color: Color(0xff6b6b6b)),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Container(
                      alignment: Alignment.topLeft,
                      child: Image.asset(
                        DHomeConstant.getPngImagePath("detail.check.png"),
                        height: 30,
                        width: 30,
                      ),
                    ),
                    const Text(
                      "Balcony",
                      style: TextStyle(fontSize: 12, color: Color(0xff6b6b6b)),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Container(
                      alignment: Alignment.topLeft,
                      child: Image.asset(
                        DHomeConstant.getPngImagePath("detail.check.png"),
                        height: 30,
                        width: 30,
                      ),
                    ),
                    const Text(
                      "CCTV",
                      style: TextStyle(fontSize: 12, color: Color(0xff6b6b6b)),
                    )
                  ],
                ),
                delay: delayedAmount + 600,
              ),
              DHomeAnimation(
                child: line(),
                delay: delayedAmount + 600,
              ),
              DHomeAnimation(
                child: Container(
                    alignment: Alignment.topLeft,
                    child: const Text(
                      "Photos",
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                    )),
                delay: delayedAmount + 700,
              ),
              DHomeAnimation(
                child: Container(
                  alignment: Alignment.topLeft,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                          width: 70,
                          height: 70.2,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10)),
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: OctoImage(
                                image: const CachedNetworkImageProvider(
                                    "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/dreamhomeapp%2Ff_img_1.png?alt=media&token=dd049a12-7bf9-491f-b1c0-73c3cbb3cb73"),
                                placeholderBuilder: OctoPlaceholder.blurHash(
                                  "LFIrmV017%.T0n?HIU\$d59-o\$er=",
                                ),
                                errorBuilder:
                                    OctoError.icon(color: DHomeColors.black),
                                fit: BoxFit.fill,
                              ))),
                      const SizedBox(
                        width: 10,
                      ),
                      Container(
                          width: 70,
                          height: 70.2,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10)),
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: OctoImage(
                                image: const CachedNetworkImageProvider(
                                    "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/dreamhomeapp%2Flist_img_2.png?alt=media&token=65ee4ac1-fccd-4d37-80a7-2a324aa3d32f"),
                                placeholderBuilder: OctoPlaceholder.blurHash(
                                  "LLIO5#-:D+oz_NxtIWt69bay%1oI",
                                ),
                                errorBuilder:
                                    OctoError.icon(color: DHomeColors.black),
                                fit: BoxFit.fill,
                              ))),
                      const SizedBox(
                        width: 10,
                      ),
                      Container(
                          width: 70,
                          height: 70.2,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10)),
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: OctoImage(
                                image: const CachedNetworkImageProvider(
                                    "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/dreamhomeapp%2Flist_img_3.png?alt=media&token=3c7714f7-c5f2-42cc-b92f-5ae9aadb9474"),
                                placeholderBuilder: OctoPlaceholder.blurHash(
                                  "L5HL*itS009F008^?Hx^0K_N_4%L",
                                ),
                                errorBuilder:
                                    OctoError.icon(color: DHomeColors.black),
                                fit: BoxFit.fill,
                              ))),
                      const SizedBox(
                        width: 10,
                      ),
                      Container(
                          width: 70,
                          height: 70.2,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10)),
                          child: Stack(
                            children: [
                              ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: OctoImage(
                                    image: const CachedNetworkImageProvider(
                                        "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/dreamhomeapp%2Flist_img_4.png?alt=media&token=98ea1919-897d-4cb9-83b4-479a1acf227d"),
                                    placeholderBuilder:
                                        OctoPlaceholder.blurHash(
                                      "LFEfZ\$4nM{IA00oLoz?b~q9Ft8WB",
                                    ),
                                    errorBuilder: OctoError.icon(
                                        color: DHomeColors.black),
                                    fit: BoxFit.fill,
                                  )),
                              Container(
                                width: 70,
                                height: 70.2,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.black54),
                                child: const Text(
                                  "4+ \n More",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(color: Colors.white),
                                ),
                              )
                            ],
                          ))
                    ],
                  ),
                ),
                delay: delayedAmount + 700,
              ),
            ],
          ),
        ));
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
}
