import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:octo_image/octo_image.dart';
import 'package:smartkit_pro/ui/fullApps/furnitureHub/helper/ColorsRes.dart';
import 'package:smartkit_pro/ui/fullApps/furnitureHub/helper/DesignConfig.dart';
import 'package:smartkit_pro/ui/fullApps/furnitureHub/helper/StringsRes.dart';
import 'package:smartkit_pro/ui/fullApps/furnitureHub/models/WishListModel.dart';

import '../../widgets/slideAnimation.dart';
import 'DetailActivity.dart';

class WishListActivity extends StatefulWidget {
  const WishListActivity({Key? key}) : super(key: key);

  @override
  _WishListActivityState createState() => _WishListActivityState();
}

class _WishListActivityState extends State<WishListActivity>
    with SingleTickerProviderStateMixin {
  AnimationController? _animationController;
  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 2000));
  }

  @override
  void dispose() {
    _animationController!.dispose();
    super.dispose();
  }

  Widget wishListData() {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height / 1.2,
      color: ColorsRes.backgroundColor,
      child: ListView.builder(
          shrinkWrap: true,
          itemCount: wishList.length,
          itemBuilder: (BuildContext context, int index) {
            return SlideAnimation(
              position: index,
              itemCount: wishList.length,
              slideDirection: SlideDirection.fromBottom,
              animationController: _animationController,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailActivity(
                        name: wishList[index].name!,
                        like: wishList[index].like!,
                        rating: wishList[index].rating!,
                        description: wishList[index].description!,
                        price: wishList[index].price!,
                        quantity: wishList[index].quantity!,
                        color: wishList[index].colorList,
                        image: wishList[index].image,
                        imgurl: wishList[index].imgurl,
                        hash: wishList[index].hash,
                      ),
                    ),
                  );
                },
                child: Container(
                  decoration: DesignConfig.buttonShadowDetalColor(
                      ColorsRes.white, 10.0),
                  margin: EdgeInsets.only(
                    left: 20.0,
                    right: 20.0,
                    top: 10.0,
                  ),
                  padding: EdgeInsets.only(top: 12, bottom: 12.0, left: 12.0),
                  child: Column(
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
                                  wishList[index].imgurl!,
                                ),
                                placeholderBuilder: OctoPlaceholder.blurHash(
                                  wishList[index].hash!,
                                ),
                                errorBuilder:
                                    OctoError.icon(color: ColorsRes.black),
                                fit: BoxFit.cover,
                                width: 133,
                                height: 133,
                              ),
                            ),
                          ]),
                          SizedBox(width: 20),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(wishList[index].name!,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: ColorsRes.violateColor,
                                        fontWeight: FontWeight.bold,
                                        letterSpacing: 0.5)),
                                SizedBox(height: 5),
                                Text(
                                  wishList[index].description!,
                                  style: TextStyle(
                                      fontSize: 10,
                                      color:
                                          ColorsRes.greyColor.withOpacity(0.7),
                                      fontWeight: FontWeight.normal),
                                  maxLines: 3,
                                ),
                                SizedBox(height: 5),
                                Text(
                                  wishList[index].price!,
                                  style: TextStyle(
                                      fontSize: 13,
                                      color: ColorsRes.yellowColor
                                          .withOpacity(0.7),
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(height: 10),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      padding: EdgeInsets.only(
                                          left: 10.0,
                                          right: 10.0,
                                          top: 5.0,
                                          bottom: 5.0),
                                      decoration:
                                          DesignConfig.boxDecorationContainer(
                                              ColorsRes.greenColor, 20.0),
                                      child: Text(
                                        StringsRes.moveToCartText,
                                        style: TextStyle(
                                            fontSize: 10,
                                            color: ColorsRes.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    SizedBox(width: 20.0),
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          if (wishList[index].like == "1") {
                                            wishList[index].like = "0";
                                          } else {
                                            wishList[index].like = "1";
                                          }
                                        });
                                      },
                                      child: Icon(
                                        wishList[index].like == "1"
                                            ? Icons.favorite
                                            : Icons.favorite_border,
                                        color: ColorsRes.redColor,
                                        size: 20.0,
                                      ),
                                    ),
                                    SizedBox(height: 5),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
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
    _animationController!.repeat();
    return Scaffold(
        backgroundColor: ColorsRes.backgroundColor,
        appBar: AppBar(
          backgroundColor: ColorsRes.backgroundColor,
          shadowColor: Colors.transparent,
          title: Text(
            StringsRes.wishListText,
            style: TextStyle(
                color: ColorsRes.violateColor,
                fontSize: 18,
                fontWeight: FontWeight.bold),
          ),
          bottom: PreferredSize(
            child: Divider(
              color: ColorsRes.greyColor,
              height: 2.3,
            ),
            preferredSize: Size(50, 5),
          ),
          centerTitle: true,
          automaticallyImplyLeading: false,
        ),
        body: SingleChildScrollView(
          child: Container(
            color: ColorsRes.backgroundColor,
            child: Column(children: [
              SizedBox(height: MediaQuery.of(context).size.height / 99),
              wishListData(),
            ]),
          ),
        ));
  }
}
