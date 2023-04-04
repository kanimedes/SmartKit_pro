import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:octo_image/octo_image.dart';
import '../helper/DHomeColors.dart';
import '../helper/DHomeString.dart';
import '../helper/DHomeconstant.dart';
import 'package:smartkit_pro/ui/fullApps/dreamHome/models/DHomeNotificationModel.dart';

class DHomeNotification extends StatefulWidget {
  const DHomeNotification({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return DHomeNotificationState();
  }
}

class DHomeNotificationState extends State<DHomeNotification> {
  List<DHomeNotificationModel> notificationList = [
    DHomeNotificationModel(
      imageUrl:
          "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/dreamhomeapp%2Fnear_img_1.png?alt=media&token=2d477646-cb44-492e-8fb7-8b654e63dd40",
      blurUrl: "LSHVJIjbI.axyZs+s8WYkXfkWCj[",
      des1: "Modern Home 3BHK",
      des2: "ResidentialHouse For Sale Near Supermarket.",
      localImg: DHomeConstant.getPngImagePath("near_img_1.png"),
    ),
    DHomeNotificationModel(
        imageUrl:
            "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/dreamhomeapp%2Fnear_img_-1.png?alt=media&token=835d33eb-303f-42bc-9d2e-416f64ef9aab",
        blurUrl: "LYG]diawNGs:%%bIs8odXpazV?WC",
        des1: "Family House 3BHK",
        des2: "with Luxurious Furniture in Mumbai. ",
        localImg: DHomeConstant.getPngImagePath("near_img_-1.png")),
    DHomeNotificationModel(
        imageUrl:
            "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/dreamhomeapp%2Fnear_img_-2.png?alt=media&token=9217aa86-10e5-40f2-bd78-07e1546f073c",
        blurUrl: "LbHy5rxZR*o#?wf5nhR*n\$a#W=Rj",
        des1: "",
        des2: "4BHK Apartment with 4 Beds and 3 Bath with great Balcony View. ",
        localImg: DHomeConstant.getPngImagePath("near_img_-1.png"))
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      AppBar(
        toolbarHeight: 133,
        backgroundColor: DHomeColors.bgColor,
        centerTitle: true,
        leadingWidth: 70,
        title: const Text(
          DHomeString.Notification,
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
      notificationData()
    ]));
  }

  Widget notificationData() {
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
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.only(left: 25),
                child: const Text(
                  DHomeString.Today,
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(right: 25),
                child: const Text(
                  DHomeString.Clear,
                  style: TextStyle(fontSize: 12, color: Color(0xff565656)),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 14.7,
          ),
          notificationListData()
        ])));
  }

  Widget notificationListData() {
    return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: DHomeColors.bgColor),
        margin: const EdgeInsets.only(left: 25, right: 25),
        child: ListView.separated(
          shrinkWrap: true,
          padding: const EdgeInsets.all(15),
          itemCount: notificationList.length,
          separatorBuilder: (context, index) {
            return const Divider(
              thickness: 1,
              color: Color(0xffacacac),
            );
          },
          itemBuilder: (BuildContext context, int index) {
            return Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  flex: 3,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: OctoImage(
                      image: CachedNetworkImageProvider(
                          notificationList[index].imageUrl),
                      placeholderBuilder: OctoPlaceholder.blurHash(
                        notificationList[index].blurUrl,
                      ),
                      errorBuilder: OctoError.icon(color: DHomeColors.black),
                      height: 90,
                      width: 100,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Expanded(
                  flex: 7,
                  child: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                            text: notificationList[index].des1 + " ",
                            style: const TextStyle(
                                fontSize: 12, fontWeight: FontWeight.w700)),
                        TextSpan(
                          text: notificationList[index].des2,
                        ),
                      ],
                    ),
                  ),
                )
              ],
            );
          },
        ));
  }
}
