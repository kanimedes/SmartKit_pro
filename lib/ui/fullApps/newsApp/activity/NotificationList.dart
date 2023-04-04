import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:octo_image/octo_image.dart';

import 'package:smartkit_pro/ui/fullApps/newsApp/helper/ButtonClickAnimation.dart';
import 'package:smartkit_pro/ui/fullApps/newsApp/helper/ColorsRes.dart';
import 'package:smartkit_pro/ui/fullApps/newsApp/helper/DesignConfig.dart';
import 'package:smartkit_pro/ui/fullApps/newsApp/helper/StringsRes.dart';
import 'package:smartkit_pro/ui/fullApps/newsApp/model/NotificationData.dart';

class NotificationList extends StatefulWidget {
  @override
  _NotificationListState createState() => _NotificationListState();
}

class _NotificationListState extends State<NotificationList> {
  late List<NotificationData> notificationlist;
  @override
  void initState() {
    super.initState();
    notificationlist = [];
    notificationlist = setNotificationList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DesignConfig.setAppbar(StringsRes.notification)
          as PreferredSizeWidget?,
      body: notificationlistWidget(),
    );
  }

  Widget notificationlistWidget() {
    return ListView.builder(
        padding: EdgeInsets.only(left: 10, top: 15, bottom: 15, right: 5),
        itemCount: notificationlist.length,
        itemBuilder: (BuildContext context, int index) {
          NotificationData item = notificationlist[index];
          return ButtonClickAnimation(
            onTap: () {},
            child: Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(bottom: 20),
              child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    CircleAvatar(
                      radius: 25,
                      child: ClipOval(
                          child: OctoImage(
                        image: CachedNetworkImageProvider(
                          item.imageurl!,
                        ),
                        placeholderBuilder: OctoPlaceholder.blurHash(
                          item.blurUrl!,
                        ),
                        errorBuilder: OctoError.icon(color: Colors.black),
                        width: 100,
                        height: 100,
                        fit: BoxFit.cover,
                      )),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                        child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RichText(
                          textAlign: TextAlign.start,
                          text: TextSpan(
                            style: Theme.of(context).textTheme.subtitle1!.merge(
                                TextStyle(
                                    color: ColorsRes.black,
                                    fontWeight: FontWeight.bold)),
                            text: "${item.username}",
                            children: <TextSpan>[
                              TextSpan(
                                  text: item.islike!
                                      ? "\tliked your article"
                                      : item.isfollow!
                                          ? "\tfollowing you"
                                          : "",
                                  style: Theme.of(context)
                                      .textTheme
                                      .caption!
                                      .merge(TextStyle(color: ColorsRes.grey))),
                            ],
                          ),
                        ),
                        Text(
                          "${item.time}",
                          style: Theme.of(context)
                              .textTheme
                              .caption!
                              .merge(TextStyle(color: ColorsRes.grey)),
                        ),
                      ],
                    )),
                    item.isfollow!
                        ? GestureDetector(
                            onTap: () {},
                            child: SvgPicture.asset(
                              "assets/images/fullApps/newsapp/svg/follow.svg",
                              height: MediaQuery.of(context).size.width / 12,
                              width: MediaQuery.of(context).size.width / 12,
                            ))
                        : SizedBox(width: 10),
                  ]),
            ),
          );
        });
  }

  List<NotificationData> setNotificationList() {
    List<NotificationData> list = [];
    list.add(new NotificationData(
        id: 1,
        username: "Dan Peck",
        islike: true,
        isfollow: false,
        userimage: "assets/images/fullApps/newsapp/news1a.jpg",
        imageurl:
            "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/newsapp%2Fnews1a.jpg?alt=media&token=4f9b47cb-7e46-4768-a764-31a3ca814bc0",
        blurUrl: "L4BVw^9v00tR01-oE3a001kD~VI:",
        time: "10 minutes ago"));

    list.add(new NotificationData(
        id: 2,
        username: "TMZ Staff",
        isfollow: true,
        islike: false,
        userimage: "assets/images/fullApps/newsapp/news1b.jpg",
        imageurl:
            "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/newsapp%2Fnews1b.jpg?alt=media&token=d3ef5894-0463-427d-9ad0-3f9fb18a79ef",
        blurUrl: "L8CY%r9X5i\$*_4IUIUXQ--s;s=s,",
        time: "2 hours ago"));

    list.add(new NotificationData(
      id: 3,
      username: "Noah Manskar",
      islike: true,
      isfollow: false,
      userimage: "assets/images/fullApps/newsapp/news1c.jpg",
      imageurl:
          "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/newsapp%2Fnews1c.jpg?alt=media&token=8e0cef0d-af33-4fa4-8d7a-665969eabc03",
      blurUrl: "L2Dbo}mU00Ac03Kh0MEc|,}[^-Mw",
      time: "1 days ago",
    ));

    list.add(new NotificationData(
      id: 4,
      username: "Michael Rothstein",
      islike: false,
      isfollow: true,
      userimage: "assets/images/fullApps/newsapp/news1d.jpg",
      imageurl:
          "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/newsapp%2Fnews1d.jpg?alt=media&token=b269bac1-bb8b-4cb0-aaa9-503269da32de",
      blurUrl: "L9H1iS~X0017Bw%MOe#*004-oi?F",
      time: "2 days ago",
    ));

    return list;
  }
}
