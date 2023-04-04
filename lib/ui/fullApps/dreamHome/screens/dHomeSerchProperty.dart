import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../helper/DHomeColors.dart';
import '../helper/DHomeString.dart';
import '../helper/DHomeconstant.dart';

import 'dHomeAllProperty.dart';

class DHomeSearchProperty extends StatefulWidget {
  const DHomeSearchProperty({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return DHomeSearchPropertyState();
  }
}

class DHomeSearchPropertyState extends State<DHomeSearchProperty> {
  RangeValues _currentRangeValues = const RangeValues(2000, 7000);
  bool a = true,
      b = false,
      c = false,
      d = false,
      e = false,
      furnished = false,
      b1 = true,
      b2 = false,
      b3 = false,
      b4 = false,
      b5 = false,
      unfurnished = true,
      gym = true,
      sp = false,
      balcony = false;
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
    return Scaffold(
        body: Stack(children: [
      AppBar(
        toolbarHeight: 133,
        backgroundColor: DHomeColors.bgColor,
        centerTitle: true,
        leadingWidth: 80,
        title: const Text(
          DHomeString.SearchProperty,
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
      listData()
    ]));
  }

  Widget listData() {
    return Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * .2),
        padding: EdgeInsets.only(
            left: MediaQuery.of(context).size.width * .03,
            right: MediaQuery.of(context).size.width * .05),
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(50),
              topRight: Radius.circular(50),
            )),
        child: DefaultTabController(
            length: 3,
            child: Column(children: [
              Container(
                margin: const EdgeInsets.only(left: 10, right: 10, top: 30),
                decoration: const BoxDecoration(
                  color: DHomeColors.bgColor,
                  boxShadow: [
                    BoxShadow(
                      color: Color(0x14212121),
                      blurRadius: 15.0,
                    ),
                  ],
                ),
                child: TabBar(
                  onTap: (int i) {},
                  indicatorSize: TabBarIndicatorSize.tab,
                  padding: const EdgeInsets.all(5),
                  labelColor: Colors.white,
                  indicatorColor: Colors.white,
                  unselectedLabelColor: Colors.black,
                  labelStyle: const TextStyle(
                      fontSize: 12, fontWeight: FontWeight.w600),
                  indicator: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.black),
                  tabs: const [
                    Tab(text: "Rent"),
                    Tab(text: "Buy"),
                    Tab(text: "Sell"),
                  ],
                ),
              ),
              Expanded(
                child: TabBarView(
                  children: [rent(), rent(), rent()],
                ),
              )
            ])));
  }

  Widget rent() {
    return Container(
        height: MediaQuery.of(context).size.height,
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            children: [
              line(),
              city(),
              line(),
              propertyType(),
              listDataProperty(),
              line(),
              priceRange(),
              rangeSlider(),
              line(),
              bedRooms(),
              bedRoomList(),
              line(),
              bathRooms(),
              bathRoomList(),
              line(),
              furnishing(),
              furnishingList(),
              line(),
              amenities(),
              amenitiesList(),
              line(),
              const SizedBox(
                height: 20,
              ),
              clearNGoBtn(),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ));
  }

  Widget line() {
    return Container(
      padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
      child: const Divider(
        height: 1,
        color: Color(0xffacacac),
      ),
    );
  }

  Widget city() {
    return ListTile(
      title: const Text(
        "City",
        style: TextStyle(fontSize: 14),
      ),
      subtitle: const Text(
        "Mumbai",
        style: TextStyle(fontSize: 10, color: Color(0xff565656)),
      ),
      trailing: IconButton(
          onPressed: () {},
          padding: const EdgeInsets.only(left: 40),
          icon: const Icon(
            Icons.arrow_forward_ios,
            size: 15,
            color: Colors.black,
          )),
    );
  }

  Widget propertyType() {
    return Container(
        alignment: Alignment.topLeft,
        padding: const EdgeInsets.only(left: 10),
        child: const Text(
          DHomeString.PropertyType,
          style: TextStyle(fontSize: 14),
        ));
  }

  Widget listDataProperty() {
    return Container(
      height: MediaQuery.of(context).size.height * .08,
      padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * .02),
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
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
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

  Widget priceRange() {
    return Container(
        alignment: Alignment.topLeft,
        padding: const EdgeInsets.only(left: 10),
        child: const Text(
          DHomeString.PriceRange,
          style: TextStyle(fontSize: 14),
        ));
  }

  Widget rangeSlider() {
    return RangeSlider(
      values: _currentRangeValues,
      activeColor: DHomeColors.black,
      inactiveColor: DHomeColors.bgColor,
      min: 2000,
      max: 7000,
      divisions: 5,
      labels: RangeLabels(
        "\$${_currentRangeValues.start.round()}",
        "\$${_currentRangeValues.end.round()}",
      ),
      onChanged: (RangeValues values) {
        setState(() {
          _currentRangeValues = values;
        });
      },
    );
  }

  Widget bedRooms() {
    return Container(
        alignment: Alignment.topLeft,
        padding: const EdgeInsets.only(left: 10, top: 10, bottom: 10),
        child: const Text(
          DHomeString.Bedrooms,
          style: TextStyle(fontSize: 14),
        ));
  }

  Widget bedRoomList() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              a = true;
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
    );
  }

  Widget bathRooms() {
    return Container(
        alignment: Alignment.topLeft,
        padding: const EdgeInsets.only(left: 10, top: 10, bottom: 10),
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

  Widget furnishing() {
    return Container(
        alignment: Alignment.topLeft,
        padding: const EdgeInsets.only(left: 10, top: 10, bottom: 10),
        child: const Text(
          DHomeString.Furnishing,
          style: TextStyle(fontSize: 14),
        ));
  }

  Widget furnishingList() {
    return Row(children: [
      Container(
        padding: const EdgeInsets.only(left: 10),
        child: ElevatedButton(
          onPressed: () {
            setState(() {
              furnished = true;
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
        padding: const EdgeInsets.only(left: 10, top: 10, bottom: 10),
        child: const Text(
          DHomeString.Amenities,
          style: TextStyle(fontSize: 14),
        ));
  }

  Widget amenitiesList() {
    return Row(children: [
      Container(
        padding: const EdgeInsets.only(left: 10),
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
              sp = true;
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
    ]);
  }

  Widget clearNGoBtn() {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
      TextButton(
        onPressed: () {
          setState(() {});
        },
        child: const Text(
          DHomeString.Clear,
          style: TextStyle(
              fontWeight: FontWeight.w600,
              color: DHomeColors.black,
              fontSize: 16),
        ),
      ),
      ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const DHomeAllProperty(),
            ),
          );
        },
        child: const Text(
          DHomeString.LetSearch,
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

  Widget buy() {
    return Container(
      height: MediaQuery.of(context).size.height,
      color: Colors.blueGrey,
    );
  }

  Widget sell() {
    return Container(
      height: MediaQuery.of(context).size.height,
      color: Colors.yellow,
    );
  }
}

class ListDataView {
  late final String imageUrl;
  late final String title;
  ListDataView({
    required this.imageUrl,
    required this.title,
  });
}
