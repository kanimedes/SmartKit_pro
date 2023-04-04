import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smartkit_pro/ui/fullApps/music/model/music_model.dart';
import 'package:smartkit_pro/ui/fullApps/music/model/playlistModel.dart';
import 'package:smartkit_pro/ui/fullApps/music/model/singer_model.dart';
import 'package:smartkit_pro/ui/fullApps/music/screen/musicList.dart';
import 'package:smartkit_pro/ui/fullApps/music/screen/playMusic.dart';
import 'package:smartkit_pro/ui/fullApps/music/screen/playlistData.dart';
import 'package:smartkit_pro/ui/fullApps/music/screen/singerList.dart';
import 'package:smartkit_pro/ui/fullApps/music/screen/viewPlaylist.dart';
import 'package:smartkit_pro/ui/fullApps/music/widgets/slideAnimation.dart';
import 'package:smartkit_pro/ui/fullApps/music/helper/string.dart';
import 'package:smartkit_pro/ui/fullApps/music/helper/colors.dart';
import 'package:smartkit_pro/ui/fullApps/music/helper/constanat.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  FocusNode searchFocusNode = FocusNode();
  late AnimationController transitionController;
  late Animation offsetAnimation;

  @override
  initState() {
    transitionController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    offsetAnimation =
        Tween<Offset>(begin: Offset(0.5, 0.0), end: Offset(0.0, 0.0))
            .animate(transitionController);

    transitionController.forward();
    super.initState();
  }

  @override
  dispose() {
    searchFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: RefreshIndicator(
          color: primary,
          onRefresh: () async {
            return;
          },
          child: GestureDetector(
            onTap: () => searchFocusNode.unfocus(),
            child: CustomScrollView(
              physics: const BouncingScrollPhysics(),
              slivers: [
                SliverPersistentHeader(
                    pinned: true, delegate: HeadingDelegate()),
                SliverToBoxAdapter(
                  child: Stack(
                    children: [
                      Stack(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              getSearchBar(),
                              getText(popularPlaylist, "Playlist", playList),
                              getPlayListData(),
                              getText(recentlyPlayed, "Music", musicsList),
                              getRecentlyPlayedData(),
                              getText(popularSinger, "Singer", singerList),
                              getPopularSingerData(),
                              getText(songsForYou, "Music", musicsList),
                              getSongForYouData(),
                              getText(todayHits, "Music", musicsList),
                              getTodayData(),
                            ],
                          ),
                          Positioned.directional(
                              textDirection: Directionality.of(context),
                              bottom: 0,
                              child: Container(
                                color: primary,
                                height: 56,
                              ))
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  getSearchBar() {
    return Padding(
      padding:
          const EdgeInsetsDirectional.only(end: 15.0, start: 15.0, top: 10.0),
      child: TextFormField(
        keyboardType: TextInputType.text,
        focusNode: searchFocusNode,
        textInputAction: TextInputAction.search,
        style: TextStyle(color: black, fontWeight: FontWeight.normal),
        cursorColor: primary,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.search, color: primary),
          hintText: searchHint,
          hintStyle: Theme.of(context)
              .textTheme
              .subtitle2!
              .copyWith(color: Colors.grey[500], fontWeight: FontWeight.normal),
          filled: true,
          fillColor: Colors.grey[300],
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: black),
            borderRadius: BorderRadius.circular(10.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
      ),
    );
  }

  getText(String text, String textOf, List<dynamic> dataList) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
      child: Row(
        children: [
          Expanded(
            child: Text(
              text,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ),
          GestureDetector(
            onTap: () {
              if (textOf == "Music") {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => MusicList(
                              musicsList: musicsList,
                              title: text,
                              showAppBar: true,
                            )));
              } else if (textOf == "Playlist") {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => PlaylistList(
                              playList: playList,
                              title: text,
                            )));
              } else if (textOf == "Singer") {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (_) => SingerList(
                          singerDetails: singerList,
                          title: text,
                        )));
              }
            },
            child: Text(
              viewAll,
              style: TextStyle(fontSize: 14, color: primary),
            ),
          ),
        ],
      ),
    );
  }

  getPlayListData() {
    return AnimationFromRightSide(
      delay: 400,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.25,
        child: ListView.builder(
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: playList.length > showTotalData
                ? showTotalData
                : playList.length,
            itemBuilder: (context, index) {
              return popularPlayListData(index);
            }),
      ),
    );
  }

  popularPlayListData(int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (_) => ViewPlayList(
                    playlistDetails: playList[index],
                    dataOf: "PlayList",
                  )));
        },
        child: Container(
          width: MediaQuery.of(context).size.width * 0.4,
          height: MediaQuery.of(context).size.height * 0.15,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.grey[200],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10)),
                  child: Image.asset(
                    playList[index].imgurl!,
                    height: 150,
                    width: 150,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 5, left: 3.0, right: 3.0),
                child: Text(
                  playList[index].name!,
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  softWrap: true,
                ),
              ),
              Padding(
                padding:
                    EdgeInsets.only(top: 5, left: 3.0, right: 3.0, bottom: 5),
                child: Text(
                  playList[index].artistName!,
                  style: TextStyle(color: Colors.grey),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  softWrap: true,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  getRecentlyPlayedData() {
    return AnimationFromRightSide(
      delay: 500,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.2,
        child: ListView.builder(
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: playList.length > showTotalData
                ? showTotalData
                : playList.length,
            itemBuilder: (context, index) {
              return recentlyPlayedItem(index);
            }),
      ),
    );
  }

  recentlyPlayedItem(int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (_) => PlayMusic(songDetails: musicsList[index])));
        },
        child: Container(
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(10.0),
          ),
          width: MediaQuery.of(context).size.width * 0.3,
          height: MediaQuery.of(context).size.height * 0.15,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10)),
                  child: Image.asset(
                    musicsList[index].imgurl!,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 3.0,
                  right: 3.0,
                  top: 5.0,
                ),
                child: Text(
                  musicsList[index].name!,
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  softWrap: true,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(3.0),
                child: Text(
                  musicsList[index].artistName!,
                  style: TextStyle(color: Colors.grey),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  softWrap: true,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  getSongForYouData() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.1,
      child: ListView.builder(
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: musicsList.length > showTotalData
              ? showTotalData
              : musicsList.length,
          itemBuilder: (context, index) {
            return songsForYouItem(index);
          }),
    );
  }

  songsForYouItem(int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadiusDirectional.circular(10)),
        width: MediaQuery.of(context).size.width * 0.6,
        height: MediaQuery.of(context).size.height * 0.1,
        child: InkWell(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (_) => PlayMusic(songDetails: musicsList[index])));
          },
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 80,
                height: 80,
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10.0),
                      bottomLeft: Radius.circular(10)),
                  child: Image.asset(
                    musicsList[index].imgurl!,
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 10,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      musicsList[index].name!,
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      softWrap: true,
                    ),
                    Text(
                      musicsList[index].artistName!,
                      style: TextStyle(color: Colors.grey),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      softWrap: true,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  getTodayData() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      child: ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          scrollDirection: Axis.vertical,
          itemCount: musicsList.length > showTotalData
              ? showTotalData
              : musicsList.length,
          itemBuilder: (context, index) {
            return todaySongItem(index);
          }),
    );
  }

  todaySongItem(int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (_) => PlayMusic(songDetails: musicsList[index])));
        },
        child: Container(
          width: MediaQuery.of(context).size.width * 0.9,
          height: MediaQuery.of(context).size.height * 0.1,
          decoration: BoxDecoration(
              color: Colors.grey[200], borderRadius: BorderRadius.circular(10)),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 80,
                height: 80,
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10.0),
                      bottomLeft: Radius.circular(10)),
                  child: Image.asset(
                    musicsList[index].imgurl!,
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 10,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      musicsList[index].name!,
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      softWrap: true,
                    ),
                    Text(
                      musicsList[index].artistName!,
                      style: TextStyle(color: Colors.grey),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      softWrap: true,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  getPopularSingerData() {
    return AnimationFromRightSide(
      delay: 600,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.2,
        child: ListView.builder(
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: singerList.length > showTotalData
                ? showTotalData
                : singerList.length,
            itemBuilder: (context, index) {
              return popularSingerItem(index);
            }),
      ),
    );
  }

  popularSingerItem(int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (_) => ViewPlayList(
                    playlistDetails: singerList[index],
                    dataOf: "Singer",
                  )));
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
          ),
          width: MediaQuery.of(context).size.width * 0.4,
          height: MediaQuery.of(context).size.height * 0.15,
          child: Column(
            children: [
              Expanded(
                  child: Hero(
                tag: "${singerList[index].id}${singerList[index].name}",
                child: Container(
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: AssetImage(singerList[index].imgurl!),
                          fit: BoxFit.fill)),
                ),
              )),
              Padding(
                padding: const EdgeInsets.only(
                  left: 3.0,
                  right: 3.0,
                  top: 5.0,
                ),
                child: Text(
                  singerList[index].name!,
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  softWrap: true,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HeadingDelegate extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: backgroundColor,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: [
            Container(
              width: 70,
              height: 70,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(20)),
              child: SvgPicture.asset("${imagePath}logo.svg", color: primary),
            ),
            Expanded(
                child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Text(appName,
                  style: TextStyle(
                      color: primary, fontSize: 30, fontFamily: 'SFPro')),
            )),
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              clipBehavior: Clip.hardEdge,
              child: CircleAvatar(
                foregroundColor: primary,
                backgroundImage: AssetImage("${imagePath}singer7.jpg"),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  double get maxExtent => 56;

  @override
  double get minExtent => 56;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
