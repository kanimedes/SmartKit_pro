import 'package:flutter/material.dart';
import 'package:smartkit_pro/ui/fullApps/music/model/singer_model.dart';
import 'package:smartkit_pro/ui/fullApps/music/screen/viewPlaylist.dart';
import 'package:smartkit_pro/ui/fullApps/music/helper/colors.dart';
import 'package:smartkit_pro/ui/fullApps/music/helper/utils.dart';

class SingerList extends StatefulWidget {
  String? title;
  List<SingerModel>? singerDetails;

  SingerList({Key? key, required this.singerDetails, required this.title})
      : super(key: key);

  @override
  State<SingerList> createState() => _SingerListState();
}

class _SingerListState extends State<SingerList> {
  @override
  Widget build(BuildContext context) {
    print("length is ${widget.singerDetails!.length}");
    return Scaffold(
      appBar: Utils.getAppBar(context, widget.title!),
      body: SingleChildScrollView(
        child: Container(
            decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.7),
                borderRadius: BorderRadius.circular(10)),
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: Padding(
              padding:
                  EdgeInsetsDirectional.only(start: 15.0, end: 15.0, top: 15.0),
              child: GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 200,
                      childAspectRatio: 1,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10),
                  itemCount: widget.singerDetails!.length,
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
                              tag:
                                  "${singerList[index].id}${singerList[index].name}",
                              child: Container(
                                alignment: AlignmentDirectional.bottomStart,
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.only(
                                      start: 10.0, bottom: 5.0),
                                ),
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        opacity: 0.9,
                                        image: AssetImage(
                                            singerList[index].imgurl!),
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
                                  child: Text(
                                      widget.singerDetails![index].name!,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: white)),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    });
                  }),
            )),
      ),
    );
  }
}
