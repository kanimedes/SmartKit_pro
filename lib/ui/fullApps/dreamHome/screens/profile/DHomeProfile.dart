import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:octo_image/octo_image.dart';

import '../../helper/DHomeColors.dart';
import '../../helper/DHomeString.dart';
import '../../helper/DHomeconstant.dart';
import '../login/DHomePasswordUpdate.dart';
import 'DHomeEditProfile.dart';

class DHomeProfile extends StatefulWidget {
  const DHomeProfile({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return DHomeProfileState();
  }
}

class DHomeProfileState extends State<DHomeProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      AppBar(
        toolbarHeight: 133,
        backgroundColor: DHomeColors.bgColor,
        centerTitle: true,
        leadingWidth: 80,
        title: Text(
          DHomeString.Profile,
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
      profileData()
    ]));
  }

  Widget profileData() {
    return Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * .2),
        //padding: EdgeInsets.only(left: 20,right:20),
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(50),
              topRight: Radius.circular(50),
            )),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            profileShow(),
            line(),
            personalDetail(),
            detailList(
                image: "edit.user.png", name: "Divy Jani", showArrow: false),
            detailList(
                image: "edit.mail.png",
                name: "abcexample@gmail.com",
                showArrow: false),
            detailList(
                image: "edit.phone.png", name: "0123456789", showArrow: false),
            detailList(
                image: "edit.password.png", name: "●●●●●●●●●", showArrow: true),
            line(),
            address(),
            addressData()
          ],
        ));
  }

  Widget profileShow() {
    return Column(
      children: [
        SizedBox(
            width: 70,
            height: 68.4,
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              child: OctoImage(
                image: const CachedNetworkImageProvider(
                    "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/travelapp%2Ftoptrip_b.jpg?alt=media&token=cd01d6b2-2892-4da7-bfee-4069e2e4f7e8"),
                placeholderBuilder: OctoPlaceholder.blurHash(
                  "L5Jk_:009FDi00oJ-oRj00~VMwM{",
                ),
                errorBuilder: OctoError.icon(color: DHomeColors.black),
                fit: BoxFit.contain,
                height: 50,
                width: 70,
              ),
            )),
        const Text(
          "Divy Jani",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
        GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const DHomeEditProfile(),
                ),
              );
            },
            child: const Text(
              "Edit Profile",
              style: TextStyle(fontSize: 12, color: Color(0xff565656)),
            ))
      ],
    );
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

  Widget personalDetail() {
    return Container(
        padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
        alignment: Alignment.topLeft,
        child: const Text(
          DHomeString.PersonalDetails,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ));
  }

  Widget detailList(
      {required String image, required String name, required bool showArrow}) {
    return GestureDetector(
      onTap: () {
        if (showArrow) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const DHomePasswordUpdate(),
            ),
          );
        }
      },
      child: Container(
        padding: const EdgeInsets.only(
          top: 10,
          left: 20,
        ),
        alignment: Alignment.topLeft,
        child: Row(
          children: [
            Image.asset(
              DHomeConstant.getPngImagePath(image),
              width: 30,
              height: 30,
            ),
            const SizedBox(
              width: 15,
            ),
            Text(
              name,
              style: const TextStyle(fontSize: 14),
            ),
            // SizedBox(width: MediaQuery.of(context).size.width*.38,),
            showArrow
                ? Container(
                    padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * .44),
                    alignment: Alignment.topRight,
                    child: IconButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const DHomePasswordUpdate(),
                            ),
                          );
                        },
                        padding: const EdgeInsets.only(left: 40),
                        icon: const Icon(
                          Icons.arrow_forward_ios,
                          size: 15,
                          color: Colors.black,
                        )))
                : Container()
          ],
        ),
      ),
    );
  }

  Widget address() {
    return Container(
        padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
        alignment: Alignment.topLeft,
        child: const Text(
          DHomeString.Address,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ));
  }

  Widget addressData() {
    return ListTile(
      leading: Image.asset(
        DHomeConstant.getPngImagePath("edit.address.png"),
        width: 30,
        height: 30,
      ),
      title: const Text(
        "Nr Hotel Vrinadavan, Hari Niwas Circle, Opp Manalisa Blg, Thane (west)",
        style: TextStyle(fontSize: 14),
      ),
    );
  }
}
