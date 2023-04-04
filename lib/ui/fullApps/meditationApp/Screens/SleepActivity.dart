import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:octo_image/octo_image.dart';
import 'package:smartkit_pro/ui/fullApps/furnitureHub/models/ExploreModel.dart';
import 'package:smartkit_pro/ui/fullApps/furnitureHub/screens/DetailActivity.dart';
import 'package:smartkit_pro/ui/fullApps/meditationApp/helper/ColorsRes.dart';
import 'package:smartkit_pro/ui/fullApps/meditationApp/helper/StringsRes.dart';
import 'package:smartkit_pro/ui/fullApps/meditationApp/model/CategoryModel.dart';
import 'package:smartkit_pro/ui/fullApps/meditationApp/model/PopularStoriesModel.dart';
import 'package:smartkit_pro/ui/fullApps/meditationApp/model/RecommendedModel.dart';
import 'package:smartkit_pro/ui/fullApps/meditationApp/model/SleepModel.dart';
import 'package:smartkit_pro/ui/fullApps/meditationApp/model/SleepSoundModel.dart';

class SleepActivity extends StatefulWidget {
  const SleepActivity({Key? key}) : super(key: key);

  @override
  _SleepActivityState createState() => _SleepActivityState();
}

class _SleepActivityState extends State<SleepActivity>
    with SingleTickerProviderStateMixin {
  int currentIndex = 0;
  PageController? _controller;
  bool descTextShowFlag = false;
  TabController? _tabController;
  int _activeIndex = 0;

  @override
  void initState() {
    super.initState();
    _controller = PageController(initialPage: 0);
    _tabController = TabController(vsync: this, length: 4);
    _tabController!.addListener(() {
      setState(() {
        _activeIndex = _tabController!.index;
      });
    });
  }

  Widget sleepData() {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 2.8,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: sleepList.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
                child: Container(
                  margin: EdgeInsets.only(right: 15.0, top: 15.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: OctoImage(
                            image: CachedNetworkImageProvider(
                                sleepList[index].imgurl!),
                            placeholderBuilder: OctoPlaceholder.blurHash(
                              sleepList[index].hash!,
                            ),
                            width: MediaQuery.of(context).size.height / 5.9,
                            height: MediaQuery.of(context).size.height / 4,
                            errorBuilder:
                                OctoError.icon(color: ColorsRes.black),
                            fit: BoxFit.fitHeight,
                          )),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 2.9,
                        child: Text(sleepList[index].name!,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontSize: 14,
                                color: ColorsRes.black,
                                fontWeight: FontWeight.bold,
                                fontFamily: "Lato",
                                letterSpacing: 0.5)),
                      ),
                      SizedBox(height: 5),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 2.9,
                        child: Text(
                          sleepList[index].subTitle!,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 11,
                            color: ColorsRes.black.withOpacity(0.7),
                            fontWeight: FontWeight.normal,
                            fontFamily: "Lato",
                          ),
                          maxLines: 1,
                        ),
                      ),
                    ],
                  ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailActivity(
                        name: exploreList[index].name!,
                        like: exploreList[index].like!,
                        rating: exploreList[index].rating!,
                        description: exploreList[index].description!,
                        price: exploreList[index].price!,
                        quantity: exploreList[index].quantity!,
                        color: exploreList[index].colorList,
                        image: exploreList[index].image,
                        hash: exploreList[index].hash,
                        imgurl: exploreList[index].imgurl,
                      ),
                    ),
                  );
                });
          }),
    );
  }

  Widget popularStoriesData() {
    return Container(
      height: MediaQuery.of(context).size.height / 0.86,
      margin: EdgeInsets.only(top: 10.0),
      child: GridView.count(
          childAspectRatio: 0.787,
          padding: EdgeInsets.zero,
          crossAxisSpacing: 4.7,
          mainAxisSpacing: 4.7,
          physics: NeverScrollableScrollPhysics(),
          crossAxisCount: 2,
          children: List.generate(
            popularStoriesList.length,
            (index) {
              return GestureDetector(
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            borderRadius: BorderRadius.circular(10.0),
                            child: OctoImage(
                                image: CachedNetworkImageProvider(
                                  popularStoriesList[index].imgurl!,
                                ),
                                placeholderBuilder: OctoPlaceholder.blurHash(
                                  popularStoriesList[index].hash!,
                                ),
                                errorBuilder:
                                    OctoError.icon(color: Colors.black),
                                fit: BoxFit.fill,
                                width: MediaQuery.of(context).size.width,
                                height:
                                    MediaQuery.of(context).size.height / 5)),
                        Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: Text(
                            popularStoriesList[index].name!,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              color: ColorsRes.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              fontFamily: "Lato",
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 6.0),
                          child: Text(
                            popularStoriesList[index].subTitle!,
                            textAlign: TextAlign.left,
                            maxLines: 1,
                            style: TextStyle(
                              color: ColorsRes.black,
                              fontWeight: FontWeight.normal,
                              fontFamily: "Lato",
                              fontSize: 10,
                            ),
                          ),
                        ),
                      ]),
                ),
                onTap: () {
                  setState(() {
                    if (categoryList[index].like! == "1") {
                      categoryList[index].like = "0";
                    } else {
                      categoryList[index].like = "1";
                    }
                  });
                },
              );
            },
          )),
    );
  }

  Widget recommendedData() {
    return Container(
      height: MediaQuery.of(context).size.height / 3.1,
      margin: EdgeInsets.only(right: 10.0, top: 10.0),
      child: ListView.builder(
          padding: EdgeInsets.only(right: 10, top: 10),
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: recommendedList.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
                margin: EdgeInsets.only(bottom: 10),
                child: ListTile(
                  dense: true,
                  contentPadding: EdgeInsets.zero,
                  leading: ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: OctoImage(
                        image: CachedNetworkImageProvider(
                          recommendedList[index].imgurl!,
                        ),
                        placeholderBuilder: OctoPlaceholder.blurHash(
                          recommendedList[index].hash!,
                        ),
                        errorBuilder: OctoError.icon(color: Colors.black),
                        fit: BoxFit.fill,
                        width: MediaQuery.of(context).size.width / 7,
                        height: MediaQuery.of(context).size.height / 5),
                  ),
                  title: Text(recommendedList[index].name!,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: ColorsRes.black,
                        fontFamily: "Lato",
                      )),
                  subtitle: Text(recommendedList[index].subTitle!,
                      style: TextStyle(
                        fontSize: 10,
                        color: ColorsRes.black,
                        fontFamily: "Lato",
                      )),
                  trailing: CircleAvatar(
                    radius: 15.0,
                    backgroundColor: ColorsRes.white,
                    child: Icon(Icons.play_arrow, color: ColorsRes.black),
                  ),
                  onTap: () {},
                ));
          }),
    );
  }

  Widget sleepSoundData() {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 8.8,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: sleepSoundList.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
                child: Container(
                  margin: EdgeInsets.only(right: 15.0, top: 15.0),
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(35),
                        child: OctoImage(
                          image: CachedNetworkImageProvider(
                              sleepSoundList[index].imgurl!),
                          placeholderBuilder: OctoPlaceholder.blurHash(
                            sleepSoundList[index].hash!,
                          ),
                          width: MediaQuery.of(context).size.height / 10.9,
                          height: MediaQuery.of(context).size.height / 10.9,
                          errorBuilder: OctoError.icon(color: ColorsRes.black),
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                        top: MediaQuery.of(context).size.height / 30,
                        left: 5.0,
                        child: Container(
                          alignment: Alignment.topCenter,
                          width: MediaQuery.of(context).size.width / 6.0,
                          /*padding: EdgeInsets.only(top: MediaQuery.of(context).size.height/42),*/
                          child: Text(sleepSoundList[index].name!,
                              textAlign: TextAlign.center,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontSize: 12,
                                  color: ColorsRes.white,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "TrebuchetMS",
                                  letterSpacing: 0.5)),
                        ),
                      ),
                    ],
                  ),
                ),
                onTap: () {
                  /*Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          DetailActivity(name: exploreList[index].name!,like: exploreList[index].like!,rating: exploreList[index].rating!,description: exploreList[index].description!,price: exploreList[index].price!,quantity: exploreList[index].quantity!,color: exploreList[index].colorList,image: exploreList[index].image, hash: exploreList[index].hash,imgurl: exploreList[index].imgurl,),
                    ),
                  );*/
                });
          }),
    );
  }

  Widget sleepSound2Data() {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 4.6,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: sleepSound2List.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
                child: Container(
                  margin: EdgeInsets.only(right: 15.0, top: 15.0),
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(35),
                        child: OctoImage(
                          image: CachedNetworkImageProvider(
                              sleepSound2List[index].imgurl!),
                          placeholderBuilder: OctoPlaceholder.blurHash(
                            sleepSound2List[index].hash!,
                          ),
                          width: MediaQuery.of(context).size.height / 10.9,
                          height: MediaQuery.of(context).size.height / 10.9,
                          errorBuilder: OctoError.icon(color: ColorsRes.black),
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                        top: MediaQuery.of(context).size.height / 30,
                        left: 5.0,
                        child: Container(
                          alignment: Alignment.topCenter,
                          width: MediaQuery.of(context).size.width / 6.0,
                          /*padding: EdgeInsets.only(top: MediaQuery.of(context).size.height/42),*/
                          child: Text(sleepSound2List[index].name!,
                              textAlign: TextAlign.center,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontSize: 12,
                                  color: ColorsRes.white,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "TrebuchetMS",
                                  letterSpacing: 0.5)),
                        ),
                      ),
                    ],
                  ),
                ),
                onTap: () {});
          }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorsRes.backgroundColor,
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
            toolbarHeight: 0,
            backgroundColor: ColorsRes.backgroundColor,
            shadowColor: Colors.transparent),
        body: Container(
            margin: EdgeInsets.only(left: 10.0, top: 20.0, right: 10.0),
            child: SingleChildScrollView(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      StringsRes.sleep,
                      style: TextStyle(
                        color: ColorsRes.black,
                        fontSize: 24,
                        fontFamily: "TrebuchetMS",
                      ),
                    ),
                    sleepData(),
                    Text(
                      StringsRes.popularStories,
                      style: TextStyle(
                        color: ColorsRes.black,
                        fontSize: 24,
                        fontFamily: "TrebuchetMS",
                      ),
                    ),
                    popularStoriesData(),
                    Text(
                      StringsRes.recommendedForYou,
                      style: TextStyle(
                        color: ColorsRes.black,
                        fontSize: 24,
                        fontFamily: "TrebuchetMS",
                      ),
                    ),
                    recommendedData(),
                    Text(
                      StringsRes.sleepSounds,
                      style: TextStyle(
                        color: ColorsRes.black,
                        fontSize: 24,
                        fontFamily: "TrebuchetMS",
                      ),
                    ),
                    sleepSoundData(),
                    sleepSound2Data(),
                  ]),
            )));
  }
}
