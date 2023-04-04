import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:octo_image/octo_image.dart';

import 'package:smartkit_pro/ui/fullApps/newsApp/activity/CommentList.dart';
import 'package:smartkit_pro/ui/fullApps/newsApp/activity/FullScreenImage.dart';
import 'package:smartkit_pro/ui/fullApps/newsApp/activity/MainActivity.dart';
import 'package:smartkit_pro/ui/fullApps/newsApp/helper/ButtonClickAnimation.dart';
import 'package:smartkit_pro/ui/fullApps/newsApp/helper/ColorsRes.dart';
import 'package:smartkit_pro/ui/fullApps/newsApp/helper/DesignConfig.dart';
import 'package:smartkit_pro/ui/fullApps/newsApp/helper/StringsRes.dart';

class NewsDetail extends StatefulWidget {
  @override
  _NewsDetailState createState() => _NewsDetailState();
}

class _NewsDetailState extends State<NewsDetail> {
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
        title: Text(StringsRes.lblnews,
            style:
                TextStyle(color: ColorsRes.white, fontWeight: FontWeight.bold)),
        actions: [
          IconButton(
            icon: Icon(
              Icons.bookmark,
              color: ColorsRes.white,
            ),
            onPressed: () {},
          )
        ],
      ),
      body: ListView(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
          children: [
            titleWidget(),
            SizedBox(height: 5),
            authorDateInfoWidget(),
            Divider(),
            SizedBox(height: 15),
            shortdescWidget(),
            SizedBox(height: 20),
            socialmediaWidget(),
            imageWidget(),
            SizedBox(height: 15),
            descWidget(),
          ]),
    );
  }

  Widget socialmediaWidget() {
    return Row(children: [
      SizedBox(width: 5),
      ButtonClickAnimation(
          onTap: () {},
          child: SvgPicture.asset(
            "assets/images/fullApps/newsapp/svg/FB.svg",
            height: MediaQuery.of(context).size.width / 18,
            width: MediaQuery.of(context).size.width / 18,
          )),
      SizedBox(width: 15),
      ButtonClickAnimation(
          onTap: () {},
          child: SvgPicture.asset(
            "assets/images/fullApps/newsapp/svg/WP.svg",
            height: MediaQuery.of(context).size.width / 18,
            width: MediaQuery.of(context).size.width / 18,
          )),
      SizedBox(width: 15),
      ButtonClickAnimation(
          onTap: () {},
          child: SvgPicture.asset(
            "assets/images/fullApps/newsapp/svg/Twitter.svg",
            height: MediaQuery.of(context).size.width / 18,
            width: MediaQuery.of(context).size.width / 18,
          )),
      Spacer(),
      ButtonClickAnimation(
          onTap: () {},
          child: SvgPicture.asset(
            "assets/images/fullApps/newsapp/svg/like.svg",
            height: MediaQuery.of(context).size.width / 18,
            width: MediaQuery.of(context).size.width / 18,
          )),
      SizedBox(width: 15),
      ButtonClickAnimation(
          onTap: () {
            Navigator.of(context)
                .push(CupertinoPageRoute(builder: (context) => CommentList()));
          },
          child: SvgPicture.asset(
            "assets/images/fullApps/newsapp/svg/comment.svg",
            height: MediaQuery.of(context).size.width / 18,
            width: MediaQuery.of(context).size.width / 18,
          )),
      SizedBox(width: 5),
    ]);
  }

  Widget imageWidget() {
    return ButtonClickAnimation(
        onTap: () {
          Navigator.of(context).push(CupertinoPageRoute(
              builder: (context) => FullScreenImage(
                  selectednews.image, selectednews.imgurl, selectednews.hash)));
        },
        child: Card(
          shape: DesignConfig.setRoundedBorder(Colors.transparent, 15, false),
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: OctoImage(
            image: CachedNetworkImageProvider(selectednews.imgurl!),
            placeholderBuilder: OctoPlaceholder.blurHash(selectednews.hash!),
            errorBuilder: OctoError.icon(color: Colors.black),
            fit: BoxFit.cover,
            height: 250,
          ),
        ));
  }

  Widget titleWidget() {
    return Text(selectednews.title!,
        style: Theme.of(context).textTheme.headline6!.merge(
            TextStyle(color: ColorsRes.black, fontWeight: FontWeight.bold)));
  }

  Widget descWidget() {
    return Text(selectednews.description!,
        style: Theme.of(context).textTheme.subtitle1!.merge(
            TextStyle(color: ColorsRes.grey, letterSpacing: 0.5, height: 1.3)));
  }

  Widget shortdescWidget() {
    return Text(selectednews.shortdesc!,
        style: Theme.of(context).textTheme.subtitle1!.merge(
            TextStyle(color: ColorsRes.grey, letterSpacing: 0.5, height: 1.3)));
  }

  Widget authorDateInfoWidget() {
    return Text(
        "${selectednews.author}, PublishedOn: ${selectednews.publshedAt}",
        style: Theme.of(context)
            .textTheme
            .subtitle2!
            .merge(TextStyle(color: ColorsRes.grey)));
  }
}
