import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:octo_image/octo_image.dart';
import 'package:smartkit_pro/ui/fullApps/pureBeauty/helper/DesignConfig.dart';
import 'package:smartkit_pro/ui/fullApps/pureBeauty/styles/colors.dart';

class AppointmentPaymentPage extends StatefulWidget {
  String? img;
  String? imgurl;
  String? hash;

  AppointmentPaymentPage({Key? key, this.img, this.imgurl, this.hash})
      : super(key: key);

  @override
  _AppointmentPaymentPageState createState() => _AppointmentPaymentPageState();
}

class _AppointmentPaymentPageState extends State<AppointmentPaymentPage> {
  int paytype = 0;

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.light,
      ),
      child: Scaffold(
        backgroundColor: salonbgcolor,
        appBar: DesignConfig.setAppbar("Book Appointment", context, true)
            as PreferredSizeWidget?,
        body: SingleChildScrollView(
          child: Column(children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              decoration: DesignConfig.outerDecorationService(10, salonbgcolor),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                          width: 100,
                          padding: EdgeInsets.only(
                              left: 5, right: 5, top: 5, bottom: 5),
                          decoration: DesignConfig.outerDecoration(10),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: OctoImage(
                              image: CachedNetworkImageProvider(widget.imgurl!),
                              placeholderBuilder:
                                  OctoPlaceholder.blurHash(widget.hash!),
                              errorBuilder: OctoError.icon(color: Colors.black),
                              height: 95,
                              fit: BoxFit.cover,
                              width: 95,
                            ),
                          )),
                      SizedBox(width: 10),
                      Expanded(
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                            Text(
                              "Four Season Fashion",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6!
                                  .merge(TextStyle(
                                      color: salonappcolor,
                                      fontWeight: FontWeight.bold)),
                            ),
                            SizedBox(height: 5),
                            Text(
                              "Spa Salon - Near PalletMall, Woodland Hills",
                              style: Theme.of(context).textTheme.caption!.merge(
                                  TextStyle(
                                      color: salonlightfont,
                                      letterSpacing: 0.5)),
                            ),
                            SizedBox(height: 5),
                            Row(children: [
                              Icon(
                                Icons.location_on_rounded,
                                color: salonlightfont,
                                size: 18,
                              ),
                              SizedBox(width: 3),
                              Expanded(
                                child: Text(
                                  "1.5 km",
                                  style: Theme.of(context)
                                      .textTheme
                                      .caption!
                                      .merge(TextStyle(
                                          color: salonlightfont,
                                          letterSpacing: 0.5)),
                                ),
                              ),
                            ]),
                            SizedBox(height: 5),
                            Row(children: [
                              Text(
                                "Services:",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .merge(TextStyle(
                                        color: salonappcolor,
                                        fontWeight: FontWeight.bold,
                                        letterSpacing: 0.5)),
                              ),
                              SizedBox(width: 3),
                              Expanded(
                                child: Text(
                                  "Hair. Nail. Facial",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1!
                                      .merge(TextStyle(
                                          color: salonmainlight,
                                          fontWeight: FontWeight.w500,
                                          letterSpacing: 0.5)),
                                ),
                              ),
                            ]),
                          ])),
                    ],
                  ),
                  SizedBox(height: 20),
                  RichText(
                    textAlign: TextAlign.start,
                    text: TextSpan(
                      style: Theme.of(context).textTheme.subtitle2!.merge(
                          TextStyle(
                              color: salonappcolor,
                              fontWeight: FontWeight.bold)),
                      text: "\tTotal:",
                      children: const <TextSpan>[
                        TextSpan(
                            text: "\t\$50.00",
                            style: TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        left: 15, top: 25, right: 15, bottom: 15),
                    decoration: DesignConfig.newInnerDecoration(30),
                    //decoration: DesignConfig.innerDecoration(30),
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 12),
                    //padding: EdgeInsets.only(bottom: 15, left: 10, right: 10, top: 10),
                    child: RichText(
                      textAlign: TextAlign.start,
                      text: TextSpan(
                        style: Theme.of(context).textTheme.subtitle2!.merge(
                            TextStyle(
                                color: salonappcolor,
                                fontWeight: FontWeight.bold)),
                        text: "",
                        children: [
                          WidgetSpan(
                            alignment: PlaceholderAlignment.middle,
                            child: SvgPicture.asset(
                              "assets/images/fullApps/pureBeauty/svgimg/btm_calendar.svg",
                              color: salonlightfont,
                            ),
                          ),
                          TextSpan(
                              text: "\t13 July, 2021\t\t\t",
                              style: TextStyle(
                                color: salonlightfont,
                              )),
                          WidgetSpan(
                            alignment: PlaceholderAlignment.middle,
                            child: Icon(
                              Icons.watch_later_outlined,
                              color: salonlightfont,
                            ),
                          ),
                          TextSpan(
                              text: "\t03:30 PM",
                              style: TextStyle(
                                color: salonlightfont,
                              )),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              child: Row(children: [
                Text(
                  "Payment Method",
                  style: Theme.of(context).textTheme.subtitle1!.merge(TextStyle(
                      color: salonappcolor, fontWeight: FontWeight.bold)),
                ),
                Spacer(),
                Text(
                  "+Add New Card",
                  style: Theme.of(context)
                      .textTheme
                      .subtitle1!
                      .merge(TextStyle(color: Colors.red)),
                ),
              ]),
            ),
            Container(
              decoration: DesignConfig.outerDecoration(10),
              margin: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              child: ListTile(
                leading: SvgPicture.asset(
                    "assets/images/fullApps/pureBeauty/svgimg/debitcard.svg"),
                title: Text(
                  "Credit/Debit Card",
                  style: Theme.of(context).textTheme.headline6!.merge(TextStyle(
                      color: salonappcolor, fontWeight: FontWeight.bold)),
                ),
                subtitle: Text("Ending on 09,2021"),
                onTap: () {
                  setState(() {
                    paytype = 0;
                  });
                },
                trailing: AnimatedContainer(
                  duration: DesignConfig.animationtime,
                  padding: EdgeInsets.only(right: 10, bottom: 10),
                  decoration: DesignConfig.innersliderCircleDecoration(),
                  child: Icon(
                    Icons.brightness_1,
                    size: 18,
                    color: paytype == 0 ? salonappcolor : Colors.white,
                  ),
                ),
              ),
            ),
            Container(
              decoration: DesignConfig.outerDecoration(10),
              margin: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              child: ListTile(
                leading: SvgPicture.asset(
                    "assets/images/fullApps/pureBeauty/svgimg/bank.svg"),
                title: Text(
                  "Bank Account",
                  style: Theme.of(context).textTheme.headline6!.merge(TextStyle(
                      color: salonappcolor, fontWeight: FontWeight.bold)),
                ),
                subtitle: Text("SBI Account"),
                onTap: () {
                  setState(() {
                    paytype = 1;
                  });
                },
                trailing: Container(
                  padding: EdgeInsets.only(right: 10, bottom: 10),
                  decoration: DesignConfig.innersliderCircleDecoration(),
                  child: Icon(
                    Icons.brightness_1,
                    size: 18,
                    color: paytype == 1 ? salonappcolor : Colors.white,
                  ),
                ),
              ),
            ),
            Container(
              decoration: DesignConfig.outerDecoration(10),
              margin: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              child: ListTile(
                leading: SvgPicture.asset(
                    "assets/images/fullApps/pureBeauty/svgimg/paypal.svg"),
                title: Text(
                  "Paypal",
                  style: Theme.of(context).textTheme.headline6!.merge(TextStyle(
                      color: salonappcolor, fontWeight: FontWeight.bold)),
                ),
                subtitle: Text("info@wrteam.in"),
                onTap: () {
                  setState(() {
                    paytype = 2;
                  });
                },
                trailing: Container(
                  padding: EdgeInsets.only(right: 10, bottom: 10),
                  decoration: DesignConfig.innersliderCircleDecoration(),
                  child: Icon(
                    Icons.brightness_1,
                    size: 18,
                    color: paytype == 2 ? salonappcolor : Colors.white,
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                showSuccessDialog();
              },
              child: Container(
                decoration:
                    DesignConfig.outerDecorationService(30, salonappcolor),
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(vertical: 20),
                margin: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                child: Text(
                  "Continue",
                  style: Theme.of(context).textTheme.headline6!.merge(
                      TextStyle(color: Colors.white, letterSpacing: 0.5)),
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }

  showSuccessDialog() {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            contentPadding: EdgeInsets.all(0),
            shape: DesignConfig.roundedrectangleshape,
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                /*  GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Align(
                    alignment: Alignment.topRight,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 5.0, top: 5),
                      child: Icon(
                        Icons.close,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ), */
                SizedBox(height: 20),
                SvgPicture.asset(
                    "assets/images/fullApps/pureBeauty/svgimg/successful.svg"),
                Padding(
                  padding: const EdgeInsets.only(left: 8, right: 8, top: 20),
                  child: Text(
                    "Your Appointment Booked Successfully.",
                    textAlign: TextAlign.center,
                    style:
                        Theme.of(context).textTheme.subtitle1!.merge(TextStyle(
                              color: salonlightfont,
                              letterSpacing: 0.5,
                            )),
                  ),
                ),
                SizedBox(height: 15),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Container(
                    decoration:
                        DesignConfig.outerDecorationService(30, salonappcolor),
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(vertical: 15),
                    margin: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                    child: Text(
                      "Continue Booking",
                      style: Theme.of(context).textTheme.headline6!.merge(
                          TextStyle(color: Colors.white, letterSpacing: 0.5)),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 8.0, right: 8, top: 8, bottom: 20),
                  child: Text(
                    "Go to Appointment",
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .textTheme
                        .caption!
                        .merge(TextStyle(color: salonlightfont)),
                  ),
                ),
              ],
            ),
          );
        });
  }
}
