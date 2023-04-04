import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:octo_image/octo_image.dart';
import 'package:smartkit_pro/ui/fullApps/pureBeauty/helper/DataConfig.dart';
import 'package:smartkit_pro/ui/fullApps/pureBeauty/helper/DesignConfig.dart';
import 'package:smartkit_pro/ui/fullApps/pureBeauty/helper/ReadMoreText.dart';
import 'package:smartkit_pro/ui/fullApps/pureBeauty/styles/colors.dart';

import 'BookAppointment/BookAppointmentPage.dart';

class SalonDetailPage extends StatefulWidget {
  String? img;
  String? imgurl;
  String? hash;

  SalonDetailPage({Key? key, this.img, this.imgurl, this.hash})
      : super(key: key);

  @override
  _SalonDetailPageState createState() => _SalonDetailPageState();
}

class _SalonDetailPageState extends State<SalonDetailPage> {
  int? selectedserviceid = 1;

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.light,
      ),
      child: Scaffold(
        backgroundColor: salonbgcolor,
        body: Stack(children: [
          OctoImage(
            image: CachedNetworkImageProvider(widget.imgurl!),
            placeholderBuilder: OctoPlaceholder.blurHash(widget.hash!),
            errorBuilder: OctoError.icon(color: Colors.black),
            width: double.maxFinite,
            fit: BoxFit.cover,
            height: kToolbarHeight * 4,
          ),
          //Image.asset("assets/images/fullApps/pureBeauty/36.jpg"),
          Padding(
            padding:
                const EdgeInsets.only(top: kToolbarHeight, left: 20, right: 20),
            child: Row(children: [
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  decoration:
                      DesignConfig.outersliderCircularDecoration(salonbgcolor),
                  padding: EdgeInsets.all(15),
                  child: SvgPicture.asset(
                      "assets/images/fullApps/pureBeauty/svgimg/back01.svg"),
                ),
              ),
              Spacer(),
              GestureDetector(
                onTap: () {},
                child: Container(
                  decoration:
                      DesignConfig.outersliderCircularDecoration(salonbgcolor),
                  padding: EdgeInsets.all(15),
                  child: SvgPicture.asset(
                      "assets/images/fullApps/pureBeauty/svgimg/Map.svg"),
                ),
              ),
            ]),
          ),
          Container(
            height: double.maxFinite,
            width: double.maxFinite,
            margin: EdgeInsets.only(top: kToolbarHeight * 3.5),
            decoration: BoxDecoration(
              color: salonbgcolor,
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(30.0),
                  topLeft: Radius.circular(30.0)),
            ),
            child: SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 20, right: 20, top: 25),
                      child: Text(
                        "Plush Beauty Lounge",
                        style: Theme.of(context).textTheme.headline5!.merge(
                            TextStyle(
                                color: salonappcolor,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 0.5)),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 20, right: 20, top: 8),
                      child: Text(
                        "Spa Salon - Near PalletMall, Woodland Hills",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context)
                            .textTheme
                            .subtitle1!
                            .merge(TextStyle(
                              color: salonlightfont,
                              letterSpacing: 0.5,
                            )),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 20, right: 20, top: 15),
                      child: Row(
                        children: [
                          Expanded(
                            child: RichText(
                              text: TextSpan(
                                children: [
                                  WidgetSpan(
                                    alignment: PlaceholderAlignment.middle,
                                    child: Icon(
                                      Icons.watch_later_outlined,
                                      color: salonappcolor,
                                    ),
                                  ),
                                  TextSpan(
                                    text: "\t\t[ Open Today ]",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText2!
                                        .merge(TextStyle(
                                          color: salonlightfont,
                                          letterSpacing: 0.5,
                                        )),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            child: RichText(
                              text: TextSpan(
                                children: [
                                  WidgetSpan(
                                    alignment: PlaceholderAlignment.middle,
                                    child: Icon(
                                      Icons.local_offer,
                                      color: salonappcolor,
                                    ),
                                  ),
                                  TextSpan(
                                    text: "\t\t-58%",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText2!
                                        .merge(TextStyle(
                                          color: salonappcolor,
                                          fontWeight: FontWeight.bold,
                                          letterSpacing: 0.5,
                                        )),
                                  ),
                                  TextSpan(
                                    text: "(6 pax available)",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText2!
                                        .merge(TextStyle(
                                          color: salonlightfont,
                                          letterSpacing: 0.5,
                                        )),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 20, right: 20, top: 8),
                      child: Row(
                        children: [
                          Expanded(
                            child: RichText(
                              text: TextSpan(
                                children: [
                                  WidgetSpan(
                                    alignment: PlaceholderAlignment.middle,
                                    child: SvgPicture.asset(
                                      "assets/images/fullApps/pureBeauty/svgimg/rating.svg",
                                      height: 20,
                                      width: 20,
                                    ),
                                  ),
                                  TextSpan(
                                    text: "\t\t4.7(2.7k)",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText2!
                                        .merge(TextStyle(
                                          color: salonlightfont,
                                          letterSpacing: 0.5,
                                        )),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            child: RichText(
                              text: TextSpan(
                                children: [
                                  WidgetSpan(
                                    alignment: PlaceholderAlignment.middle,
                                    child: Icon(
                                      Icons.remove_red_eye,
                                      color: salonmainlight,
                                    ),
                                  ),
                                  TextSpan(
                                    text: "\t\t10k Views",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText2!
                                        .merge(TextStyle(
                                          color: salonlightfont,
                                          letterSpacing: 0.5,
                                        )),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 20, right: 20, top: 15),
                      child: Text(
                        "About",
                        style: Theme.of(context).textTheme.headline6!.merge(
                            TextStyle(
                                color: salonappcolor,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 0.5)),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 20, right: 20, top: 10),
                      child: ReadMoreText(
                        "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.\n\nIt was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                        trimLines: 10,
                        style: Theme.of(context).textTheme.subtitle1!.merge(
                            TextStyle(
                                color: salonlightfont,
                                height: 1.5,
                                letterSpacing: 0.5)),
                        colorClickableText: salonappcolor,
                        trimMode: TrimMode.Line,
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 20, right: 20, top: 20),
                      child: Text(
                        "Opening Hours",
                        style: Theme.of(context).textTheme.headline6!.merge(
                            TextStyle(
                                color: salonappcolor,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 0.5)),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 20, right: 20, top: 20),
                      child: Row(children: [
                        Expanded(
                          child: Row(children: [
                            Icon(
                              Icons.brightness_1,
                              color: salonappcolor,
                              size: 10,
                            ),
                            SizedBox(width: 10),
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: "Monday - Friday",
                                    style: Theme.of(context)
                                        .textTheme
                                        .subtitle1!
                                        .merge(TextStyle(
                                          color: salonlightfont,
                                          letterSpacing: 0.5,
                                        )),
                                  ),
                                  TextSpan(
                                    text: "\n\n08:00am - 03:00pm",
                                    style: Theme.of(context)
                                        .textTheme
                                        .subtitle2!
                                        .merge(TextStyle(
                                          color: salonappcolor,
                                          fontWeight: FontWeight.bold,
                                          letterSpacing: 0.5,
                                        )),
                                  ),
                                ],
                              ),
                            ),
                          ]),
                        ),
                        Expanded(
                          child: Row(children: [
                            Icon(
                              Icons.brightness_1,
                              color: salonappcolor,
                              size: 10,
                            ),
                            SizedBox(width: 10),
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: "Saturday - Sunday",
                                    style: Theme.of(context)
                                        .textTheme
                                        .subtitle1!
                                        .merge(TextStyle(
                                          color: salonlightfont,
                                          letterSpacing: 0.5,
                                        )),
                                  ),
                                  TextSpan(
                                    text: "\n\n09:00am - 02:00pm",
                                    style: Theme.of(context)
                                        .textTheme
                                        .subtitle2!
                                        .merge(TextStyle(
                                          color: salonappcolor,
                                          fontWeight: FontWeight.bold,
                                          letterSpacing: 0.5,
                                        )),
                                  ),
                                ],
                              ),
                            ),
                          ]),
                        ),
                      ]),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 20, right: 20, top: 20),
                      child: Text(
                        "Our Services",
                        style: Theme.of(context).textTheme.headline6!.merge(
                            TextStyle(
                                color: salonappcolor,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 0.5)),
                      ),
                    ),
                    SizedBox(height: 20),
                    serviceWidget(),
                    // SizedBox(height: 20),
                    hairlistWidget(),
                    SizedBox(height: 20),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => BookAppointmentPage()));
                      },
                      child: Center(
                        child: Container(
                          width: double.maxFinite,
                          alignment: Alignment.center,
                          margin: EdgeInsets.symmetric(horizontal: 30),
                          padding: EdgeInsets.symmetric(vertical: 20),
                          decoration: DesignConfig.outerDecorationService(
                              30, salonappcolor),
                          child: Text(
                            "Continue Booking",
                            style: Theme.of(context).textTheme.headline6!.merge(
                                TextStyle(
                                    color: Colors.white, letterSpacing: 0.5)),
                          ),
                        ),
                      ),
                    ),

                    Padding(
                      padding:
                          const EdgeInsets.only(left: 20, right: 20, top: 20),
                      child: Row(children: [
                        Text(
                          "Choose Service",
                          style: Theme.of(context).textTheme.headline6!.merge(
                              TextStyle(
                                  color: salonappcolor,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 0.5)),
                        ),
                        Spacer(),
                        Text(
                          "See all",
                          style: Theme.of(context).textTheme.subtitle1!.merge(
                              TextStyle(
                                  color: salonlightfont,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 0.5)),
                        ),
                      ]),
                    ),

                    serviceImgListWidget(),

                    Padding(
                      padding:
                          const EdgeInsets.only(left: 20, right: 20, top: 20),
                      child: Row(children: [
                        Text(
                          "Our Specialist",
                          style: Theme.of(context).textTheme.headline6!.merge(
                              TextStyle(
                                  color: salonappcolor,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 0.5)),
                        ),
                        Spacer(),
                        Text(
                          "See all",
                          style: Theme.of(context).textTheme.subtitle1!.merge(
                              TextStyle(
                                  color: salonlightfont,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 0.5)),
                        ),
                      ]),
                    ),

                    specialistImgWidget(),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 20, right: 20, top: 20),
                      child: Text(
                        "Review",
                        style: Theme.of(context).textTheme.headline6!.merge(
                            TextStyle(
                                color: salonappcolor,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 0.5)),
                      ),
                    ),
                    reviewListWidget(),
                  ]),
            ),
          )
        ]),
      ),
    );
  }

  Widget serviceWidget() {
    return Container(
      height: 65,
      //margin: EdgeInsets.only(bottom: 20),
      color: salonbgcolor,
      child: ListView(
          scrollDirection: Axis.horizontal,
          children: List.generate(DataConfig.serviceList.length, (index) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  selectedserviceid = DataConfig.serviceList[index]['id'];
                });
              },
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: AnimatedContainer(
                      duration: DesignConfig.animationtime,
                      width: 150,
                      padding: EdgeInsets.only(left: 12, right: 12),
                      margin: EdgeInsets.only(
                          bottom: 10,
                          left: index == 0 ? 30 : 0,
                          right: index == DataConfig.serviceList.length - 1
                              ? 20
                              : 10),

                      //decoration: DesignConfig.outerDecorationService(30, salonbgcolor),
                      decoration: selectedserviceid ==
                              DataConfig.serviceList[index]['id']
                          ? DesignConfig.newInnerDecoration(30)
                          : DesignConfig.outerDecorationService(
                              30, salonbgcolor),
                      child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                                DataConfig.serviceList[index]['img']),
                            SizedBox(width: 15),
                            Text(
                              DataConfig.serviceList[index]['title'],
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle1!
                                  .merge(TextStyle(
                                      color: salonappcolor,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 0.5)),
                            ),
                          ]))),
            );
          })),
    );
  }

  Widget hairlistWidget() {
    return ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: DataConfig.hairstylelist.length,
        itemBuilder: (context, index) {
          return Container(
            width: double.maxFinite,
            height: 110,
            decoration: DesignConfig.outerDecorationService(10, salonbgcolor),
            margin: EdgeInsets.only(bottom: 25, left: 12, right: 12),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10.0),
                      topLeft: Radius.circular(10.0)),
                  child: OctoImage(
                    image: CachedNetworkImageProvider(
                        DataConfig.hairstylelist[index]['imgurl']),
                    placeholderBuilder: OctoPlaceholder.blurHash(
                        DataConfig.hairstylelist[index]['hash']),
                    errorBuilder: OctoError.icon(color: Colors.black),
                    width: 120,
                    height: 110,
                    fit: BoxFit.cover,
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                DataConfig.hairstylelist[index]['title'],
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle1!
                                    .merge(TextStyle(
                                        color: salonappcolor,
                                        letterSpacing: 0.5,
                                        fontWeight: FontWeight.bold)),
                              ),
                            ),
                            if (DataConfig.hairstylelist[index]['discount']
                                .toString()
                                .trim()
                                .isNotEmpty)
                              Container(
                                decoration: DesignConfig.outerDecorationService(
                                    15, salonmainlight),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 5),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    SvgPicture.asset(
                                        "assets/images/fullApps/pureBeauty/svgimg/discount.svg"),
                                    SizedBox(width: 5),
                                    Text(
                                      DataConfig.hairstylelist[index]
                                          ['discount'],
                                      style: TextStyle(
                                          color: salonappcolor,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                          ],
                        ),
                        SizedBox(height: 5),
                        Row(
                          children: [
                            Text(
                              DataConfig.hairstylelist[index]['price'],
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText2!
                                  .merge(TextStyle(
                                      color: salonappcolor,
                                      letterSpacing: 0.5,
                                      fontWeight: FontWeight.bold)),
                            ),
                            SizedBox(width: 10),
                            Icon(
                              Icons.brightness_1,
                              color: salonlightfont,
                              size: 7,
                            ),
                            SizedBox(width: 8),
                            Text(
                              DataConfig.hairstylelist[index]['time'],
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText2!
                                  .merge(TextStyle(
                                    color: salonlightfont,
                                    letterSpacing: 0.5,
                                  )),
                            ),
                          ],
                        ),
                        SizedBox(height: 8),
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                DataConfig.hairstylelist[index]['desc'],
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText2!
                                    .merge(TextStyle(
                                      color: salonlightfont,
                                      letterSpacing: 0.5,
                                    )),
                              ),
                            ),
                            SizedBox(width: 8),
                            Container(
                                decoration: DesignConfig.newInnerDecoration(10),
                                child: Padding(
                                  padding: EdgeInsets.all(8),
                                  child: Icon(
                                    Icons.add,
                                    color: salonappcolor,
                                    size: 18,
                                  ),
                                )),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }

  Widget serviceImgListWidget() {
    return Container(
      height: 120,
      margin: EdgeInsets.only(bottom: 20, top: 10),
      color: salonbgcolor,
      child: ListView(
          scrollDirection: Axis.horizontal,
          children: List.generate(DataConfig.serviceimagelist.length, (index) {
            return IntrinsicHeight(
              child: Container(
                  width: 100,
                  padding:
                      EdgeInsets.only(left: 5, right: 5, top: 5, bottom: 5),
                  margin: EdgeInsets.only(
                      bottom: 10,
                      top: 10,
                      left: index == 0 ? 20 : 0,
                      right: index == DataConfig.serviceimagelist.length - 1
                          ? 20
                          : 10),
                  decoration: DesignConfig.outerDecoration(10),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: OctoImage(
                      image: CachedNetworkImageProvider(
                          DataConfig.serviceimagelist[index]['imgurl']),
                      placeholderBuilder: OctoPlaceholder.blurHash(
                          DataConfig.serviceimagelist[index]['hash']),
                      errorBuilder: OctoError.icon(color: Colors.black),
                      height: 95,
                      width: 95,
                    ),
                  )),
            );
          })),
    );
  }

  Widget specialistImgWidget() {
    return Container(
      height: 100,
      margin: EdgeInsets.only(bottom: 20, top: 10),
      color: salonbgcolor,
      child: ListView(
          scrollDirection: Axis.horizontal,
          children: List.generate(DataConfig.specialistimglist.length, (index) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                    //width: 70,
                    margin: EdgeInsets.only(
                        bottom: 6.0,
                        left: index == 0 ? 20 : 0,
                        right: index == DataConfig.specialistimglist.length - 1
                            ? 20
                            : 20),
                    padding: EdgeInsets.all(3),
                    decoration: DesignConfig.outerCircularDecoration(),
                    child: CircleAvatar(
                      radius: 35,
                      child: ClipOval(
                        child: OctoImage(
                          image: CachedNetworkImageProvider(
                              DataConfig.specialistimglist[index]['imgurl']),
                          placeholderBuilder: OctoPlaceholder.blurHash(
                              DataConfig.specialistimglist[index]['hash']),
                          errorBuilder: OctoError.icon(color: Colors.black),
                        ),
                      ),
                    )),
                Padding(
                  padding: EdgeInsets.only(right: index == 0 ? 0 : 10),
                  child: Text(
                    DataConfig.specialistimglist[index]['name'],
                    textAlign: TextAlign.center,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(color: salonlightfont),
                  ),
                )
              ],
            );
          })),
    );
  }

  Widget reviewListWidget() {
    return ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: DataConfig.reviewList.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 25),
            child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Container(
                  // width: 50,
                  margin: EdgeInsets.only(right: 20),
                  decoration: DesignConfig.outerCircularDecoration(),
                  child: CircleAvatar(
                    radius: 25,
                    child: ClipOval(
                      child: OctoImage(
                        image: CachedNetworkImageProvider(
                            DataConfig.reviewList[index]['imgurl']),
                        placeholderBuilder: OctoPlaceholder.blurHash(
                            DataConfig.reviewList[index]['hash']),
                        errorBuilder: OctoError.icon(color: Colors.black),
                      ),
                    ),
                  )),
              Expanded(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                              child: Text(
                            DataConfig.reviewList[index]['name'],
                            style: Theme.of(context).textTheme.subtitle1!.merge(
                                TextStyle(
                                    color: salonappcolor,
                                    fontWeight: FontWeight.bold)),
                          )),
                          SizedBox(width: 5),
                          Text(
                            DataConfig.reviewList[index]['time'],
                            style: Theme.of(context)
                                .textTheme
                                .caption!
                                .merge(TextStyle(color: salonlightfont)),
                          )
                        ],
                      ),
                      SizedBox(height: 5),
                      RatingBarIndicator(
                        rating:
                            double.parse(DataConfig.reviewList[index]['rate']),
                        itemBuilder: (context, index) => Padding(
                          padding: EdgeInsets.all(8.0),
                          child: SvgPicture.asset(
                            "assets/images/fullApps/pureBeauty/svgimg/rating.svg",
                            height: 40,
                            width: 40,
                          ),
                        ),
                        itemCount: 5,
                        itemSize: 14,
                        unratedColor: salonlightfont.withOpacity(0.5),
                        direction: Axis.horizontal,
                      ),
                      SizedBox(height: 5),
                      Text(
                        DataConfig.reviewList[index]['desc'],
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.subtitle2!.merge(
                            TextStyle(
                                color: salonlightfont,
                                letterSpacing: 0.5,
                                height: 1.5)),
                      ),
                    ]),
              ),
            ]),
          );
        });
  }
}
