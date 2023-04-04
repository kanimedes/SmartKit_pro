import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:octo_image/octo_image.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'package:smartkit_pro/ui/fullApps/happyShop/Helper/HappyShopColor.dart';
import 'package:smartkit_pro/ui/fullApps/happyShop/Helper/HappyShopString.dart';

class HappyShopStaggeredList extends StatefulWidget {
  const HappyShopStaggeredList({Key? key}) : super(key: key);

  @override
  _HappyShopStaggeredListState createState() => _HappyShopStaggeredListState();
}

List listUrl = [
  {
    'localimg': "assets/images/fullApps/happyshop/man1.jpg",
    'img':
        "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/happyshop%2Fman1.jpg?alt=media&token=912bd1e3-8275-4452-9440-fb49f94ce43e",
    'blurUrl': "LVMk35t7_Nt8%MayIUbHtRayRPj]",
    'name': "Printed Men Round Neck Maroon T-Shirt",
    'descprice': "2500",
    'price': "3500",
    'rating': "4.5",
    'noOfRating': "90"
  },
  {
    'localimg': "assets/images/fullApps/happyshop/man2.jpg",
    'img':
        "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/happyshop%2Fman2.jpg?alt=media&token=62642dc8-c563-4aa2-a459-528aea42781c",
    'blurUrl': "LZOWg4jY~qt7-:x]S4RP?cfPD\$WC",
    'name': null,
    'descprice': null,
    'price': null,
    'rating': null,
    'noOfRating': null
  },
  {
    'localimg': "assets/images/fullApps/happyshop/man3.jpg",
    'img':
        "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/happyshop%2Fman3.jpg?alt=media&token=9e04c698-1a73-4f01-a181-416f1c86269c",
    'blurUrl': "L=ONB@WB~qoz-;kCM{ayxtj[NGae",
    'name': "Solid Men Round Neck Grey T-Shirt",
    'descprice': "1300",
    'price': "1400",
    'rating': "3.5",
    'noOfRating': "45"
  },
  {
    'localimg': "assets/images/fullApps/happyshop/man4.jpg",
    'img':
        "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/happyshop%2Fman4.jpg?alt=media&token=dda49a0f-f1fd-475f-bbd3-1f86b2119aed",
    'blurUrl': "LDK]u?~V00I9zms,*0%20KV@?btR",
    'name': "Men Regular Fit Solid Casual Shirt",
    'descprice': "1700",
    'price': "2000",
    'rating': "4.5",
    'noOfRating': "150"
  },
  {
    'localimg': "assets/images/fullApps/happyshop/man5.jpg",
    'img':
        "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/happyshop%2Fman5.jpg?alt=media&token=cb80716b-0cba-4f88-8b2d-50df02adc5a7",
    'blurUrl': "LxOgKQn%~pS#-pRkNGxu%1j[S4j[",
    'name': "Solid Men Round Neck Grey T-Shirt",
    'descprice': "1300",
    'price': "1400",
    'rating': "3.5",
    'noOfRating': "45"
  },
  {
    'localimg': "assets/images/fullApps/happyshop/man6.jpg",
    'img':
        "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/happyshop%2Fman6.jpg?alt=media&token=33594d5d-2c33-43d8-9847-a16e188f36bc",
    'blurUrl': "LOOffWD%ys%M-pjsIpkC0}jZ={bI",
    'name': "Woman Regular Fit Solid Casual Shirt",
    'descprice': "1700",
    'price': "2000",
    'rating': "4.5",
    'noOfRating': "150"
  },
  {
    'localimg': "assets/images/fullApps/happyshop/woman_f.jpg",
    'img':
        "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/happyshop%2Fwoman_f.jpg?alt=media&token=bae9c0cd-6f80-48e9-8d06-93637d0eaa0c",
    'blurUrl': "LwN,-]Rj_Nxu%1j[M}WVf+kCaeae",
    'name': null,
    'descprice': null,
    'price': null,
    'rating': null,
    'noOfRating': null
  },
  {
    'localimg': "assets/images/fullApps/happyshop/woman_g.jpg",
    'img':
        "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/happyshop%2Fwoman_g.jpg?alt=media&token=2ff10184-cfba-4583-940a-83eaeeeb7c62",
    'blurUrl': "LELDx[j@~Xt7%LofNGRj%2f6E1t7",
    'name': "Solid Woman Round Neck Grey T-Shirt",
    'descprice': "1300",
    'price': "1400",
    'rating': "3.5",
    'noOfRating': "45"
  },
  {
    'localimg': "assets/images/fullApps/happyshop/woman_h.jpg",
    'img':
        "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/happyshop%2Fwoman_h.jpg?alt=media&token=11fab84b-ff90-433b-9677-bb712bbd7647",
    'blurUrl': "LOGbuOS8^z--_4WYWX%M~Tt2M}fm",
    'name': "Woman Regular Fit Solid Casual Shirt",
    'descprice': "1700",
    'price': "2000",
    'rating': "4.5",
    'noOfRating': "150"
  },
  {
    'localimg': "assets/images/fullApps/happyshop/woman_i.jpg",
    'img':
        "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/happyshop%2Fwoman_i.jpg?alt=media&token=ba5572d2-25ea-4083-95a9-7dc21024e1a0",
    'blurUrl': "LQK-zpM{*0Mx~Wo#ozbHE2XS%MtR",
    'name': "Solid Woman Round Neck Grey T-Shirt",
    'descprice': "1300",
    'price': "1400",
    'rating': "3.5",
    'noOfRating': "45"
  },
  {
    'localimg': "assets/images/fullApps/happyshop/woman_j.jpg",
    'img':
        "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/happyshop%2Fwoman_j.jpg?alt=media&token=21c34958-4f60-43eb-9581-d4208dbf4380",
    'blurUrl': "LPPXwKIu|BRQZzxZ-;S5zmR,aKoJ",
    'name': "Woman Regular Fit Solid Casual Shirt",
    'descprice': "1700",
    'price': "2000",
    'rating': "4.5",
    'noOfRating': "150"
  },
  {
    'localimg': "assets/images/fullApps/happyshop/woman_k.jpg",
    'img':
        "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/happyshop%2Fwoman_k.jpg?alt=media&token=94370e0a-92a7-433a-968c-04ab09b9463e",
    'blurUrl': "LYMq|^of}[j[xafkfkjtRPoLNGR*",
    'name': null,
    'descprice': null,
    'price': null,
    'rating': null,
    'noOfRating': null
  },
  {
    'localimg': "assets/images/fullApps/happyshop/woman_l.jpg",
    'img':
        "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/happyshop%2Fwoman_l.jpg?alt=media&token=db01f6e4-8903-46b7-b087-e1fcf74553f2",
    'blurUrl': "LRQ@L5IW}j%0t6bInin~\${ocNfR-",
    'name': "Solid Woman Round Neck Grey T-Shirt",
    'descprice': "1300",
    'price': "1400",
    'rating': "3.5",
    'noOfRating': "45"
  },
];

class _HappyShopStaggeredListState extends State<HappyShopStaggeredList> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return Future.value(true);
      },
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios, color: primary),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: Text("All Products"),
          backgroundColor: Colors.white,
        ),
        /*
        StaggeredGridView.countBuilder(
            crossAxisCount: 2,
            itemCount: listUrl.length,
            staggeredTileBuilder: (index) {
              // ignore: unnecessary_new
              return new StaggeredTile.fit(1);
            },
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {},
                child: Container(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(10.0)),
                  child: StaggerdCard(
                    imgurl: listUrl[index]['img'],
                    itemname: listUrl[index]['name'],
                    descprice: listUrl[index]['descprice'],
                    price: listUrl[index]['price'],
                    rating: listUrl[index]['rating'],
                    imageblururl: listUrl[index]['blurUrl'],
                    localimg: listUrl[index]['localimg'],
                  ),
                ),
              );
            })

         */

        body: StaggeredGrid.count(
          crossAxisCount: 2,
          children: listUrl
              .map((data) => Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0)),
                    child: StaggerdCard(
                      imgurl: data['img'],
                      itemname: data['name'],
                      descprice: data['descprice'],
                      price: data['price'],
                      rating: data['rating'],
                      imageblururl: data['blurUrl'],
                      localimg: data['localimg'],
                    ),
                  ))
              .toList(),
        ),
      ),
    );
  }
}

class StaggerdCard extends StatefulWidget {
  const StaggerdCard(
      {Key? key,
      this.imgurl,
      this.rating,
      this.itemname,
      this.price,
      this.descprice,
      this.imageblururl,
      this.localimg})
      : super(key: key);
  final String? imgurl,
      rating,
      itemname,
      price,
      descprice,
      imageblururl,
      localimg;
  @override
  _StaggerdCardState createState() => _StaggerdCardState();
}

class _StaggerdCardState extends State<StaggerdCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(5), topRight: Radius.circular(5)),
      ),
      child: Card(
        elevation: 1.0,
        child: Column(
          children: [
            Stack(
              alignment: Alignment.topRight,
              children: [
                ClipRRect(
                  borderRadius: widget.itemname != null
                      ? BorderRadius.only(
                          topLeft: Radius.circular(5),
                          topRight: Radius.circular(5))
                      : BorderRadius.circular(5.0),
                  child: OctoImage(
                    image: CachedNetworkImageProvider(widget.imgurl!),
                    placeholderBuilder: OctoPlaceholder.blurHash(
                      widget.imageblururl!,
                    ),
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height / 3.5,
                    errorBuilder: OctoError.icon(color: textcolor),
                    fit: BoxFit.fill,
                  ),
                ),
                widget.rating != null
                    ? Card(
                        child: Padding(
                        padding: const EdgeInsets.all(1.5),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.star,
                              color: Colors.yellow,
                              size: 10,
                            ),
                            Text(
                              widget.rating!,
                              style: Theme.of(context)
                                  .textTheme
                                  .overline!
                                  .copyWith(letterSpacing: 0.2),
                            ),
                          ],
                        ),
                      ))
                    : Container(),
              ],
            ),
            widget.itemname != null
                ? Padding(
                    padding: const EdgeInsets.all(0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Expanded(
                          child: Text(
                            widget.itemname!,
                            style: Theme.of(context)
                                .textTheme
                                .overline!
                                .copyWith(
                                    color: Colors.black,
                                    fontSize: 16.0,
                                    letterSpacing: 0.5),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  )
                : Container(),
            widget.price != null
                ? Padding(
                    padding: const EdgeInsets.only(left: 5.0, bottom: 5),
                    child: Row(
                      children: <Widget>[
                        Text(" " + CUR_CURRENCY + " " + widget.price!,
                            style: TextStyle(color: primary)),
                        SizedBox(
                          width: 5.0,
                        ),
                        widget.price != null
                            ? Text(
                                CUR_CURRENCY + "" + widget.descprice!,
                                style: Theme.of(context)
                                    .textTheme
                                    .overline!
                                    .copyWith(
                                        decoration: TextDecoration.lineThrough,
                                        letterSpacing: 1),
                              )
                            : Container(),
                      ],
                    ),
                  )
                : Container()
          ],
        ),
      ),
    );
  }
}
