import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:octo_image/octo_image.dart';
import 'package:smartkit_pro/ui/fullApps/meditationApp/helper/ColorsRes.dart';
import 'package:smartkit_pro/ui/fullApps/meditationApp/helper/StringsRes.dart';
import 'package:smartkit_pro/ui/fullApps/meditationApp/model/MusicModel.dart';
import 'package:smartkit_pro/ui/fullApps/meditationApp/model/SleepSoundModel.dart';

class MusicActivity extends StatefulWidget {
  const MusicActivity({Key? key}) : super(key: key);

  @override
  _MusicActivityState createState() => _MusicActivityState();
}

class _MusicActivityState extends State<MusicActivity>
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

  Widget musicData() {
    return Container(
      height: MediaQuery.of(context).size.height / 0.96,
      padding: const EdgeInsets.only(top: 10.0),
      child: GridView.count(
          crossAxisSpacing: 4.7,
          mainAxisSpacing: 4.7,
          physics: NeverScrollableScrollPhysics(),
          crossAxisCount: 2,
          children: List.generate(
            musicList.length,
            (index) {
              return GestureDetector(
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: ShaderMask(
                      shaderCallback: (rect) {
                        return LinearGradient(
                          begin: Alignment.center,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.transparent,
                            Colors.black.withOpacity(0.85)
                          ],
                        ).createShader(rect);
                      },
                      blendMode: BlendMode.overlay,
                      child: Stack(children: [
                        OctoImage(
                            image: CachedNetworkImageProvider(
                              musicList[index].imgurl!,
                            ),
                            placeholderBuilder: OctoPlaceholder.blurHash(
                              musicList[index].hash!,
                            ),
                            errorBuilder: OctoError.icon(color: Colors.black),
                            fit: BoxFit.cover,
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.width),
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Align(
                                alignment: Alignment.bottomLeft,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 10.0, right: 20.0),
                                  child: Text(
                                    musicList[index].name!,
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      color: ColorsRes.white,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: "Lato",
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.bottomLeft,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 10.0,
                                      right: 20.0,
                                      bottom: 10.0,
                                      top: 6.0),
                                  child: Text(
                                    musicList[index].duration!,
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      color: ColorsRes.white,
                                      fontWeight: FontWeight.normal,
                                      fontFamily: "Lato",
                                      fontSize: 10,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ]),
                    ),
                  ),
                ),
                onTap: () {
                  /*Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) =>
                              UserDetailActivity(id: index)));*/
                },
              );
            },
          )),
    );
  }

  Widget natureData() {
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

  Widget nature2Data() {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 7.0,
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
                      StringsRes.nature,
                      style: TextStyle(
                        color: ColorsRes.black,
                        fontSize: 24,
                        fontFamily: "TrebuchetMS",
                      ),
                    ),
                    natureData(),
                    nature2Data(),
                    Text(
                      StringsRes.music,
                      style: TextStyle(
                        color: ColorsRes.black,
                        fontSize: 24,
                        fontFamily: "TrebuchetMS",
                      ),
                    ),
                    musicData(),
                  ]),
            )));
  }
}
