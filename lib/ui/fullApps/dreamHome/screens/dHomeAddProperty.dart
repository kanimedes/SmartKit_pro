import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:octo_image/octo_image.dart';
import 'package:smartkit_pro/ui/fullApps/dreamHome/bottombar/bottomPage.dart';
import 'package:smartkit_pro/ui/fullApps/dreamHome/models/DHomeAddProModel.dart';
import 'package:smartkit_pro/ui/fullApps/dreamHome/models/DHomeAllPro4Model.dart';

import '../helper/DHomeColors.dart';
import '../helper/DHomeString.dart';
import '../helper/DHomeconstant.dart';
import 'dHomeSerchProperty.dart';

class DHomeAddProperty extends StatefulWidget {
  const DHomeAddProperty({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return DHomeAddPropertyState();
  }
}

class DHomeAddPropertyState extends State<DHomeAddProperty> {
  bool first = false;
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
          title: Text(
            DHomeString.AddProperties,
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
        addPropertyData()
      ]),
    );
  }

  Widget addPropertyData() {
    return Container(
      height: MediaQuery.of(context).size.height,
      margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * .2),
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(50),
            topRight: Radius.circular(50),
          )),
      child: AnimatedCrossFade(
        firstCurve: Curves.linear,
        secondCurve: Curves.linear,
        firstChild: Animated2And3(
          onpress: () {
            setState(() {
              first = !first;
            });
          },
        ),
        secondChild: DHomeAllProperty1(
          onrPress: () {
            setState(() {
              first = !first;
            });
          },
        ),
        crossFadeState:
            first ? CrossFadeState.showFirst : CrossFadeState.showSecond,
        duration: const Duration(milliseconds: 500),
      ),
    );
  }
}

class DHomeAllProperty2 extends StatefulWidget {
  final VoidCallback onrPress;
  final VoidCallback back;
  const DHomeAllProperty2(
      {required this.onrPress, required this.back, Key? key})
      : super(key: key);
  @override
  State<DHomeAllProperty2> createState() => DHomeAllProperty2State();
}

class DHomeAllProperty2State extends State<DHomeAllProperty2> {
  int val = 2;
  bool a = true,
      b = false,
      c = false,
      d = false,
      e = false,
      second = false,
      b1 = true,
      b2 = false,
      b3 = false,
      b4 = false,
      b5 = false;
  List<ListDataView> location = [
    ListDataView(
      title: "Home",
      imageUrl: DHomeConstant.getSvgImagePath("cat.home.svg"),
    ),
    ListDataView(
      title: "Apartment",
      imageUrl: DHomeConstant.getSvgImagePath("cat.apartment.svg"),
    ),
    ListDataView(
      title: "commercial",
      imageUrl: DHomeConstant.getSvgImagePath("cat.commercial.svg"),
    )
  ];
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * .04,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                  padding: const EdgeInsets.only(left: 20),
                  child: const Text(
                    DHomeString.page1Text,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  )),
              Container(
                  padding: const EdgeInsets.only(right: 20),
                  child: Text(
                    "step $val of 4",
                    style:
                        const TextStyle(fontSize: 12, color: Color(0xff565656)),
                  ))
            ],
          ),
          line(),
          SizedBox(
            height: MediaQuery.of(context).size.height * .02,
          ),
          plotAre(),
          SizedBox(
            height: MediaQuery.of(context).size.height * .02,
          ),
          Container(
            alignment: Alignment.topLeft,
            padding: const EdgeInsets.only(left: 20),
            child: const Text(DHomeString.PropertyType),
          ),
          listDataProperty(),
          line(),
          bedRooms(),
          bedRoomList(),
          SizedBox(
            height: MediaQuery.of(context).size.height * .02,
          ),
          line(),
          bathRooms(),
          bathRoomList(),
          SizedBox(
            height: MediaQuery.of(context).size.height * .02,
          ),
          line(),
          SizedBox(
            height: MediaQuery.of(context).size.height * .04,
          ),
          backNextBtn()
        ],
      ),
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

  Widget plotAre() {
    return Container(
      height: MediaQuery.of(context).size.height * .12,
      margin: const EdgeInsets.only(left: 20, right: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: DHomeColors.bgColor,
      ),
      child: Container(
        margin: const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: DHomeColors.white,
          boxShadow: const [
            BoxShadow(
              color: Color(0x0f000000),
              blurRadius: 10.0, // soften the shadow
              spreadRadius: 0.0, //extend the shadow
            )
          ],
        ),
        child: const ListTile(
          dense: true,
          contentPadding: EdgeInsets.only(left: 10),
          title: Text("Plot Area"),
          subtitle: Text(
            "1650 sqft",
            style: TextStyle(fontSize: 12, color: Color(0xffa2a2a2)),
          ),
        ),
      ),
    );
  }

  Widget listDataProperty() {
    return Container(
      height: MediaQuery.of(context).size.height * .08,
      padding: const EdgeInsets.only(left: 20),
      child: ListView.builder(
          shrinkWrap: true,
          itemCount: location.length,
          scrollDirection: Axis.horizontal,
          physics: const AlwaysScrollableScrollPhysics(),
          itemBuilder: (BuildContext context, int index) {
            return Container(
              width: MediaQuery.of(context).size.width * .3,
              margin:
                  const EdgeInsets.only(left: 2, right: 20, top: 8, bottom: 8),
              decoration: BoxDecoration(
                  color: index == 0 ? DHomeColors.black : DHomeColors.bgColor,
                  borderRadius: BorderRadius.circular(10)),
              child: GestureDetector(
                onTap: () {
                  // Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => GoRideChooseDesScreen(),),);
                },
                child: Row(
                    //crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(
                        width: 2,
                      ),
                      index == 0
                          ? Image.asset(
                              DHomeConstant.getPngImagePath("hover.home.png"),
                              height: 25,
                              width: 25,
                            )
                          : SvgPicture.asset(
                              location[index].imageUrl,
                            ),
                      Text(
                        location[index].title,
                        style: TextStyle(
                          color: index == 0 ? Colors.white : Colors.black,
                        ),
                      ),
                    ]),
              ),
            );
          }),
    );
  }

  Widget bedRooms() {
    return Container(
        alignment: Alignment.topLeft,
        padding: const EdgeInsets.only(left: 20, top: 10, bottom: 10),
        child: const Text(
          DHomeString.Bedrooms,
          style: TextStyle(fontSize: 14),
        ));
  }

  Widget bedRoomList() {
    return Container(
      padding: const EdgeInsets.only(left: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                a = !a;
                b = false;
                c = false;
                d = false;
                e = false;
              });
            },
            child: Container(
              height: 50,
              width: 50,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: a ? DHomeColors.black : DHomeColors.bgColor,
                  borderRadius: BorderRadius.circular(10)),
              child: Text(
                "1",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: a ? DHomeColors.white : DHomeColors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w600),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                b = true;
                a = false;
                c = false;
                d = false;
                e = false;
              });
            },
            child: Container(
              height: 50,
              width: 50,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: b ? DHomeColors.black : DHomeColors.bgColor,
                  borderRadius: BorderRadius.circular(10)),
              child: Text(
                "2",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: b ? DHomeColors.white : DHomeColors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w600),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                c = true;
                a = false;
                b = false;
                d = false;
                e = false;
              });
            },
            child: Container(
              height: 50,
              width: 50,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: c ? DHomeColors.black : DHomeColors.bgColor,
                  borderRadius: BorderRadius.circular(10)),
              child: Text(
                "3",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: c ? DHomeColors.white : DHomeColors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w600),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                d = true;
                a = false;
                b = false;
                e = false;
                c = false;
              });
            },
            child: Container(
              height: 50,
              width: 50,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: d ? DHomeColors.black : DHomeColors.bgColor,
                  borderRadius: BorderRadius.circular(10)),
              child: Text(
                "4",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: d ? DHomeColors.white : DHomeColors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w600),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                e = true;
                d = false;
                a = false;
                b = false;
                c = false;
              });
            },
            child: Container(
              height: 50,
              width: 50,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: e ? DHomeColors.black : DHomeColors.bgColor,
                  borderRadius: BorderRadius.circular(10)),
              child: Text(
                "+5",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: e ? DHomeColors.white : DHomeColors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w600),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget bathRooms() {
    return Container(
        alignment: Alignment.topLeft,
        padding: const EdgeInsets.only(left: 20, top: 10, bottom: 10),
        child: const Text(
          DHomeString.Bathrooms,
          style: TextStyle(fontSize: 14),
        ));
  }

  Widget bathRoomList() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              b1 = true;
              b2 = false;
              b3 = false;
              b4 = false;
              b5 = false;
            });
          },
          child: Container(
            height: 50,
            width: 50,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: b1 ? DHomeColors.black : DHomeColors.bgColor,
                borderRadius: BorderRadius.circular(10)),
            child: Text(
              "1",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: b1 ? DHomeColors.white : DHomeColors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.w600),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              b2 = true;
              b1 = false;
              b3 = false;
              b4 = false;
              b5 = false;
            });
          },
          child: Container(
            height: 50,
            width: 50,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: b2 ? DHomeColors.black : DHomeColors.bgColor,
                borderRadius: BorderRadius.circular(10)),
            child: Text(
              "2",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: b2 ? DHomeColors.white : DHomeColors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.w600),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              b3 = true;
              b1 = false;
              b2 = false;
              b4 = false;
              b5 = false;
            });
          },
          child: Container(
            height: 50,
            width: 50,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: b3 ? DHomeColors.black : DHomeColors.bgColor,
                borderRadius: BorderRadius.circular(10)),
            child: Text(
              "3",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: b3 ? DHomeColors.white : DHomeColors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.w600),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              b4 = true;
              b1 = false;
              b2 = false;
              b3 = false;
              b5 = false;
            });
          },
          child: Container(
            height: 50,
            width: 50,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: b4 ? DHomeColors.black : DHomeColors.bgColor,
                borderRadius: BorderRadius.circular(10)),
            child: Text(
              "4",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: b4 ? DHomeColors.white : DHomeColors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.w600),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              b5 = true;
              b1 = false;
              b2 = false;
              b3 = false;
              b4 = false;
            });
          },
          child: Container(
            height: 50,
            width: 50,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: b5 ? DHomeColors.black : DHomeColors.bgColor,
                borderRadius: BorderRadius.circular(10)),
            child: Text(
              "+5",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: b5 ? DHomeColors.white : DHomeColors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.w600),
            ),
          ),
        )
      ],
    );
  }

  Widget backNextBtn() {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
      TextButton(
        onPressed: widget.back,
        child: const Text(
          DHomeString.Back,
          style: TextStyle(
              fontWeight: FontWeight.w500,
              color: DHomeColors.black,
              fontSize: 16),
        ),
      ),
      ElevatedButton(
        onPressed: widget.onrPress,
        child: const Text(
          DHomeString.NextStep,
          style: TextStyle(
              fontWeight: FontWeight.w600,
              color: DHomeColors.white,
              fontSize: 16),
        ),
        style: ElevatedButton.styleFrom(
          elevation: 0,
          shape: const StadiumBorder(),
          minimumSize: const Size(186, 48),
          primary: DHomeColors.black,
        ),
      ),
    ]);
  }
}

class Animated2And3 extends StatefulWidget {
  final VoidCallback onpress;
  const Animated2And3({required this.onpress, Key? key}) : super(key: key);
  @override
  State<Animated2And3> createState() => _Animated2And3State();
}

class _Animated2And3State extends State<Animated2And3> {
  bool second = false;
  @override
  Widget build(BuildContext context) {
    return AnimatedCrossFade(
      firstCurve: Curves.linear,
      secondCurve: Curves.linear,
      firstChild: DHomeAllProperty2(
        onrPress: () {
          setState(() {
            second = !second;
          });
        },
        back: widget.onpress,
      ),
      secondChild: Animated3And4(
          onpress: () {
            setState(() {
              second = !second;
            });
          },
          back: widget.onpress),
      crossFadeState:
          second ? CrossFadeState.showSecond : CrossFadeState.showFirst,
      duration: const Duration(milliseconds: 500),
    );
  }
}

class Animated3And4 extends StatefulWidget {
  final VoidCallback onpress, back;
  const Animated3And4({required this.onpress, required this.back, Key? key})
      : super(key: key);
  @override
  State<Animated3And4> createState() => _Animated3And4State();
}

class _Animated3And4State extends State<Animated3And4> {
  bool third = false;
  @override
  Widget build(BuildContext context) {
    return AnimatedCrossFade(
      firstCurve: Curves.linear,
      secondCurve: Curves.linear,
      firstChild: DHomeAllProperty3(
          onrPress: () {
            setState(() {
              third = !third;
            });
          },
          back: widget.onpress),
      secondChild: DHomeAllProperty4(
          onrPress: () {
            setState(() {
              third = !third;
            });
          },
          back: widget.onpress),
      crossFadeState:
          third ? CrossFadeState.showSecond : CrossFadeState.showFirst,
      duration: const Duration(milliseconds: 500),
    );
  }
}

class DHomeAllProperty3 extends StatefulWidget {
  final VoidCallback onrPress, back;
  const DHomeAllProperty3(
      {required this.onrPress, required this.back, Key? key})
      : super(key: key);
  @override
  State<DHomeAllProperty3> createState() => _DHomeAllProperty3State();
}

class _DHomeAllProperty3State extends State<DHomeAllProperty3> {
  int val = 3;
  bool furnished = true,
      unfurnished = false,
      gym = false,
      sp = true,
      balcony = false,
      cctv = false,
      parking = false,
      theator = true;
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      SizedBox(
        height: MediaQuery.of(context).size.height * .04,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
              padding: const EdgeInsets.only(left: 20),
              child: const Text(
                DHomeString.page1Text,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              )),
          Container(
              padding: const EdgeInsets.only(right: 20),
              child: Text(
                "step $val of 4",
                style: const TextStyle(fontSize: 12, color: Color(0xff565656)),
              ))
        ],
      ),
      line(),
      furnishing(),
      furnishingList(),
      line(),
      amenities(),
      amenitiesList(),
      SizedBox(
        height: MediaQuery.of(context).size.height * .295,
      ),
      backNextBtn(),
    ]);
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

  Widget furnishing() {
    return Container(
        alignment: Alignment.topLeft,
        padding: const EdgeInsets.only(left: 20, top: 10, bottom: 10),
        child: const Text(
          DHomeString.Furnishing,
          style: TextStyle(fontSize: 14),
        ));
  }

  Widget furnishingList() {
    return Row(children: [
      Container(
        padding: const EdgeInsets.only(left: 20),
        child: ElevatedButton(
          onPressed: () {
            setState(() {
              furnished = !furnished;
              unfurnished = false;
            });
          },
          child: Text(
            "Furnished",
            style: TextStyle(
                fontWeight: FontWeight.w600,
                color: furnished ? DHomeColors.white : DHomeColors.black,
                fontSize: 12),
          ),
          style: ElevatedButton.styleFrom(
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            minimumSize: const Size(110, 45),
            primary: furnished ? DHomeColors.black : DHomeColors.bgColor,
          ),
        ),
      ),
      Container(
        padding: const EdgeInsets.only(left: 40),
        child: ElevatedButton(
          onPressed: () {
            setState(() {
              unfurnished = true;
              furnished = false;
            });
          },
          child: Text(
            "Unfurnished",
            style: TextStyle(
                fontWeight: FontWeight.w600,
                color: unfurnished ? DHomeColors.white : DHomeColors.black,
                fontSize: 12),
          ),
          style: ElevatedButton.styleFrom(
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            minimumSize: const Size(110, 45),
            primary: unfurnished ? DHomeColors.black : DHomeColors.bgColor,
          ),
        ),
      ),
    ]);
  }

  Widget amenities() {
    return Container(
        alignment: Alignment.topLeft,
        padding: const EdgeInsets.only(left: 20, top: 10, bottom: 10),
        child: const Text(
          DHomeString.Amenities,
          style: TextStyle(fontSize: 14),
        ));
  }

  Widget amenitiesList() {
    return Column(
      children: [
        Row(children: [
          Container(
            padding: const EdgeInsets.only(left: 20),
            child: ElevatedButton(
              onPressed: () {
                setState(() {
                  gym = true;
                  balcony = false;
                  sp = false;
                });
              },
              child: Text(
                "Gym",
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: gym ? DHomeColors.white : DHomeColors.black,
                    fontSize: 12),
              ),
              style: ElevatedButton.styleFrom(
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                minimumSize: const Size(80, 45),
                primary: gym ? DHomeColors.black : DHomeColors.bgColor,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 20),
            child: ElevatedButton(
              onPressed: () {
                setState(() {
                  gym = false;
                  balcony = false;
                  sp = !sp;
                });
              },
              child: Text(
                "Swimming Pool",
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: sp ? DHomeColors.white : DHomeColors.black,
                    fontSize: 12),
              ),
              style: ElevatedButton.styleFrom(
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                minimumSize: const Size(110, 45),
                primary: sp ? DHomeColors.black : DHomeColors.bgColor,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 20),
            child: ElevatedButton(
              onPressed: () {
                setState(() {
                  gym = false;
                  balcony = true;
                  sp = false;
                });
              },
              child: Text(
                "Balcony",
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: balcony ? DHomeColors.white : DHomeColors.black,
                    fontSize: 12),
              ),
              style: ElevatedButton.styleFrom(
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                minimumSize: const Size(100, 45),
                primary: balcony ? DHomeColors.black : DHomeColors.bgColor,
              ),
            ),
          ),
        ]),
        const SizedBox(
          height: 20,
        ),
        Row(children: [
          Container(
            padding: const EdgeInsets.only(left: 20),
            child: ElevatedButton(
              onPressed: () {
                setState(() {
                  cctv = true;
                  parking = false;
                  theator = false;
                });
              },
              child: Text(
                "CCTV",
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: cctv ? DHomeColors.white : DHomeColors.black,
                    fontSize: 12),
              ),
              style: ElevatedButton.styleFrom(
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                minimumSize: const Size(80, 45),
                primary: cctv ? DHomeColors.black : DHomeColors.bgColor,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 20),
            child: ElevatedButton(
              onPressed: () {
                setState(() {
                  cctv = false;
                  parking = true;
                  theator = false;
                });
              },
              child: Text(
                "Parking",
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: parking ? DHomeColors.white : DHomeColors.black,
                    fontSize: 12),
              ),
              style: ElevatedButton.styleFrom(
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                minimumSize: const Size(130, 45),
                primary: parking ? DHomeColors.black : DHomeColors.bgColor,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 20),
            child: ElevatedButton(
              onPressed: () {
                setState(() {
                  cctv = false;
                  parking = false;
                  theator = !theator;
                });
              },
              child: Text(
                "Theatre",
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: theator ? DHomeColors.white : DHomeColors.black,
                    fontSize: 12),
              ),
              style: ElevatedButton.styleFrom(
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                minimumSize: const Size(100, 45),
                primary: theator ? DHomeColors.black : DHomeColors.bgColor,
              ),
            ),
          ),
        ]),
      ],
    );
  }

  Widget backNextBtn() {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
      TextButton(
        onPressed: widget.back,
        child: const Text(
          DHomeString.Back,
          style: TextStyle(
              fontWeight: FontWeight.w500,
              color: DHomeColors.black,
              fontSize: 16),
        ),
      ),
      ElevatedButton(
        onPressed: widget.onrPress,
        child: const Text(
          DHomeString.NextStep,
          style: TextStyle(
              fontWeight: FontWeight.w600,
              color: DHomeColors.white,
              fontSize: 16),
        ),
        style: ElevatedButton.styleFrom(
          elevation: 0,
          shape: const StadiumBorder(),
          minimumSize: const Size(186, 48),
          primary: DHomeColors.black,
        ),
      ),
    ]);
  }
}

class DHomeAllProperty1 extends StatefulWidget {
  final VoidCallback onrPress;
  const DHomeAllProperty1({required this.onrPress, Key? key}) : super(key: key);
  @override
  State<DHomeAllProperty1> createState() => _DHomeAllProperty1State();
}

class _DHomeAllProperty1State extends State<DHomeAllProperty1> {
  int val = 1;
  List<DHomeAddProModel> addProList = [
    DHomeAddProModel(title: 'Property Title', des: 'Alpha Towers'),
    DHomeAddProModel(
        title: 'Property Description',
        des: '4BHK Apartment with 4 Beds and 3 Bath with great Balcony View. '),
    DHomeAddProModel(
        title: 'Property Location',
        des: '35, New No 19, 25 Street, Mount Road'),
    DHomeAddProModel(title: 'Set Price', des: '\$5,000 /Month'),
  ];
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      SizedBox(
        height: MediaQuery.of(context).size.height * .04,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
              padding: const EdgeInsets.only(left: 20),
              child: const Text(
                DHomeString.page1Text,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              )),
          Container(
              padding: const EdgeInsets.only(right: 20),
              child: Text(
                "step $val of 4",
                style: const TextStyle(fontSize: 12, color: Color(0xff565656)),
              ))
        ],
      ),
      line(),
      const SizedBox(
        height: 20,
      ),
      rentSell(),
      const SizedBox(
        height: 20,
      ),
      propertyList(),
      const SizedBox(
        height: 20,
      ),
      nextBtn()
    ]);
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

  Widget rentSell() {
    return Container(
      height: MediaQuery.of(context).size.height * .1,
      margin: const EdgeInsets.only(left: 20, right: 20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: DHomeColors.bgColor),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
              height: MediaQuery.of(context).size.height * .06,
              width: 150,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: DHomeColors.black,
                  borderRadius: BorderRadius.circular(15)),
              child: const Text(
                DHomeString.Rent,
                style: TextStyle(color: Colors.white),
              )),
          Container(
              height: MediaQuery.of(context).size.height * .06,
              width: 150,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: DHomeColors.white),
              child: const Text(DHomeString.Sell)),
        ],
      ),
    );
  }

  Widget propertyList() {
    return Container(
        height: MediaQuery.of(context).size.height * .43,
        margin: const EdgeInsets.only(
          left: 20,
          right: 20,
        ),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: DHomeColors.bgColor),
        child: ListView.builder(
            shrinkWrap: true,
            itemCount: addProList.length,
            padding: const EdgeInsets.only(
              left: 20,
              right: 20,
            ),
            // scrollDirection: Axis.horizontal,
            physics: const AlwaysScrollableScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              return Container(
                width: MediaQuery.of(context).size.width * .8,
                margin: const EdgeInsets.only(top: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: DHomeColors.white,
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0x0f000000),
                      blurRadius: 10.0, // soften the shadow
                      spreadRadius: 0.0, //extend the shadow
                    )
                  ],
                ),
                child: ListTile(
                  dense: true,
                  contentPadding: const EdgeInsets.only(left: 10),
                  title: Text(
                    addProList[index].title,
                    style: const TextStyle(fontSize: 14),
                  ),
                  subtitle: Container(
                      margin: const EdgeInsets.only(right: 30),
                      child: Text(
                        addProList[index].des,
                        style: const TextStyle(
                            fontSize: 12, color: Color(0xffa2a2a2)),
                      )),
                ),
              );
            }));
  }

  Widget nextBtn() {
    return ElevatedButton(
      onPressed: widget.onrPress,
      child: const Text(
        DHomeString.NextStep,
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

class DHomeAllProperty4 extends StatefulWidget {
  final VoidCallback onrPress, back;
  const DHomeAllProperty4(
      {required this.onrPress, required this.back, Key? key})
      : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return DHomeAllProperty4State();
  }
}

class DHomeAllProperty4State extends State<DHomeAllProperty4>
    with TickerProviderStateMixin {
  late AnimationController scaleController = AnimationController(
      duration: const Duration(milliseconds: 800), vsync: this);
  late Animation<double> scaleAnimation =
      CurvedAnimation(parent: scaleController, curve: Curves.elasticOut);
  late AnimationController checkController =
      AnimationController(duration: const Duration(seconds: 2), vsync: this);
  late Animation<double> checkAnimation =
      CurvedAnimation(parent: checkController, curve: Curves.linear);
  double circleSize = 90;
  double iconSize = 60;
  int val = 4;
  final _formKeyDialog = GlobalKey<FormState>();
  List<DHomeAllPro4Model> imageList = [
    DHomeAllPro4Model(image: "", blurUrl: "", localImg: ""),
    DHomeAllPro4Model(
        image:
            "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/dreamhomeapp%2Ff_img_1.png?alt=media&token=dd049a12-7bf9-491f-b1c0-73c3cbb3cb73",
        blurUrl: "LFIrmV017%.T0n?HIU\$d59-o\$er=",
        localImg: DHomeConstant.getPngImagePath("list_img_1.png")),
    DHomeAllPro4Model(
        image:
            "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/dreamhomeapp%2Flist_img_2.png?alt=media&token=65ee4ac1-fccd-4d37-80a7-2a324aa3d32f",
        blurUrl: "LLIO5#-:D+oz_NxtIWt69bay%1oI",
        localImg: DHomeConstant.getPngImagePath("list_img_2.png")),
    DHomeAllPro4Model(
        image:
            "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/dreamhomeapp%2Flist_img_3.png?alt=media&token=3c7714f7-c5f2-42cc-b92f-5ae9aadb9474",
        blurUrl: "L5HL*itS009F008^?Hx^0K_N_4%L",
        localImg: DHomeConstant.getPngImagePath("list_img_3.png")),
    DHomeAllPro4Model(
        image:
            "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/dreamhomeapp%2Flist_img_4.png?alt=media&token=98ea1919-897d-4cb9-83b4-479a1acf227d",
        blurUrl: "LFEfZ\$4nM{IA00oLoz?b~q9Ft8WB",
        localImg: DHomeConstant.getPngImagePath("list_img_4.png")),
    DHomeAllPro4Model(
        image:
            "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/dreamhomeapp%2Flist_img_5.png?alt=media&token=11ff8716-4e55-42d8-b20c-288e427627db",
        blurUrl: "LQI\$Na_3IAMwn--?tRRP%%tnMxj=",
        localImg: DHomeConstant.getPngImagePath("list_img_5.png")),
    DHomeAllPro4Model(
        image:
            "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/dreamhomeapp%2Flist_img_6.png?alt=media&token=505adc48-c4f1-4b70-a6eb-65f3bdcddd5e",
        blurUrl: "L9IX]b?_Y89~%i:}tSNL00O@V@xa",
        localImg: DHomeConstant.getPngImagePath("list_img_6.png")),
    DHomeAllPro4Model(
        image:
            "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/dreamhomeapp%2Flist_img_7.png?alt=media&token=aa816192-ca50-43e8-940b-49fa6f5099bc",
        blurUrl: "LSMjQ}%%?bs,%Lt6t6M|8^VsM{t7",
        localImg: DHomeConstant.getPngImagePath("list_img_7.png")),
  ];
  @override
  void dispose() {
    scaleController.dispose();
    checkController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      SizedBox(
        height: MediaQuery.of(context).size.height * .04,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
              padding: const EdgeInsets.only(left: 20),
              child: const Text(
                DHomeString.page4Text,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              )),
          Container(
              padding: const EdgeInsets.only(right: 20),
              child: Text(
                "step $val of 4",
                style: const TextStyle(fontSize: 12, color: Color(0xff565656)),
              ))
        ],
      ),
      line(),
      gridList(),
      SizedBox(
        height: MediaQuery.of(context).size.height * .355,
      ),
      backPostBtn()
    ]);
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

  Widget gridList() {
    return Container(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: GridView.builder(
            shrinkWrap: true,
            itemCount: imageList.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              mainAxisSpacing: 10.0,
              crossAxisSpacing: 10.0,
            ),
            itemBuilder: (BuildContext context, int index) {
              return index != 0
                  ? Container(
                      height: 75,
                      width: 75,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10)),
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: OctoImage(
                            image: CachedNetworkImageProvider(
                                imageList[index].image),
                            placeholderBuilder: OctoPlaceholder.blurHash(
                              imageList[index].blurUrl,
                            ),
                            errorBuilder:
                                OctoError.icon(color: DHomeColors.black),
                            fit: BoxFit.fill,
                          )),
                    )
                  : Container(
                      height: 75,
                      width: 75,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: DHomeColors.bgColor,
                        boxShadow: const [
                          BoxShadow(
                            color: Color(0x29000000),
                            blurRadius: 6.0, // soften the shadow
                            spreadRadius: 0.0, //extend the shadow
                          )
                        ],
                      ),
                      child: DottedBorder(
                          borderType: BorderType.RRect,
                          radius: const Radius.circular(10),
                          dashPattern: const [10, 10],
                          color: Colors.black,
                          strokeWidth: 1,
                          child: Center(
                              child: Image.asset(
                            DHomeConstant.getPngImagePath("add.photo.png"),
                            height: 30,
                            width: 30,
                          ))));
            }));
  }

  Widget backPostBtn() {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
      TextButton(
        onPressed: widget.onrPress,
        child: const Text(
          DHomeString.Back,
          style: TextStyle(
              fontWeight: FontWeight.w500,
              color: DHomeColors.black,
              fontSize: 16),
        ),
      ),
      ElevatedButton(
        onPressed: () {
          propertyUpdate();
        },
        child: const Text(
          DHomeString.PostProperty,
          style: TextStyle(
              fontWeight: FontWeight.w600,
              color: DHomeColors.white,
              fontSize: 16),
        ),
        style: ElevatedButton.styleFrom(
          elevation: 0,
          shape: const StadiumBorder(),
          minimumSize: const Size(186, 48),
          primary: DHomeColors.black,
        ),
      ),
    ]);
  }

  propertyUpdate() {
    scaleController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        checkController.forward();
      }
    });
    scaleController.forward();
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
                  decoration: const BoxDecoration(
                      // gradient: UiUtils.buildLinerGradient([Theme.of(context).scaffoldBackgroundColor, Theme.of(context).canvasColor], Alignment.topCenter, Alignment.bottomCenter),
                      color: DHomeColors.bgColor,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50),
                        topRight: Radius.circular(50.0),
                      )),
                  constraints: BoxConstraints(
                      maxHeight: MediaQuery.of(context).size.height * (0.5)),
                  child: Form(
                    key: _formKeyDialog,
                    child: Column(
                      children: [
                        const Padding(
                            padding: EdgeInsetsDirectional.only(
                                start: 20, end: 20, top: 40),
                            child: Text(
                              DHomeString.proSuccessful,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 24, fontWeight: FontWeight.w700),
                            )),
                        Container(
                          alignment: Alignment.center,
                          margin: const EdgeInsetsDirectional.only(
                              start: 40, end: 40, top: 60),
                          child: Stack(
                            children: [
                              Center(
                                child: ScaleTransition(
                                  scale: scaleAnimation,
                                  child: Container(
                                    height: circleSize,
                                    width: circleSize,
                                    decoration: const BoxDecoration(
                                      color: Colors.black,
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                ),
                              ),
                              SizeTransition(
                                sizeFactor: checkAnimation,
                                axis: Axis.horizontal,
                                axisAlignment: -1,
                                child: Center(
                                    child: Container(
                                        padding: const EdgeInsets.only(top: 15),
                                        child: Icon(Icons.check,
                                            color: Colors.white,
                                            size: iconSize))),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pushAndRemoveUntil(
                                MaterialPageRoute(
                                  builder: (context) => BottomPage(
                                      from: 1,
                                      to: 1,
                                      body: BottomPage.defaultPages[1]),
                                ),
                                (Route<dynamic> route) => false);
                          },
                          child: const Text(
                            DHomeString.Continue,
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
                        )
                      ],
                    ),
                  ),
                ))));
  }
}
