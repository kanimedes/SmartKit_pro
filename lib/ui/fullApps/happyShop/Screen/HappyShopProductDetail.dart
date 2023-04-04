// ignore_for_file: prefer_final_fields

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:octo_image/octo_image.dart';

import 'package:smartkit_pro/ui/fullApps/happyShop/Helper/HappyShopColor.dart';
import 'package:smartkit_pro/ui/fullApps/happyShop/Helper/HappyShopString.dart';
import 'HappyShopCart.dart';
import 'HappyShopProductPriview.dart';

class HappyShopProductDetail extends StatefulWidget {
  HappyShopProductDetail({
    Key? key,
    this.imgurl,
    this.tag,
    this.imagelisturl,
    this.localimg,
  }) : super(key: key);
  final String? imgurl, tag, localimg;
  List? imagelisturl;
  @override
  _HappyShopProductDetailState createState() => _HappyShopProductDetailState();
}

class _HappyShopProductDetailState extends State<HappyShopProductDetail>
    with TickerProviderStateMixin {
  int currentIndex = 0;
  PageController? _controller;
  bool descTextShowFlag = false;

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  ChoiceChip? choiceChip;
  int _selVarient = 0, _oldSelVarient = 0;

  int offset = 0;
  int total = 0;
  bool isLoadingmore = true;
  ScrollController controller = new ScrollController();

  bool _isCommentEnable = false;
  final TextEditingController _commentC = new TextEditingController();
  double initialRate = 0;
  Animation? buttonSqueezeanimation;
  late AnimationController buttonController;

  List sliderList = [
    "assets/images/goggle2.jpg",
    "assets/images/goggle3.jpg",
    "assets/images/goggle3.jpg",
    "assets/images/goggle3.jpg",
    "assets/images/goggle3.jpg",
    "assets/images/goggle3.jpg",
    "assets/images/goggle3.jpg",
  ];
  @override
  void initState() {
    super.initState();
    _controller = PageController(initialPage: 0);
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: [SystemUiOverlay.bottom]);
    buttonController = new AnimationController(
        duration: new Duration(milliseconds: 2000), vsync: this);

    buttonSqueezeanimation = new Tween(
      begin: deviceWidth * 0.7,
      end: 50.0,
    ).animate(new CurvedAnimation(
      parent: buttonController,
      curve: new Interval(
        0.0,
        0.150,
      ),
    ));
  }

  List reviewList = [
    {""}
  ];

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: [SystemUiOverlay.top, SystemUiOverlay.bottom]);
    buttonController.dispose();
    super.dispose();
  }

  _showContent() {
    return Column(
      children: <Widget>[
        Expanded(
          child: SingleChildScrollView(
            controller: controller,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                InkWell(
                  splashColor: primary.withOpacity(0.2),
                  onTap: () {
                    Navigator.push(
                        context,
                        PageRouteBuilder(
                          transitionDuration: Duration(seconds: 1),
                          pageBuilder: (_, __, ___) => HappyShopProductPreview(
                              imagelisturl: widget.imagelisturl),
                        ));
                  },
                  child: Stack(
                    children: <Widget>[
                      /*Center(
                        child: Hero(
                          tag: widget.tag,
                          child: Image.asset(
                            widget.imgurl,
                          ),
                        ),
                      ),*/
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 1.8,
                        child: Stack(children: [
                          PageView.builder(
                            controller: _controller,
                            itemCount: widget.imagelisturl!.length,
                            onPageChanged: (int index) {
                              setState(() {
                                currentIndex = index;
                              });
                            },
                            itemBuilder: (_, i) {
                              return OctoImage(
                                image: CachedNetworkImageProvider(
                                    widget.imagelisturl![i]['img']),
                                placeholderBuilder: OctoPlaceholder.blurHash(
                                  widget.imagelisturl![i]['blurUrl'],
                                ),
                                width: double.infinity,
                                errorBuilder: OctoError.icon(color: textcolor),
                                fit: BoxFit.fitHeight,
                              );
                            },
                          ),
                          Container(
                            margin: EdgeInsets.only(
                                left: 20,
                                top: MediaQuery.of(context).size.height * .50),
                            child: Padding(
                              padding: EdgeInsets.all(10.0),
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: List.generate(
                                    widget.imagelisturl!.length,
                                    (index) => new Container(
                                        width: currentIndex == index ? 30 : 10,
                                        height: 10,
                                        margin:
                                            EdgeInsets.only(left: 3, right: 3),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          color: currentIndex == index
                                              ? white
                                              : white.withOpacity(0.3),
                                        )),
                                  )),
                            ),
                          ),
                        ]),
                      ),

                      // ),
                      Padding(
                        padding: const EdgeInsets.only(top: 25.0, left: 10),
                        child: Material(
                          color: Color(0xFF333333).withOpacity(0.3),
                          shape: CircleBorder(),
                          child: InkWell(
                              child: Padding(
                                padding: EdgeInsets.only(
                                    left: 15, right: 8, top: 8, bottom: 8),
                                child: Icon(
                                  Icons.arrow_back_ios,
                                  color: Color(0xFF333333).withOpacity(0.5),
                                ),
                              ),
                              onTap: () {}),
                        ),

                        /*Material(
                          color: Color(0xFF333333).withOpacity(0.3),
                          shape: CircleBorder(),
                          child: IconButton(
                              padding: const EdgeInsets.only(left: 10),
                              icon: Icon(
                                Icons.arrow_back_ios,
                                color: Color(0xFF333333).withOpacity(0.5),
                              ),
                              onPressed: () {
                                Navigator.pop(context);
                              }),
                        ),*/
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 25.0,
                        ),
                        child: Align(
                            alignment: Alignment.topRight,
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Material(
                                  color: Color(0xFF333333).withOpacity(0.3),
                                  shape: CircleBorder(),
                                  child: InkWell(
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Icon(
                                          Icons.favorite,
                                          color: Color(0xFF333333)
                                              .withOpacity(0.5),
                                        ),
                                      ),
                                      onTap: () {}),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 5),
                                  child: Material(
                                    color: Color(0xFF333333).withOpacity(0.3),
                                    shape: CircleBorder(),
                                    child: InkWell(
                                      child: new Stack(children: <Widget>[
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Icon(
                                            Icons.shopping_cart_rounded,
                                            color: Color(0xFF333333)
                                                .withOpacity(0.5),
                                            // size: 26,
                                          ),
                                        ),
                                        (CUR_CART_COUNT != null &&
                                                CUR_CART_COUNT.isNotEmpty &&
                                                CUR_CART_COUNT != "0")
                                            ? new Positioned(
                                                top: 0.0,
                                                right: 5.0,
                                                bottom: 15,
                                                child: Container(
                                                    decoration: BoxDecoration(
                                                        shape: BoxShape.circle,
                                                        color: Colors.red),
                                                    child: new Center(
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsets.all(4),
                                                        child: new Text(
                                                          CUR_CART_COUNT,
                                                          style: TextStyle(
                                                              fontSize: 8,
                                                              color:
                                                                  Colors.white),
                                                        ),
                                                      ),
                                                    )),
                                              )
                                            : Container()
                                      ]),
                                      onTap: () async {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  HappyShopCart(),
                                            ));
                                      },
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 10.0,
                                )
                              ],
                            )),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 5.0,
                ),
                _rate(),
                _price(),
                _offPrice(),
                _title(),
                _desc(),
                _selectVarientTitle(),
                _getVarient(_selVarient),
                _otherDetailsTitle(),
                _madeIn(),
                _cancleable(),
                _ratingReview(),
                _review(),
                _rating(),
                _writeReview()
              ],
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => HappyShopCart(),
              ),
            );
          },
          child: Container(
            height: 55,
            decoration: BoxDecoration(
              color: Colors.white,
              gradient: happyshopgradient,
              boxShadow: const [
                BoxShadow(color: Colors.black26, blurRadius: 10)
              ],
            ),
            child: Center(
                child: Text(
              "Add to Cart",
              style: Theme.of(context)
                  .textTheme
                  .button!
                  .copyWith(fontWeight: FontWeight.bold, color: Colors.white),
            )),
          ),
        ),
      ],
    );
  }

  _madeIn() {
    String madeIn = "India";
    return madeIn != null
        ? Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: ListTile(
              trailing: Text(madeIn),
              dense: true,
              title: Text(
                'Made In',
                style: Theme.of(context).textTheme.subtitle2,
              ),
            ),
          )
        : Container();
  }

  _rate() {
    return Row(
      children: [
        Card(
          margin: const EdgeInsets.only(left: 20.0, bottom: 5),
          child: Padding(
            padding: const EdgeInsets.all(2.0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: const <Widget>[
                Icon(
                  Icons.star,
                  color: Colors.yellow,
                  size: 15,
                ),
                Text(" " "4.5")
              ],
            ),
          ),
        ),
        Text(
          " " "150" " Ratings",
          style: Theme.of(context).textTheme.caption,
        )
      ],
    );
  }

  _price() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5),
      child: Text(CUR_CURRENCY + " " + "1200",
          style: Theme.of(context).textTheme.headline6),
    );
  }

  _offPrice() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        children: <Widget>[
          Text(
            CUR_CURRENCY + " " + "1100",
            style: Theme.of(context).textTheme.bodyText2!.copyWith(
                  decoration: TextDecoration.lineThrough,
                ),
          ),
          Container(
            margin: EdgeInsets.only(left: 10),
            padding: EdgeInsets.all(4),
            child: Text("8.4" "% off",
                style: Theme.of(context)
                    .textTheme
                    .overline!
                    .copyWith(color: primary, letterSpacing: 0.5)),
            decoration: new BoxDecoration(
                color: primary.withOpacity(0.2),
                borderRadius: new BorderRadius.circular(4.0)),
          ),
        ],
      ),
    );
  }

  _title() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
      child: Text(
        "Nike Shoes",
        style: Theme.of(context)
            .textTheme
            .headline6!
            .copyWith(color: Colors.black),
      ),
    );
  }

  _desc() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Text(
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy"),
    );
  }

  _selectVarientTitle() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Text(
        selectVarient,
        style: Theme.of(context).textTheme.subtitle1!.copyWith(color: primary),
      ),
    );
  }

  _getVarient(int pos) {
    List<String> attrName = ["Size"];
    List<String> attrValue = ["7", "8"];

    return InkWell(
        child: ListView.builder(
            shrinkWrap: true,
            padding: EdgeInsets.symmetric(horizontal: 20),
            itemCount: attrName.length,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return ListTile(
                dense: true,
                title: Text(
                  attrName[index] + " : " + attrValue[index],
                  style: Theme.of(context).textTheme.subtitle2,
                ),
                trailing: Icon(Icons.keyboard_arrow_right),
              );
            }),
        onTap: _chooseVarient);
  }

  void _chooseVarient() {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        builder: (builder) {
          return StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text(
                    selectVarient,
                    style: Theme.of(context).textTheme.headline6,
                  ),
                ),
                Divider(),
                _title(),
                _price(),
                _offPrice(),
                Column(
                  children: [
                    Text(
                      "Variant",
                      textAlign: TextAlign.left,
                    ),
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Row(
                          children: [
                            Center(
                              child: ChoiceChip(
                                key: ValueKey<String>(
                                  "1",
                                ),
                                selected: false,
                                label: Text("1",
                                    style: TextStyle(color: Colors.white)),
                                backgroundColor: primary.withOpacity(0.45),
                                selectedColor: primary,
                                disabledColor: primary.withOpacity(0.5),
                                onSelected: (bool selected) {
                                  setState(() {
                                    selected = false;
                                  });
                                },
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            ChoiceChip(
                              key: ValueKey<String>(
                                "2",
                              ),
                              selected: true,
                              label: Text("1",
                                  style: TextStyle(color: Colors.white)),
                              backgroundColor: primary.withOpacity(0.45),
                              selectedColor: primary,
                              disabledColor: primary.withOpacity(0.5),
                              onSelected: (bool selected) {
                                selected = false;
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Divider(),
                Padding(
                  padding: const EdgeInsets.only(right: 18.0, bottom: 8),
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: primary,
                      ),
                      onPressed: applyVarient,
                      child: Text(
                        'Apply',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            );
          });
        });
  }

  applyVarient() {
    Navigator.of(context).pop();
    setState(() {
      _selVarient = _oldSelVarient;
    });
  }

  _otherDetailsTitle() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5),
      child: Text(
        'Other Details',
        style: Theme.of(context).textTheme.subtitle1!.copyWith(color: primary),
      ),
    );
  }

  _cancleable() {
    String cancleable = "1";
    if (cancleable == "1") {
      cancleable = "Yes";
    } else {
      cancleable = "No";
    }
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: ListTile(
        trailing: Text(cancleable),
        dense: true,
        title: Text(
          'Cancleable',
          style: Theme.of(context).textTheme.subtitle2,
        ),
      ),
    );
  }

  _ratingReview() {
    return
        // ("true" == "true" || reviewList.length > 0)
        //     ?
        Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5),
      child: Text(
        'Ratings & Reviews',
        style: Theme.of(context).textTheme.subtitle1!.copyWith(color: primary),
      ),
    );
    // : Container();
  }

  _rating() {
    return Center(
      child: RatingBar.builder(
        initialRating: initialRate,
        minRating: 1,
        direction: Axis.horizontal,
        allowHalfRating: true,
        itemCount: 5,
        itemSize: 32,
        itemPadding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 5),
        itemBuilder: (context, _) => Icon(
          Icons.star,
          color: Colors.amber,
        ),
        onRatingUpdate: (rating) {},
      ),
    );
  }

  _writeReview() {
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: _commentC,
            keyboardType: TextInputType.multiline,
            maxLines: null,
            onChanged: (String val) {
              if (_commentC.text.trim().isNotEmpty) {
                setState(() {
                  _isCommentEnable = true;
                });
              } else {
                setState(() {
                  _isCommentEnable = false;
                });
              }
            },
            decoration: InputDecoration(
              contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
              prefixIcon: Icon(Icons.rate_review, color: primary),
              hintText: 'Write your review..',
              hintStyle: TextStyle(color: primary.withOpacity(0.5)),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 30,
          child: IconButton(
              icon: Icon(
                Icons.send,
                color: _isCommentEnable ? primary : Colors.transparent,
              ),
              onPressed: () => _isCommentEnable == true),
        )
      ],
    );
  }

  _review() {
    List reviewList = [
      {
        'rating': "12",
        'username': "Mac",
        'date': "18/02/2021",
        'comment': "tetstetsttetstttetsttet"
      }
    ];
    return ListView.separated(
        shrinkWrap: true,
        padding: EdgeInsets.symmetric(horizontal: 20),
        itemCount: reviewList.length,
        physics: NeverScrollableScrollPhysics(),
        separatorBuilder: (BuildContext context, int index) => Divider(),
        itemBuilder: (context, index) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Card(
                    color: primary,
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Icon(
                            Icons.star,
                            color: Colors.yellow,
                            size: 15,
                          ),
                          Text(
                            " " + reviewList[index]['rating'],
                            style: TextStyle(color: Colors.white),
                          )
                        ],
                      ),
                    ),
                  ),
                  Text("  " + reviewList[index]['username']),
                  Spacer(),
                  Text(reviewList[index]['date'])
                ],
              ),
              reviewList[index]['comment'] != null
                  ? Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(reviewList[index]['comment'] ?? ''))
                  : Container(),
            ],
          );
        });
  }

  List<T?> map<T>(List list, Function handler) {
    List<T?> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }

    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        // appBar: PreferredSize(
        //   preferredSize: Size.fromHeight(0),
        //   child: AppBar(elevation: 0, brightness: Brightness.light, backgroundColor: Colors.white.withOpacity(0.8)),
        // ),
        body: Stack(
          children: <Widget>[
            _showContent(),
          ],
        ));
  }
}
