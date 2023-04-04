import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:octo_image/octo_image.dart';
import 'package:smartkit_pro/ui/fullApps/grobag/Helper/GrobagColor.dart';

import 'GrobagHome.dart';
import 'GrobagProductList.dart';

class GrobagAllCat extends StatefulWidget {
  const GrobagAllCat({Key? key}) : super(key: key);

  @override
  _GrobagAllCatState createState() => _GrobagAllCatState();
}

class _GrobagAllCatState extends State<GrobagAllCat> {
  @override
  Widget build(BuildContext context) {
    return _catList();
  }

  _catList() {
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
          crossAxisCount: 3,
          shrinkWrap: true,
          childAspectRatio: 0.8,
          physics: BouncingScrollPhysics(),
          mainAxisSpacing: 15,
          crossAxisSpacing: 10,
          children: List.generate(
            catList.length,
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
                          borderRadius: BorderRadius.circular(10.0),
                          child: OctoImage(
                            image: CachedNetworkImageProvider(
                              catList[index]["img"],
                            ),
                            placeholderBuilder: OctoPlaceholder.blurHash(
                              catList[index]["blurUrl"],
                            ),
                            errorBuilder: OctoError.icon(color: black),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                    Text(
                      catList[index]["title"],
                      style: TextStyle(
                        color: fontColor,
                      ),
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              );
            },
          )),
    );
  }
}
