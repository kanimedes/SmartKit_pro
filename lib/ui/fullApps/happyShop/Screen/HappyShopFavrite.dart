import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:octo_image/octo_image.dart';

import 'package:smartkit_pro/ui/fullApps/happyShop/Helper/HappyShopColor.dart';
import 'package:smartkit_pro/ui/fullApps/happyShop/Helper/HappyShopString.dart';

import 'HappyShopHome.dart';
import 'HappyShopProductDetail.dart';

class HappyShopFavrite extends StatefulWidget {
  final bool? appbar;
  const HappyShopFavrite({Key? key, this.appbar}) : super(key: key);

  @override
  _HappyShopFavriteState createState() => _HappyShopFavriteState();
}

class _HappyShopFavriteState extends State<HappyShopFavrite>
    with TickerProviderStateMixin {
  ScrollController controller = new ScrollController();
  List tempList = [];
  String msg = noFav;
  Animation? buttonSqueezeanimation;
  late AnimationController buttonController;
  int offset = 0;
  int total = 0;
  bool isLoadingmore = true;
  List favList = [
    {
      'localimg': "assets/images/fullApps/happyshop/woman_a1.jpg",
      'img':
          "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/happyshop%2Fwoman_a1.jpg?alt=media&token=624b4d16-86f5-45ab-9c2c-40a6c957f10e",
      'blurUrl': "LDRAQ99y}8-7?E\$}oJNx,Cr?J-S}",
      'imglist': [
        {
          'tag': "41",
          'localimg': "assets/images/fullApps/happyshop/woman_a1.jpg",
          'img':
              "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/happyshop%2Fwoman_a1.jpg?alt=media&token=624b4d16-86f5-45ab-9c2c-40a6c957f10e",
          'blurUrl': "LDRAQ99y}8-7?E\$}oJNx,Cr?J-S}",
        },
        {
          'tag': "42",
          'localimg': "assets/images/fullApps/happyshop/woman_a2.jpg",
          'img':
              "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/happyshop%2Fwoman_a2.jpg?alt=media&token=41bd7c50-f4b4-4a34-98c8-fd9bedee4198",
          'blurUrl': "LHRJ;-9d}RxD-ms,WBNx#+n%OXW;",
        },
        {
          'tag': "43",
          'localimg': "assets/images/fullApps/happyshop/woman_a3.jpg",
          'img':
              "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/happyshop%2Fwoman_a3.jpg?alt=media&token=6a394b0b-59eb-463e-b537-9f68f28c649d",
          'blurUrl': "LdPELhRQ}lWEr?s.%JagxBWENKoe",
        },
        {
          'tag': "44",
          'localimg': "assets/images/fullApps/happyshop/woman_a4.jpg",
          'img':
              "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/happyshop%2Fwoman_a4.jpg?alt=media&token=2820a9b7-f2cf-42b1-ae3d-9e0c7212f8ab",
          'blurUrl': "LcQQr@M}}l%K\$~WXoxs,i{oeW=Rk",
        },
      ],
      'name': "Nike",
      'cartCount': "1",
      'descprice': "2500",
      'price': "3500",
      'rating': "4.5",
      'noOfRating': "90"
    },
    {
      'localimg': "assets/images/fullApps/happyshop/woman_b1.jpg",
      'img':
          "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/happyshop%2Fwoman_b1.jpg?alt=media&token=1e8c51be-6cf4-47e3-909a-7ba0e6add4f8",
      'blurUrl': "LLIDhWxa5[JB}tocKQWZS\$R*xC\$%",
      'imglist': [
        {
          'tag': "46",
          'localimg': "assets/images/fullApps/happyshop/woman_b1.jpg",
          'img':
              "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/happyshop%2Fwoman_b1.jpg?alt=media&token=1e8c51be-6cf4-47e3-909a-7ba0e6add4f8",
          'blurUrl': "LLIDhWxa5[JB}tocKQWZS\$R*xC\$%",
        },
        {
          'tag': "47",
          'localimg': "assets/images/fullApps/happyshop/woman_b2.jpg",
          'img':
              "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/happyshop%2Fwoman_b2.jpg?alt=media&token=7a79082c-d228-4593-8aab-1066603f56da",
          'blurUrl': "LHJQHw~XF\$9Z=xjrOYozE-NG\$Kxa",
        },
        {
          'tag': "48",
          'localimg': "assets/images/fullApps/happyshop/woman_b3.jpg",
          'img':
              "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/happyshop%2Fwoman_b3.jpg?alt=media&token=3d01cc6e-86d8-4e7f-9fb0-a46a4c479e6e",
          'blurUrl': "LFG@yi%3EnEM~DoLS%ShOZS2w[xG",
        },
        {
          'tag': "49",
          'localimg': "assets/images/fullApps/happyshop/woman_b4.jpg",
          'img':
              "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/happyshop%2Fwoman_b4.jpg?alt=media&token=113683b4-3adf-42fe-8945-3bf5a52bda02",
          'blurUrl': "LGGtg--W5@EM}ts:KQOFR,WBxFxb",
        },
        {
          'tag': "50",
          'localimg': "assets/images/fullApps/happyshop/woman_b5.jpg",
          'img':
              "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/happyshop%2Fwoman_b5.jpg?alt=media&token=59b141c5-b804-40d6-a951-80fba9d5eff7",
          'blurUrl': "LJHwjH%3E.Io}]ofXUbbNyWBxCxa",
        },
      ],
      'name': "Bag",
      'cartCount': "1",
      'descprice': "1000",
      'price': "1200",
      'rating': "2.5",
      'noOfRating': "50"
    },
    {
      'localimg': "assets/images/fullApps/happyshop/woman_c1.jpg",
      'img':
          "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/happyshop%2Fwoman_c1.jpg?alt=media&token=51fe8e98-bcc2-4ae2-b681-01efe5bedfef",
      'blurUrl': "LPQsoNI:}F-VtRofnPWB\$*ofSNjF",
      'imglist': [
        {
          'tag': "51",
          'localimg': "assets/images/fullApps/happyshop/woman_c1.jpg",
          'img':
              "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/happyshop%2Fwoman_c1.jpg?alt=media&token=51fe8e98-bcc2-4ae2-b681-01efe5bedfef",
          'blurUrl': "LPQsoNI:}F-VtRofnPWB\$*ofSNjF",
        },
        {
          'tag': "52",
          'localimg': "assets/images/fullApps/happyshop/woman_c2.jpg",
          'img':
              "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/happyshop%2Fwoman_c2.jpg?alt=media&token=a3489a1c-02c3-443c-95b1-ecb9a5242681",
          'blurUrl': "LQRcfGRj}txaXmkCr?aexGofODV@",
        },
        {
          'tag': "53",
          'localimg': "assets/images/fullApps/happyshop/woman_c3.jpg",
          'img':
              "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/happyshop%2Fwoman_c3.jpg?alt=media&token=c8dcdbf1-6376-482f-b349-2b783baba66c",
          'blurUrl': "LQQ?%:M{}Yo}kqxGwJNa-Bs:NwNa",
        },
        {
          'tag': "54",
          'localimg': "assets/images/fullApps/happyshop/woman_c4.jpg",
          'img':
              "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/happyshop%2Fwoman_c4.jpg?alt=media&token=fb071301-c34e-43e5-a8a3-363db55f02bc",
          'blurUrl': "LaPz_wRj}GxG%Ks9bwS3rDaes:s:",
        },
        {
          'tag': "55",
          'localimg': "assets/images/fullApps/happyshop/woman_c5.jpg",
          'img':
              "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/happyshop%2Fwoman_c5.jpg?alt=media&token=c79fb39d-0158-4342-bea3-18bd01de80a0",
          'blurUrl': "LkP||?R*|Lxar=ofg4R*IAWVx]s:",
        },
      ],
      'name': "Puma Shoes",
      'cartCount': "1",
      'descprice': "1300",
      'price': "1400",
      'rating': "3.5",
      'noOfRating': "45"
    },
    {
      'localimg': "assets/images/fullApps/happyshop/woman_d1.jpg",
      'img':
          "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/happyshop%2Fwoman_d1.jpg?alt=media&token=3f616835-8709-46a6-9304-a43eaed0e988",
      'blurUrl': "LUM%D;xay?M|?aofR-VsC6WV#Sf6",
      'imglist': [
        {
          'tag': "56",
          'localimg': "assets/images/fullApps/happyshop/woman_d1.jpg",
          'img':
              "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/happyshop%2Fwoman_d1.jpg?alt=media&token=3f616835-8709-46a6-9304-a43eaed0e988",
          'blurUrl': "LUM%D;xay?M|?aofR-VsC6WV#Sf6",
        },
        {
          'tag': "57",
          'localimg': "assets/images/fullApps/happyshop/woman_d2.jpg",
          'img':
              "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/happyshop%2Fwoman_d2.jpg?alt=media&token=0cf7a9e8-4608-4336-a9f8-0c501e4fc5e3",
          'blurUrl': "LLOy0DpcQ7IAHCni,[WBLLnOozoL",
        },
        {
          'tag': "58",
          'localimg': "assets/images/fullApps/happyshop/woman_d3.jpg",
          'img':
              "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/happyshop%2Fwoman_d3.jpg?alt=media&token=c91423e8-c879-4904-bbfe-29848d06dc26",
          'blurUrl': "LUOVilv~qFXnLKNZ#UxuTdWBV@kB",
        },
        {
          'tag': "59",
          'localimg': "assets/images/fullApps/happyshop/woman_d4.jpg",
          'img':
              "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/happyshop%2Fwoman_d4.jpg?alt=media&token=45702238-9a89-4a24-90e7-c273dde919cb",
          'blurUrl': "LUOVilv~qFXnLKNZ#UxuTdWBV@kB",
        },
      ],
      'name': "NIkeShoes",
      'cartCount': "1",
      'descprice': "1700",
      'price': "2000",
      'rating': "4.5",
      'noOfRating': "150"
    },
  ];

  @override
  void initState() {
    super.initState();

    offset = 0;
    total = 0;

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

  @override
  void dispose() {
    buttonController.dispose();
    super.dispose();
  }

  _showContent() {
    return favList.isEmpty
        ? Padding(
            padding: const EdgeInsets.only(top: kToolbarHeight),
            child: Center(child: Text(msg)),
          )
        : ListView.builder(
            shrinkWrap: true,
            controller: controller,
            itemCount: favList.length,
            physics: BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return listItem(index);
            },
          );
  }

  Widget listItem(int index) {
    return Card(
      elevation: 0.1,
      shadowColor: happyshopcolor5,
      child: InkWell(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            OctoImage(
              image: CachedNetworkImageProvider(favList[index]['img']),
              placeholderBuilder: OctoPlaceholder.blurHash(
                favList[index]['blurUrl'],
              ),
              height: 90.0,
              width: 90.0,
              errorBuilder: OctoError.icon(color: textcolor),
              fit: BoxFit.fill,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 5.0),
                            child: Text(
                              favList[index]['name'],
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle1!
                                  .copyWith(color: Colors.black),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                        InkWell(
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 8.0, right: 8, bottom: 8),
                            child: Icon(
                              Icons.close,
                              size: 13,
                            ),
                          ),
                          onTap: () {
                            setState(() {
                              favList.removeAt(index);
                            });
                          },
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5.0),
                      child: Row(
                        children: [
                          Icon(
                            Icons.star,
                            color: Colors.yellow,
                            size: 12,
                          ),
                          Text(
                            " " + favList[index]['rating'],
                            style: Theme.of(context).textTheme.overline,
                          ),
                          Text(
                            " (" + favList[index]['noOfRating'] + ")",
                            style: Theme.of(context).textTheme.overline,
                          )
                        ],
                      ),
                    ),
                    Row(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            InkWell(
                              child: Container(
                                margin: EdgeInsets.only(
                                    right: 8, top: 8, bottom: 8),
                                child: Icon(
                                  Icons.remove,
                                  size: 12,
                                  color: Colors.grey,
                                ),
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5))),
                              ),
                              onTap: () {},
                            ),
                            Text(
                              favList[index]['cartCount'],
                              style: Theme.of(context).textTheme.caption,
                            ),
                            InkWell(
                              child: Container(
                                margin: EdgeInsets.all(8),
                                child: Icon(
                                  Icons.add,
                                  size: 12,
                                  color: Colors.grey,
                                ),
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5))),
                              ),
                              onTap: () {},
                            )
                          ],
                        ),
                        Spacer(),
                        Row(
                          children: <Widget>[
                            Text(
                              favList[index]['descprice'],
                              style: Theme.of(context)
                                  .textTheme
                                  .overline!
                                  .copyWith(
                                      decoration: TextDecoration.lineThrough,
                                      letterSpacing: 0.7),
                            ),
                            Text(favList[index]['price'],
                                style: Theme.of(context).textTheme.headline6),
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
        splashColor: primary.withOpacity(0.2),
        onTap: () {
          Navigator.push(
            context,
            PageRouteBuilder(
                transitionDuration: Duration(seconds: 1),
                pageBuilder: (_, __, ___) => HappyShopProductDetail(
                    imagelisturl: favList[index]['imglist'],
                    imgurl: favList[index]['img'],
                    tag: "${favList[index]}1",
                    localimg: favList[index]['localimg'])),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => HappyShopHome(),
          ),
        ) as Future<bool>;
      } as Future<bool> Function()?,
      child: Scaffold(
        appBar: widget.appbar == true
            ? /*AppBar(
                title: Text(
                  "Favrite",
                  style: TextStyle(color: Colors.white),
                ),
              )*/
            AppBar(
                leading: IconButton(
                  icon: Icon(Icons.arrow_back_ios, color: primary),
                  onPressed: () => Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HappyShopHome(),
                    ),
                  ),
                ),
                title: Text(
                  "Favrite",
                  style: TextStyle(
                    color: primary,
                  ),
                ),
                systemOverlayStyle: SystemUiOverlayStyle.dark,
                backgroundColor: Colors.white,
                elevation: 5,
              )
            : PreferredSize(preferredSize: Size.fromHeight(0), child: AppBar()),
        body: Stack(
          children: <Widget>[
            _showContent(),
          ],
        ),
      ),
    );
  }
}
