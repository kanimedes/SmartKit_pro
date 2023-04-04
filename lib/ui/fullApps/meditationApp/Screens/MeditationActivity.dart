import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:octo_image/octo_image.dart';
import 'package:smartkit_pro/ui/fullApps/meditationApp/helper/ColorsRes.dart';
import 'package:smartkit_pro/ui/fullApps/meditationApp/helper/StringsRes.dart';
import 'package:smartkit_pro/ui/fullApps/meditationApp/model/MeditationModel.dart';

class MeditationActivity extends StatefulWidget {
  const MeditationActivity({Key? key}) : super(key: key);

  @override
  _MeditationActivityState createState() => _MeditationActivityState();
}

class _MeditationActivityState extends State<MeditationActivity>
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

  Widget meditationData() {
    return Container(
      height: MediaQuery.of(context).size.height / 3.8,
      padding: const EdgeInsets.only(top: 10.0),
      child: GridView.count(
          shrinkWrap: true,
          crossAxisSpacing: 4.7,
          childAspectRatio: 0.89,
          physics: NeverScrollableScrollPhysics(),
          crossAxisCount: 2,
          children: List.generate(
            meditationList.length,
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
                              meditationList[index].imgurl!,
                            ),
                            placeholderBuilder: OctoPlaceholder.blurHash(
                              meditationList[index].hash!,
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
                                    meditationList[index].name!,
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      color: ColorsRes.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                      fontFamily: "Lato",
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
                                    meditationList[index].duration!,
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

  Widget meditation2Data() {
    return Container(
      height: MediaQuery.of(context).size.height / 3.5,
      padding: const EdgeInsets.only(top: 10.0),
      child: GridView.count(
          shrinkWrap: true,
          childAspectRatio: 1.8,
          physics: NeverScrollableScrollPhysics(),
          crossAxisCount: 1,
          children: List.generate(
            meditation1List.length,
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
                              meditation1List[index].imgurl!,
                            ),
                            placeholderBuilder: OctoPlaceholder.blurHash(
                              meditation1List[index].hash!,
                            ),
                            errorBuilder: OctoError.icon(color: Colors.black),
                            fit: BoxFit.cover,
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height),
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
                                    meditation1List[index].name!,
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
                                    meditation1List[index].duration!,
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

  Widget meditation3Data() {
    return Container(
      height: MediaQuery.of(context).size.height / 0.96,
      padding: const EdgeInsets.only(top: 10.0),
      child: GridView.count(
          crossAxisSpacing: 4.7,
          mainAxisSpacing: 4.7,
          physics: NeverScrollableScrollPhysics(),
          crossAxisCount: 2,
          children: List.generate(
            meditation2List.length,
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
                              meditation2List[index].imgurl!,
                            ),
                            placeholderBuilder: OctoPlaceholder.blurHash(
                              meditation2List[index].hash!,
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
                                    meditation2List[index].name!,
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
                                    meditation2List[index].duration!,
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
                      StringsRes.meditations,
                      style: TextStyle(
                        color: ColorsRes.black,
                        fontSize: 24,
                        fontFamily: "TrebuchetMS",
                      ),
                    ),
                    meditationData(),
                    meditation2Data(),
                    Container(
                      padding: EdgeInsets.all(
                          MediaQuery.of(context).size.height / 30),
                      margin: EdgeInsets.only(left: 8, right: 8.0, bottom: 5.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        gradient: LinearGradient(
                          colors: const [
                            ColorsRes.premiumGradient1Color,
                            ColorsRes.premiumGradient2Color,
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.topRight,
                          stops: const [0, 2],
                        ),
                      ),
                      child: Row(
                        children: [
                          SvgPicture.asset(
                              "assets/images/fullApps/meditationApp/unlock.svg"),
                          SizedBox(
                              width: MediaQuery.of(context).size.height / 28),
                          Expanded(
                            child: Text(
                              StringsRes.premium,
                              maxLines: 2,
                              style: TextStyle(
                                color: ColorsRes.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                fontFamily: "Lato",
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    meditation3Data(),
                  ]),
            )));
  }
}
