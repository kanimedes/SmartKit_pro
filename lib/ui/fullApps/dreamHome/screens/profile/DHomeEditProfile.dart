import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:octo_image/octo_image.dart';

import '../../helper/DHomeColors.dart';
import '../../helper/DHomeString.dart';
import '../../helper/DHomeconstant.dart';

class DHomeEditProfile extends StatefulWidget {
  const DHomeEditProfile({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return DHomeEditProfileState();
  }
}

class DHomeEditProfileState extends State<DHomeEditProfile> {
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
          DHomeString.EditProfile,
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
      editData()
    ]));
  }

  Widget editData() {
    return Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * .2),
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(50),
              topRight: Radius.circular(50),
            )),
        child: SingleChildScrollView(
          child: Column(children: [
            const SizedBox(
              height: 20,
            ),
            profileShow(),
            const SizedBox(
              height: 57,
            ),
            fullNameEnter(),
            const SizedBox(
              height: 20,
            ),
            emailEnter(),
            const SizedBox(
              height: 20,
            ),
            phoneEnter(),
            const SizedBox(
              height: 20,
            ),
            addressEnter(),
            const SizedBox(
              height: 25,
            ),
            saveProfileBtn()
          ]),
        ));
  }

  Widget profileShow() {
    return Stack(
      children: [
        SizedBox(
            width: 89,
            height: 89,
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
        Container(
            padding: EdgeInsets.only(
                left: MediaQuery.of(context).size.width * .18,
                top: MediaQuery.of(context).size.height * .08),
            child: SvgPicture.asset(
                DHomeConstant.getSvgImagePath("pro.pic_update.svg")))
      ],
    );
  }

  Widget fullNameEnter() {
    return Column(
      children: [
        Container(
            alignment: Alignment.topLeft,
            padding: EdgeInsets.only(
              left: MediaQuery.of(context).size.width * .07,
            ),
            child: const Text(
              DHomeString.FullName,
              textAlign: TextAlign.start,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            )),
        Container(
          alignment: Alignment.topLeft,
          padding: EdgeInsets.only(
            left: MediaQuery.of(context).size.width * .07,
            right: MediaQuery.of(context).size.width * .07,
          ),
          child: TextFormField(
              cursorColor: const Color(0xffacacac),
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.zero,
                hintText: "Divy Jani",
                hintStyle: TextStyle(
                    color: Color(0xff565656),
                    fontSize: 14,
                    fontWeight: FontWeight.w600),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0xffacacac)),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0xffacacac)),
                ),
              )),
        ),
      ],
    );
  }

  Widget emailEnter() {
    return Column(
      children: [
        Container(
            alignment: Alignment.topLeft,
            padding: EdgeInsets.only(
              left: MediaQuery.of(context).size.width * .07,
            ),
            child: const Text(
              DHomeString.EmailID,
              textAlign: TextAlign.start,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            )),
        Container(
          alignment: Alignment.topLeft,
          padding: EdgeInsets.only(
            left: MediaQuery.of(context).size.width * .07,
            right: MediaQuery.of(context).size.width * .07,
          ),
          child: TextFormField(
              cursorColor: const Color(0xffacacac),
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.zero,
                hintText: "abcd2021@gmail.com",
                hintStyle: TextStyle(
                    color: Color(0xff565656),
                    fontSize: 14,
                    fontWeight: FontWeight.w600),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0xffacacac)),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0xffacacac)),
                ),
              )),
        ),
      ],
    );
  }

  Widget phoneEnter() {
    return Column(
      children: [
        Container(
            alignment: Alignment.topLeft,
            padding: EdgeInsets.only(
              left: MediaQuery.of(context).size.width * .07,
            ),
            child: const Text(
              DHomeString.PhoneNumber,
              textAlign: TextAlign.start,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            )),
        Container(
          alignment: Alignment.topLeft,
          padding: EdgeInsets.only(
            left: MediaQuery.of(context).size.width * .07,
            right: MediaQuery.of(context).size.width * .07,
          ),
          child: TextFormField(
              cursorColor: const Color(0xffacacac),
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.zero,
                hintText: "0123456789",
                hintStyle: TextStyle(
                    color: Color(0xff565656),
                    fontSize: 14,
                    fontWeight: FontWeight.w600),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0xffacacac)),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0xffacacac)),
                ),
              )),
        ),
      ],
    );
  }

  Widget addressEnter() {
    return Column(
      children: [
        Container(
            alignment: Alignment.topLeft,
            padding: EdgeInsets.only(
              left: MediaQuery.of(context).size.width * .07,
            ),
            child: const Text(
              DHomeString.Address,
              textAlign: TextAlign.start,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            )),
        Container(
          alignment: Alignment.topLeft,
          padding: EdgeInsets.only(
            left: MediaQuery.of(context).size.width * .07,
            right: MediaQuery.of(context).size.width * .07,
          ),
          child: TextFormField(
              cursorColor: const Color(0xffacacac),
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.zero,
                hintText:
                    "Nr Hotel Vrinadavan, Hari Niwas Circle, Opp Manalisa Blg, Thane (west)",
                hintStyle: TextStyle(
                    color: Color(0xff565656),
                    fontSize: 14,
                    fontWeight: FontWeight.w600),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0xffacacac)),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0xffacacac)),
                ),
              )),
        ),
      ],
    );
  }

  Widget saveProfileBtn() {
    return ElevatedButton(
      onPressed: () {
        Navigator.pop(context);
        // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>  HeartBeatPage(from: 1, to: 1, body: HeartBeatPage.defaultPages[1]),),);
      },
      child: const Text(
        DHomeString.SaveProfile,
        style: TextStyle(
            fontWeight: FontWeight.w600,
            color: DHomeColors.white,
            fontSize: 20),
      ),
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(340, 55),
        shape: const StadiumBorder(),
        primary: DHomeColors.black,
      ),
    );
  }
}
