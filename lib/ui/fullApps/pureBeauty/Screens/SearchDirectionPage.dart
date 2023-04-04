import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:octo_image/octo_image.dart';
import 'package:smartkit_pro/ui/fullApps/pureBeauty/helper/DesignConfig.dart';
import 'package:smartkit_pro/ui/fullApps/pureBeauty/styles/colors.dart';

class SearchDirectionPage extends StatefulWidget {
  const SearchDirectionPage({Key? key}) : super(key: key);

  @override
  _SearchDirectionPageState createState() => _SearchDirectionPageState();
}

class _SearchDirectionPageState extends State<SearchDirectionPage> {
  TextEditingController edtsearch = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: salonbgcolor,
      body: Stack(children: [
        OctoImage(
          image: CachedNetworkImageProvider(
              'https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/salonapp%2Fmap.jpg?alt=media&token=eec4db0c-7c3e-4301-aee7-e2b31a0943f6'),
          placeholderBuilder:
              OctoPlaceholder.blurHash('L3Qm9i%gJF-:~q9F-;%M4^?H\$uNG'),
          errorBuilder: OctoError.icon(color: Colors.black),
          height: double.maxFinite,
          width: double.maxFinite,
          fit: BoxFit.cover,
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: bottomWidget(),
        ),
        searchWidget(),
      ]),
    );
  }

  Widget bottomWidget() {
    return IntrinsicHeight(
      child: Column(children: [
        Align(
          alignment: Alignment.centerRight,
          child: GestureDetector(
            onTap: () {},
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration:
                  DesignConfig.outersliderCircularDecoration(salonappcolor),
              padding: EdgeInsets.all(15),
              child: SvgPicture.asset(
                  "assets/images/fullApps/pureBeauty/svgimg/direction.svg"),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Row(children: [
            GestureDetector(
              onTap: () {},
              child: Container(
                decoration:
                    DesignConfig.outersliderCircularDecoration(salonbgcolor),
                padding: EdgeInsets.all(15),
                child: SvgPicture.asset(
                    "assets/images/fullApps/pureBeauty/svgimg/steps.svg"),
              ),
            ),
            Spacer(),
            GestureDetector(
              onTap: () {},
              child: Container(
                decoration:
                    DesignConfig.outersliderCircularDecoration(salonbgcolor),
                padding: EdgeInsets.all(15),
                child: SvgPicture.asset(
                    "assets/images/fullApps/pureBeauty/svgimg/location02.svg"),
              ),
            ),
          ]),
        ),
        Container(
          height: 130,
          decoration: DesignConfig.outerDecorationService(10, salonbgcolor),
          margin: EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: const Radius.circular(10),
                  bottomLeft: const Radius.circular(10),
                ),
                child: OctoImage(
                  image: CachedNetworkImageProvider(
                      'https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/salonapp%2Fshop_10.jpg?alt=media&token=1d5ac445-3407-4c4c-b7b2-d95f5464d609'),
                  placeholderBuilder:
                      OctoPlaceholder.blurHash('LHECXpRi-;t9~VM|oLM|IUogxtR%'),
                  errorBuilder: OctoError.icon(color: Colors.black),
                  height: 130,
                  width: 150,
                  fit: BoxFit.cover,
                ),
              ),
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 10),
                      Text(
                        "Hair. Facial",
                        style: Theme.of(context)
                            .textTheme
                            .caption!
                            .merge(TextStyle(
                              color: salonmainlight,
                              letterSpacing: 0.5,
                            )),
                      ),
                      SizedBox(height: 5),
                      Text(
                        "Mounrich Spa Services",
                        style: Theme.of(context).textTheme.subtitle1!.merge(
                            TextStyle(
                                color: salonappcolor,
                                letterSpacing: 0.5,
                                fontWeight: FontWeight.bold)),
                      ),
                      SizedBox(height: 2),
                      Text(
                        "Spa Salon - Near PalletMall, Woodland Hills",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context)
                            .textTheme
                            .bodyText2!
                            .merge(TextStyle(
                              color: Colors.grey,
                              letterSpacing: 0.5,
                            )),
                      ),
                      SizedBox(height: 8),
                      Row(
                        children: [
                          SvgPicture.asset(
                              "assets/images/fullApps/pureBeauty/svgimg/rating.svg"),
                          SizedBox(width: 8),
                          Text(
                            "4.8 (2.7k)",
                            style: Theme.of(context)
                                .textTheme
                                .bodyText2!
                                .merge(TextStyle(
                                  color: Colors.black,
                                  letterSpacing: 0.5,
                                )),
                          ),
                          Spacer(),
                          SvgPicture.asset(
                              "assets/images/fullApps/pureBeauty/svgimg/discount.svg"),
                          SizedBox(width: 8),
                          Text(
                            "-58%",
                            style: Theme.of(context)
                                .textTheme
                                .bodyText2!
                                .merge(TextStyle(
                                  color: Colors.black,
                                  letterSpacing: 0.5,
                                )),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                    ]),
              )),
            ],
          ),
        ),
        SizedBox(height: 10),
      ]),
    );
  }

  Widget searchWidget() {
    return Container(
      margin: EdgeInsets.only(top: kToolbarHeight, left: 25, right: 60),
      decoration: DesignConfig.outerDecoration(25),
      child: Row(children: [
        SizedBox(width: 15),
        SvgPicture.asset(
            "assets/images/fullApps/pureBeauty/svgimg/Location000002.svg"),
        SizedBox(width: 10),
        Expanded(
            child: TextField(
          decoration: InputDecoration(
            hintText: "Search",
            hintStyle: Theme.of(context)
                .textTheme
                .subtitle2!
                .merge(TextStyle(color: salonlightfont, letterSpacing: 0.5)),
            border: InputBorder.none,
          ),
          keyboardType: TextInputType.emailAddress,
          controller: edtsearch,
        )),
        SizedBox(width: 10),
        Icon(
          Icons.clear,
          color: Colors.grey,
        ),
        SizedBox(width: 15),
      ]),
    );
  }
}
