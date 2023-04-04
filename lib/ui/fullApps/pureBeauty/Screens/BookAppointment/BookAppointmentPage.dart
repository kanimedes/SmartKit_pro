import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:octo_image/octo_image.dart';
import 'package:smartkit_pro/ui/fullApps/pureBeauty/helper/CustomDropdown.dart';
import 'package:smartkit_pro/ui/fullApps/pureBeauty/helper/DataConfig.dart';
import 'package:smartkit_pro/ui/fullApps/pureBeauty/helper/DesignConfig.dart';
import 'package:smartkit_pro/ui/fullApps/pureBeauty/styles/colors.dart';

import 'AppointmentPaymentPage.dart';

class BookAppointmentPage extends StatefulWidget {
  const BookAppointmentPage({Key? key}) : super(key: key);

  @override
  _BookAppointmentPageState createState() => _BookAppointmentPageState();
}

class _BookAppointmentPageState extends State<BookAppointmentPage> {
  String gender = "Male";
  int currentpage = 0;
  String hairstyleval = 'One',
      savingval = 'One',
      styleval = 'One',
      facialval = 'One',
      haircolorval = 'One',
      trimmingval = 'One',
      haircutval = 'One';
  String spaval = 'One', makupval = 'One', bridalval = 'One', nailval = 'One';
  List<String> items = ['One', 'Two', 'Three', 'Four'];
  TextEditingController edtdate = TextEditingController();
  int selectedspecialist = 0;
  int selectedslot = 0;

  String? headerimg, headerimgurl, headerhash;
  ScrollController? _controller;

  Future<bool> _backPress() {
    if (currentpage == 1) {
      setState(() {
        currentpage = 0;
      });
      _controller!.animateTo(0,
          curve: Curves.linear, duration: Duration(milliseconds: 500));
      return Future.value(false);
    } else {
      return Future.value(true);
    }
  }

  @override
  void initState() {
    super.initState();
    _controller = ScrollController();
    headerimgurl =
        "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/salonapp%2Fshop_17.jpg?alt=media&token=32f7e94f-cda5-4725-ab7b-8575f169944c";
    headerhash = "L48przE20gEN~B={9t9w0gxZ=_Sh";
    headerimg = "assets/images/fullApps/pureBeauty/shop_17.jpg";
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _backPress,
      child: Scaffold(
          backgroundColor: salondropdownbgcolor,
          body: Stack(children: [
            OctoImage(
              image: CachedNetworkImageProvider(headerimgurl!),
              placeholderBuilder: OctoPlaceholder.blurHash(headerhash!),
              errorBuilder: OctoError.icon(color: Colors.black),
              height: kToolbarHeight * 6.5,
              fit: BoxFit.cover,
              width: double.maxFinite,
            ),
            AppBar(
              systemOverlayStyle: SystemUiOverlayStyle.light,
              backgroundColor: Colors.transparent,
              title: Text(
                "Book Appointment",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),

            Container(
              margin: EdgeInsets.only(top: kToolbarHeight * 1.5),
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(30.0),
                    topLeft: Radius.circular(30.0)),
              ),
              child: SingleChildScrollView(
                controller: _controller,
                padding: EdgeInsets.only(top: kToolbarHeight * 4.5),
                child: Container(
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                      color: salonbgcolor,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(30.0),
                          topLeft: Radius.circular(30.0)),
                    ),
                    child: currentpage == 0
                        ? firstPageWidget()
                        : secondPageWidget()),
              ),
            ),
            //),
          ])),
    );
  }

  Widget firstPageWidget() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 25),
        child: Text(
          "Gender",
          style: Theme.of(context).textTheme.headline6!.merge(TextStyle(
              color: salonappcolor,
              fontWeight: FontWeight.bold,
              letterSpacing: 0.5)),
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        child: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
          GestureDetector(
            onTap: () {
              setState(() {
                gender = "Male";

                headerimgurl =
                    "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/salonapp%2Fshop_17.jpg?alt=media&token=32f7e94f-cda5-4725-ab7b-8575f169944c";
                headerhash = "L48przE20gEN~B={9t9w0gxZ=_Sh";
                headerimg = "assets/images/fullApps/pureBeauty/shop_17.jpg";
              });
            },
            child:
                Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
              AnimatedContainer(
                duration: DesignConfig.animationtime,
                padding: EdgeInsets.only(right: 10, bottom: 10),
                decoration: DesignConfig.innersliderCircleDecoration(),
                child: Icon(
                  Icons.brightness_1,
                  size: 18,
                  color: gender == "Male" ? salonappcolor : Colors.white,
                ),
              ),
              SizedBox(width: 10),
              Text(
                "Male",
                style: Theme.of(context).textTheme.subtitle1!.merge(TextStyle(
                    color: salonlightfont,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.5)),
              ),
            ]),
          ),
          SizedBox(width: 50),
          GestureDetector(
            onTap: () {
              setState(() {
                gender = "Female";
                headerimgurl =
                    "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/salonapp%2Fshop_7.jpg?alt=media&token=7f442505-fe80-48cd-90f3-b10c11c5f684";
                headerhash = "L6By,8.7Dj=|.R~B4U-;Fg9F-T58";
                headerimg = "assets/images/fullApps/pureBeauty/shop_7.jpg";
              });
            },
            child:
                Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
              AnimatedContainer(
                duration: DesignConfig.animationtime,
                decoration: DesignConfig.innersliderCircleDecoration(),
                padding: EdgeInsets.only(right: 10, bottom: 10),
                child: Icon(
                  Icons.brightness_1,
                  size: 18,
                  color: gender == "Female" ? salonappcolor : Colors.white,
                ),
              ),
              SizedBox(width: 10),
              Text(
                "Female",
                style: Theme.of(context).textTheme.subtitle1!.merge(TextStyle(
                    color: salonlightfont,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.5)),
              ),
            ]),
          ),
        ]),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Row(
          children: [
            Expanded(
              child: Text(
                "Choose your Service",
                style: Theme.of(context).textTheme.headline6!.merge(TextStyle(
                    color: salonappcolor,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.5)),
              ),
            ),
            RichText(
              textAlign: TextAlign.start,
              text: TextSpan(
                style: Theme.of(context).textTheme.subtitle2!.merge(TextStyle(
                    color: salonappcolor, fontWeight: FontWeight.bold)),
                text: "Total:",
                children: const <TextSpan>[
                  TextSpan(
                      text: "\t\$50.00",
                      style: TextStyle(
                          color: Colors.red, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
          ],
        ),
      ),
      gender == "Male"
          ? maleServiceOptionsWidget()
          : femaleServiceOptionsWidget(),
      GestureDetector(
        onTap: () {
          setState(() {
            currentpage = 1;
          });

          _controller!.animateTo(0,
              curve: Curves.linear, duration: Duration(milliseconds: 500));
        },
        child: Container(
          decoration: DesignConfig.outerDecorationService(30, salonappcolor),
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(vertical: 20),
          margin: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          child: Text(
            "Book Now",
            style: Theme.of(context)
                .textTheme
                .headline6!
                .merge(TextStyle(color: Colors.white, letterSpacing: 0.5)),
          ),
        ),
      ),
    ]);
  }

  Widget maleServiceOptionsWidget() {
    return Column(children: [
      Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 25),
        child: Row(children: [
          Expanded(
            flex: 1,
            child: Text(
              "Hair Style",
              style: Theme.of(context).textTheme.subtitle1!.merge(TextStyle(
                  color: salonmainlight,
                  letterSpacing: 0.3,
                  fontWeight: FontWeight.bold)),
            ),
          ),
          Expanded(
            flex: 2,
            child: CustomDropdown<String>(
              child: Text("Hair Style",
                  style: TextStyle(
                      color: salonlightfont, fontWeight: FontWeight.bold)),
              onChange: (String newValue, int index) {
                setState(() {
                  hairstyleval = newValue;
                });
              },
              selectedvalue: hairstyleval,
              dropdownButtonStyle: DropdownButtonStyle(
                shape: RoundedRectangleBorder(
                    //side: new BorderSide(color: Colors.transparent, width: 1.0),
                    borderRadius: BorderRadius.circular(10)),
                elevation: 0,
                backgroundColor: salonbgcolor,
                primaryColor: salonlightfont,
              ),
              dropdownStyle: DropdownStyle(
                borderRadius: BorderRadius.circular(10),
                color: salonbgcolor,
                elevation: 0,
              ),
              items: items
                  .map(
                    (item) => DropdownItem<String>(
                      value: item,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 8),
                        child: Text(
                          item,
                          style: TextStyle(
                              color: salonlightfont,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
        ]),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 12),
        child: Row(children: [
          Expanded(
            flex: 1,
            child: Text(
              "Saving",
              style: Theme.of(context).textTheme.subtitle1!.merge(TextStyle(
                  color: salonmainlight,
                  letterSpacing: 0.3,
                  fontWeight: FontWeight.bold)),
            ),
          ),
          Expanded(
            flex: 2,
            child: CustomDropdown<String>(
              child: Text("Saving",
                  style: TextStyle(
                      color: salonlightfont, fontWeight: FontWeight.bold)),
              onChange: (String newValue, int index) {
                setState(() {
                  savingval = newValue;
                });
              },
              selectedvalue: savingval,
              dropdownButtonStyle: DropdownButtonStyle(
                shape: RoundedRectangleBorder(
                    //side: new BorderSide(color: Colors.transparent, width: 1.0),
                    borderRadius: BorderRadius.circular(10)),
                elevation: 0,
                backgroundColor: salonbgcolor,
                primaryColor: salonlightfont,
              ),
              dropdownStyle: DropdownStyle(
                borderRadius: BorderRadius.circular(10),
                color: salonbgcolor,
                elevation: 0,
              ),
              items: items
                  .map(
                    (item) => DropdownItem<String>(
                      value: item,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 8),
                        child: Text(
                          item,
                          style: TextStyle(
                              color: salonlightfont,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
        ]),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 12),
        child: Row(children: [
          Expanded(
            flex: 1,
            child: Text(
              "Styling",
              style: Theme.of(context).textTheme.subtitle1!.merge(TextStyle(
                  color: salonmainlight,
                  letterSpacing: 0.3,
                  fontWeight: FontWeight.bold)),
            ),
          ),
          Expanded(
            flex: 2,
            child: CustomDropdown<String>(
              child: Text("Styling",
                  style: TextStyle(
                      color: salonlightfont, fontWeight: FontWeight.bold)),
              onChange: (String newValue, int index) {
                setState(() {
                  styleval = newValue;
                });
              },
              selectedvalue: styleval,
              dropdownButtonStyle: DropdownButtonStyle(
                shape: RoundedRectangleBorder(
                    //side: new BorderSide(color: Colors.transparent, width: 1.0),
                    borderRadius: BorderRadius.circular(10)),
                elevation: 0,
                backgroundColor: salonbgcolor,
                primaryColor: salonlightfont,
              ),
              dropdownStyle: DropdownStyle(
                borderRadius: BorderRadius.circular(10),
                color: salonbgcolor,
                elevation: 0,
              ),
              items: items
                  .map(
                    (item) => DropdownItem<String>(
                      value: item,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 8),
                        child: Text(
                          item,
                          style: TextStyle(
                              color: salonlightfont,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
        ]),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 12),
        child: Row(children: [
          Expanded(
            flex: 1,
            child: Text(
              "Facial",
              style: Theme.of(context).textTheme.subtitle1!.merge(TextStyle(
                  color: salonmainlight,
                  letterSpacing: 0.3,
                  fontWeight: FontWeight.bold)),
            ),
          ),
          Expanded(
            flex: 2,
            child: CustomDropdown<String>(
              child: Text("Facial",
                  style: TextStyle(
                      color: salonlightfont, fontWeight: FontWeight.bold)),
              onChange: (String newValue, int index) {
                setState(() {
                  facialval = newValue;
                });
              },
              selectedvalue: facialval,
              dropdownButtonStyle: DropdownButtonStyle(
                shape: RoundedRectangleBorder(
                    //side: new BorderSide(color: Colors.transparent, width: 1.0),
                    borderRadius: BorderRadius.circular(10)),
                elevation: 0,
                backgroundColor: salonbgcolor,
                primaryColor: salonlightfont,
              ),
              dropdownStyle: DropdownStyle(
                borderRadius: BorderRadius.circular(10),
                color: salonbgcolor,
                elevation: 0,
              ),
              items: items
                  .map(
                    (item) => DropdownItem<String>(
                      value: item,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 8),
                        child: Text(
                          item,
                          style: TextStyle(
                              color: salonlightfont,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
        ]),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 12),
        child: Row(children: [
          Expanded(
            flex: 1,
            child: Text(
              "Hair Color",
              style: Theme.of(context).textTheme.subtitle1!.merge(TextStyle(
                  color: salonmainlight,
                  letterSpacing: 0.3,
                  fontWeight: FontWeight.bold)),
            ),
          ),
          Expanded(
            flex: 2,
            child: CustomDropdown<String>(
              child: Text("Hair Color",
                  style: TextStyle(
                      color: salonlightfont, fontWeight: FontWeight.bold)),
              onChange: (String newValue, int index) {
                setState(() {
                  haircolorval = newValue;
                });
              },
              selectedvalue: haircolorval,
              dropdownButtonStyle: DropdownButtonStyle(
                shape: RoundedRectangleBorder(
                    //side: new BorderSide(color: Colors.transparent, width: 1.0),
                    borderRadius: BorderRadius.circular(10)),
                elevation: 0,
                backgroundColor: salonbgcolor,
                primaryColor: salonlightfont,
              ),
              dropdownStyle: DropdownStyle(
                borderRadius: BorderRadius.circular(10),
                color: salonbgcolor,
                elevation: 0,
              ),
              items: items
                  .map(
                    (item) => DropdownItem<String>(
                      value: item,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 8),
                        child: Text(
                          item,
                          style: TextStyle(
                              color: salonlightfont,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
        ]),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 12),
        child: Row(children: [
          Expanded(
            flex: 1,
            child: Text(
              "Trimming",
              style: Theme.of(context).textTheme.subtitle1!.merge(TextStyle(
                  color: salonmainlight,
                  letterSpacing: 0.3,
                  fontWeight: FontWeight.bold)),
            ),
          ),
          Expanded(
            flex: 2,
            child: CustomDropdown<String>(
              child: Text("Trimming",
                  style: TextStyle(
                      color: salonlightfont, fontWeight: FontWeight.bold)),
              onChange: (String newValue, int index) {
                setState(() {
                  trimmingval = newValue;
                });
              },
              selectedvalue: trimmingval,
              dropdownButtonStyle: DropdownButtonStyle(
                shape: RoundedRectangleBorder(
                    //side: new BorderSide(color: Colors.transparent, width: 1.0),
                    borderRadius: BorderRadius.circular(10)),
                elevation: 0,
                backgroundColor: salonbgcolor,
                primaryColor: salonlightfont,
              ),
              dropdownStyle: DropdownStyle(
                borderRadius: BorderRadius.circular(10),
                color: salonbgcolor,
                elevation: 0,
              ),
              items: items
                  .map(
                    (item) => DropdownItem<String>(
                      value: item,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 8),
                        child: Text(
                          item,
                          style: TextStyle(
                              color: salonlightfont,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
        ]),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 12),
        child: Row(children: [
          Expanded(
            flex: 1,
            child: Text(
              "Hair cut",
              style: Theme.of(context).textTheme.subtitle1!.merge(TextStyle(
                  color: salonmainlight,
                  letterSpacing: 0.3,
                  fontWeight: FontWeight.bold)),
            ),
          ),
          Expanded(
            flex: 2,
            child: CustomDropdown<String>(
              child: Text("Hair cut",
                  style: TextStyle(
                      color: salonlightfont, fontWeight: FontWeight.bold)),
              onChange: (String newValue, int index) {
                setState(() {
                  haircutval = newValue;
                });
              },
              selectedvalue: haircutval,
              dropdownButtonStyle: DropdownButtonStyle(
                shape: RoundedRectangleBorder(
                    //side: new BorderSide(color: Colors.transparent, width: 1.0),
                    borderRadius: BorderRadius.circular(10)),
                elevation: 0,
                backgroundColor: salonbgcolor,
                primaryColor: salonlightfont,
              ),
              dropdownStyle: DropdownStyle(
                borderRadius: BorderRadius.circular(10),
                color: salonbgcolor,
                elevation: 0,
              ),
              items: items
                  .map(
                    (item) => DropdownItem<String>(
                      value: item,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 8),
                        child: Text(
                          item,
                          style: TextStyle(
                              color: salonlightfont,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
        ]),
      ),
    ]);
  }

  Widget femaleServiceOptionsWidget() {
    return Column(children: [
      Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 25),
        child: Row(children: [
          Expanded(
            flex: 1,
            child: Text(
              "Hair cut",
              style: Theme.of(context).textTheme.subtitle1!.merge(TextStyle(
                  color: salonmainlight,
                  letterSpacing: 0.3,
                  fontWeight: FontWeight.bold)),
            ),
          ),
          Expanded(
            flex: 2,
            child: CustomDropdown<String>(
              child: Text("Hair cut",
                  style: TextStyle(
                      color: salonlightfont, fontWeight: FontWeight.bold)),
              onChange: (String newValue, int index) {
                setState(() {
                  haircutval = newValue;
                });
              },
              selectedvalue: haircutval,
              dropdownButtonStyle: DropdownButtonStyle(
                shape: RoundedRectangleBorder(
                    //side: new BorderSide(color: Colors.transparent, width: 1.0),
                    borderRadius: BorderRadius.circular(10)),
                elevation: 0,
                backgroundColor: salonbgcolor,
                primaryColor: salonlightfont,
              ),
              dropdownStyle: DropdownStyle(
                borderRadius: BorderRadius.circular(10),
                color: salonbgcolor,
                elevation: 0,
              ),
              items: items
                  .map(
                    (item) => DropdownItem<String>(
                      value: item,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 8),
                        child: Text(
                          item,
                          style: TextStyle(
                              color: salonlightfont,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
        ]),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 12),
        child: Row(children: [
          Expanded(
            flex: 1,
            child: Text(
              "Spa",
              style: Theme.of(context).textTheme.subtitle1!.merge(TextStyle(
                  color: salonmainlight,
                  letterSpacing: 0.3,
                  fontWeight: FontWeight.bold)),
            ),
          ),
          Expanded(
            flex: 2,
            child: CustomDropdown<String>(
              child: Text("Spa",
                  style: TextStyle(
                      color: salonlightfont, fontWeight: FontWeight.bold)),
              onChange: (String newValue, int index) {
                setState(() {
                  spaval = newValue;
                });
              },
              selectedvalue: spaval,
              dropdownButtonStyle: DropdownButtonStyle(
                shape: RoundedRectangleBorder(
                    //side: new BorderSide(color: Colors.transparent, width: 1.0),
                    borderRadius: BorderRadius.circular(10)),
                elevation: 0,
                backgroundColor: salonbgcolor,
                primaryColor: salonlightfont,
              ),
              dropdownStyle: DropdownStyle(
                borderRadius: BorderRadius.circular(10),
                color: salonbgcolor,
                elevation: 0,
              ),
              items: items
                  .map(
                    (item) => DropdownItem<String>(
                      value: item,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 8),
                        child: Text(
                          item,
                          style: TextStyle(
                              color: salonlightfont,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
        ]),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 12),
        child: Row(children: [
          Expanded(
            flex: 1,
            child: Text(
              "Makup",
              style: Theme.of(context).textTheme.subtitle1!.merge(TextStyle(
                  color: salonmainlight,
                  letterSpacing: 0.3,
                  fontWeight: FontWeight.bold)),
            ),
          ),
          Expanded(
            flex: 2,
            child: CustomDropdown<String>(
              child: Text("Makup",
                  style: TextStyle(
                      color: salonlightfont, fontWeight: FontWeight.bold)),
              onChange: (String newValue, int index) {
                setState(() {
                  makupval = newValue;
                });
              },
              selectedvalue: makupval,
              dropdownButtonStyle: DropdownButtonStyle(
                shape: RoundedRectangleBorder(
                    //side: new BorderSide(color: Colors.transparent, width: 1.0),
                    borderRadius: BorderRadius.circular(10)),
                elevation: 0,
                backgroundColor: salonbgcolor,
                primaryColor: salonlightfont,
              ),
              dropdownStyle: DropdownStyle(
                borderRadius: BorderRadius.circular(10),
                color: salonbgcolor,
                elevation: 0,
              ),
              items: items
                  .map(
                    (item) => DropdownItem<String>(
                      value: item,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 8),
                        child: Text(
                          item,
                          style: TextStyle(
                              color: salonlightfont,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
        ]),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 12),
        child: Row(children: [
          Expanded(
            flex: 1,
            child: Text(
              "Facial",
              style: Theme.of(context).textTheme.subtitle1!.merge(TextStyle(
                  color: salonmainlight,
                  letterSpacing: 0.3,
                  fontWeight: FontWeight.bold)),
            ),
          ),
          Expanded(
            flex: 2,
            child: CustomDropdown<String>(
              child: Text("Facial",
                  style: TextStyle(
                      color: salonlightfont, fontWeight: FontWeight.bold)),
              onChange: (String newValue, int index) {
                setState(() {
                  facialval = newValue;
                });
              },
              selectedvalue: facialval,
              dropdownButtonStyle: DropdownButtonStyle(
                shape: RoundedRectangleBorder(
                    //side: new BorderSide(color: Colors.transparent, width: 1.0),
                    borderRadius: BorderRadius.circular(10)),
                elevation: 0,
                backgroundColor: salonbgcolor,
                primaryColor: salonlightfont,
              ),
              dropdownStyle: DropdownStyle(
                borderRadius: BorderRadius.circular(10),
                color: salonbgcolor,
                elevation: 0,
              ),
              items: items
                  .map(
                    (item) => DropdownItem<String>(
                      value: item,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 8),
                        child: Text(
                          item,
                          style: TextStyle(
                              color: salonlightfont,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
        ]),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 12),
        child: Row(children: [
          Expanded(
            flex: 1,
            child: Text(
              "Hair Color",
              style: Theme.of(context).textTheme.subtitle1!.merge(TextStyle(
                  color: salonmainlight,
                  letterSpacing: 0.3,
                  fontWeight: FontWeight.bold)),
            ),
          ),
          Expanded(
            flex: 2,
            child: CustomDropdown<String>(
              child: Text("Hair Color",
                  style: TextStyle(
                      color: salonlightfont, fontWeight: FontWeight.bold)),
              onChange: (String newValue, int index) {
                setState(() {
                  haircolorval = newValue;
                });
              },
              selectedvalue: haircolorval,
              dropdownButtonStyle: DropdownButtonStyle(
                shape: RoundedRectangleBorder(
                    //side: new BorderSide(color: Colors.transparent, width: 1.0),
                    borderRadius: BorderRadius.circular(10)),
                elevation: 0,
                backgroundColor: salonbgcolor,
                primaryColor: salonlightfont,
              ),
              dropdownStyle: DropdownStyle(
                borderRadius: BorderRadius.circular(10),
                color: salonbgcolor,
                elevation: 0,
              ),
              items: items
                  .map(
                    (item) => DropdownItem<String>(
                      value: item,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 8),
                        child: Text(
                          item,
                          style: TextStyle(
                              color: salonlightfont,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
        ]),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 12),
        child: Row(children: [
          Expanded(
            flex: 1,
            child: Text(
              "Bridal",
              style: Theme.of(context).textTheme.subtitle1!.merge(TextStyle(
                  color: salonmainlight,
                  letterSpacing: 0.3,
                  fontWeight: FontWeight.bold)),
            ),
          ),
          Expanded(
            flex: 2,
            child: CustomDropdown<String>(
              child: Text("Bridal",
                  style: TextStyle(
                      color: salonlightfont, fontWeight: FontWeight.bold)),
              onChange: (String newValue, int index) {
                setState(() {
                  bridalval = newValue;
                });
              },
              selectedvalue: bridalval,
              dropdownButtonStyle: DropdownButtonStyle(
                shape: RoundedRectangleBorder(
                    //side: new BorderSide(color: Colors.transparent, width: 1.0),
                    borderRadius: BorderRadius.circular(10)),
                elevation: 0,
                backgroundColor: salonbgcolor,
                primaryColor: salonlightfont,
              ),
              dropdownStyle: DropdownStyle(
                borderRadius: BorderRadius.circular(10),
                color: salonbgcolor,
                elevation: 0,
              ),
              items: items
                  .map(
                    (item) => DropdownItem<String>(
                      value: item,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 8),
                        child: Text(
                          item,
                          style: TextStyle(
                              color: salonlightfont,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
        ]),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 12),
        child: Row(children: [
          Expanded(
            flex: 1,
            child: Text(
              "Nail",
              style: Theme.of(context).textTheme.subtitle1!.merge(TextStyle(
                  color: salonmainlight,
                  letterSpacing: 0.3,
                  fontWeight: FontWeight.bold)),
            ),
          ),
          Expanded(
            flex: 2,
            child: CustomDropdown<String>(
              child: Text("Nail",
                  style: TextStyle(
                      color: salonlightfont, fontWeight: FontWeight.bold)),
              onChange: (String newValue, int index) {
                setState(() {
                  nailval = newValue;
                });
              },
              selectedvalue: nailval,
              dropdownButtonStyle: DropdownButtonStyle(
                shape: RoundedRectangleBorder(
                    //side: new BorderSide(color: Colors.transparent, width: 1.0),
                    borderRadius: BorderRadius.circular(10)),
                elevation: 0,
                backgroundColor: salonbgcolor,
                primaryColor: salonlightfont,
              ),
              dropdownStyle: DropdownStyle(
                borderRadius: BorderRadius.circular(10),
                color: salonbgcolor,
                elevation: 0,
              ),
              items: items
                  .map(
                    (item) => DropdownItem<String>(
                      value: item,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 8),
                        child: Text(
                          item,
                          style: TextStyle(
                              color: salonlightfont,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
        ]),
      ),
    ]);
  }

  Widget secondPageWidget() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 25),
        child: Text(
          "Select your date",
          style: Theme.of(context).textTheme.headline6!.merge(TextStyle(
              color: salonappcolor,
              fontWeight: FontWeight.bold,
              letterSpacing: 0.5)),
        ),
      ),
      bookdateWidget(),
      Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 25),
        child: Text(
          "Select Specialist",
          style: Theme.of(context).textTheme.headline6!.merge(TextStyle(
              color: salonappcolor,
              fontWeight: FontWeight.bold,
              letterSpacing: 0.5)),
        ),
      ),
      specialistImgWidget(),
      Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 25),
        child: Text(
          "Avilable Slot",
          style: Theme.of(context).textTheme.headline6!.merge(TextStyle(
              color: salonappcolor,
              fontWeight: FontWeight.bold,
              letterSpacing: 0.5)),
        ),
      ),
      availableslotWidget(),
      GestureDetector(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => AppointmentPaymentPage(
                    imgurl: headerimgurl,
                    img: headerimg,
                    hash: headerhash,
                  )));
        },
        child: Container(
          decoration: DesignConfig.outerDecorationService(30, salonappcolor),
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(vertical: 20),
          margin: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          child: Text(
            "Continue",
            style: Theme.of(context)
                .textTheme
                .headline6!
                .merge(TextStyle(color: Colors.white, letterSpacing: 0.5)),
          ),
        ),
      ),
    ]);
  }

  Widget availableslotWidget() {
    return Container(
      color: salonbgcolor,
      child: GridView.builder(
        padding: EdgeInsets.only(left: 12, top: 10, bottom: 10),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          childAspectRatio: 1.8,
          mainAxisSpacing: 10,
        ),
        physics: BouncingScrollPhysics(),
        shrinkWrap: true,
        itemCount: DataConfig.slottimelist.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedslot = index;
              });
            },
            child: AnimatedContainer(
              duration: DesignConfig.animationtime,
              decoration: index == selectedslot
                  ? DesignConfig.outerDecorationService(10, salonappcolor)
                  : DesignConfig.outerDecoration(10),
              alignment: Alignment.center,
              margin: EdgeInsets.only(right: 12),
              child: Text(
                DataConfig.slottimelist[index],
                style: TextStyle(
                    color:
                        index == selectedslot ? Colors.white : salonlightfont),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget specialistImgWidget() {
    return Container(
      height: 120,
      margin: EdgeInsets.only(bottom: 20, top: 10),
      color: salonbgcolor,
      child: ListView(
          scrollDirection: Axis.horizontal,
          children: List.generate(DataConfig.specialistimglist.length, (index) {
            return GestureDetector(
              onTap: () {
                selectedspecialist = index;
                setState(() {});
              },
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AnimatedContainer(
                      duration: DesignConfig.animationtime,
                      width: 73,
                      padding: EdgeInsets.all(4),
                      margin: EdgeInsets.only(
                          bottom: 6.0,
                          left: index == 0 ? 20 : 0,
                          right:
                              index == DataConfig.specialistimglist.length - 1
                                  ? 20
                                  : 20),
                      decoration: selectedspecialist == index
                          ? DesignConfig.outercolorCircularDecoration(
                              salonappcolor)
                          : DesignConfig.outerCircularDecoration(),
                      child: CircleAvatar(
                        radius: 40,
                        child: ClipOval(
                          child: OctoImage(
                            image: CachedNetworkImageProvider(
                                DataConfig.specialistimglist[index]['imgurl']),
                            placeholderBuilder: OctoPlaceholder.blurHash(
                              DataConfig.specialistimglist[index]['hash'],
                            ),
                            errorBuilder: OctoError.icon(color: Colors.black),
                            fit: BoxFit.cover,
                          ),
                        ),
                      )),
                  Padding(
                    padding: EdgeInsets.only(right: index == 0 ? 0 : 8),
                    child: Text(
                      DataConfig.specialistimglist[index]['name'],
                      // textAlign: TextAlign.center,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          color: salonmainlight, fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
            );
          })),
    );
  }

  _selectDate(BuildContext context, TextEditingController _dateTimeController,
      DateTime initialDateTime) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: initialDateTime,
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
      builder: (context, child) {
        return Theme(
          data: ThemeData.light().copyWith(
            colorScheme: ColorScheme.light().copyWith(
              primary: salonappcolor,
            ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null) {
      //print("==${picked.month}");
      setState(() {
        String dayStr = "";
        if (picked.day < 10) {
          dayStr = "0" + picked.day.toString();
        } else {
          dayStr = picked.day.toString();
        }

        String dateStr = dayStr +
            " " +
            DataConfig.months[picked.month - 1] +
            ", " +
            picked.year.toString();

        _dateTimeController.text = dateStr;
      });
    }
  }

  Widget bookdateWidget() {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(left: 20, top: 25, right: 20),
          decoration: DesignConfig.innerDecoration(30),
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.only(
            bottom: 10,
            left: 10,
            right: 10,
          ),
          child: TextFormField(
            enableInteractiveSelection: false,
            focusNode: AlwaysDisabledFocusNode(),
            style: TextStyle(color: salonlightfont, letterSpacing: 0.5),
            cursorColor: salonappcolor,
            decoration: InputDecoration(
              isDense: true,
              hintText: "Select Appointment Date",
              hintStyle: Theme.of(context)
                  .textTheme
                  .subtitle2!
                  .merge(TextStyle(color: salonlightfont, letterSpacing: 0.5)),
              border: InputBorder.none,
            ),
            keyboardType: TextInputType.text,
            controller: edtdate,
            onTap: () {
              _selectDate(context, edtdate, DateTime.now());
            },
          ),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: IntrinsicWidth(
            child: GestureDetector(
              onTap: () {
                _selectDate(context, edtdate, DateTime.now());
              },
              child: Container(
                margin: EdgeInsets.only(top: 16, right: 20),
                decoration: DesignConfig.outerDecoration(10),
                alignment: Alignment.center,
                padding:
                    EdgeInsets.only(bottom: 10, top: 10, left: 13, right: 13),
                child: SvgPicture.asset(
                    "assets/images/fullApps/pureBeauty/svgimg/btm_scalendar.svg"),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class AlwaysDisabledFocusNode extends FocusNode {
  @override
  bool get hasFocus => false;
}
