import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:octo_image/octo_image.dart';
import 'package:smartkit_pro/ui/fullApps/dreamHome/bottombar/bottomPage.dart';

import '../../helper/DHomeColors.dart';
import '../../helper/DHomeconstant.dart';
import '../dHomeAddProperty.dart';
import '../dHomeSerchProperty.dart';
import '../profile/DHomeProfile.dart';

class DHomeMenu extends StatefulWidget {
  const DHomeMenu({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return DHomeMenuState();
  }
}

class DHomeMenuState extends State<DHomeMenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      Container(
        height: MediaQuery.of(context).size.height,
        color: DHomeColors.bgColor,
        child: Column(
          children: [
            const SizedBox(
              height: 60,
            ),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                  alignment: Alignment.topLeft,
                  padding: const EdgeInsets.only(
                    left: 30,
                  ),
                  child: SvgPicture.asset(
                      DHomeConstant.getSvgImagePath("close.svg"))),
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
                height: 80,
                margin: const EdgeInsets.only(left: 30, right: 30),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: ListTile(
                  contentPadding: const EdgeInsets.all(10),
                  dense: true,
                  leading: Container(
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
                          ))),
                  title: const Text(
                    "Divy Jani",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                  subtitle: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const DHomeProfile()));
                      },
                      child: const Text(
                        "View and Edit Profile",
                        style:
                            TextStyle(fontSize: 14, color: Color(0xff818181)),
                      )),
                )),
          ],
        ),
      ),
      listData(),
    ]));
  }

  Widget listData() {
    return Container(
      margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * .3),
      padding: const EdgeInsets.only(left: 10, right: 10),
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(50),
            topRight: Radius.circular(50),
          )),
      child: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          tileDesign(
              name: "Home",
              image: "pro.home.svg",
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BottomPage(
                        from: 1, to: 1, body: BottomPage.defaultPages[1]),
                  ),
                );
              }),
          tileDesign(
              name: "Search Property",
              image: "pro.search.svg",
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const DHomeSearchProperty(),
                  ),
                );
              }),
          tileDesign(
              name: "Add Properties",
              image: "pro.add.svg",
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const DHomeAddProperty(),
                  ),
                );
              }),
          tileDesign(
              name: "Favorites",
              image: "pro.wishlist.svg",
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BottomPage(
                        from: 1, to: 2, body: BottomPage.defaultPages[2]),
                  ),
                );
              }),
          tileDesign(
              name: "Messages",
              image: "pro.chat.svg",
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BottomPage(
                        from: 2, to: 3, body: BottomPage.defaultPages[3]),
                  ),
                );
              }),
          tileDesign(
              name: "Settings",
              image: "pro.settings.svg",
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BottomPage(
                        from: 3, to: 4, body: BottomPage.defaultPages[4]),
                  ),
                );
              }),
        ],
      ),
    );
  }

  Widget tileDesign({String? name, String? image, VoidCallback? onPressed}) {
    return GestureDetector(
      onTap: onPressed,
      child: ListTile(
        dense: true,
        horizontalTitleGap: 0,
        leading: SvgPicture.asset(DHomeConstant.getSvgImagePath(image!)),
        title: Text(
          name!,
          style: const TextStyle(fontSize: 14),
        ),
        trailing: IconButton(
            onPressed: onPressed!,
            padding: const EdgeInsets.only(left: 40),
            icon: const Icon(
              Icons.arrow_forward_ios,
              size: 15,
              color: Colors.black,
            )),
      ),
    );
  }
}
