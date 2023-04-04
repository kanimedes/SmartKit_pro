import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smartkit_pro/ui/fullApps/happyShop/Helper/HappyShopColor.dart';
import 'package:smartkit_pro/ui/fullApps/happyShop/Helper/HappyShopString.dart';

class HappyShopCatogeryAll extends StatefulWidget {
  const HappyShopCatogeryAll({Key? key}) : super(key: key);

  @override
  _HappyShopCatogeryAllState createState() => _HappyShopCatogeryAllState();
}

class _HappyShopCatogeryAllState extends State<HappyShopCatogeryAll> {
  int offset = perPage;
  int total = 0;
  ScrollController controller = new ScrollController();
  List tempList = [];

  List catList = [
    {'img': "assets/images/fullApps/happyshop/cat_1.png", 'title': "Men's"},
    {'img': "assets/images/fullApps/happyshop/cat_2.png", 'title': "women's"},
    {
      'img': "assets/images/fullApps/happyshop/cat_3.png",
      'title': "Women's Shoes"
    },
    {
      'img': "assets/images/fullApps/happyshop/cat_4.png",
      'title': "Man's Shoes"
    },
    {'img': "assets/images/fullApps/happyshop/cat_5.png", 'title': "Tie"},
    {'img': "assets/images/fullApps/happyshop/cat_6.png", 'title': "Earring"},
  ];

  getAppBar(String title, BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: Icon(Icons.arrow_back_ios, color: primary),
        onPressed: () => Navigator.of(context).pop(),
      ),
      title: Text(
        title,
        style: TextStyle(
          color: primary,
        ),
      ),
      backgroundColor: Colors.white,
      systemOverlayStyle: SystemUiOverlayStyle.dark,
      elevation: 5,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: getAppBar(ALL_CAT, context),
        body: GridView.count(
            controller: controller,
            padding: EdgeInsets.all(20),
            crossAxisCount: 4,
            shrinkWrap: true,
            childAspectRatio: .8,
            physics: BouncingScrollPhysics(),
            children: List.generate(
              (offset < total) ? catList.length + 1 : catList.length,
              (index) {
                return (index == catList.length)
                    ? Center(child: CircularProgressIndicator())
                    : catItem(index, context);
              },
            )));
  }

  Widget catItem(int index, BuildContext context) {
    return InkWell(
      child: Column(
        children: <Widget>[
          ClipRRect(
              borderRadius: BorderRadius.circular(25.0),
              child: Image.asset(
                catList[index]['img'],
                height: 50,
                width: 50,
                fit: BoxFit.fill,
              )),
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Text(
              catList[index]['title'],
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context)
                  .textTheme
                  .caption!
                  .copyWith(color: Colors.black),
            ),
          )
        ],
      ),
      onTap: () {},
    );
  }
}
