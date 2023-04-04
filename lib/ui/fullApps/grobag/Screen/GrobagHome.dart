import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:octo_image/octo_image.dart';
import 'package:smartkit_pro/ui/fullApps/grobag/Helper/GrobagColor.dart';
import 'package:smartkit_pro/ui/fullApps/grobag/Screen/GrobagAllCat.dart';
import 'package:smartkit_pro/ui/fullApps/grobag/Screen/GrobagCart.dart';
import 'package:smartkit_pro/ui/fullApps/grobag/Screen/GrobagNotification.dart';
import 'package:smartkit_pro/ui/fullApps/grobag/Screen/GrobagProductDetail.dart';
import 'package:smartkit_pro/ui/fullApps/grobag/Screen/GrobagProductList.dart';
import 'package:smartkit_pro/ui/fullApps/grobag/Screen/GrobagSearch.dart';

import 'GrobagFavorite.dart';
import 'GrobagMyProfile.dart';

class GrobagHome extends StatefulWidget {
  const GrobagHome({Key? key}) : super(key: key);

  @override
  _GrobagHomeState createState() => _GrobagHomeState();
}

class _GrobagHomeState extends State<GrobagHome> {
  int _curBottom = 0;

  late List<Widget> fragments;

  @override
  void initState() {
    super.initState();
    fragments = [
      HomePage(),
      GrobagAllCat(),
      GrobagFavorite(),
      GrobagMyProfile(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _curBottom == 0
            ? AppBar(
                //leading: Platform.isAndroid?BackButton():Text("gfdcg"),
                automaticallyImplyLeading: false,
                backgroundColor: white,
                title: Row(
                  children: [
                    Platform.isIOS ? BackButton() : Text(""),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          children: [
                            Text(
                              'Your Location ',
                              style: TextStyle(fontSize: 14),
                            ),
                            SvgPicture.asset(
                                'assets/images/fullApps/grobag/edit-loc.svg')
                          ],
                        ),
                        Text('Gandhidham'),
                      ],
                    ),
                  ],
                ),
                actions: [
                  GestureDetector(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SvgPicture.asset(
                          'assets/images/fullApps/grobag/notification.svg'),
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => GrobagNotification()));
                    },
                  ),
                  GestureDetector(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0, right: 18),
                      child: SvgPicture.asset(
                          'assets/images/fullApps/grobag/cart.svg'),
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => GrobagCart()));
                    },
                  ),
                ],
              )
            : AppBar(
                backgroundColor: white,
                automaticallyImplyLeading: false,
                title: Text(
                  _curBottom == 1
                      ? 'Category'
                      : _curBottom == 2
                          ? 'Favorite'
                          : 'Profile',
                  style: TextStyle(
                    color: fontColor,
                  ),
                ),
              ),
        bottomNavigationBar: getBottomNav(),
        body: fragments[_curBottom]);
  }

  getBottomNav() {
    return BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/images/fullApps/grobag/home.svg',
            ),
            activeIcon: SvgPicture.asset(
              'assets/images/fullApps/grobag/active-home.svg',
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon:
                SvgPicture.asset('assets/images/fullApps/grobag/category.svg'),
            activeIcon: SvgPicture.asset(
              'assets/images/fullApps/grobag/active-category.svg',
            ),
            label: 'Category',
          ),
          BottomNavigationBarItem(
            icon:
                SvgPicture.asset('assets/images/fullApps/grobag/favorite.svg'),
            activeIcon: SvgPicture.asset(
              'assets/images/fullApps/grobag/active-favorite.svg',
            ),
            label: 'Favorite',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/images/fullApps/grobag/profile.svg'),
            activeIcon: SvgPicture.asset(
              'assets/images/fullApps/grobag/active-profile.svg',
            ),
            label: 'Profile',
          ),
        ],
        type: BottomNavigationBarType.fixed,
        currentIndex: _curBottom,
        selectedItemColor: primary,
        onTap: (int index) {
          if (mounted) {
            setState(() {
              _curBottom = index;
            });
          }
        },
        elevation: 25);
  }
}

List catList = [
  {
    'localimg': "assets/images/fullApps/grobag/cat-image-1.jpg",
    'img':
        "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/grobag%2Fcat-image-1.jpg?alt=media&token=3cafd782-d1ab-4846-a882-f0139c069c93",
    'blurUrl': "LkR2So#F-=Kut8X5o2nl?dO,M_v-",
    'title': "Guava"
  },
  {
    'localimg': "assets/images/fullApps/grobag/cat-image-2.jpg",
    'img':
        "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/grobag%2Fcat-image-2.jpg?alt=media&token=35424c8e-c05c-4a5f-82ba-0500124b7753",
    'blurUrl': "LJQAluX3.S\$mtRjvsmWn.Tn-Q-Sb",
    'title': "Pear"
  },
  {
    'localimg': "assets/images/fullApps/grobag/cat-image-3.jpg",
    'img':
        "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/grobag%2Fcat-image-3.jpg?alt=media&token=2883dfa0-3bdc-4636-98b8-77a91d046319",
    'blurUrl': "LVRUmSRj?HxuxtWBWBof~pozIUV@",
    'title': "Coconut"
  },
  {
    'localimg': "assets/images/fullApps/grobag/cat-image-4.jpg",
    'img':
        "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/grobag%2Fcat-image-4.jpg?alt=media&token=f6880e1d-dc03-4332-8b1a-2c51c53ae5bb",
    'blurUrl': "LXSiJwbax^n+t7fQj[j[.AjGROba",
    'title': "Lemon"
  },
  {
    'localimg': "assets/images/fullApps/grobag/cat-image-5.jpg",
    'img':
        "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/grobag%2Fcat-image-5.jpg?alt=media&token=3bc166e4-b34e-4055-bb1b-5f9065004ba0",
    'blurUrl': "LfOXWq-C%yFrtQoyjZaL_LJ6My#X",
    'title': "Watermelon"
  },
  {
    'localimg': "assets/images/fullApps/grobag/cat-image-6.jpg",
    'img':
        "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/grobag%2Fcat-image-6.jpg?alt=media&token=773531c2-a32d-4b0d-8297-9b354c08eed8",
    'blurUrl': "LLSr#aoy?]jaxuWBaet7.RkCH@ae",
    'title': "Banana"
  },
  {
    'localimg': "assets/images/fullApps/grobag/cat-image-7.jpg",
    'img':
        "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/grobag%2Fcat-image-7.jpg?alt=media&token=c434b142-2db8-4b5f-a4d5-7ff83649356b",
    'blurUrl': "LeQR*ZIw-;-htQj=jJfA_N\$^MyNN",
    'title': "Jambu"
  },
  {
    'localimg': "assets/images/fullApps/grobag/cat-image-8.jpg",
    'img':
        "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/grobag%2Fcat-image-8.jpg?alt=media&token=f620ba30-6177-40ce-af5f-7489c5ae3811",
    'blurUrl': "LWRC;8\$%^,I;xta#f8jZ~WNbD%w{",
    'title': "Avocado"
  },
  {
    'localimg': "assets/images/fullApps/grobag/cat-image-9.jpg",
    'img':
        "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/grobag%2Fcat-image-9.jpg?alt=media&token=ea12ecf7-cfc8-4f64-a299-13ea8030419c",
    'blurUrl': "LUQITEVz~ntdo@t7jKNF_Jt59IRU",
    'title': "Grapes"
  },
  {
    'localimg': "assets/images/fullApps/grobag/cat-image-10.jpg",
    'img':
        "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/grobag%2Fcat-image-10.jpg?alt=media&token=99211229-8248-4d44-a58a-18cdff65bd44",
    'blurUrl': "LaSXx_ax%#t7o}ayniof*0j[R4WU",
    'title': "Orange"
  },
  {
    'localimg': "assets/images/fullApps/grobag/cat-image-11.jpg",
    'img':
        "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/grobag%2Fcat-image-11.jpg?alt=media&token=3c6fe4d3-d54c-4d32-bb3c-28c88f83b552",
    'blurUrl': "LSSN+yt+.9i0t8jbn%bY.TVZMwl8",
    'title': "Apple"
  },
  {
    'localimg': "assets/images/fullApps/grobag/cat-image-12.jpg",
    'img':
        "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/grobag%2Fcat-image-12.jpg?alt=media&token=12c716f6-8177-4cd9-ad28-1734ebd6a8db",
    'blurUrl': "LOR:3|oe_3oe-UWBNGoz~qjsD\$WW",
    'title': "Corn"
  },
  {
    'localimg': "assets/images/fullApps/grobag/cat-image-13.jpg",
    'img':
        "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/grobag%2Fcat-image-13.jpg?alt=media&token=c2a138ce-311b-4dd0-a0a8-b1d2c6f17a01",
    'blurUrl': "LqS4g?j[%Nj[S|fQsDfQ*Jf6ROjt",
    'title': "Strawberry"
  },
  {
    'localimg': "assets/images/fullApps/grobag/cat-image-14.jpg",
    'img':
        "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/grobag%2Fcat-image-14.jpg?alt=media&token=e7d333e6-0a83-4bdf-a093-8eb3c5defe7e",
    'blurUrl': "LPPR1k%3-rJ4xuofjsWA^-NYM_xI",
    'title': "Melon"
  },
];

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

List<String> searchList = [
  "Categories",
  "Sections",
  "Product",
];
String? curStatus = "Categories";

class _HomePageState extends State<HomePage> {
  final _controller = PageController();
  List<Widget> pages = [];

  int _curSlider = 0;

  List homeSliderList = [
    {
      'localimg': "assets/images/fullApps/grobag/slider-a.jpg",
      'img':
          "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/grobag%2Fslider-a.jpg?alt=media&token=53441609-4fda-497e-86ab-374d6d94f88a",
      'blurUrl': "LaPEg:s:}Roc},R*V[fkD=ofNKaL",
    },
    {
      'localimg': "assets/images/fullApps/grobag/slider-b.jpg",
      'img':
          "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/grobag%2Fslider-b.jpg?alt=media&token=ea2126b7-413b-433e-8229-4d8a7607da7d",
      'blurUrl': "LCD9@Pyw0v~W%stfo{af00V\$^k9t",
    },
    {
      'localimg': "assets/images/fullApps/grobag/slider-c.jpg",
      'img':
          "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/grobag%2Fslider-c.jpg?alt=media&token=18c5288c-72f8-44d5-af45-083f49812fad",
      'blurUrl': "LZKdr3?wXTa0_3?bjYNG.8xvR*RQ",
    },
    {
      'localimg': "assets/images/fullApps/grobag/slider-d.jpg",
      'img':
          "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/grobag%2Fslider-d.jpg?alt=media&token=6264bee2-54ee-47de-a452-eea0535d51a8",
      'blurUrl': "LML#RG0000~D?wwI4-tTJBVuE1%N",
    },
  ];
  List offerBannerList = [
    {
      'localimg': "assets/images/fullApps/grobag/banner-a.jpg",
      'img':
          "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/grobag%2Fbanner-a.jpg?alt=media&token=545b2f34-7678-46ad-866f-b8e63eec7b4b",
      'blurUrl': "LZP6W._2~p00ozWCoeoewgsCofX8",
    },
    {
      'localimg': "assets/images/fullApps/grobag/banner-b.jpg",
      'img':
          "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/grobag%2Fbanner-b.jpg?alt=media&token=537efc9f-843c-4e1a-8946-00e1a82cb8ed",
      'blurUrl': "LCNv-w0001*H_2\$jt7IUvn9]IU^Q",
    },
    {
      'localimg': "assets/images/fullApps/grobag/banner-c.jpg",
      'img':
          "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/grobag%2Fbanner-c.jpg?alt=media&token=91588661-abb0-4dff-bbc2-fe04185f31c4",
      'blurUrl': "LDNTHp}C00_19~9}9#Iu;UIW9tag",
    }
  ];
  List sectList = [
    {
      'section': "Best Selling Items",
      'productList': [
        {
          'tag': "4",
          'localimg': "assets/images/fullApps/grobag/product_1d.jpg",
          'img':
              "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/grobag%2Fproduct_1b.jpg?alt=media&token=abb8c343-dd54-4ce9-b018-07b2c33382cb",
          'blurUrl': "LBHU5i9F:a4q?@KJ9vVb03n\$Op=_",
          'name': "Apple",
          'descprice': "1700",
          'price': "2000",
          'qty': '250 gm',
          'imglist': [
            {
              'localimg': "assets/images/fullApps/grobag/product_1d.jpg",
              'img':
                  "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/grobag%2Fproduct_1b.jpg?alt=media&token=abb8c343-dd54-4ce9-b018-07b2c33382cb",
              'blurUrl': "LBHU5i9F:a4q?@KJ9vVb03n\$Op=_",
            },
            {
              'localimg': "assets/images/fullApps/grobag/product_1d.jpg",
              'img':
                  "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/grobag%2Fproduct_1b.jpg?alt=media&token=abb8c343-dd54-4ce9-b018-07b2c33382cb",
              'blurUrl': "LBHU5i9F:a4q?@KJ9vVb03n\$Op=_",
            },
            {
              'localimg': "assets/images/fullApps/grobag/product_1d.jpg",
              'img':
                  "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/grobag%2Fproduct_1b.jpg?alt=media&token=abb8c343-dd54-4ce9-b018-07b2c33382cb",
              'blurUrl': "LBHU5i9F:a4q?@KJ9vVb03n\$Op=_",
            },
            {
              'localimg': "assets/images/fullApps/grobag/product_1d.jpg",
              'img':
                  "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/grobag%2Fproduct_1b.jpg?alt=media&token=abb8c343-dd54-4ce9-b018-07b2c33382cb",
              'blurUrl': "LBHU5i9F:a4q?@KJ9vVb03n\$Op=_",
            },
          ]
        },
        {
          'tag': "5",
          'localimg': "assets/images/fullApps/grobag/product_4.jpg",
          'img':
              "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/grobag%2Fproduct_4.jpg?alt=media&token=d25f2797-eb33-4e15-bfd8-830f8edf1324",
          'blurUrl': "LIN+yu~S^}t64rWBxWs,%bkCIZjZ",
          'name': "Banana",
          'descprice': "25",
          'price': "2200",
          'qty': '250 gm',
          'imglist': [
            {
              'localimg': "assets/images/fullApps/grobag/product_4.jpg",
              'img':
                  "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/grobag%2Fproduct_4.jpg?alt=media&token=d25f2797-eb33-4e15-bfd8-830f8edf1324",
              'blurUrl': "LIN+yu~S^}t64rWBxWs,%bkCIZjZ",
            },
            {
              'localimg': "assets/images/fullApps/grobag/product_4.jpg",
              'img':
                  "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/grobag%2Fproduct_4.jpg?alt=media&token=d25f2797-eb33-4e15-bfd8-830f8edf1324",
              'blurUrl': "LIN+yu~S^}t64rWBxWs,%bkCIZjZ",
            },
            {
              'localimg': "assets/images/fullApps/grobag/product_4.jpg",
              'img':
                  "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/grobag%2Fproduct_4.jpg?alt=media&token=d25f2797-eb33-4e15-bfd8-830f8edf1324",
              'blurUrl': "LIN+yu~S^}t64rWBxWs,%bkCIZjZ",
            },
            {
              'localimg': "assets/images/fullApps/grobag/product_4.jpg",
              'img':
                  "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/grobag%2Fproduct_4.jpg?alt=media&token=d25f2797-eb33-4e15-bfd8-830f8edf1324",
              'blurUrl': "LIN+yu~S^}t64rWBxWs,%bkCIZjZ",
            },
          ]
        },
        {
          'tag': "1",
          'localimg': "assets/images/fullApps/grobag/product_5.jpg",
          'img':
              "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/grobag%2Fproduct_5.jpg?alt=media&token=05c0d79e-c784-4e41-8634-429a88b6ebc5",
          'blurUrl': "LOPEaz_J},ENOpM}\$yoe-iR*EPs.",
          'name': "Pineapple",
          'descprice': "25",
          'price': "50",
          'qty': "1 kg",
          'imglist': [
            {
              'localimg': "assets/images/fullApps/grobag/product_5.jpg",
              'img':
                  "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/grobag%2Fproduct_5.jpg?alt=media&token=05c0d79e-c784-4e41-8634-429a88b6ebc5",
              'blurUrl': "LOPEaz_J},ENOpM}\$yoe-iR*EPs.",
            },
            {
              'localimg': "assets/images/fullApps/grobag/product_5.jpg",
              'img':
                  "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/grobag%2Fproduct_5.jpg?alt=media&token=05c0d79e-c784-4e41-8634-429a88b6ebc5",
              'blurUrl': "LOPEaz_J},ENOpM}\$yoe-iR*EPs.",
            },
            {
              'localimg': "assets/images/fullApps/grobag/product_5.jpg",
              'img':
                  "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/grobag%2Fproduct_5.jpg?alt=media&token=05c0d79e-c784-4e41-8634-429a88b6ebc5",
              'blurUrl': "LOPEaz_J},ENOpM}\$yoe-iR*EPs.",
            },
            {
              'localimg': "assets/images/fullApps/grobag/product_5.jpg",
              'img':
                  "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/grobag%2Fproduct_5.jpg?alt=media&token=05c0d79e-c784-4e41-8634-429a88b6ebc5",
              'blurUrl': "LOPEaz_J},ENOpM}\$yoe-iR*EPs.",
            },
          ]
        },
        {
          'tag': "2",
          'localimg': "assets/images/fullApps/grobag/product_6.jpg",
          'img':
              "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/grobag%2Fproduct_6.jpg?alt=media&token=ffab6aaa-8bdb-490c-a081-21b330c2e5c2",
          'blurUrl': "LbQZ{8R4~CxGR5aJniWV^+o0E1S#",
          'name': "Strawberry",
          'descprice': "1000",
          'price': "1200",
          'qty': '500 gm',
          'imglist': [
            {
              'localimg': "assets/images/fullApps/grobag/product_6.jpg",
              'img':
                  "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/grobag%2Fproduct_6.jpg?alt=media&token=ffab6aaa-8bdb-490c-a081-21b330c2e5c2",
              'blurUrl': "LbQZ{8R4~CxGR5aJniWV^+o0E1S#",
            },
            {
              'localimg': "assets/images/fullApps/grobag/product_6.jpg",
              'img':
                  "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/grobag%2Fproduct_6.jpg?alt=media&token=ffab6aaa-8bdb-490c-a081-21b330c2e5c2",
              'blurUrl': "LbQZ{8R4~CxGR5aJniWV^+o0E1S#",
            },
            {
              'localimg': "assets/images/fullApps/grobag/product_6.jpg",
              'img':
                  "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/grobag%2Fproduct_6.jpg?alt=media&token=ffab6aaa-8bdb-490c-a081-21b330c2e5c2",
              'blurUrl': "LbQZ{8R4~CxGR5aJniWV^+o0E1S#",
            },
            {
              'localimg': "assets/images/fullApps/grobag/product_6.jpg",
              'img':
                  "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/grobag%2Fproduct_6.jpg?alt=media&token=ffab6aaa-8bdb-490c-a081-21b330c2e5c2",
              'blurUrl': "LbQZ{8R4~CxGR5aJniWV^+o0E1S#",
            },
          ]
        },
        {
          'tag': "3",
          'localimg': "assets/images/fullApps/grobag/product_7.jpg",
          'img':
              "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/grobag%2Fproduct_7.jpg?alt=media&token=53603a0a-e39d-4858-994b-254d63561f51",
          'blurUrl': "LHR8e+}=:-B7]-RnODS}{ONIOp,@",
          'name': "Pear",
          'descprice': "1300",
          'price': "1400",
          'qty': '2 kg',
          'imglist': [
            {
              'localimg': "assets/images/fullApps/grobag/product_7.jpg",
              'img':
                  "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/grobag%2Fproduct_7.jpg?alt=media&token=53603a0a-e39d-4858-994b-254d63561f51",
              'blurUrl': "LHR8e+}=:-B7]-RnODS}{ONIOp,@",
            },
            {
              'localimg': "assets/images/fullApps/grobag/product_7.jpg",
              'img':
                  "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/grobag%2Fproduct_7.jpg?alt=media&token=53603a0a-e39d-4858-994b-254d63561f51",
              'blurUrl': "LHR8e+}=:-B7]-RnODS}{ONIOp,@",
            },
            {
              'localimg': "assets/images/fullApps/grobag/product_7.jpg",
              'img':
                  "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/grobag%2Fproduct_7.jpg?alt=media&token=53603a0a-e39d-4858-994b-254d63561f51",
              'blurUrl': "LHR8e+}=:-B7]-RnODS}{ONIOp,@",
            },
            {
              'localimg': "assets/images/fullApps/grobag/product_7.jpg",
              'img':
                  "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/grobag%2Fproduct_7.jpg?alt=media&token=53603a0a-e39d-4858-994b-254d63561f51",
              'blurUrl': "LHR8e+}=:-B7]-RnODS}{ONIOp,@",
            },
          ]
        },
      ]
    },
    {
      'section': "Exclusive",
      'productList': [
        {
          'tag': "8",
          'localimg': "assets/images/fullApps/grobag/product_9.jpg",
          'img':
              "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/grobag%2Fproduct_9.jpg?alt=media&token=2bee53f6-153e-4937-876a-f3b61a24fd08",
          'blurUrl': "LGRJ*2%a?Tt4HzjaRmag~fRmD;e;",
          'name': "Tomato",
          'descprice': "1300",
          'price': "1400",
          'qty': '1 kg',
          'imglist': [
            {
              'localimg': "assets/images/fullApps/grobag/product_9.jpg",
              'img':
                  "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/grobag%2Fproduct_9.jpg?alt=media&token=2bee53f6-153e-4937-876a-f3b61a24fd08",
              'blurUrl': "LGRJ*2%a?Tt4HzjaRmag~fRmD;e;",
            },
            {
              'localimg': "assets/images/fullApps/grobag/product_9.jpg",
              'img':
                  "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/grobag%2Fproduct_9.jpg?alt=media&token=2bee53f6-153e-4937-876a-f3b61a24fd08",
              'blurUrl': "LGRJ*2%a?Tt4HzjaRmag~fRmD;e;",
            },
            {
              'localimg': "assets/images/fullApps/grobag/product_9.jpg",
              'img':
                  "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/grobag%2Fproduct_9.jpg?alt=media&token=2bee53f6-153e-4937-876a-f3b61a24fd08",
              'blurUrl': "LGRJ*2%a?Tt4HzjaRmag~fRmD;e;",
            },
            {
              'localimg': "assets/images/fullApps/grobag/product_9.jpg",
              'img':
                  "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/grobag%2Fproduct_9.jpg?alt=media&token=2bee53f6-153e-4937-876a-f3b61a24fd08",
              'blurUrl': "LGRJ*2%a?Tt4HzjaRmag~fRmD;e;",
            },
          ]
        },
        {
          'tag': "6",
          'localimg': "assets/images/fullApps/grobag/product_10.jpg",
          'img':
              "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/grobag%2Fproduct_10.jpg?alt=media&token=f519d166-e55a-4b19-a228-3a7134940baa",
          'blurUrl': "LNPOYP^O.RJ,-.axM~V@}]9^o}\$*",
          'name': "Capsicum ",
          'descprice': "2500",
          'price': "3500",
          'qty': '250 gm',
          'imglist': [
            {
              'localimg': "assets/images/fullApps/grobag/product_10.jpg",
              'img':
                  "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/grobag%2Fproduct_10.jpg?alt=media&token=f519d166-e55a-4b19-a228-3a7134940baa",
              'blurUrl': "LNPOYP^O.RJ,-.axM~V@}]9^o}\$*",
            },
            {
              'localimg': "assets/images/fullApps/grobag/product_10.jpg",
              'img':
                  "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/grobag%2Fproduct_10.jpg?alt=media&token=f519d166-e55a-4b19-a228-3a7134940baa",
              'blurUrl': "LNPOYP^O.RJ,-.axM~V@}]9^o}\$*",
            },
            {
              'localimg': "assets/images/fullApps/grobag/product_10.jpg",
              'img':
                  "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/grobag%2Fproduct_10.jpg?alt=media&token=f519d166-e55a-4b19-a228-3a7134940baa",
              'blurUrl': "LNPOYP^O.RJ,-.axM~V@}]9^o}\$*",
            },
            {
              'localimg': "assets/images/fullApps/grobag/product_10.jpg",
              'img':
                  "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/grobag%2Fproduct_10.jpg?alt=media&token=f519d166-e55a-4b19-a228-3a7134940baa",
              'blurUrl': "LNPOYP^O.RJ,-.axM~V@}]9^o}\$*",
            },
          ]
        },
        {
          'tag': "7",
          'localimg': "assets/images/fullApps/grobag/product_11.jpg",
          'img':
              "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/grobag%2Fproduct_11.jpg?alt=media&token=69d788a9-768e-4c74-b02d-2742c4167032",
          'blurUrl': "LABr0D03x[%b.ObZRlt6.j%wRQRn",
          'name': "Cauliflower",
          'descprice': "1000",
          'price': "1000",
          'qty': '250 gm',
          'imglist': [
            {
              'localimg': "assets/images/fullApps/grobag/product_11.jpg",
              'img':
                  "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/grobag%2Fproduct_11.jpg?alt=media&token=69d788a9-768e-4c74-b02d-2742c4167032",
              'blurUrl': "LABr0D03x[%b.ObZRlt6.j%wRQRn",
            },
            {
              'localimg': "assets/images/fullApps/grobag/product_11.jpg",
              'img':
                  "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/grobag%2Fproduct_11.jpg?alt=media&token=69d788a9-768e-4c74-b02d-2742c4167032",
              'blurUrl': "LABr0D03x[%b.ObZRlt6.j%wRQRn",
            },
            {
              'localimg': "assets/images/fullApps/grobag/product_11.jpg",
              'img':
                  "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/grobag%2Fproduct_11.jpg?alt=media&token=69d788a9-768e-4c74-b02d-2742c4167032",
              'blurUrl': "LABr0D03x[%b.ObZRlt6.j%wRQRn",
            },
            {
              'localimg': "assets/images/fullApps/grobag/product_11.jpg",
              'img':
                  "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/grobag%2Fproduct_11.jpg?alt=media&token=69d788a9-768e-4c74-b02d-2742c4167032",
              'blurUrl': "LABr0D03x[%b.ObZRlt6.j%wRQRn",
            },
          ]
        },
        {
          'tag': "9",
          'localimg': "assets/images/fullApps/grobag/product_12.jpg",
          'img':
              "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/grobag%2Fproduct_12.jpg?alt=media&token=6d09fde4-a844-4932-83f3-0487f940b24a",
          'blurUrl': "LZIsH=Ip.AoztmWAoNkC?wt7IAV[",
          'name': "Bitter Gourd",
          'descprice': "1700",
          'price': "2000",
          'qty': '500 gm',
          'imglist': [
            {
              'localimg': "assets/images/fullApps/grobag/product_12.jpg",
              'img':
                  "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/grobag%2Fproduct_12.jpg?alt=media&token=6d09fde4-a844-4932-83f3-0487f940b24a",
              'blurUrl': "LZIsH=Ip.AoztmWAoNkC?wt7IAV[",
            },
            {
              'localimg': "assets/images/fullApps/grobag/product_12.jpg",
              'img':
                  "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/grobag%2Fproduct_12.jpg?alt=media&token=6d09fde4-a844-4932-83f3-0487f940b24a",
              'blurUrl': "LZIsH=Ip.AoztmWAoNkC?wt7IAV[",
            },
            {
              'localimg': "assets/images/fullApps/grobag/product_12.jpg",
              'img':
                  "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/grobag%2Fproduct_12.jpg?alt=media&token=6d09fde4-a844-4932-83f3-0487f940b24a",
              'blurUrl': "LZIsH=Ip.AoztmWAoNkC?wt7IAV[",
            },
            {
              'localimg': "assets/images/fullApps/grobag/product_12.jpg",
              'img':
                  "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/grobag%2Fproduct_12.jpg?alt=media&token=6d09fde4-a844-4932-83f3-0487f940b24a",
              'blurUrl': "LZIsH=Ip.AoztmWAoNkC?wt7IAV[",
            },
          ]
        },
        {
          'tag': "5",
          'localimg': "assets/images/fullApps/grobag/product_13.jpg",
          'img':
              "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/grobag%2Fproduct_13.jpg?alt=media&token=12432118-e805-4efe-824e-5090e435e985",
          'blurUrl': "LUKT*}?Gy?XS%LVsj[bbYQkDZ\$ae",
          'name': "Red Chili",
          'descprice': "25",
          'price': "2200",
          'qty': '250 gm',
          'imglist': [
            {
              'localimg': "assets/images/fullApps/grobag/product_13.jpg",
              'img':
                  "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/grobag%2Fproduct_13.jpg?alt=media&token=12432118-e805-4efe-824e-5090e435e985",
              'blurUrl': "LUKT*}?Gy?XS%LVsj[bbYQkDZ\$ae",
            },
            {
              'localimg': "assets/images/fullApps/grobag/product_13.jpg",
              'img':
                  "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/grobag%2Fproduct_13.jpg?alt=media&token=12432118-e805-4efe-824e-5090e435e985",
              'blurUrl': "LUKT*}?Gy?XS%LVsj[bbYQkDZ\$ae",
            },
            {
              'localimg': "assets/images/fullApps/grobag/product_13.jpg",
              'img':
                  "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/grobag%2Fproduct_13.jpg?alt=media&token=12432118-e805-4efe-824e-5090e435e985",
              'blurUrl': "LUKT*}?Gy?XS%LVsj[bbYQkDZ\$ae",
            },
            {
              'localimg': "assets/images/fullApps/grobag/product_13.jpg",
              'img':
                  "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/grobag%2Fproduct_13.jpg?alt=media&token=12432118-e805-4efe-824e-5090e435e985",
              'blurUrl': "LUKT*}?Gy?XS%LVsj[bbYQkDZ\$ae",
            },
          ]
        },
      ]
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
      children: [
        _searchbar(),
        _slider(),
        _catList(),
        _section(),
        _offerImage()
      ],
    ));
  }

  void initializeSlider() {
    setState(() {
      pages = homeSliderList.map((slider) {
        return _buildImagePageItem(slider['img'], slider['blurUrl']);
      }).toList();
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    initializeSlider();
    WidgetsBinding.instance.addPostFrameCallback((_) => _animateSlider());
  }

  _offerImage() {
    return ListView.builder(
      padding: EdgeInsets.symmetric(vertical: 10),
      itemCount: offerBannerList.length,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return _getOfferImage(index);
      },
    );
  }

  _searchbar() {
    return Container(
      height: 50,
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Container(
            width: 120,
            height: 30,
            padding: EdgeInsets.all(5.0),
            margin: const EdgeInsets.only(right: 8.0),
            decoration: BoxDecoration(
              border: Border.all(width: 1.0, color: fontLight.withOpacity(0.5)),
              borderRadius: BorderRadius.all(Radius.circular(
                      5.0) //                 <--- border radius here
                  ),
            ),
            child: Center(
              child: DropdownButtonHideUnderline(
                  child: DropdownButton(
                dropdownColor: primary.withOpacity(0.9),
                isExpanded: false,
                value: curStatus,
                onChanged: (dynamic newValue) {
                  setState(() {
                    curStatus = newValue;
                  });
                },
                items: searchList.map((String st) {
                  return DropdownMenuItem<String>(
                    value: st,
                    child: Text(
                      st,
                    ),
                  );
                }).toList(),
              )),
            ),
          ),
          Expanded(
            child: GestureDetector(
              child: SizedBox(
                height: 30,
                child: TextField(
                  enabled: false,
                  textAlign: TextAlign.left,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.fromLTRB(15.0, 5.0, 0, 5.0),
                    border: OutlineInputBorder(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(5.0),
                      ),
                      borderSide: BorderSide(
                        width: 0,
                        style: BorderStyle.solid,
                      ),
                    ),
                    isDense: true,
                    hintText: 'Search for product',
                    hintStyle: Theme.of(context).textTheme.bodyText2!.copyWith(
                          color: fontColor,
                        ),
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SvgPicture.asset(
                        'assets/images/fullApps/grobag/search-home.svg',
                      ),
                    ),
                  ),
                ),
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => GrobagSearch()));
              },
            ),
          ),
        ],
      ),
    );
  }

  _getOfferImage(index) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
      child: InkWell(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: OctoImage(
            image: CachedNetworkImageProvider(
              offerBannerList[index]['img'],
            ),
            placeholderBuilder: OctoPlaceholder.blurHash(
              offerBannerList[index]['blurUrl'],
            ),
            height: MediaQuery.of(context).size.height / 5.5,
            width: double.maxFinite,
            errorBuilder: OctoError.icon(color: black),
            fit: BoxFit.fill,
          ),
        ),
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => GrobagProducList(
                        title: catList[index]["title"],
                      )));
        },
      ),
    );
  }

  Widget _slider() {
    double height = MediaQuery.of(context).size.width / 2.2;

    return pages.isNotEmpty
        ? Stack(
            alignment: Alignment.bottomLeft,
            children: [
              Container(
                height: height,
                width: double.infinity,
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: PageView.builder(
                  itemCount: homeSliderList.length,
                  scrollDirection: Axis.horizontal,
                  controller: _controller,
                  physics: AlwaysScrollableScrollPhysics(),
                  onPageChanged: (index) {
                    if (mounted) {
                      setState(() {
                        _curSlider = index;
                      });
                    }
                  },
                  itemBuilder: (BuildContext context, int index) {
                    return pages[index];
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 30, bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: _buildIndicator(),
                ),
              ),
            ],
          )
        : Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              child: Container(
                height: height,
                width: double.infinity,
                color: lightBack,
              ),
            ),
          );
  }

  _section() {
    return ListView.builder(
      padding: EdgeInsets.all(0),
      itemCount: sectList.length,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return _singleSection(index);
      },
    );
  }

  _singleSection(int index) {
    return sectList[index]["productList"].length > 0
        ? Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                _getHeading(sectList[index]["section"], index),
                _getSection(index),
              ],
            ),
          )
        : Container();
  }

  _getSection(int i) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.25,
      child: ListView.builder(
        itemCount: sectList[i]["productList"].length < 10
            ? sectList[i]["productList"].length
            : 10,
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        physics: AlwaysScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return Container(
            width: MediaQuery.of(context).size.width * 0.4,
            padding: const EdgeInsetsDirectional.only(end: 10),
            child: InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => GrobagProductDetail(
                            pos: 0,
                            imglist: sectList[i]['productList'][index]
                                ['imglist'])));
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsetsDirectional.only(bottom: 5.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        child: OctoImage(
                          image: CachedNetworkImageProvider(
                            sectList[i]['productList'][index]['img'],
                          ),
                          placeholderBuilder: OctoPlaceholder.blurHash(
                            sectList[i]['productList'][index]['blurUrl'],
                          ),
                          errorBuilder: OctoError.icon(color: black),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Text(
                    sectList[i]['productList'][index]['qty'],
                    style: Theme.of(context).textTheme.caption!.copyWith(
                          color: secondary,
                        ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                  Text(
                    sectList[i]['productList'][index]['name'],
                    style: Theme.of(context).textTheme.subtitle2!.copyWith(
                          color: fontColor,
                          fontWeight: FontWeight.w700,
                        ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                  Row(
                    children: [
                      Text(
                        "\$ " + sectList[i]['productList'][index]['descprice'],
                        style: TextStyle(
                          color: primary,
                          fontWeight: FontWeight.w400,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                      Spacer(),
                      Container(
                        width: 24,
                        height: 24,
                        decoration: BoxDecoration(
                            color: primary.withOpacity(0.3),
                            borderRadius: BorderRadius.circular(6)),
                        child: Icon(
                          Icons.add,
                          size: 12,
                          color: primary,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  _getHeading(String title, int index) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(top: 10.0, bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
            child: Text(
              title,
              style: Theme.of(context).textTheme.subtitle1!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
          InkWell(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'View all',
                style: Theme.of(context)
                    .textTheme
                    .caption!
                    .copyWith(color: primary),
              ),
            ),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => GrobagProducList(
                            title: title,
                          )));
            },
          ),
        ],
      ),
    );
  }

  _catList() {
    return GridView.count(
        padding: EdgeInsets.all(20),
        crossAxisCount: 5,
        shrinkWrap: true,
        childAspectRatio: 0.8,
        physics: NeverScrollableScrollPhysics(),
        mainAxisSpacing: 5,
        crossAxisSpacing: 10,
        children: List.generate(
          catList.length < 10 ? catList.length : 10,
          (index) {
            return InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => GrobagProducList(
                              title: catList[index]["title"],
                            )));
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsetsDirectional.only(bottom: 5.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: OctoImage(
                          image: CachedNetworkImageProvider(
                            catList[index]["img"],
                          ),
                          placeholderBuilder: OctoPlaceholder.blurHash(
                            catList[index]["blurUrl"],
                          ),
                          width: double.maxFinite,
                          errorBuilder: OctoError.icon(color: black),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                  Text(
                    catList[index]["title"],
                    style: Theme.of(context).textTheme.caption!.copyWith(
                          color: fontColor,
                        ),
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            );
          },
        ));
  }

  List<T?> map<T>(List list, Function handler) {
    List<T?> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }

    return result;
  }

  List<Widget> _buildIndicator() {
    List<Widget> indicators = [];
    for (int i = 0; i < pages.length; i++) {
      if (_curSlider == i) {
        indicators.add(_indicator(true));
      } else {
        indicators.add(_indicator(false));
      }
    }

    return indicators;
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
        duration: Duration(milliseconds: 300),
        height: 6,
        width: isActive ? 25 : 7,
        margin: EdgeInsets.only(right: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: isActive ? primary : fontLight,
        ));
  }

  void _animateSlider() {
    Future.delayed(Duration(seconds: 30)).then((_) {
      if (mounted) {
        int nextPage = _controller.hasClients
            ? _controller.page!.round() + 1
            : _controller.initialPage;

        if (nextPage == homeSliderList.length) {
          nextPage = 0;
        }
        if (_controller.hasClients) {
          _controller
              .animateToPage(nextPage,
                  duration: Duration(milliseconds: 200), curve: Curves.linear)
              .then((_) => _animateSlider());
        }
      }
    });
  }

  Widget _buildImagePageItem(String? slider, String? blurUrl) {
    double height = MediaQuery.of(context).size.width / 2.2;

    return GestureDetector(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10.0),
        child: OctoImage(
          image: CachedNetworkImageProvider(
            slider!,
          ),
          placeholderBuilder: OctoPlaceholder.blurHash(
            blurUrl!,
          ),
          height: height,
          width: double.maxFinite,
          errorBuilder: OctoError.icon(color: black),
          fit: BoxFit.fill,
        ),
      ),
      onTap: () {},
    );
  }
}
