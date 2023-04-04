import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:octo_image/octo_image.dart';
import 'package:smartkit_pro/ui/fullApps/pureBeauty/helper/DesignConfig.dart';
import 'package:smartkit_pro/ui/fullApps/pureBeauty/styles/colors.dart';

import '../SalonDetailPage.dart';
import 'BookAppointmentPage.dart';

class BookAppointmentInfoPage extends StatefulWidget {
  String? img, blurUrl, localimg;
  BookAppointmentInfoPage({Key? key, this.img, this.blurUrl, this.localimg})
      : super(key: key);

  @override
  _BookAppointmentInfoPageState createState() =>
      _BookAppointmentInfoPageState();
}

class _BookAppointmentInfoPageState extends State<BookAppointmentInfoPage> {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.light,
      ),
      child: Scaffold(
        backgroundColor: salonbgcolor,
        body: Stack(
          children: [
            OctoImage(
              image: CachedNetworkImageProvider(widget.img!),
              placeholderBuilder: OctoPlaceholder.blurHash(widget.blurUrl!),
              errorBuilder: OctoError.icon(color: Colors.black),
              width: double.maxFinite,
              height: double.maxFinite,
              fit: BoxFit.cover,
            ),
            DesignConfig.setAppbar("Book Appointment", context, false),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                decoration:
                    DesignConfig.outerDecorationService(30, salonbgcolor),
                margin: EdgeInsets.only(left: 30, right: 30, bottom: 90),
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 10),
                      Text(
                        "Hair. Facial",
                        style: Theme.of(context)
                            .textTheme
                            .subtitle1!
                            .merge(TextStyle(
                              color: salonmainlight,
                              letterSpacing: 0.5,
                            )),
                      ),
                      SizedBox(height: 8),
                      Text(
                        "Mounrich Spa Services",
                        style: Theme.of(context).textTheme.headline6!.merge(
                            TextStyle(
                                color: salonappcolor,
                                letterSpacing: 0.5,
                                fontWeight: FontWeight.bold)),
                      ),
                      SizedBox(height: 15),
                      Text(
                        "Spa Salon - Near PalletMall, Woodland Hills",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context)
                            .textTheme
                            .bodyText2!
                            .merge(TextStyle(
                              color: Colors.grey,
                              letterSpacing: 0.5,
                            )),
                      ),
                      SizedBox(height: 15),
                      Row(
                        children: [
                          SvgPicture.asset(
                              "assets/images/fullApps/pureBeauty/svgimg/rating.svg"),
                          SizedBox(width: 8),
                          Text(
                            "4.8 (2.7k)",
                            style: Theme.of(context)
                                .textTheme
                                .bodyText2!
                                .merge(TextStyle(
                                  color: Colors.black,
                                  letterSpacing: 0.5,
                                )),
                          ),
                          Spacer(),
                          SvgPicture.asset(
                              "assets/images/fullApps/pureBeauty/svgimg/discount.svg"),
                          SizedBox(width: 8),
                          Text(
                            "-58%",
                            style: Theme.of(context)
                                .textTheme
                                .bodyText2!
                                .merge(TextStyle(
                                  color: Colors.black,
                                  letterSpacing: 0.5,
                                )),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => BookAppointmentPage()));
                        },
                        child: Container(
                          width: double.maxFinite,
                          alignment: Alignment.center,
                          padding: EdgeInsets.symmetric(vertical: 17),
                          decoration: DesignConfig.outerDecorationService(
                              40, salonappcolor),
                          child: Text(
                            "Book Now",
                            style: Theme.of(context).textTheme.headline5!.merge(
                                TextStyle(
                                    color: Colors.white, letterSpacing: 0.5)),
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                    ]),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 30),
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => SalonDetailPage(
                            img: "assets/images/fullApps/pureBeauty/shop_6.jpg",
                            imgurl:
                                "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/salonapp%2Fshop_6.jpg?alt=media&token=ebb4ec58-eec3-4a81-ac12-c93698177d90",
                            hash: "LCG[1Z~V-o-T01s+?Fxa004.MyjZ")));
                  },
                  child: Row(mainAxisSize: MainAxisSize.min, children: [
                    Text(
                      "View More Details",
                      style: Theme.of(context)
                          .textTheme
                          .subtitle1!
                          .merge(TextStyle(color: Colors.white)),
                    ),
                    SizedBox(width: 8),
                    Icon(
                      Icons.keyboard_arrow_down,
                      color: Colors.white,
                      size: 30,
                    )
                  ]),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
