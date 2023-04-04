import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:octo_image/octo_image.dart';

import 'package:smartkit_pro/ui/fullApps/happyShop/Helper/HappyShopColor.dart';
import 'package:smartkit_pro/ui/fullApps/happyShop/Helper/HappyShopString.dart';
import 'package:smartkit_pro/ui/fullApps/happyShop/Screen/HappyShopHome.dart';

class HappyShopNotification extends StatefulWidget {
  final bool? appbar;
  const HappyShopNotification({Key? key, this.appbar}) : super(key: key);

  @override
  _HappyShopNotificationState createState() => _HappyShopNotificationState();
}

class _HappyShopNotificationState extends State<HappyShopNotification>
    with TickerProviderStateMixin {
  Animation? buttonSqueezeanimation;
  late AnimationController buttonController;

  @override
  void initState() {
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
    super.initState();
  }

  @override
  void dispose() {
    buttonController.dispose();
    super.dispose();
  }

  List notiList = [
    {
      'localimg': "assets/images/fullApps/happyshop/man1.jpg",
      'img':
          "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/happyshop%2Fman1.jpg?alt=media&token=912bd1e3-8275-4452-9440-fb49f94ce43e",
      'blurUrl': "LVMk35t7_Nt8%MayIUbHtRayRPj]",
      "title": "Men's Shirt",
      "date": "1-2-2021",
      "desc": "50% of on Men's Shirt"
    },
    {
      'localimg': "assets/images/fullApps/happyshop/man2.jpg",
      'img':
          "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/happyshop%2Fman2.jpg?alt=media&token=62642dc8-c563-4aa2-a459-528aea42781c",
      'blurUrl': "LZOWg4jY~qt7-:x]S4RP?cfPD\$WC",
      "title": "6+ lakh + style & 2500 + brands for you!",
      "date": "1-2-2021",
      "desc": "Get ready for deals you'll go med over"
    },
    {
      'localimg': "assets/images/fullApps/happyshop/man3.jpg",
      'img':
          "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/happyshop%2Fman3.jpg?alt=media&token=9e04c698-1a73-4f01-a181-416f1c86269c",
      'blurUrl': "L=ONB@WB~qoz-;kCM{ayxtj[NGae",
      "title": "Bigest Steal on Ethnicwear!",
      "date": "1-2-2021",
      "desc": "Bag 60-80% off on Biba, Aurelia & AKS"
    },
    {
      'localimg': "assets/images/fullApps/happyshop/man4.jpg",
      'img':
          "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/happyshop%2Fman4.jpg?alt=media&token=dda49a0f-f1fd-475f-bbd3-1f86b2119aed",
      'blurUrl': "LDK]u?~V00I9zms,*0%20KV@?btR",
      "title": "Score 50-90% off, plus extra 30% off!",
      "date": "1-2-2021",
      "desc": "The widest catalogue awaits! HURRY"
    },
    {
      'localimg': "assets/images/fullApps/happyshop/man5.jpg",
      'img':
          "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/happyshop%2Fman5.jpg?alt=media&token=cb80716b-0cba-4f88-8b2d-50df02adc5a7",
      'blurUrl': "LxOgKQn%~pS#-pRkNGxu%1j[S4j[",
      "title": "The comfiest tees you nedd to bag",
      "date": "1-2-2021",
      "desc": "All styles of FLAT 74% off. HURRY!"
    },
    {
      'localimg': "assets/images/fullApps/happyshop/man6.jpg",
      'img':
          "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/happyshop%2Fman6.jpg?alt=media&token=33594d5d-2c33-43d8-9847-a16e188f36bc",
      'blurUrl': "LOOffWD%ys%M-pjsIpkC0}jZ={bI",
      "title": "You just can't let this one get away!",
      "date": "1-2-2021",
      "desc": "Bag tops & tees of FLAT 70% off now"
    },
    {
      'localimg': "assets/images/fullApps/happyshop/woman_f.jpg",
      'img':
          "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/happyshop%2Fwoman_f.jpg?alt=media&token=bae9c0cd-6f80-48e9-8d06-93637d0eaa0c",
      'blurUrl': "LwN,-]Rj_Nxu%1j[M}WVf+kCaeae",
      "title": "Race towards perfection with PUMA",
      "date": "1-2-2021",
      "desc": "Min. 65% off on the best style!"
    },
    {
      'localimg': "assets/images/fullApps/happyshop/woman_g.jpg",
      'img':
          "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/happyshop%2Fwoman_g.jpg?alt=media&token=2ff10184-cfba-4583-940a-83eaeeeb7c62",
      'blurUrl': "LELDx[j@~Xt7%LofNGRj%2f6E1t7",
      "title": "NEW ARRIVALS to go ga-ga over!",
      "date": "1-2-2021",
      "desc": "Starts at R.299 with EXTRA DISCOUNT! HURRY!"
    },
    {
      'localimg': "assets/images/fullApps/happyshop/woman_h.jpg",
      'img':
          "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/happyshop%2Fwoman_h.jpg?alt=media&token=11fab84b-ff90-433b-9677-bb712bbd7647",
      'blurUrl': "LOGbuOS8^z--_4WYWX%M~Tt2M}fm",
      "title": "It just doesn't g get better than this!",
      "date": "1-2-2021",
      "desc": "You buy 1, we'll give you 3 FREE!"
    }
  ];

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
                  title: Text("Notifications",
                      style: TextStyle(color: Colors.white)),
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
                    "Notifications",
                    style: TextStyle(
                      color: primary,
                    ),
                  ),
                  systemOverlayStyle: SystemUiOverlayStyle.dark,
                  backgroundColor: Colors.white,
                  elevation: 5,
                )
              : PreferredSize(
                  preferredSize: Size.fromHeight(0), child: AppBar()),
          body: notiList.isEmpty
              ? Padding(
                  padding: const EdgeInsets.only(top: kToolbarHeight),
                  child: Center(child: Text(noNoti)))
              : ListView.builder(
                  shrinkWrap: true,
                  itemCount: notiList.length,
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return listItem(index);
                  },
                )),
    );
  }

  Widget listItem(int index) {
    return Card(
      elevation: 0.1,
      shadowColor: happyshopcolor5,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    notiList[index]['date'],
                    style: TextStyle(color: primary),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Text(
                      notiList[index]['title'],
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Text(notiList[index]['desc'])
                ],
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width / 6,
              height: MediaQuery.of(context).size.height / 12,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(3.0),
                child: OctoImage(
                  image: CachedNetworkImageProvider(notiList[index]['img']),
                  placeholderBuilder: OctoPlaceholder.blurHash(
                    notiList[index]['blurUrl'],
                  ),
                  height: MediaQuery.of(context).size.height / 12,
                  width: MediaQuery.of(context).size.width / 6,
                  errorBuilder: OctoError.icon(color: textcolor),
                  fit: BoxFit.cover,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
