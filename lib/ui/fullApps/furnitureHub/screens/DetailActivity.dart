import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:octo_image/octo_image.dart';
import 'package:smartkit_pro/ui/fullApps/furnitureHub/helper/ColorsRes.dart';
import 'package:smartkit_pro/ui/fullApps/furnitureHub/helper/DesignConfig.dart';
import 'package:smartkit_pro/ui/fullApps/furnitureHub/helper/StringsRes.dart';
import 'package:smartkit_pro/ui/fullApps/furnitureHub/models/ColorModel.dart';

import '../../widgets/slideAnimation.dart';
import 'MainActivity.dart';

// ignore: must_be_immutable
class DetailActivity extends StatefulWidget {
  String? name, description, rating, price, like, image, imgurl, hash;
  List<ColorModel>? color;
  int? quantity;
  DetailActivity(
      {Key? key,
      this.name,
      this.description,
      this.rating,
      this.quantity,
      this.price,
      this.like,
      this.color,
      this.image,
      this.imgurl,
      this.hash})
      : super(key: key);

  @override
  _DetailActivityState createState() => _DetailActivityState();
}

class _DetailActivityState extends State<DetailActivity>
    with SingleTickerProviderStateMixin {
  AnimationController? _animationController;
  @override
  void initState() {
    _animationController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 2000));
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _animationController!.dispose();
  }

  int? colorSelect = 1;

  Widget colorList() {
    return Container(
      height: 40,
      margin: EdgeInsets.only(left: 8),
      child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: widget.color!.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
                child: Container(
                  decoration: colorSelect == index
                      ? DesignConfig.buttonShadowColorListColor(ColorsRes.white)
                      : DesignConfig.buttonShadowColorListColor(
                          Colors.transparent),
                  margin: EdgeInsets.only(left: 20.0),
                  padding: EdgeInsets.all(5),
                  child: CircleAvatar(
                      backgroundColor: widget.color![index].color, radius: 10),
                ),
                onTap: () {
                  setState(() {
                    colorSelect = index;
                  });
                });
          }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorsRes.backgroundColor,
        appBar: AppBar(
          backgroundColor: ColorsRes.backgroundColor,
          shadowColor: Colors.transparent,
          leading: SlideAnimation(
            position: 1,
            itemCount: 8,
            slideDirection: SlideDirection.fromTop,
            animationController: _animationController,
            child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child:
                    Icon(Icons.arrow_back_ios, color: ColorsRes.violateColor)),
          ),
          actions: [
            SlideAnimation(
              position: 1,
              itemCount: 8,
              slideDirection: SlideDirection.fromTop,
              animationController: _animationController,
              child: GestureDetector(
                  onTap: () {
                    setState(() {
                      if (widget.like == "1") {
                        widget.like = "0";
                      } else {
                        widget.like = "1";
                      }
                    });
                  },
                  child: Padding(
                      padding: EdgeInsets.only(right: 20.0),
                      child: widget.like == "1"
                          ? Icon(Icons.favorite, color: ColorsRes.redColor)
                          : Icon(Icons.favorite_border,
                              color: ColorsRes.redColor))),
            ),
          ],
        ),
        bottomNavigationBar: SlideAnimation(
          position: 5,
          itemCount: 8,
          slideDirection: SlideDirection.fromBottom,
          animationController: _animationController,
          child: Container(
              decoration: DesignConfig.halfCurve(ColorsRes.white, 30.0, 30.0),
              height: MediaQuery.of(context).size.height / 3.8,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                        padding:
                            EdgeInsets.only(left: 30.0, right: 30.0, top: 25.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              StringsRes.colorText,
                              style: TextStyle(
                                  color: ColorsRes.violateColor,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold),
                            ),
                            Expanded(child: colorList()),
                          ],
                        )),
                    Padding(
                        padding:
                            EdgeInsets.only(left: 30.0, right: 30.0, top: 14.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              StringsRes.quantityText,
                              style: TextStyle(
                                  color: ColorsRes.violateColor,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold),
                            ),
                            Expanded(
                              child: Align(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          if (widget.quantity! > 1) {
                                            widget.quantity =
                                                (widget.quantity! - 1);
                                          }
                                        });
                                      },
                                      child: Container(
                                          margin: EdgeInsets.only(
                                              top: 10.0,
                                              bottom: 5.0,
                                              left: 10.0,
                                              right: 20.0),
                                          decoration:
                                              DesignConfig.buttonShadowColor(
                                                  ColorsRes.white, 20.0),
                                          padding: EdgeInsets.only(
                                              bottom: 5.0,
                                              top: 5.0,
                                              left: 5.0,
                                              right: 5.0),
                                          child: Icon(Icons.remove,
                                              color: ColorsRes.greyColor,
                                              size: 18.0)),
                                    ),
                                    Text(widget.quantity.toString(),
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: ColorsRes.violateColor)),
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          widget.quantity =
                                              (widget.quantity! + 1);
                                        });
                                      },
                                      child: Container(
                                          margin: EdgeInsets.only(
                                              top: 10.0,
                                              bottom: 5.0,
                                              left: 20.0),
                                          decoration:
                                              DesignConfig.buttonShadowColor(
                                                  ColorsRes.white, 20.0),
                                          padding: EdgeInsets.only(
                                              bottom: 5.0,
                                              top: 5.0,
                                              left: 5.0,
                                              right: 5.0),
                                          child: Icon(Icons.add,
                                              color: ColorsRes.violateColor,
                                              size: 18.0)),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        )),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MainActivity(id: 2),
                          ),
                        );
                      },
                      child: Container(
                        margin: EdgeInsets.only(top: 20.0),
                        padding: EdgeInsets.only(
                            left: 30.0, right: 30.0, top: 10.0, bottom: 10.0),
                        decoration: DesignConfig.boxDecorationContainer(
                            ColorsRes.greenColor, 20.0),
                        child: Text(
                          StringsRes.addToCartText,
                          style: TextStyle(
                              fontSize: 14,
                              color: ColorsRes.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ])),
        ),
        body: Container(
            color: ColorsRes.backgroundColor,
            child: Column(children: [
              SlideAnimation(
                  position: 1,
                  itemCount: 8,
                  slideDirection: SlideDirection.fromBottom,
                  animationController: _animationController,
                  child: Container(
                    margin: EdgeInsets.only(top: 20.0, left: 30.0, right: 30.0),
                    padding:
                        EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
                    height: MediaQuery.of(context).size.height / 2.69,
                    decoration: DesignConfig.buttonShadowDetalColor(
                        ColorsRes.white, 10.0),
                    child: Column(children: [
                      ClipRRect(
                          borderRadius: BorderRadius.circular(10.0),
                          child: OctoImage(
                            image: CachedNetworkImageProvider(widget.imgurl!),
                            placeholderBuilder: OctoPlaceholder.blurHash(
                              widget.hash!,
                            ),
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height / 4,
                            errorBuilder:
                                OctoError.icon(color: ColorsRes.black),
                            fit: BoxFit.fill,
                          )),
                      SizedBox(height: 14.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            widget.name!,
                            style: TextStyle(
                                color: ColorsRes.violateColor,
                                fontSize: 17,
                                fontWeight: FontWeight.bold),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 10.0, bottom: 5.0),
                            decoration: DesignConfig.buttonShadowColor(
                                ColorsRes.yellowColor, 20.0),
                            padding: EdgeInsets.only(
                                bottom: 6.0, top: 6.0, left: 20.0, right: 20.0),
                            child: Text(widget.price!,
                                style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold,
                                    color: ColorsRes.white)),
                          ),
                        ],
                      ),
                    ]),
                  )),
              SizedBox(height: 30.0),
              SlideAnimation(
                position: 3,
                itemCount: 8,
                slideDirection: SlideDirection.fromBottom,
                animationController: _animationController,
                child: Padding(
                  padding: const EdgeInsets.only(left: 30.0, right: 30.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        StringsRes.itemDescriptionText,
                        style: TextStyle(
                            color: ColorsRes.violateColor,
                            fontSize: 14,
                            fontWeight: FontWeight.bold),
                      ),
                      DesignConfig.displayRating(widget.rating!, true),
                    ],
                  ),
                ),
              ),
              SlideAnimation(
                position: 4,
                itemCount: 8,
                slideDirection: SlideDirection.fromBottom,
                animationController: _animationController,
                child: Padding(
                    padding: const EdgeInsets.only(
                        left: 30.0, right: 30.0, top: 14.0),
                    child: Text(
                      widget.description!,
                      style: TextStyle(
                          color: ColorsRes.greyColor,
                          fontSize: 12,
                          fontWeight: FontWeight.normal),
                    )),
              ),
            ])));
  }
}
