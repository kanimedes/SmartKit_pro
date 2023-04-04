import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:octo_image/octo_image.dart';

import 'package:smartkit_pro/ui/fullApps/newsApp/activity/LiveVideos/LiveVideoDetail.dart';
import 'package:smartkit_pro/ui/fullApps/newsApp/activity/NotificationList.dart';
import 'package:smartkit_pro/ui/fullApps/newsApp/activity/Profile/NewArticle.dart';
import 'package:smartkit_pro/ui/fullApps/newsApp/helper/ButtonClickAnimation.dart';
import 'package:smartkit_pro/ui/fullApps/newsApp/helper/ColorsRes.dart';
import 'package:smartkit_pro/ui/fullApps/newsApp/helper/DesignConfig.dart';
import 'package:smartkit_pro/ui/fullApps/newsApp/helper/StringsRes.dart';
import 'package:smartkit_pro/ui/fullApps/newsApp/helper/VideoView/overlay_service.dart';
import 'package:smartkit_pro/ui/fullApps/newsApp/model/LiveVideo.dart';

late LiveVideo selectedlivevideo;

class LiveVideoList extends StatefulWidget {
  @override
  _LiveVideoListState createState() => _LiveVideoListState();
}

class _LiveVideoListState extends State<LiveVideoList> {
  late List<LiveVideo> livevideolist;
  @override
  void initState() {
    super.initState();
    // livevideolist = new List<LiveVideo>();
    livevideolist = [];
    setVideoList();
  }

  setVideoList() {
    livevideolist.add(new LiveVideo(
        id: 1,
        description:
            "Hurricane Hanna battered southern Texas with sustained winds of 75 mph and continued to deliver heavy rain and flash flooding as it moved inland late Saturday.",
        title: "Live Video",
        link:
            "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/bee.mp4?alt=media&token=a43df0e5-cfd6-4bcf-8299-4e78c7df3a71",
        image: "assets/images/fullApps/newsapp/news1a.jpg",
        imgurl:
            "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/newsapp%2Fnews1a.jpg?alt=media&token=4f9b47cb-7e46-4768-a764-31a3ca814bc0",
        hash: "L4BVw^9v00tR01-oE3a001kD~VI:"));
    livevideolist.add(new LiveVideo(
        id: 2,
        title: "Live Video",
        description:
            "Hurricane Hanna battered southern Texas with sustained winds of 75 mph and continued to deliver heavy rain and flash flooding as it moved inland late Saturday.",
        link:
            "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/bee.mp4?alt=media&token=a43df0e5-cfd6-4bcf-8299-4e78c7df3a71",
        image: "assets/images/fullApps/newsapp/news1b.jpg",
        imgurl:
            "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/newsapp%2Fnews1b.jpg?alt=media&token=d3ef5894-0463-427d-9ad0-3f9fb18a79ef",
        hash: "L8CY%r9X5i\$*_4IUIUXQ--s;s=s,"));

    livevideolist.add(new LiveVideo(
        id: 3,
        title: "Live Video",
        description:
            "Hurricane Hanna battered southern Texas with sustained winds of 75 mph and continued to deliver heavy rain and flash flooding as it moved inland late Saturday.",
        link:
            "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/bee.mp4?alt=media&token=a43df0e5-cfd6-4bcf-8299-4e78c7df3a71",
        image: "assets/images/fullApps/newsapp/news1c.jpg",
        imgurl:
            "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/newsapp%2Fnews1c.jpg?alt=media&token=8e0cef0d-af33-4fa4-8d7a-665969eabc03",
        hash: "L2Dbo}mU00Ac03Kh0MEc|,}[^-Mw"));
    livevideolist.add(new LiveVideo(
        id: 4,
        title: "Live Video",
        description:
            "Hurricane Hanna battered southern Texas with sustained winds of 75 mph and continued to deliver heavy rain and flash flooding as it moved inland late Saturday.",
        link:
            "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/bee.mp4?alt=media&token=a43df0e5-cfd6-4bcf-8299-4e78c7df3a71",
        image: "assets/images/fullApps/newsapp/news1d.jpg",
        imgurl:
            "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/newsapp%2Fnews1d.jpg?alt=media&token=b269bac1-bb8b-4cb0-aaa9-503269da32de",
        hash: "L9H1iS~X0017Bw%MOe#*004-oi?F"));
    livevideolist.add(new LiveVideo(
        id: 5,
        title: "Live Video",
        description:
            "Hurricane Hanna battered southern Texas with sustained winds of 75 mph and continued to deliver heavy rain and flash flooding as it moved inland late Saturday.",
        link:
            "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/bee.mp4?alt=media&token=a43df0e5-cfd6-4bcf-8299-4e78c7df3a71",
        image: "assets/images/fullApps/newsapp/news1e.jpg",
        imgurl:
            "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/newsapp%2Fnews1e.jpg?alt=media&token=d41f05b2-56e2-44f2-8aee-fde8c49b8c45",
        hash: "LDH.4zH?~WM^n;-=e?wI0c%~Swx_"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle.light,
        iconTheme: IconThemeData(
          color: ColorsRes.white,
        ),
        elevation: 3,
        backgroundColor: ColorsRes.appcolor,
        centerTitle: true,
        title: Text(StringsRes.live,
            style:
                TextStyle(color: ColorsRes.white, fontWeight: FontWeight.bold)),
        leading: IconButton(
          icon: Icon(Icons.add_box_outlined),
          onPressed: () {
            Navigator.of(context)
                .push(CupertinoPageRoute(builder: (context) => NewArticle()));
          },
        ),
        actions: [
          IconButton(
              icon: Icon(Icons.notifications_none_outlined,
                  color: ColorsRes.white),
              onPressed: () {
                Navigator.of(context).push(CupertinoPageRoute(
                    builder: (context) => NotificationList()));
              }),
        ],
      ),
      body: videoListWidget(),
    );
  }

  Widget videoListWidget() {
    return ListView.separated(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        itemCount: livevideolist.length,
        separatorBuilder: (context, index) => SizedBox(
              height: 15,
            ),
        itemBuilder: (context, index) {
          LiveVideo video = livevideolist[index];
          return ButtonClickAnimation(
            onTap: () {
              selectedlivevideo = video;

              OverlayService().addVideosOverlay(context, LiveVideoDetail());
            },
            child: Card(
              shape: DesignConfig.setRoundedBorder(ColorsRes.white, 10, false),
              child: Column(children: [
                Card(
                  margin: EdgeInsets.all(0),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                    topRight: Radius.circular(15),
                    topLeft: Radius.circular(15),
                  )),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: OctoImage(
                    image: CachedNetworkImageProvider(video.imgurl!),
                    placeholderBuilder: OctoPlaceholder.blurHash(video.hash!),
                    errorBuilder: OctoError.icon(color: Colors.black),
                    fit: BoxFit.cover,
                    height: 200,
                    width: double.maxFinite,
                  ),
                ),
                SizedBox(height: 12),
                Row(children: [
                  SizedBox(width: 10),
                  Icon(
                    Icons.brightness_1,
                    color: ColorsRes.red,
                    size: 15,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(child: Text(video.title!)),
                  Icon(
                    Icons.share,
                    color: ColorsRes.blue,
                  ),
                  SizedBox(width: 5),
                ]),
                SizedBox(height: 8),
              ]),
            ),
          );
        });
  }
}
