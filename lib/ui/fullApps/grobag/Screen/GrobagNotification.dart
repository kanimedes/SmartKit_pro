import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:octo_image/octo_image.dart';
import 'package:smartkit_pro/ui/fullApps/grobag/Helper/GrobagAppbar.dart';
import 'package:smartkit_pro/ui/fullApps/grobag/Helper/GrobagColor.dart';

class GrobagNotification extends StatefulWidget {
  const GrobagNotification({Key? key}) : super(key: key);

  @override
  _GrobagNotificationState createState() => _GrobagNotificationState();
}

class _GrobagNotificationState extends State<GrobagNotification> {
  List notiList = [
    {
      'localimg': "assets/images/fullApps/grobag/product_4.jpg",
      'img':
          "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/grobag%2Fproduct_4.jpg?alt=media&token=d25f2797-eb33-4e15-bfd8-830f8edf1324",
      'blurUrl': "LIN+yu~S^}t64rWBxWs,%bkCIZjZ",
      'name': "Your Order no: 131344588 have been cancelled.",
      'time': '2 day ago'
    },
    {
      'localimg': "assets/images/fullApps/grobag/product_8.jpg",
      'img':
          "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/grobag%2Fproduct_8.jpg?alt=media&token=4bd2a674-dc5e-4dcf-859d-1a3b9a9f24c7",
      'blurUrl': "LADb}@%J9OM|~VIaR--m04IW-+%1",
      'name': "Order no: 1234577854 has delivered successfull.",
      'time': '3 day ago'
    },
    {
      'localimg': "assets/images/fullApps/grobag/product_5.jpg",
      'img':
          "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/grobag%2Fproduct_5.jpg?alt=media&token=05c0d79e-c784-4e41-8634-429a88b6ebc5",
      'blurUrl': "LOPEaz_J},ENOpM}\$yoe-iR*EPs.",
      'name': "Your Order no: 457898754 has been processed from our store.",
      'time': '3 day ago'
    },
    {
      'localimg': "assets/images/fullApps/grobag/product_9.jpg",
      'img':
          "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/grobag%2Fproduct_9.jpg?alt=media&token=2bee53f6-153e-4937-876a-f3b61a24fd08",
      'blurUrl': "LGRJ*2%a?Tt4HzjaRmag~fRmD;e;",
      'name': "Don't miss a 50% discount for Biggrocecery day.",
      'time': '5 day ago'
    },
    {
      'localimg': "assets/images/fullApps/grobag/product_14.jpg",
      'img':
          "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/grobag%2Fproduct_14.jpg?alt=media&token=853c83b9-c928-4508-91aa-13234c30e85f",
      'blurUrl': "LPRnFFr??*VL~dkUIbV_ToWCiit#",
      'name': "Hurry! Big discount on backery product for limited stock",
      'time': '7 day ago'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: GrobagAppbar(
          title: "Notifications",
        ),
        body: ListView.builder(
          itemCount: notiList.length,
          physics: AlwaysScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return listItem(index);
          },
        ));
  }

  Widget listItem(int index) {
    return Card(
      elevation: 0.1,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: OctoImage(
                image: CachedNetworkImageProvider(
                  notiList[index]["img"],
                ),
                placeholderBuilder: OctoPlaceholder.blurHash(
                  notiList[index]['blurUrl'],
                ),
                height: 80,
                width: 80,
                errorBuilder: OctoError.icon(color: black),
                fit: BoxFit.fill,
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsetsDirectional.only(start: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      notiList[index]["name"],
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.subtitle1!.copyWith(
                          color: fontColor, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      notiList[index]["time"],
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.subtitle1!.copyWith(
                            color: fontLight,
                          ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
