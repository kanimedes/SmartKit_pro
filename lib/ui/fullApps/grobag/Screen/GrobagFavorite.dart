import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:octo_image/octo_image.dart';
import 'package:smartkit_pro/ui/fullApps/grobag/Helper/GrobagColor.dart';

import 'GrobagHome.dart';

class GrobagFavorite extends StatefulWidget {
  const GrobagFavorite({Key? key}) : super(key: key);

  @override
  _GrobagFavoriteState createState() => _GrobagFavoriteState();
}

class _GrobagFavoriteState extends State<GrobagFavorite> {
  List favList = [
    {
      'tag': "4",
      'localimg': "assets/images/fullApps/grobag/product_5.jpg",
      'img':
          "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/grobag%2Fproduct_5.jpg?alt=media&token=05c0d79e-c784-4e41-8634-429a88b6ebc5",
      'blurUrl': "LOPEaz_J},ENOpM}\$yoe-iR*EPs.",
      'name': "Pineapple",
      'descprice': "1700",
      'price': "2000",
      'qty': '250 gm',
      'isFav': true
    },
    {
      'tag': "5",
      'localimg': "assets/images/fullApps/grobag/product_6.jpg",
      'img':
          "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/grobag%2Fproduct_6.jpg?alt=media&token=ffab6aaa-8bdb-490c-a081-21b330c2e5c2",
      'blurUrl': "LbQZ{8R4~CxGR5aJniWV^+o0E1S#",
      'name': "Strawberry",
      'descprice': "25",
      'price': "2200",
      'qty': '250 gm',
      'isFav': true
    },
    {
      'tag': "1",
      'localimg': "assets/images/fullApps/grobag/product_7.jpg",
      'img':
          "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/grobag%2Fproduct_7.jpg?alt=media&token=53603a0a-e39d-4858-994b-254d63561f51",
      'blurUrl': "LHR8e+}=:-B7]-RnODS}{ONIOp,@",
      'name': "Pear",
      'descprice': "25",
      'price': "50",
      'qty': "1 kg",
      'isFav': true
    },
    {
      'tag': "2",
      'localimg': "assets/images/fullApps/grobag/product_8.jpg",
      'img':
          "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/grobag%2Fproduct_8.jpg?alt=media&token=4bd2a674-dc5e-4dcf-859d-1a3b9a9f24c7",
      'blurUrl': "LADb}@%J9OM|~VIaR--m04IW-+%1",
      'name': "Avocado",
      'descprice': "1000",
      'price': "1200",
      'qty': '500 gm',
      'isFav': true
    },
    {
      'tag': "3",
      'localimg': "assets/images/fullApps/grobag/product_9.jpg",
      'img':
          "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/grobag%2Fproduct_9.jpg?alt=media&token=2bee53f6-153e-4937-876a-f3b61a24fd08",
      'blurUrl': "LGRJ*2%a?Tt4HzjaRmag~fRmD;e;",
      'name': "Tomato",
      'descprice': "1300",
      'price': "1400",
      'qty': '2 kg',
      'isFav': true
    },
    {
      'tag': "8",
      'localimg': "assets/images/fullApps/grobag/product_10.jpg",
      'img':
          "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/grobag%2Fproduct_10.jpg?alt=media&token=f519d166-e55a-4b19-a228-3a7134940baa",
      'blurUrl': "LNPOYP^O.RJ,-.axM~V@}]9^o}\$*",
      'name': "Capsicum",
      'descprice': "1300",
      'price': "1400",
      'qty': '1 kg',
      'isFav': true
    },
    {
      'tag': "6",
      'localimg': "assets/images/fullApps/grobag/product_11.jpg",
      'img':
          "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/grobag%2Fproduct_11.jpg?alt=media&token=69d788a9-768e-4c74-b02d-2742c4167032",
      'blurUrl': "LABr0D03x[%b.ObZRlt6.j%wRQRn",
      'name': "Cauliflower",
      'descprice': "2500",
      'price': "3500",
      'qty': '250 gm',
      'isFav': true
    },
    {
      'tag': "7",
      'localimg': "assets/images/fullApps/grobag/product_12.jpg",
      'img':
          "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/grobag%2Fproduct_12.jpg?alt=media&token=6d09fde4-a844-4932-83f3-0487f940b24a",
      'blurUrl': "LZIsH=Ip.AoztmWAoNkC?wt7IAV[",
      'name': "Bitter Gourd",
      'descprice': "1000",
      'price': "1000",
      'qty': '250 gm',
      'isFav': true
    },
    {
      'tag': "9",
      'localimg': "assets/images/fullApps/grobag/product_13.jpg",
      'img':
          "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/grobag%2Fproduct_13.jpg?alt=media&token=12432118-e805-4efe-824e-5090e435e985",
      'blurUrl': "LUKT*}?Gy?XS%LVsj[bbYQkDZ\$ae",
      'name': "Red Chili",
      'descprice': "1700",
      'price': "2000",
      'qty': '500 gm',
      'isFav': true
    },
    {
      'tag': "5",
      'localimg': "assets/images/fullApps/grobag/product_14.jpg",
      'img':
          "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/grobag%2Fproduct_14.jpg?alt=media&token=853c83b9-c928-4508-91aa-13234c30e85f",
      'blurUrl': "LPRnFFr??*VL~dkUIbV_ToWCiit#",
      'name': "Watermelon",
      'descprice': "25",
      'price': "2200",
      'qty': '250 gm',
      'isFav': true
    },
  ];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => GrobagHome(),
            )) as Future<bool>;
      } as Future<bool> Function()?,
      child: GridView.count(
          padding: EdgeInsets.all(20),
          crossAxisCount: 2,
          shrinkWrap: true,
          childAspectRatio: 0.8,
          physics: BouncingScrollPhysics(),
          mainAxisSpacing: 15,
          crossAxisSpacing: 10,
          children: List.generate(
            favList.length,
            (index) {
              return Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                width: MediaQuery.of(context).size.width * 0.4,
                child: GestureDetector(
                  onTap: () {},
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Expanded(
                        child: Stack(
                          children: [
                            Positioned.fill(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10.0),
                                child: OctoImage(
                                  image: CachedNetworkImageProvider(
                                    favList[index]["img"],
                                  ),
                                  placeholderBuilder: OctoPlaceholder.blurHash(
                                    favList[index]['blurUrl'],
                                  ),
                                  errorBuilder: OctoError.icon(color: black),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            Positioned(
                              right: 5,
                              top: 5,
                              child: InkWell(
                                child: Container(
                                  width: 20,
                                  height: 20,
                                  decoration: BoxDecoration(
                                    color: secondary.withOpacity(0.2),
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  child: Icon(
                                    favList[index]['isFav']
                                        ? Icons.favorite
                                        : Icons.favorite_border,
                                    size: 15,
                                    color: secondary,
                                  ),
                                ),
                                onTap: () {
                                  setState(() {
                                    favList[index]['isFav'] =
                                        !favList[index]['isFav'];
                                  });
                                },
                              ),
                            )
                          ],
                        ),
                      ),
                      Text(
                        favList[index]['qty'],
                        style: Theme.of(context).textTheme.caption!.copyWith(
                              color: secondary,
                            ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                      Text(
                        favList[index]['name'],
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
                            "\$ " + favList[index]['descprice'],
                            style: TextStyle(
                              color: primary,
                              fontWeight: FontWeight.w400,
                            ),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                          Spacer(),
                          Container(
                            margin: EdgeInsets.only(bottom: 5, right: 5),
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
          )),
    );
  }
}
