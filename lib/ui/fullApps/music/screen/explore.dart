import 'package:flutter/material.dart';
import 'package:smartkit_pro/ui/fullApps/music/helper/constanat.dart';
import 'package:smartkit_pro/ui/fullApps/music/helper/colors.dart';
import 'package:smartkit_pro/ui/fullApps/music/helper/utils.dart';
import 'package:smartkit_pro/ui/fullApps/music/model/category_model.dart';
import 'package:smartkit_pro/ui/fullApps/music/model/podcast.dart';
import 'package:smartkit_pro/ui/fullApps/music/model/singer_model.dart';
import 'package:smartkit_pro/ui/fullApps/music/screen/viewPlaylist.dart';
import 'package:smartkit_pro/ui/fullApps/music/helper/string.dart';

class Explore extends StatefulWidget {
  const Explore({Key? key}) : super(key: key);

  @override
  State<Explore> createState() => _ExploreState();
}

class _ExploreState extends State<Explore> {
  FocusNode searchFocusNode = FocusNode();

  @override
  dispose() {
    searchFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Utils.getAppBar(context, explore),
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        child: GestureDetector(
          onTap: () => searchFocusNode.unfocus(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              getSearchBar(),
              getTitle(podcast),
              getPodcastData(),
              getTitle(category),
              getCategoryData(),
              getTitle(topSingers),
              getTopSingerData(),
            ],
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

  getTitle(String title) {
    return Padding(
      padding: EdgeInsetsDirectional.only(start: 15.0, top: 10.0),
      child: Text(
        title,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
      ),
    );
  }

  getPodcastData() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.25,
      child: ListView.builder(
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: podcastList.length > showTotalData
              ? showTotalData
              : podcastList.length,
          itemBuilder: (context, index) {
            return itemCard(index);
          }),
    );
  }

  itemCard(int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (_) => ViewPlayList(
                    playlistDetails: podcastList[index],
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
                child: Hero(
                  tag: "${podcastList[index].id}${podcastList[index].name}",
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10)),
                    child: Image.asset(
                      podcastList[index].imgurl!,
                      height: 150,
                      width: 150,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 5, left: 3.0, right: 3.0),
                child: Text(
                  podcastList[index].name!,
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
                  podcastList[index].artistName!,
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

  getCategoryData() {
    return Padding(
      padding: EdgeInsetsDirectional.only(start: 15.0, end: 15.0, top: 15.0),
      child: GridView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              childAspectRatio: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10),
          itemCount: categoriesList.length,
          itemBuilder: (BuildContext ctx, index) {
            return Stack(
              children: [
                //added background image
                Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          opacity: 0.9,
                          image: AssetImage(
                              categoriesList[index].backgroundImage!),
                          fit: BoxFit.fill),
                      borderRadius: BorderRadius.circular(15)),
                ),
                //added black shadow background to show text properly
                Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.25),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Text(categoriesList[index].name!,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, color: white)),
                )
              ],
            );
          }),
    );
  }

  getTopSingerData() {
    return Padding(
      padding: EdgeInsetsDirectional.only(start: 15.0, end: 15.0, top: 15.0),
      child: GridView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              childAspectRatio: 1,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10),
          itemCount: singerList.length,
          itemBuilder: (BuildContext ctx, index) {
            return LayoutBuilder(
                builder: (context, BoxConstraints constraints) {
              return GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (_) => ViewPlayList(
                            playlistDetails: singerList[index],
                            dataOf: "Singer",
                          )));
                },
                child: Stack(
                  children: [
                    Hero(
                      tag: "${singerList[index].id}${singerList[index].name}",
                      child: Container(
                        alignment: AlignmentDirectional.bottomStart,
                        child: Padding(
                          padding: const EdgeInsetsDirectional.only(
                              start: 10.0, bottom: 5.0),
                        ),
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                opacity: 0.9,
                                image: AssetImage(singerList[index].imgurl!),
                                fit: BoxFit.cover),
                            borderRadius: BorderRadius.circular(15)),
                      ),
                    ),
                    Positioned.directional(
                      textDirection: Directionality.of(context),
                      bottom: 0,
                      child: Container(
                        alignment: AlignmentDirectional.bottomStart,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadiusDirectional.only(
                                bottomStart: Radius.circular(15),
                                bottomEnd: Radius.circular(15)),
                            gradient: LinearGradient(
                              colors: [
                                Colors.black87,
                                Colors.black45,
                                Colors.black12,
                                Colors.black.withOpacity(0)
                              ],
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                            )),
                        height: 40,
                        width: constraints.maxWidth,
                        child: Padding(
                          padding: const EdgeInsetsDirectional.only(
                              start: 10.0, bottom: 5.0),
                          child: Text(singerList[index].name!,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, color: white)),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            });
          }),
    );
  }
}
