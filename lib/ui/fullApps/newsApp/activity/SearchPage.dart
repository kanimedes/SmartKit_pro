import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smartkit_pro/ui/fullApps/newsApp/helper/ButtonClickAnimation.dart';
import 'package:smartkit_pro/ui/fullApps/newsApp/helper/ColorsRes.dart';
import 'package:smartkit_pro/ui/fullApps/newsApp/helper/DesignConfig.dart';
import 'package:smartkit_pro/ui/fullApps/newsApp/helper/StringsRes.dart';
import 'package:smartkit_pro/ui/fullApps/newsApp/model/Category.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController edtsearch = new TextEditingController(text: "Today ");
  List<Category>? categorylist;

  List<String> searchresultlist = [
    "Today's news",
    "Today's Gold Price",
    "IPL news",
    "Political news",
    "Health news"
  ];

  List<Color> colorlist = [
    ColorsRes.categorycolor1,
    ColorsRes.categorycolor2,
    ColorsRes.categorycolor3,
    ColorsRes.categorycolor4,
    ColorsRes.categorycolor5,
    ColorsRes.categorycolor6,
    ColorsRes.categorycolor7,
    ColorsRes.categorycolor8
  ];
  List<Category>? setCategoryList() {
    categorylist = [];
    categorylist!.add(new Category(id: 1, name: "Sports"));
    categorylist!.add(new Category(id: 2, name: "Entertainment"));
    categorylist!.add(new Category(id: 3, name: "Politics"));
    categorylist!.add(new Category(id: 4, name: "Technology"));
    categorylist!.add(new Category(id: 5, name: "Education"));
    categorylist!.add(new Category(id: 6, name: "Health"));
    categorylist!.add(new Category(id: 7, name: "Science"));
    categorylist!.add(new Category(id: 8, name: "Economy"));
    return categorylist;
  }

  @override
  void initState() {
    super.initState();
    setCategoryList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        iconTheme: IconThemeData(
          color: ColorsRes.white,
        ),
        elevation: 0,
        backgroundColor: ColorsRes.appcolor,
        centerTitle: true,
        title: Text(StringsRes.search,
            style:
                TextStyle(color: ColorsRes.white, fontWeight: FontWeight.bold)),
      ),
      body: Column(children: [
        searchboxWidget(),
        categoryWidget(),
        Expanded(
            child: edtsearch.text.trim().isEmpty
                ? nodataWidget()
                : searchResultWidget()),
      ]),
    );
  }

  Widget nodataWidget() {
    return SingleChildScrollView(
      padding: EdgeInsets.only(
          left: 30, right: 30, top: MediaQuery.of(context).size.height / 8),
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        Icon(
          Icons.search,
          color: ColorsRes.grey.withOpacity(0.4),
          size: 150,
        ),
        SizedBox(height: 10),
        Text(
          "Item not Found",
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.headline6!.merge(
              TextStyle(color: ColorsRes.black, fontWeight: FontWeight.bold)),
        ),
        SizedBox(height: 10),
        Text(
          "Try searching the item with a different keyword.",
          textAlign: TextAlign.center,
          style: Theme.of(context)
              .textTheme
              .subtitle1!
              .merge(TextStyle(color: ColorsRes.grey)),
        ),
      ]),
    );
  }

  Widget categoryWidget() {
    return Container(
        height: 40,
        margin: EdgeInsets.only(top: 5, bottom: 5),
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: categorylist!.length,
            itemBuilder: (context, index) {
              Category category = categorylist![index];
              return Container(
                decoration: DesignConfig.boxDecorationContainerColor(
                    colorlist[index % colorlist.length], 20),
                margin: EdgeInsets.only(left: 5, right: 5),
                padding: EdgeInsets.only(left: 8, right: 8),
                alignment: Alignment.center,
                child: ConstrainedBox(
                  constraints: new BoxConstraints(
                    minWidth: 80.0,
                  ),
                  child: Text(
                    category.name!,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: ColorsRes.white, fontWeight: FontWeight.bold),
                  ),
                ),
              );
            }));
  }

  Widget searchboxWidget() {
    return Stack(
      children: [
        Container(
          height: 30,
          margin: EdgeInsets.only(bottom: 30),
          color: ColorsRes.appcolor,
        ),
        Positioned.fill(
          child: Align(
            alignment: Alignment.center,
            child: SizedBox(
              height: 55,
              width: MediaQuery.of(context).size.width - 40,
              child: Stack(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: ColorsRes.white,
                      boxShadow: [
                        BoxShadow(
                          color: ColorsRes.appcolor.withOpacity(0.3),
                          offset: Offset(4, 4),
                          blurRadius: 10,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: ColorsRes.white,
                      boxShadow: const [
                        BoxShadow(
                          color: ColorsRes.btnlightshadow,
                          offset: Offset(-4, -4),
                          blurRadius: 10,
                        ),
                      ],
                    ),
                  ),
                  Center(
                    child: TextFormField(
                      style: TextStyle(color: ColorsRes.black),
                      cursorColor: ColorsRes.black,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.search),
                        hintText: StringsRes.searcharticle,
                        hintStyle: Theme.of(context)
                            .textTheme
                            .subtitle2!
                            .merge(TextStyle(color: ColorsRes.grey)),
                        border: InputBorder.none,
                      ),
                      keyboardType: TextInputType.text,
                      controller: edtsearch,
                      onChanged: (String searchtext) {
                        setState(() {});
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget searchResultWidget() {
    return ListView.separated(
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        separatorBuilder: (context, index) => SizedBox(height: 15),
        itemCount: searchresultlist.length,
        itemBuilder: (context, index) {
          String searchtext = searchresultlist[index];

          return ButtonClickAnimation(
            onTap: () {},
            child: Row(children: [
              Icon(
                Icons.search,
                color: ColorsRes.grey.withOpacity(0.7),
              ),
              Text(
                searchtext,
                style: Theme.of(context).textTheme.subtitle1,
              )
            ]),
          );
        });
  }
}
