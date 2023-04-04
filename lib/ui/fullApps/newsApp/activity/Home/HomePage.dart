import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:octo_image/octo_image.dart';

import 'package:smartkit_pro/ui/fullApps/newsApp/activity/Home/NewsDetail.dart';
import 'package:smartkit_pro/ui/fullApps/newsApp/activity/NotificationList.dart';
import 'package:smartkit_pro/ui/fullApps/newsApp/activity/Profile/NewArticle.dart';
import 'package:smartkit_pro/ui/fullApps/newsApp/activity/SearchPage.dart';
import 'package:smartkit_pro/ui/fullApps/newsApp/helper/ButtonClickAnimation.dart';
import 'package:smartkit_pro/ui/fullApps/newsApp/helper/ColorsRes.dart';
import 'package:smartkit_pro/ui/fullApps/newsApp/helper/DesignConfig.dart';
import 'package:smartkit_pro/ui/fullApps/newsApp/helper/StringsRes.dart';
import 'package:smartkit_pro/ui/fullApps/newsApp/model/Article.dart';
import 'package:smartkit_pro/ui/fullApps/newsApp/model/Category.dart';

import '../MainActivity.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late List<Category> categorylist;

  TabController? tabController;
  int pageno = 0;
  Category? selectedcategory;

  final controller = PageController(
    initialPage: 0,
  );

  @override
  void initState() {
    super.initState();
    categorylist = [];

    setData();
  }

  setData() async {
    categorylist = setCategoryList();

    selectedcategory = categorylist[0];

    tabController = new TabController(vsync: this, length: categorylist.length);
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.dark,
      ),
      child: Scaffold(
          body: DefaultTabController(
              length: categorylist.length,
              child: NestedScrollView(
                headerSliverBuilder:
                    (BuildContext context, bool innerBoxIsScrolled) {
                  return <Widget>[
                    SliverAppBar(
                      backgroundColor: ColorsRes.white,
                      leading: IconButton(
                        icon: Icon(Icons.add_box_outlined),
                        onPressed: () {
                          Navigator.of(context).push(CupertinoPageRoute(
                              builder: (context) => NewArticle()));
                        },
                      ),
                      title: Text(StringsRes.mainappname,
                          style: new TextStyle(
                              color: ColorsRes.black,
                              fontWeight: FontWeight.bold)),
                      iconTheme: IconThemeData(
                        color: ColorsRes.appcolor,
                      ),
                      actions: <Widget>[
                        IconButton(
                            icon: Icon(
                              Icons.search,
                              color: ColorsRes.appcolor,
                            ),
                            onPressed: () {
                              Navigator.of(context).push(CupertinoPageRoute(
                                  builder: (context) => SearchPage()));
                            }),
                        IconButton(
                            icon: Icon(Icons.notifications_none_outlined,
                                color: ColorsRes.appcolor),
                            onPressed: () {
                              Navigator.of(context).push(CupertinoPageRoute(
                                  builder: (context) => NotificationList()));
                            }),
                      ],
                      floating: true,
                      pinned: true,
                      snap: false,
                      primary: true,
                      forceElevated: innerBoxIsScrolled,
                      bottom: TabBar(
                        indicatorColor: ColorsRes.blue,
                        labelColor: ColorsRes.blue,
                        unselectedLabelColor: ColorsRes.grey,
                        isScrollable: true,
                        labelStyle: Theme.of(context)
                            .textTheme
                            .subtitle1!
                            .merge(TextStyle(fontWeight: FontWeight.bold)),
                        unselectedLabelStyle: Theme.of(context)
                            .textTheme
                            .button!
                            .merge(TextStyle(fontWeight: FontWeight.w400)),
                        controller: tabController,
                        onTap: (int tabno) {
                          pageno = tabno;
                          controller.jumpToPage(tabno);
                          selectedcategory = categorylist[tabno];
                        },
                        tabs: categorylist
                            .map(
                                (Category category) => Tab(text: category.name))
                            .toList(),
                      ),
                    ),
                  ];
                },
                body: categorylist.isEmpty
                    ? Container()
                    : PageView(
                        controller: controller,
                        onPageChanged: (int pno) {
                          pageno = pno;
                          tabController!.index = pno;
                          selectedcategory = categorylist[pno];
                        },
                        children: categorylist.map((item) {
                          return setDetailPageContent(item);
                        }).toList(),
                      ),
              ))),
    );
  }

  Widget setDetailPageContent(Category category) {
    List<Article> toplist = setNewsList(category.id);
    List<Article> bottomlist = setNewsList(category.id);
    return SingleChildScrollView(
      child: Column(children: <Widget>[
        toplistWidget(toplist),
        bottomlistWidget(bottomlist),
      ]),
    );
  }

  Widget toplistWidget(List<Article> toplist) {
    return Container(
      height: 220,
      margin: EdgeInsets.only(left: 8),
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: toplist.length,
          itemBuilder: (BuildContext context, int index) {
            Article item = toplist[index];
            return ButtonClickAnimation(
              onTap: () {
                selectednews = item;
                Navigator.of(context).push(
                    CupertinoPageRoute(builder: (context) => NewsDetail()));
              },
              child: Container(
                width: 230,
                height: 220,
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                child: Stack(children: <Widget>[
                  Card(
                    shape: DesignConfig.setRoundedBorder(
                        Colors.transparent, 20, false),
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    child: OctoImage(
                      image: CachedNetworkImageProvider(item.imgurl!),
                      placeholderBuilder: OctoPlaceholder.blurHash(item.hash!),
                      errorBuilder: OctoError.icon(color: Colors.black),
                      fit: BoxFit.cover,
                      height: double.maxFinite,
                      width: double.maxFinite,
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: IntrinsicHeight(
                      child: Container(
                        width: double.maxFinite,
                        decoration: DesignConfig.boxDecorationContainerColor(
                            Colors.white, 10),
                        margin:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        padding:
                            EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "${item.title}",
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context).textTheme.caption!.merge(
                                  TextStyle(
                                      color: ColorsRes.black,
                                      fontWeight: FontWeight.bold)),
                            ),
                            Text(
                              "${item.publshedAt}",
                              style: Theme.of(context)
                                  .textTheme
                                  .caption!
                                  .merge(TextStyle(
                                    color: ColorsRes.grey,
                                  )),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                    padding: EdgeInsets.all(7),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(20),
                          topLeft: Radius.circular(20),
                        ),
                        color: ColorsRes.black.withOpacity(0.4)),
                    child: Row(mainAxisSize: MainAxisSize.min, children: [
                      GestureDetector(
                          onTap: () {}, child: Icon(Icons.bookmark)),
                      SizedBox(width: 5),
                      GestureDetector(onTap: () {}, child: Icon(Icons.share)),
                    ]),
                  ),
                ]),
              ),
            );
          }),
    );
  }

  Widget bottomlistWidget(List<Article> bottomlist) {
    return ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: bottomlist.length,
        itemBuilder: (BuildContext context, int index) {
          Article item = bottomlist[index];
          return ButtonClickAnimation(
            onTap: () {
              selectednews = item;
              Navigator.of(context)
                  .push(CupertinoPageRoute(builder: (context) => NewsDetail()));
            },
            child: Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(left: 10, right: 10, bottom: 10),
              child:
                  Row(crossAxisAlignment: CrossAxisAlignment.start, children: <
                      Widget>[
                Card(
                  shape: DesignConfig.setRoundedBorder(
                      Colors.transparent, 15, false),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: OctoImage(
                    image: CachedNetworkImageProvider(item.imgurl!),
                    placeholderBuilder: OctoPlaceholder.blurHash(item.hash!),
                    errorBuilder: OctoError.icon(color: Colors.black),
                    fit: BoxFit.cover,
                    height: 90,
                    width: 100,
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                    child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${item.title}",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.subtitle1!.merge(
                          TextStyle(
                              color: ColorsRes.black,
                              fontWeight: FontWeight.bold)),
                    ),
                    Text("${item.shortdesc}",
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.bodyText1),
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.all(2),
                          decoration: DesignConfig.boxDecorationContainerColor(
                              ColorsRes.red.withOpacity(0.5), 5),
                          child: Text(
                            item.newstype!,
                            style: Theme.of(context)
                                .textTheme
                                .caption!
                                .merge(TextStyle(color: ColorsRes.red)),
                          ),
                        ),
                        SizedBox(width: 8),
                        Expanded(
                            child: Text("${item.author}",
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .merge(TextStyle(color: ColorsRes.blue)))),
                      ],
                    ),
                    Text(
                      "${item.publshedAt}",
                      style:
                          Theme.of(context).textTheme.caption!.merge(TextStyle(
                                color: ColorsRes.grey,
                              )),
                    ),
                  ],
                )),
                GestureDetector(
                    onTap: () {},
                    child: Icon(
                      Icons.bookmark_border,
                      color: ColorsRes.appcolor,
                    )),
              ]),
            ),
          );
        });
  }

  List<Category> setCategoryList() {
    List<Category> categorylist = [];
    categorylist.add(new Category(id: 1, name: "Sports"));
    categorylist.add(new Category(id: 2, name: "Entertainment"));
    categorylist.add(new Category(id: 3, name: "Politics"));
    categorylist.add(new Category(id: 4, name: "Technology"));
    categorylist.add(new Category(id: 5, name: "Education"));
    categorylist.add(new Category(id: 6, name: "Health"));
    categorylist.add(new Category(id: 7, name: "Science"));
    categorylist.add(new Category(id: 8, name: "Economy"));
    return categorylist;
  }

  List<Article> setNewsList(int? categoryid) {
//filter list by categoryid

    List<Article> newslist = [];
    if (categoryid == 1) {
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
          image: "assets/images/fullApps/newsapp/news1b.jpg",
          imgurl:
              "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/newsapp%2Fnews1b.jpg?alt=media&token=d3ef5894-0463-427d-9ad0-3f9fb18a79ef",
          hash: "L8CY%r9X5i\$*_4IUIUXQ--s;s=s,",
          publshedAt: "Jun 12,2020",
          newstype: "Hot"));

      newslist.add(new Article(
          title: "New Lions safety Jayron Kearse suspended three games",
          author: "Michael Rothstein",
          description:
              "Kearse, 26, signed with the Lions in March after four seasons in Minnesota, where he played in 62 games with five starts, making 79 tackles and defending eight passes.",
          shortdesc:
              "Kearse, 26, signed with the Lions in March after four seasons in Minnesota, where he played in 62 games with five starts",
          image: "assets/images/fullApps/newsapp/news1c.jpg",
          imgurl:
              "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/newsapp%2Fnews1c.jpg?alt=media&token=8e0cef0d-af33-4fa4-8d7a-665969eabc03",
          hash: "L2Dbo}mU00Ac03Kh0MEc|,}[^-Mw",
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
          image: "assets/images/fullApps/newsapp/news1d.jpg",
          imgurl:
              "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/newsapp%2Fnews1d.jpg?alt=media&token=b269bac1-bb8b-4cb0-aaa9-503269da32de",
          hash: "L9H1iS~X0017Bw%MOe#*004-oi?F",
          publshedAt: "Dec 15,2020",
          newstype: "Hot"));

      newslist.add(new Article(
          title:
              "Tesla stock falls further after Elon Musk loses \$15B in single day",
          author: "Noah Manskar",
          description:
              "Tesla’s stock price fell for the fourth straight day Tuesday after its massive Monday plunge wiped \$15 billion off CEO Elon Musk’s net worth. The electric-car maker’s shares slipped 4.9 percent to \$679.40 in premarket trading as of 8:03 a.m., putting it on tr…",
          shortdesc:
              "Tesla’s stock price fell for the fourth straight day Tuesday after its massive Monday plunge wiped \$15 billion off CEO Elon Musk’s net worth. The electric-car maker’s shares slipped 4.9 percent to \$679.40 in premarket trading as of 8:03 a.m.",
          image: "assets/images/fullApps/newsapp/news1e.jpg",
          imgurl:
              "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/newsapp%2Fnews1e.jpg?alt=media&token=d41f05b2-56e2-44f2-8aee-fde8c49b8c45",
          hash: "LDH.4zH?~WM^n;-=e?wI0c%~Swx_",
          publshedAt: "Dec 15,2020",
          newstype: "Hot"));

      newslist.add(new Article(
          title:
              "Tesla stock falls further after Elon Musk loses \$15B in single day",
          author: "Noah Manskar",
          description:
              "Tesla’s stock price fell for the fourth straight day Tuesday after its massive Monday plunge wiped \$15 billion off CEO Elon Musk’s net worth. The electric-car maker’s shares slipped 4.9 percent to \$679.40 in premarket trading as of 8:03 a.m., putting it on tr…",
          shortdesc:
              "Tesla’s stock price fell for the fourth straight day Tuesday after its massive Monday plunge wiped \$15 billion off CEO Elon Musk’s net worth. The electric-car maker’s shares slipped 4.9 percent to \$679.40 in premarket trading as of 8:03 a.m.",
          image: "assets/images/fullApps/newsapp/news1f.jpg",
          imgurl:
              "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/newsapp%2Fnews1f.jpg?alt=media&token=6c914574-177f-47d8-beeb-404d68057e4c",
          hash: "L5B|sG}+5QCl.\$wbx[I^00O@^7+H",
          publshedAt: "Dec 15,2020",
          newstype: "Hot"));

      newslist.add(new Article(
          title:
              "Tesla stock falls further after Elon Musk loses \$15B in single day",
          author: "Noah Manskar",
          description:
              "Tesla’s stock price fell for the fourth straight day Tuesday after its massive Monday plunge wiped \$15 billion off CEO Elon Musk’s net worth. The electric-car maker’s shares slipped 4.9 percent to \$679.40 in premarket trading as of 8:03 a.m., putting it on tr…",
          shortdesc:
              "Tesla’s stock price fell for the fourth straight day Tuesday after its massive Monday plunge wiped \$15 billion off CEO Elon Musk’s net worth. The electric-car maker’s shares slipped 4.9 percent to \$679.40 in premarket trading as of 8:03 a.m.",
          image: "assets/images/fullApps/newsapp/news1g.jpg",
          imgurl:
              "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/newsapp%2Fnews1g.jpg?alt=media&token=04da1eda-d3b5-479e-9afc-bae1c973e0af",
          hash: "LCBMY=_N?H-:0056nOE2NMM|i_OU",
          publshedAt: "Dec 15,2020",
          newstype: "Hot"));
    } else if (categoryid == 2) {
      newslist.add(new Article(
          title: "Hurricane Hanna makes landfall around 5 p.m. on Saturday.",
          author: "Dan Peck",
          description:
              "Hurricane Hanna battered southern Texas with sustained winds of 75 mph and continued to deliver heavy rain and flash flooding as it moved inland late Saturday.",
          shortdesc:
              "Hurricane Hanna battered southern Texas with sustained winds of 75 mph and continued to deliver heavy rain and flash flooding",
          image: "assets/images/fullApps/newsapp/news3f.jpg",
          imgurl:
              "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/newsapp%2Fnews3f.jpg?alt=media&token=54d8c3af-7e38-46a0-abbc-e822af08936e",
          hash: "LHI}Y8Gc=@9Z.9~p4:%14p-nD%4.",
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
          image: "assets/images/fullApps/newsapp/news3e.jpg",
          imgurl:
              "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/newsapp%2Fnews3e.jpg?alt=media&token=b78ef6ef-df57-449a-9437-b6cb52d5db28",
          hash: "L9Gb*V00?w~po~00_3?a?vae%Loz",
          publshedAt: "Jun 12,2020",
          newstype: "Hot"));

      newslist.add(new Article(
          title: "New Lions safety Jayron Kearse suspended three games",
          author: "Michael Rothstein",
          description:
              "Kearse, 26, signed with the Lions in March after four seasons in Minnesota, where he played in 62 games with five starts, making 79 tackles and defending eight passes.",
          shortdesc:
              "Kearse, 26, signed with the Lions in March after four seasons in Minnesota, where he played in 62 games with five starts",
          image: "assets/images/fullApps/newsapp/news3d.jpg",
          imgurl:
              "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/newsapp%2Fnews3d.jpg?alt=media&token=d19db09d-4d0d-44c9-ac7e-2995e80aaa6b",
          hash: "LFDJI\$_3IpE1~p?bx]IURjxu%MM{",
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
          image: "assets/images/fullApps/newsapp/news3c.jpg",
          imgurl:
              "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/newsapp%2Fnews3c.jpg?alt=media&token=3d4fe117-a392-4320-9b80-5f0b8ab41329",
          hash: "LZFib^wHNs9byrIoVYVs?^RPnNbE",
          publshedAt: "Dec 15,2020",
          newstype: "Hot"));

      newslist.add(new Article(
          title:
              "Tesla stock falls further after Elon Musk loses \$15B in single day",
          author: "Noah Manskar",
          description:
              "Tesla’s stock price fell for the fourth straight day Tuesday after its massive Monday plunge wiped \$15 billion off CEO Elon Musk’s net worth. The electric-car maker’s shares slipped 4.9 percent to \$679.40 in premarket trading as of 8:03 a.m., putting it on tr…",
          shortdesc:
              "Tesla’s stock price fell for the fourth straight day Tuesday after its massive Monday plunge wiped \$15 billion off CEO Elon Musk’s net worth. The electric-car maker’s shares slipped 4.9 percent to \$679.40 in premarket trading as of 8:03 a.m.",
          image: "assets/images/fullApps/newsapp/news3b.jpg",
          imgurl:
              "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/newsapp%2Fnews3b.jpg?alt=media&token=1a77c0e6-0b3a-4bab-8927-d1f82051a094",
          hash: "LBEBsc^%0L0L~V^iIV9a0L9a%L-:",
          publshedAt: "Dec 15,2020",
          newstype: "Hot"));

      newslist.add(new Article(
          title:
              "Tesla stock falls further after Elon Musk loses \$15B in single day",
          author: "Noah Manskar",
          description:
              "Tesla’s stock price fell for the fourth straight day Tuesday after its massive Monday plunge wiped \$15 billion off CEO Elon Musk’s net worth. The electric-car maker’s shares slipped 4.9 percent to \$679.40 in premarket trading as of 8:03 a.m., putting it on tr…",
          shortdesc:
              "Tesla’s stock price fell for the fourth straight day Tuesday after its massive Monday plunge wiped \$15 billion off CEO Elon Musk’s net worth. The electric-car maker’s shares slipped 4.9 percent to \$679.40 in premarket trading as of 8:03 a.m.",
          image: "assets/images/fullApps/newsapp/news3a.jpg",
          imgurl:
              "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/newsapp%2Fnews3a.jpg?alt=media&token=ec26f20b-6dc0-47ef-9f0f-dac7e496d392",
          hash: "L6CrZZ9u0hI.=kNF-VNF0i#k}@=r",
          publshedAt: "Dec 15,2020",
          newstype: "Hot"));
    } else if (categoryid == 3) {
      newslist.add(new Article(
          title: "Hurricane Hanna makes landfall around 5 p.m. on Saturday.",
          author: "Dan Peck",
          description:
              "Hurricane Hanna battered southern Texas with sustained winds of 75 mph and continued to deliver heavy rain and flash flooding as it moved inland late Saturday.",
          shortdesc:
              "Hurricane Hanna battered southern Texas with sustained winds of 75 mph and continued to deliver heavy rain and flash flooding",
          image: "assets/images/fullApps/newsapp/news4a.jpg",
          imgurl:
              "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/newsapp%2Fnews4a.jpg?alt=media&token=0ff53d59-404c-4f12-96f8-3fecd07e5dec",
          hash: "LEFP1@_4EgEM?cbd9vR\$4:V@xFM{",
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
          image: "assets/images/fullApps/newsapp/news4b.jpg",
          imgurl:
              "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/newsapp%2Fnews4b.jpg?alt=media&token=c85c0887-113a-4aa9-bece-46f9aae5c27e",
          hash: "LcEC:}M{jsWV_4Rjs:ay%MR*oKbH",
          publshedAt: "Jun 12,2020",
          newstype: "Hot"));

      newslist.add(new Article(
          title: "New Lions safety Jayron Kearse suspended three games",
          author: "Michael Rothstein",
          description:
              "Kearse, 26, signed with the Lions in March after four seasons in Minnesota, where he played in 62 games with five starts, making 79 tackles and defending eight passes.",
          shortdesc:
              "Kearse, 26, signed with the Lions in March after four seasons in Minnesota, where he played in 62 games with five starts",
          image: "assets/images/fullApps/newsapp/news4c.jpg",
          imgurl:
              "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/newsapp%2Fnews4c.jpg?alt=media&token=be9283a5-2bee-4ca1-a609-6354d2622bb5",
          hash: "LHHAqxxv8|I]}rSKD*o#TeaK,nni",
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
          image: "assets/images/fullApps/newsapp/news4d.jpg",
          imgurl:
              "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/newsapp%2Fnews4d.jpg?alt=media&token=65f9a972-b237-4119-a5c5-a68f2671fc3e",
          hash: "LHGa??yDD+IV~ppIE1eno\$bvs8sn",
          publshedAt: "Dec 15,2020",
          newstype: "Hot"));

      newslist.add(new Article(
          title:
              "Tesla stock falls further after Elon Musk loses \$15B in single day",
          author: "Noah Manskar",
          description:
              "Tesla’s stock price fell for the fourth straight day Tuesday after its massive Monday plunge wiped \$15 billion off CEO Elon Musk’s net worth. The electric-car maker’s shares slipped 4.9 percent to \$679.40 in premarket trading as of 8:03 a.m., putting it on tr…",
          shortdesc:
              "Tesla’s stock price fell for the fourth straight day Tuesday after its massive Monday plunge wiped \$15 billion off CEO Elon Musk’s net worth. The electric-car maker’s shares slipped 4.9 percent to \$679.40 in premarket trading as of 8:03 a.m.",
          image: "assets/images/fullApps/newsapp/news4e.jpg",
          imgurl:
              "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/newsapp%2Fnews4e.jpg?alt=media&token=807196d4-81b3-46c6-a557-ae656edc2f75",
          hash: "LSI:tnz:[W;3};Ita#s9E,I.SgkC",
          publshedAt: "Dec 15,2020",
          newstype: "Hot"));

      newslist.add(new Article(
          title:
              "Tesla stock falls further after Elon Musk loses \$15B in single day",
          author: "Noah Manskar",
          description:
              "Tesla’s stock price fell for the fourth straight day Tuesday after its massive Monday plunge wiped \$15 billion off CEO Elon Musk’s net worth. The electric-car maker’s shares slipped 4.9 percent to \$679.40 in premarket trading as of 8:03 a.m., putting it on tr…",
          shortdesc:
              "Tesla’s stock price fell for the fourth straight day Tuesday after its massive Monday plunge wiped \$15 billion off CEO Elon Musk’s net worth. The electric-car maker’s shares slipped 4.9 percent to \$679.40 in premarket trading as of 8:03 a.m.",
          image: "assets/images/fullApps/newsapp/news4f.jpg",
          imgurl:
              "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/newsapp%2Fnews4f.jpg?alt=media&token=db196d99-d70e-4980-b0c4-f77c158b0b18",
          hash: "LQFYlcIU4nt7~qM{9FxuxvRjIUxu",
          publshedAt: "Dec 15,2020",
          newstype: "Hot"));
    } else if (categoryid == 4) {
      newslist.add(new Article(
          title: "Hurricane Hanna makes landfall around 5 p.m. on Saturday.",
          author: "Dan Peck",
          description:
              "Hurricane Hanna battered southern Texas with sustained winds of 75 mph and continued to deliver heavy rain and flash flooding as it moved inland late Saturday.",
          shortdesc:
              "Hurricane Hanna battered southern Texas with sustained winds of 75 mph and continued to deliver heavy rain and flash flooding",
          image: "assets/images/fullApps/newsapp/news2a.jpg",
          imgurl:
              "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/newsapp%2Fnews2a.jpg?alt=media&token=3f571927-699b-4b28-b187-33687dd66def",
          hash: "LaIXjn\$*NxW=_NS\$Ndn\$tmxDaeNb",
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
          image: "assets/images/fullApps/newsapp/news2b.jpg",
          imgurl:
              "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/newsapp%2Fnews2b.jpg?alt=media&token=78c1b4c4-88dd-4b55-863b-0d2a088bab17",
          hash: "LLAwu9_Nxui{%ht8aJoySwITM_R+",
          publshedAt: "Jun 12,2020",
          newstype: "Hot"));

      newslist.add(new Article(
          title: "New Lions safety Jayron Kearse suspended three games",
          author: "Michael Rothstein",
          description:
              "Kearse, 26, signed with the Lions in March after four seasons in Minnesota, where he played in 62 games with five starts, making 79 tackles and defending eight passes.",
          shortdesc:
              "Kearse, 26, signed with the Lions in March after four seasons in Minnesota, where he played in 62 games with five starts",
          image: "assets/images/fullApps/newsapp/news2c.jpg",
          imgurl:
              "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/newsapp%2Fnews2c.jpg?alt=media&token=9c115446-f005-4d6c-afa5-4a0cd9a70ffd",
          hash: "LPJHgkpJDi~WNMNGw[bd^jS4E1xt",
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
          image: "assets/images/fullApps/newsapp/news2d.jpg",
          imgurl:
              "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/newsapp%2Fnews2d.jpg?alt=media&token=b7599930-3108-4e9b-93a7-b716c9c7c988",
          hash: "L58Dkm:*0LCS0LxG~XI;5~F|Zf;M",
          publshedAt: "Dec 15,2020",
          newstype: "Hot"));

      newslist.add(new Article(
          title:
              "Tesla stock falls further after Elon Musk loses \$15B in single day",
          author: "Noah Manskar",
          description:
              "Tesla’s stock price fell for the fourth straight day Tuesday after its massive Monday plunge wiped \$15 billion off CEO Elon Musk’s net worth. The electric-car maker’s shares slipped 4.9 percent to \$679.40 in premarket trading as of 8:03 a.m., putting it on tr…",
          shortdesc:
              "Tesla’s stock price fell for the fourth straight day Tuesday after its massive Monday plunge wiped \$15 billion off CEO Elon Musk’s net worth. The electric-car maker’s shares slipped 4.9 percent to \$679.40 in premarket trading as of 8:03 a.m.",
          image: "assets/images/fullApps/newsapp/news2e.jpg",
          imgurl:
              "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/newsapp%2Fnews2e.jpg?alt=media&token=da8f49c7-c737-42fb-a36f-598c4f3fad10",
          hash: "LPIqr|Ipn\$WV?wMcslax.TsoNGs:",
          publshedAt: "Dec 15,2020",
          newstype: "Hot"));
    } else if (categoryid == 5) {
      newslist.add(new Article(
          title: "Hurricane Hanna makes landfall around 5 p.m. on Saturday.",
          author: "Dan Peck",
          description:
              "Hurricane Hanna battered southern Texas with sustained winds of 75 mph and continued to deliver heavy rain and flash flooding as it moved inland late Saturday.",
          shortdesc:
              "Hurricane Hanna battered southern Texas with sustained winds of 75 mph and continued to deliver heavy rain and flash flooding",
          image: "assets/images/fullApps/newsapp/news5a.jpg",
          imgurl:
              "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/newsapp%2Fnews5a.jpg?alt=media&token=9e8454f5-0b07-408c-87b1-c5be4d039fef",
          hash: "LDIq_h~oNc%\$?v9as+~V?G%1xDM|",
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
          image: "assets/images/fullApps/newsapp/news5b.jpg",
          imgurl:
              "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/newsapp%2Fnews5b.jpg?alt=media&token=e22c77d1-c372-48b6-a611-90c7b77f435c",
          hash: "LGIqlm004..8~q9Z%Mxu.8ozMxRP",
          publshedAt: "Jun 12,2020",
          newstype: "Hot"));

      newslist.add(new Article(
          title: "New Lions safety Jayron Kearse suspended three games",
          author: "Michael Rothstein",
          description:
              "Kearse, 26, signed with the Lions in March after four seasons in Minnesota, where he played in 62 games with five starts, making 79 tackles and defending eight passes.",
          shortdesc:
              "Kearse, 26, signed with the Lions in March after four seasons in Minnesota, where he played in 62 games with five starts",
          image: "assets/images/fullApps/newsapp/news2c.jpg",
          imgurl:
              "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/newsapp%2Fnews5c.jpg?alt=media&token=8c703625-b3cf-4330-beb8-ca12d70f514d",
          hash: "LEJacj00?vWDHq_NjZaKo}Vs%MRP",
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
          image: "assets/images/fullApps/newsapp/news5d.jpg",
          imgurl:
              "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/newsapp%2Fnews5d.jpg?alt=media&token=74880e6b-039f-4037-bc96-1c1c8881a881",
          hash: "LBHBVm0g_NI901Dh~pEQ_Mo#sDn#",
          publshedAt: "Dec 15,2020",
          newstype: "Hot"));

      newslist.add(new Article(
          title:
              "Tesla stock falls further after Elon Musk loses \$15B in single day",
          author: "Noah Manskar",
          description:
              "Tesla’s stock price fell for the fourth straight day Tuesday after its massive Monday plunge wiped \$15 billion off CEO Elon Musk’s net worth. The electric-car maker’s shares slipped 4.9 percent to \$679.40 in premarket trading as of 8:03 a.m., putting it on tr…",
          shortdesc:
              "Tesla’s stock price fell for the fourth straight day Tuesday after its massive Monday plunge wiped \$15 billion off CEO Elon Musk’s net worth. The electric-car maker’s shares slipped 4.9 percent to \$679.40 in premarket trading as of 8:03 a.m.",
          image: "assets/images/fullApps/newsapp/news5e.jpg",
          imgurl:
              "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/newsapp%2Fnews5e.jpg?alt=media&token=1021443b-9a68-408c-9d66-4fe664edaf59",
          hash: "L6B{}y~p8_V]I=~ptSIUa^%0?cIV",
          publshedAt: "Dec 15,2020",
          newstype: "Hot"));
    } else if (categoryid == 6) {
      newslist.add(new Article(
          title: "Hurricane Hanna makes landfall around 5 p.m. on Saturday.",
          author: "Dan Peck",
          description:
              "Hurricane Hanna battered southern Texas with sustained winds of 75 mph and continued to deliver heavy rain and flash flooding as it moved inland late Saturday.",
          shortdesc:
              "Hurricane Hanna battered southern Texas with sustained winds of 75 mph and continued to deliver heavy rain and flash flooding",
          image: "assets/images/fullApps/newsapp/news6a.jpg",
          imgurl:
              "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/newsapp%2Fnews6a.jpg?alt=media&token=6e6195f1-a547-4a07-969d-9826769a3132",
          hash: "LIE{a_Nb9G?H~q-pj]WB-p-;s:M{",
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
          image: "assets/images/fullApps/newsapp/news6b.jpg",
          imgurl:
              "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/newsapp%2Fnews6b.jpg?alt=media&token=d85831e9-7eb6-455a-9dd0-9339ee50dc3a",
          hash: "L6FYMt58FY-9-K-=%N?Z~A4oxu?b",
          publshedAt: "Jun 12,2020",
          newstype: "Hot"));

      newslist.add(new Article(
          title: "New Lions safety Jayron Kearse suspended three games",
          author: "Michael Rothstein",
          description:
              "Kearse, 26, signed with the Lions in March after four seasons in Minnesota, where he played in 62 games with five starts, making 79 tackles and defending eight passes.",
          shortdesc:
              "Kearse, 26, signed with the Lions in March after four seasons in Minnesota, where he played in 62 games with five starts",
          image: "assets/images/fullApps/newsapp/news6c.jpg",
          imgurl:
              "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/newsapp%2Fnews6c.jpg?alt=media&token=4b7c5f7f-a66b-45ef-9418-850aa04d4af8",
          hash: "L6FY+9TKE1~C~o=|-;Nd9}RiniIV",
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
          image: "assets/images/fullApps/newsapp/news6d.jpg",
          imgurl:
              "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/newsapp%2Fnews6d.jpg?alt=media&token=79f7e193-2aac-4869-94ff-d0eb34e72376",
          hash: "L9D908Kj02IB~pxvIUNF9cRnx@s+",
          publshedAt: "Dec 15,2020",
          newstype: "Hot"));

      newslist.add(new Article(
          title:
              "Tesla stock falls further after Elon Musk loses \$15B in single day",
          author: "Noah Manskar",
          description:
              "Tesla’s stock price fell for the fourth straight day Tuesday after its massive Monday plunge wiped \$15 billion off CEO Elon Musk’s net worth. The electric-car maker’s shares slipped 4.9 percent to \$679.40 in premarket trading as of 8:03 a.m., putting it on tr…",
          shortdesc:
              "Tesla’s stock price fell for the fourth straight day Tuesday after its massive Monday plunge wiped \$15 billion off CEO Elon Musk’s net worth. The electric-car maker’s shares slipped 4.9 percent to \$679.40 in premarket trading as of 8:03 a.m.",
          image: "assets/images/fullApps/newsapp/news6e.jpg",
          imgurl:
              "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/newsapp%2Fnews6e.jpg?alt=media&token=8b12b972-536c-4b5e-8901-050ad96ae788",
          hash: "LKJ*6V%dt0Iv~Ux^xvMx%NNHRjs:",
          publshedAt: "Dec 15,2020",
          newstype: "Hot"));
    } else {
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
          image: "assets/images/fullApps/newsapp/news1b.jpg",
          imgurl:
              "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/newsapp%2Fnews1b.jpg?alt=media&token=d3ef5894-0463-427d-9ad0-3f9fb18a79ef",
          hash: "L8CY%r9X5i\$*_4IUIUXQ--s;s=s,",
          publshedAt: "Jun 12,2020",
          newstype: "Hot"));

      newslist.add(new Article(
          title: "New Lions safety Jayron Kearse suspended three games",
          author: "Michael Rothstein",
          description:
              "Kearse, 26, signed with the Lions in March after four seasons in Minnesota, where he played in 62 games with five starts, making 79 tackles and defending eight passes.",
          shortdesc:
              "Kearse, 26, signed with the Lions in March after four seasons in Minnesota, where he played in 62 games with five starts",
          image: "assets/images/fullApps/newsapp/news1c.jpg",
          imgurl:
              "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/newsapp%2Fnews1c.jpg?alt=media&token=8e0cef0d-af33-4fa4-8d7a-665969eabc03",
          hash: "L2Dbo}mU00Ac03Kh0MEc|,}[^-Mw",
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
          image: "assets/images/fullApps/newsapp/news1d.jpg",
          imgurl:
              "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/newsapp%2Fnews1d.jpg?alt=media&token=b269bac1-bb8b-4cb0-aaa9-503269da32de",
          hash: "L9H1iS~X0017Bw%MOe#*004-oi?F",
          publshedAt: "Dec 15,2020",
          newstype: "Hot"));

      newslist.add(new Article(
          title:
              "Tesla stock falls further after Elon Musk loses \$15B in single day",
          author: "Noah Manskar",
          description:
              "Tesla’s stock price fell for the fourth straight day Tuesday after its massive Monday plunge wiped \$15 billion off CEO Elon Musk’s net worth. The electric-car maker’s shares slipped 4.9 percent to \$679.40 in premarket trading as of 8:03 a.m., putting it on tr…",
          shortdesc:
              "Tesla’s stock price fell for the fourth straight day Tuesday after its massive Monday plunge wiped \$15 billion off CEO Elon Musk’s net worth. The electric-car maker’s shares slipped 4.9 percent to \$679.40 in premarket trading as of 8:03 a.m.",
          image: "assets/images/fullApps/newsapp/news1e.jpg",
          imgurl:
              "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/newsapp%2Fnews1e.jpg?alt=media&token=d41f05b2-56e2-44f2-8aee-fde8c49b8c45",
          hash: "LDH.4zH?~WM^n;-=e?wI0c%~Swx_",
          publshedAt: "Dec 15,2020",
          newstype: "Hot"));

      newslist.add(new Article(
          title:
              "Tesla stock falls further after Elon Musk loses \$15B in single day",
          author: "Noah Manskar",
          description:
              "Tesla’s stock price fell for the fourth straight day Tuesday after its massive Monday plunge wiped \$15 billion off CEO Elon Musk’s net worth. The electric-car maker’s shares slipped 4.9 percent to \$679.40 in premarket trading as of 8:03 a.m., putting it on tr…",
          shortdesc:
              "Tesla’s stock price fell for the fourth straight day Tuesday after its massive Monday plunge wiped \$15 billion off CEO Elon Musk’s net worth. The electric-car maker’s shares slipped 4.9 percent to \$679.40 in premarket trading as of 8:03 a.m.",
          image: "assets/images/fullApps/newsapp/news1f.jpg",
          imgurl:
              "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/newsapp%2Fnews1f.jpg?alt=media&token=6c914574-177f-47d8-beeb-404d68057e4c",
          hash: "L5B|sG}+5QCl.\$wbx[I^00O@^7+H",
          publshedAt: "Dec 15,2020",
          newstype: "Hot"));

      newslist.add(new Article(
          title:
              "Tesla stock falls further after Elon Musk loses \$15B in single day",
          author: "Noah Manskar",
          description:
              "Tesla’s stock price fell for the fourth straight day Tuesday after its massive Monday plunge wiped \$15 billion off CEO Elon Musk’s net worth. The electric-car maker’s shares slipped 4.9 percent to \$679.40 in premarket trading as of 8:03 a.m., putting it on tr…",
          shortdesc:
              "Tesla’s stock price fell for the fourth straight day Tuesday after its massive Monday plunge wiped \$15 billion off CEO Elon Musk’s net worth. The electric-car maker’s shares slipped 4.9 percent to \$679.40 in premarket trading as of 8:03 a.m.",
          image: "assets/images/fullApps/newsapp/news1g.jpg",
          imgurl:
              "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/newsapp%2Fnews1g.jpg?alt=media&token=04da1eda-d3b5-479e-9afc-bae1c973e0af",
          hash: "LCBMY=_N?H-:0056nOE2NMM|i_OU",
          publshedAt: "Dec 15,2020",
          newstype: "Hot"));
    }
    return newslist;
  }
}
