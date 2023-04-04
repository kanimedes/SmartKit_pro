import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smartkit_pro/ui/fullApps/nftApp/utils/image_path.dart';

class profilePage extends StatefulWidget {
  const profilePage({Key? key}) : super(key: key);

  @override
  State<profilePage> createState() => _profilePageState();
}

class _profilePageState extends State<profilePage> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10, top: 20),
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.45,
              child: Stack(
                children: [
                  ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image(
                          image:
                              AssetImage(NftConstant.getImagePath("gem.jpg")))),
                  Center(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
                        child: SizedBox(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height * 0.50,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Container(
                                  width: 100,
                                  height: 100,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                        color: Colors.blue, width: 5),
                                    image: DecorationImage(
                                        image: AssetImage(
                                            NftConstant.getImagePath(
                                                "nftgirl.jpg")),
                                        fit: BoxFit.cover),
                                  ),
                                )
                              ],
                            )),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "Jessica Adam",
            style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.w600,
                fontSize: 18),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            "jessicaadam@gmail.com",
            style: TextStyle(
                color: Theme.of(context).colorScheme.primary, fontSize: 12),
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 5,
                height: 5,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.black.withOpacity(0.6)),
              ),
              SizedBox(
                width: 5,
              ),
              Text("jessica adam.eth"),
              SizedBox(
                width: 10,
              ),
              Container(
                width: 5,
                height: 5,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.black.withOpacity(0.6)),
              ),
              SizedBox(
                width: 5,
              ),
              Text("CEO Of Lexuser"),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            margin: EdgeInsets.only(left: 20, right: 20),
            width: MediaQuery.of(context).size.height,
            height: 1,
            color: Colors.grey,
          ),
          SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(4, (index) => index)
                  .map((e) => GestureDetector(
                        onTap: () {
                          setState(() {
                            currentIndex = e;
                          });
                        },
                        child: Container(
                          margin:
                              EdgeInsets.only(left: 20, top: 20, bottom: 20),
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              boxShadow: const [
                                BoxShadow(
                                  offset: Offset(2, 2),
                                  blurRadius: 10,
                                  color: Color.fromRGBO(0, 0, 0, 0.16),
                                )
                              ],
                              color: currentIndex == e
                                  ? Colors.deepPurpleAccent
                                  : Colors.white,
                              border: Border.all(
                                  color: currentIndex == e
                                      ? Colors.transparent
                                      : Colors.transparent),
                              borderRadius: BorderRadius.circular(8)),
                          child: Text(
                            "Collected",
                            style: TextStyle(
                                color: currentIndex == e
                                    ? Colors.white
                                    : Colors.black),
                          ),
                        ),
                      ))
                  .toList(),
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            physics: BouncingScrollPhysics(),
            child: Row(
              children: List.generate(3, (index) => index)
                  .map((e) => Container(
                        margin: EdgeInsets.only(left: 20, top: 10, bottom: 20),
                        padding: EdgeInsets.all(10),
                        width: MediaQuery.of(context).size.width * 0.46,
                        height: MediaQuery.of(context).size.height * 0.27,
                        decoration: BoxDecoration(
                            boxShadow: const [
                              BoxShadow(
                                offset: Offset(2, 2),
                                blurRadius: 10,
                                color: Color.fromRGBO(0, 0, 0, 0.16),
                              )
                            ],
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height * 0.18,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image(
                                    image: AssetImage(
                                  NftConstant.getImagePath("gem.jpg"),
                                )),
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "Gucci of Fakurian",
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w600),
                            ),
                            Text(
                              "Available ART (70)",
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onSecondary),
                            ),
                          ],
                        ),
                      ))
                  .toList(),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * (0.1),
          ),
        ],
      ),
    );
  }
}
