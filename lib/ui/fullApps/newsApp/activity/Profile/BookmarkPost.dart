import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
//import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:octo_image/octo_image.dart';

import 'package:smartkit_pro/ui/fullApps/newsApp/helper/ButtonClickAnimation.dart';
import 'package:smartkit_pro/ui/fullApps/newsApp/helper/ColorsRes.dart';
import 'package:smartkit_pro/ui/fullApps/newsApp/helper/DesignConfig.dart';
import 'package:smartkit_pro/ui/fullApps/newsApp/model/Article.dart';

import '../CommentList.dart';

class BookmarkPost extends StatefulWidget {
  @override
  _BookmarkPostState createState() => _BookmarkPostState();
}

class _BookmarkPostState extends State<BookmarkPost> {
  late List<Article> mypost;

  @override
  void initState() {
    super.initState();
    // mypost = new List<Article>();
    mypost = [];
    getMyPost();
  }

  getMyPost() {
    mypost = setNewsList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return mypost.isEmpty ? noHistorywidget() : bookmarkListWidget();
  }

  Widget noHistorywidget() {
    return Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
              "assets/images/fullApps/newsapp/svg/no_bookmark_yet.svg"),
          SizedBox(height: 30),
          Text(
            "No History yet",
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headline6!.merge(
                TextStyle(color: ColorsRes.black, fontWeight: FontWeight.bold)),
          ),
          SizedBox(height: 10),
          Text(
            "Hit the bottom button down below to Create your reading collection",
            textAlign: TextAlign.center,
            style: Theme.of(context)
                .textTheme
                .subtitle1!
                .merge(TextStyle(color: ColorsRes.grey)),
          ),
          Container(
            width: double.maxFinite,
            padding: EdgeInsets.symmetric(vertical: 15),
            margin: EdgeInsets.only(top: 25, left: 30, right: 30),
            alignment: Alignment.center,
            decoration: DesignConfig.boxDecorationContainerColor(
                ColorsRes.appcolor, 20),
            child: Text(
              "Start Creating",
              style: TextStyle(
                  color: ColorsRes.white, fontWeight: FontWeight.bold),
            ),
          )
        ]);
  }

  Widget bookmarkListWidget() {
    return ListView.builder(
        shrinkWrap: true,
        physics: ClampingScrollPhysics(),
        itemCount: mypost.length,
        itemBuilder: (BuildContext context, int index) {
          Article item = mypost[index];
          return Slidable(
            /*actionPane: SlidableDrawerActionPane(),
            actionExtentRatio: 0.20,*/
            key: Key(item.id.toString()),
            startActionPane: ActionPane(
                // A motion is a widget used to control how the pane animates.
                motion: ScrollMotion(),

                // All actions are defined in the children parameter.
                children: [
                  SlidableAction(
                    backgroundColor: Colors.transparent,
                    icon: Icons.share,
                    onPressed: (BuildContext context) {},
                  ),
                  SlidableAction(
                    backgroundColor: Colors.transparent,
                    icon: Icons.delete_forever,
                    onPressed: (BuildContext context) {},
                  ),
                ]),
            child: ButtonClickAnimation(
              onTap: () {},
              child: Container(
                decoration: DesignConfig.boxDecorationContainerColor(
                    ColorsRes.appcolor.withOpacity(0.05), 15),
                alignment: Alignment.center,
                margin: EdgeInsets.only(left: 10, right: 10, bottom: 10),
                padding: EdgeInsets.symmetric(horizontal: 1, vertical: 3),
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Card(
                        shape: DesignConfig.setRoundedBorder(
                            Colors.transparent, 15, false),
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        child: OctoImage(
                          image: CachedNetworkImageProvider(item.imgurl!),
                          placeholderBuilder:
                              OctoPlaceholder.blurHash(item.hash!),
                          errorBuilder: OctoError.icon(color: Colors.black),
                          fit: BoxFit.cover,
                          width: 100,
                          height: 110,
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                          child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                "${item.publshedAt}",
                                style: Theme.of(context)
                                    .textTheme
                                    .caption!
                                    .merge(TextStyle(
                                      color: ColorsRes.grey.withOpacity(0.5),
                                    )),
                              ),
                              Text(
                                "\t,1 hour ago\t",
                                style: Theme.of(context)
                                    .textTheme
                                    .caption!
                                    .merge(TextStyle(
                                      color: ColorsRes.grey.withOpacity(0.5),
                                    )),
                              ),
                            ],
                          ),
                          SizedBox(height: 5),
                          Text(
                            "${item.title}",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context).textTheme.subtitle1!.merge(
                                TextStyle(
                                    color: ColorsRes.black,
                                    fontWeight: FontWeight.bold)),
                          ),
                          SizedBox(height: 5),
                          Text("${item.shortdesc}",
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText2!
                                  .merge(TextStyle(color: ColorsRes.grey))),
                          SizedBox(height: 5),
                          Align(
                            alignment: Alignment.centerRight,
                            child: Text("${item.author}\t",
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: Theme.of(context)
                                    .textTheme
                                    .caption!
                                    .merge(TextStyle(color: ColorsRes.blue))),
                          ),
                          SizedBox(height: 8),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SvgPicture.asset(
                                    "assets/images/fullApps/newsapp/svg/like.svg",
                                    width:
                                        MediaQuery.of(context).size.width / 20,
                                  ),
                                  ButtonClickAnimation(
                                      onTap: () {
                                        Navigator.of(context).push(
                                            CupertinoPageRoute(
                                                builder: (context) =>
                                                    CommentList()));
                                      },
                                      child: SvgPicture.asset(
                                        "assets/images/fullApps/newsapp/svg/comment.svg",
                                        width:
                                            MediaQuery.of(context).size.width /
                                                20,
                                      )),
                                ]),
                          ),
                          SizedBox(height: 5),
                        ],
                      )),
                    ]),
              ),
            ),
          );
        });
  }

  List<Article> setNewsList() {
    List<Article> newslist = [];
    newslist.add(new Article(
        title: "Hurricane Hanna makes landfall around 5 p.m. on Saturday.",
        author: "Dan Peck",
        description:
            "Hurricane Hanna battered southern Texas with sustained winds of 75 mph and continued to deliver heavy rain and flash flooding as it moved inland late Saturday.",
        shortdesc:
            "Hurricane Hanna battered southern Texas with sustained winds of 75 mph and continued to deliver heavy rain and flash flooding",
        image: "assets/images/fullApps/newsapp/news1a.jpg",
        imgurl:
            "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/newsapp%2Fnews1a.jpg?alt=media&token=4f9b47cb-7e46-4768-a764-31a3ca814bc0",
        hash: "L4BVw^9v00tR01-oE3a001kD~VI:",
        publshedAt: "Feb 10,2021",
        newstype: "Hot"));

    newslist.add(new Article(
        title:
            "Nicki Minaj's Husband Gets Permission To Be There For Baby's Birth",
        author: "TMZ Staff",
        description:
            "Kenneth can be in the room when Nicki gives birth ... a judge just granted his request to tweak his pre-trial release conditions so he can travel with Nicki. With the court's order in place, KP can travel with Nicki periodically on biz…",
        shortdesc:
            "Kenneth can be in the room when Nicki gives birth ... a judge just granted his request to tweak his pre-trial ",
        image: "assets/images/fullApps/newsapp/news1f.jpg",
        imgurl:
            "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/newsapp%2Fnews1f.jpg?alt=media&token=6c914574-177f-47d8-beeb-404d68057e4c",
        hash: "L5B|sG}+5QCl.\$wbx[I^00O@^7+H",
        publshedAt: "Jun 12,2020",
        newstype: "Hot"));

    newslist.add(new Article(
        title: "New Lions safety Jayron Kearse suspended three games",
        author: "Michael Rothstein",
        description:
            "Kearse, 26, signed with the Lions in March after four seasons in Minnesota, where he played in 62 games with five starts, making 79 tackles and defending eight passes.",
        shortdesc:
            "Kearse, 26, signed with the Lions in March after four seasons in Minnesota, where he played in 62 games with five starts",
        image: "assets/images/fullApps/newsapp/news1b.jpg",
        imgurl:
            "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/newsapp%2Fnews1b.jpg?alt=media&token=d3ef5894-0463-427d-9ad0-3f9fb18a79ef",
        hash: "L8CY%r9X5i\$*_4IUIUXQ--s;s=s,",
        publshedAt: "Dec 12,2020",
        newstype: "Hot"));

    newslist.add(new Article(
        title:
            "Tesla stock falls further after Elon Musk loses \$15B in single day",
        author: "Noah Manskar",
        description:
            "Tesla’s stock price fell for the fourth straight day Tuesday after its massive Monday plunge wiped \$15 billion off CEO Elon Musk’s net worth. The electric-car maker’s shares slipped 4.9 percent to \$679.40 in premarket trading as of 8:03 a.m., putting it on tr…",
        shortdesc:
            "Tesla’s stock price fell for the fourth straight day Tuesday after its massive Monday plunge wiped \$15 billion off CEO Elon Musk’s net worth. The electric-car maker’s shares slipped 4.9 percent to \$679.40 in premarket trading as of 8:03 a.m.",
        image: "assets/images/fullApps/newsapp/news1c.jpg",
        imgurl:
            "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/newsapp%2Fnews1c.jpg?alt=media&token=8e0cef0d-af33-4fa4-8d7a-665969eabc03",
        hash: "L2Dbo}mU00Ac03Kh0MEc|,}[^-Mw",
        publshedAt: "Dec 15,2020",
        newstype: "Hot"));

    return newslist;
  }
}
