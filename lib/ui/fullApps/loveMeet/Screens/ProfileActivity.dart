import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:octo_image/octo_image.dart';
import 'package:smartkit_pro/ui/fullApps/loveMeet/Model/Gallary_Model.dart';
import 'package:smartkit_pro/ui/fullApps/loveMeet/Screens/EditProfileActivity.dart';
import 'package:smartkit_pro/ui/fullApps/loveMeet/Screens/LoginActivity.dart';
import 'package:smartkit_pro/ui/fullApps/loveMeet/Screens/MainActivity.dart';
import 'package:smartkit_pro/ui/fullApps/loveMeet/helper/ColorsRes.dart';
import 'package:smartkit_pro/ui/fullApps/loveMeet/helper/StringsRes.dart';

class ProfileActivity extends StatefulWidget {
  const ProfileActivity({Key? key}) : super(key: key);

  @override
  _ProfileActivityState createState() => _ProfileActivityState();
}

class _ProfileActivityState extends State<ProfileActivity> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.transparent,
        backgroundColor: ColorsRes.backgroundColor,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: ColorsRes.darkColor),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => MainActivity(),
              ),
            );
          },
        ),
        title: Text(
          StringsRes.profileText,
          textAlign: TextAlign.left,
          style: TextStyle(
            color: ColorsRes.darkColor,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EditProfileActivity(),
                ),
              );
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: Center(
                child: Text(
                  StringsRes.editText,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: ColorsRes.darkColor,
                    fontWeight: FontWeight.normal,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
      body: Stack(
        children: <Widget>[
          Container(
            color: ColorsRes.backgroundColor,
            width: double.infinity,
            height: double.infinity,
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 20.0,
                    ),
                    Container(
                        alignment: Alignment.center,
                        child: CircleAvatar(
                          radius: 50,
                          backgroundColor: ColorsRes.backgroundColor,
                          child: ClipOval(
                              child: OctoImage(
                            image: CachedNetworkImageProvider(
                              "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/datingapp%2Fprofilepic.jpg?alt=media&token=32c9e3f5-57a0-4caf-b176-bb801fea6181",
                            ),
                            placeholderBuilder: OctoPlaceholder.blurHash(
                              "LgJa[zIU%\$xt9ZxaxuNG~qbb?Hoz",
                            ),
                            errorBuilder: OctoError.icon(color: Colors.black),
                            width: 135,
                            height: 135,
                            fit: BoxFit.fill,
                          )),
                        )),
                    SizedBox(
                      height: 20.0,
                    ),
                    Center(
                      child: Text(
                        "Blacksmith as",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: ColorsRes.darkColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    Center(
                      child: Text(
                        "Toronto City, Ontario CA",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: ColorsRes.darkColor,
                          fontWeight: FontWeight.normal,
                          fontSize: 12,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: const [
                            Center(
                              child: Text(
                                "159",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: ColorsRes.gradientTwo,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                            Center(
                              child: Text(
                                "Followers",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: ColorsRes.darkColor,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: const [
                            Center(
                              child: Text(
                                "420",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: ColorsRes.gradientTwo,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                            Center(
                              child: Text(
                                "Following",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: ColorsRes.darkColor,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: const [
                            Center(
                              child: Text(
                                "50",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: ColorsRes.gradientTwo,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                            Center(
                              child: Text(
                                "Favorites",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: ColorsRes.darkColor,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Center(
                      child: Text(
                        "Gallery",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: ColorsRes.darkColor,
                          fontWeight: FontWeight.normal,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                      child: Row(children: const [
                        Expanded(
                            child: Divider(
                          thickness: 2,
                          color: ColorsRes.darkColor,
                          indent: 0,
                          endIndent: 0,
                        )),
                        Expanded(
                            child: Divider(
                          thickness: 3,
                          color: ColorsRes.gradientTwo,
                          indent: 0,
                          endIndent: 0,
                        )),
                        Expanded(
                            child: Divider(
                          thickness: 2,
                          color: ColorsRes.darkColor,
                          indent: 0,
                          endIndent: 0,
                        )),
                      ]),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 1.5,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: GridView.count(
                          physics: NeverScrollableScrollPhysics(),
                          crossAxisCount: 3,
                          children: List.generate(gallaryList.length, (index) {
                            return Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10.0),
                                child: OctoImage(
                                    image: CachedNetworkImageProvider(
                                      gallaryList[index].imgurl!,
                                    ),
                                    placeholderBuilder:
                                        OctoPlaceholder.blurHash(
                                      gallaryList[index].hash!,
                                    ),
                                    errorBuilder:
                                        OctoError.icon(color: Colors.black),
                                    fit: BoxFit.cover,
                                    width: MediaQuery.of(context).size.width,
                                    height: MediaQuery.of(context).size.width /
                                        5.2),
                              ),
                            );
                          }),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      /*)*/
    );
  }

  Future<void> navigationPage() async {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => LoginActivity(),
      ),
    );
  }
}
