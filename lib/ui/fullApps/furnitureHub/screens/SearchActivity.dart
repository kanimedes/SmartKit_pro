import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:octo_image/octo_image.dart';
import 'package:smartkit_pro/ui/fullApps/furnitureHub/helper/ColorsRes.dart';
import 'package:smartkit_pro/ui/fullApps/furnitureHub/helper/DesignConfig.dart';
import 'package:smartkit_pro/ui/fullApps/furnitureHub/helper/StringsRes.dart';
import 'package:smartkit_pro/ui/fullApps/furnitureHub/models/Search_Model.dart';

import '../../widgets/slideAnimation.dart';

class SearchActivity extends StatefulWidget {
  const SearchActivity({Key? key}) : super(key: key);

  @override
  _SearchActivityState createState() => _SearchActivityState();
}

class _SearchActivityState extends State<SearchActivity>
    with TickerProviderStateMixin {
  AnimationController? _animationController;
  List<String> searchHistoryList = [
    "Kitchen & Dining",
    "Accent Chairs",
    "Bar stools",
    "Office Furniture",
    "Folding Chairs",
    "Stacking Chairs",
    "Living Room Furniture",
    "Garden chairss",
  ];

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 2000));
  }

  @override
  void dispose() {
    super.dispose();
    _animationController!.dispose();
  }

  Widget searchKeywordData() {
    return Wrap(
        crossAxisAlignment: WrapCrossAlignment.start,
        spacing: 10,
        runSpacing: 15.0,
        children: List.generate(
            searchHistoryList.length >= 10 ? 10 : searchHistoryList.length,
            (i) => SlideAnimation(
                  position: i,
                  itemCount: searchHistoryList.length,
                  slideDirection: SlideDirection.fromBottom,
                  animationController: _animationController,
                  child: GestureDetector(
                    onTap: () {},
                    child: Container(
                        decoration: DesignConfig.boxDecorationBorderButtonColor(
                            ColorsRes.greyColor, 50),
                        padding: EdgeInsetsDirectional.only(
                            start: 10, end: 10, top: 10, bottom: 10),
                        child: Text(searchHistoryList[i].trim(),
                            style: TextStyle(
                              height: 1.0,
                              color: ColorsRes.greyColor,
                              fontSize: 12,
                              fontWeight: FontWeight.normal,
                            ))),
                  ),
                )));
  }

  Widget resentSearchData() {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height / 1.6,
      color: ColorsRes.backgroundColor,
      child: ListView.builder(
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          itemCount: searchList.length,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (BuildContext context, int index) {
            return SlideAnimation(
              position: index,
              itemCount: searchList.length,
              slideDirection: SlideDirection.fromBottom,
              animationController: _animationController,
              child: GestureDetector(
                onTap: () {},
                child: Container(
                  decoration: DesignConfig.buttonShadowDetalColor(
                      ColorsRes.white, 10.0),
                  margin: EdgeInsets.only(
                    right: 20.0,
                    top: 10.0,
                  ),
                  padding: EdgeInsets.only(top: 12, bottom: 12.0, left: 12.0),
                  child: Stack(
                    children: [
                      Column(
                        children: [
                          Row(
                            children: [
                              Stack(children: <Widget>[
                                Card(
                                  margin: EdgeInsets.only(bottom: 0.0),
                                  shape: DesignConfig.setRoundedBorder(
                                      Colors.transparent, 10, false),
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  child: OctoImage(
                                    image: CachedNetworkImageProvider(
                                      searchList[index].imgurl!,
                                    ),
                                    placeholderBuilder:
                                        OctoPlaceholder.blurHash(
                                      searchList[index].hash!,
                                    ),
                                    errorBuilder:
                                        OctoError.icon(color: ColorsRes.black),
                                    fit: BoxFit.cover,
                                    width: 105,
                                    height: 105,
                                  ),
                                ),
                              ]),
                              SizedBox(width: 20),
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(searchList[index].name!,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            fontSize: 14,
                                            color: ColorsRes.violateColor,
                                            fontWeight: FontWeight.bold,
                                            letterSpacing: 0.5)),
                                    SizedBox(height: 5),
                                    Text(
                                      searchList[index].description!,
                                      style: TextStyle(
                                          fontSize: 10,
                                          color: ColorsRes.greyColor
                                              .withOpacity(0.7),
                                          fontWeight: FontWeight.normal),
                                      maxLines: 3,
                                    ),
                                    SizedBox(height: 5),
                                    Text(
                                      searchList[index].price!,
                                      style: TextStyle(
                                          fontSize: 13,
                                          color: ColorsRes.yellowColor
                                              .withOpacity(0.7),
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              if (searchList[index].quantity! >
                                                  1) {
                                                searchList[index].quantity =
                                                    (searchList[index]
                                                            .quantity! -
                                                        1);
                                              }
                                            });
                                          },
                                          child: Container(
                                              margin: EdgeInsets.only(
                                                  top: 10.0,
                                                  bottom: 5.0,
                                                  right: 10.0),
                                              decoration: DesignConfig
                                                  .buttonShadowColor(
                                                      ColorsRes.white, 20.0),
                                              padding: EdgeInsets.only(
                                                  bottom: 5.0,
                                                  top: 5.0,
                                                  left: 5.0,
                                                  right: 5.0),
                                              child: Icon(Icons.remove,
                                                  color: ColorsRes.greyColor,
                                                  size: 10.0)),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              top: 10.0, bottom: 5.0),
                                          child: Text(
                                              searchList[index]
                                                  .quantity
                                                  .toString(),
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.bold,
                                                  color:
                                                      ColorsRes.violateColor)),
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              searchList[index].quantity =
                                                  (searchList[index].quantity! +
                                                      1);
                                            });
                                          },
                                          child: Container(
                                              margin: EdgeInsets.only(
                                                  top: 10.0,
                                                  bottom: 5.0,
                                                  left: 10.0),
                                              decoration: DesignConfig
                                                  .buttonShadowColor(
                                                      ColorsRes.white, 20.0),
                                              padding: EdgeInsets.only(
                                                  bottom: 5.0,
                                                  top: 5.0,
                                                  left: 5.0,
                                                  right: 5.0),
                                              child: Icon(Icons.add,
                                                  color: ColorsRes.yellowColor,
                                                  size: 10.0)),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 5),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: GestureDetector(
                          onTap: () {},
                          child: Container(
                              margin: EdgeInsets.only(
                                  top: 1.0, bottom: 5.0, right: 10.0),
                              decoration: DesignConfig.buttonShadowColor(
                                  ColorsRes.backgroundColor, 20.0),
                              padding: EdgeInsets.only(
                                  bottom: 5.0, top: 5.0, left: 5.0, right: 5.0),
                              child: Icon(Icons.close,
                                  color: ColorsRes.greyColor, size: 10.0)),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorsRes.backgroundColor,
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: ColorsRes.backgroundColor,
          shadowColor: Colors.transparent,
          automaticallyImplyLeading: false,
          title: SlideAnimation(
            position: 1,
            itemCount: 11,
            slideDirection: SlideDirection.fromTop,
            animationController: _animationController,
            child: Container(
              height: 40,
              decoration: DesignConfig.boxDecorationContainer(
                  ColorsRes.creamColor, 20.0),
              child: TextField(
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(top: 7.0),
                    prefixIcon: Icon(
                      Icons.search,
                      color: ColorsRes.violateColor,
                    ),
                    border: InputBorder.none),
                cursorColor: ColorsRes.violateColor,
                style: TextStyle(color: ColorsRes.violateColor, fontSize: 14),
              ),
            ),
          ),
          actions: [
            SlideAnimation(
              position: 2,
              itemCount: 11,
              slideDirection: SlideDirection.fromTop,
              animationController: _animationController,
              child: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Padding(
                  padding: EdgeInsets.only(right: 15, top: 15),
                  child: Text(
                    StringsRes.cancelText,
                    style: TextStyle(
                        fontSize: 18,
                        color: ColorsRes.purpalColor,
                        fontWeight: FontWeight.normal),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ],
          bottom: PreferredSize(
            child: Divider(
              color: ColorsRes.greyColor,
              height: 2.3,
            ),
            preferredSize: Size(50, 5),
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
              margin: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width / 20, top: 5.0),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: MediaQuery.of(context).size.height / 99),
                    SlideAnimation(
                      position: 2,
                      itemCount: 11,
                      slideDirection: SlideDirection.fromLeft,
                      animationController: _animationController,
                      child: Text(
                        StringsRes.topKeywordsText,
                        style: TextStyle(
                            color: ColorsRes.violateColor,
                            fontSize: 19,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height / 40),
                    searchKeywordData(),
                    SizedBox(height: MediaQuery.of(context).size.height / 40),
                    SlideAnimation(
                      position: 2,
                      itemCount: 11,
                      slideDirection: SlideDirection.fromLeft,
                      animationController: _animationController,
                      child: Text(
                        StringsRes.recentSearchText,
                        style: TextStyle(
                            color: ColorsRes.violateColor,
                            fontSize: 19,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height / 40),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 1.1,
                      child: resentSearchData(),
                    ),
                    //categoryData(),
                  ])),
        ));
  }
}
