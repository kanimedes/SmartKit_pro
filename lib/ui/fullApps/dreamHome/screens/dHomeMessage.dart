import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:octo_image/octo_image.dart';
import 'package:smartkit_pro/ui/fullApps/dreamHome/models/DHomeMessageModel.dart';

import '../helper/DHomeColors.dart';
import '../helper/DHomeString.dart';
import '../helper/DHomeconstant.dart';
import 'dHomeChat.dart';

class DHomeMessage extends StatefulWidget {
  const DHomeMessage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return DHomeMessageState();
  }
}

class DHomeMessageState extends State<DHomeMessage> {
  List<DHomeMessageModel> messageList = [
    DHomeMessageModel(
        title: "Albert C. Verdin",
        imageUrl:
            "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/dreamhomeapp%2Fchat_1.png?alt=media&token=91373d51-2519-4757-9dc7-c1d99ddfb4a8",
        hasMessage: true,
        subTitle: "Sorry to say but price is not negotiable",
        time: "25 min",
        localImage: DHomeConstant.getPngImagePath("chat_1.png"),
        blurUrl: 'LAATs900Ne~q_3D%WW-;EM-;%hRj'),
    DHomeMessageModel(
        title: "Lisa R. Reeder",
        imageUrl:
            "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/dreamhomeapp%2Fchat_2.png?alt=media&token=cc52820c-e60b-469b-a468-2ae923c3f223",
        hasMessage: false,
        subTitle: "I call you later.",
        time: "45 min",
        localImage: DHomeConstant.getPngImagePath("chat_2.png"),
        blurUrl: "LjGlbW%M?^WB_4s:bwM{S5R*M{Rj"),
    DHomeMessageModel(
        title: "Lydia W. Adams",
        imageUrl:
            "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/dreamhomeapp%2Fchat_3.png?alt=media&token=dd775dc1-468a-4760-bed7-74ac895f5332",
        hasMessage: false,
        subTitle: "Sir, this home is already sold.",
        time: "Wed",
        localImage: DHomeConstant.getPngImagePath("chat_3.png"),
        blurUrl: "L7Db{503LxD*yV9a^P9b04?F_3xW"),
    DHomeMessageModel(
        title: "John Y. Beard",
        imageUrl:
            "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/dreamhomeapp%2Fchat_4.png?alt=media&token=6add2012-7058-4fbc-91e5-eaa57d3566ba",
        hasMessage: false,
        subTitle: "Not an issue sir",
        time: "Fri",
        localImage: DHomeConstant.getPngImagePath("chat_4.png"),
        blurUrl: "L4CGJkVBPByF00IB~qx]KjJDgNrV")
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        AppBar(
          toolbarHeight: 133,
          backgroundColor: DHomeColors.bgColor,
          leadingWidth: 80,
          centerTitle: true,
          title: const Text(
            DHomeString.Messages,
            style: TextStyle(
                fontSize: 14, fontWeight: FontWeight.w500, color: Colors.black),
          ),
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: SvgPicture.asset(
              DHomeConstant.getSvgImagePath("back_arrow.svg"),
              fit: BoxFit.scaleDown,
            ),
          ),
        ),
        search(),
        messageListData()
        // featureListData()
      ],
    ));
  }

  Widget search() {
    return Container(
        margin: EdgeInsets.only(
            left: MediaQuery.of(context).size.width * .07,
            right: MediaQuery.of(context).size.width * .07,
            top: MediaQuery.of(context).size.height * .2),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
          boxShadow: const [
            BoxShadow(
              color: Color(0x0f000000),
              blurRadius: 10.0,
            ),
          ],
        ),
        child: TextFormField(
          cursorColor: const Color(0xffa2a2a2),
          decoration: InputDecoration(
            prefixIcon: SvgPicture.asset(
              DHomeConstant.getSvgImagePath("search.svg"),
              fit: BoxFit.scaleDown,
            ),
            contentPadding: const EdgeInsets.only(top: 10),
            isDense: true,
            hintText: "Search",
            hintStyle: const TextStyle(color: Color(0xff565656)),
            border: InputBorder.none,
          ),
          keyboardType: TextInputType.emailAddress,
        ));
  }

  Widget messageListData() {
    return Container(
        height: MediaQuery.of(context).size.height,
        margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * .32),
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(50),
              topRight: Radius.circular(50),
            )),
        child: ListView.separated(
            shrinkWrap: true,
            itemCount: messageList.length,
            scrollDirection: Axis.vertical,
            physics: const AlwaysScrollableScrollPhysics(),
            separatorBuilder: (context, index) {
              return const Padding(
                padding: EdgeInsets.only(left: 25, right: 30),
                child: Divider(
                  color: Color(0xffacacac),
                  height: 1,
                ),
              );
            },
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DHomeChat(
                            title: messageList[index].title,
                            hash: messageList[index].blurUrl,
                            imgurl: messageList[index].imageUrl,
                            profile: messageList[index].localImage),
                      ),
                    );
                  },
                  child: ListTile(
                      dense: true,
                      leading: Container(
                          padding: const EdgeInsets.only(left: 10),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: OctoImage(
                              image: CachedNetworkImageProvider(
                                  messageList[index].imageUrl),
                              placeholderBuilder: OctoPlaceholder.blurHash(
                                messageList[index].blurUrl,
                              ),
                              errorBuilder:
                                  OctoError.icon(color: DHomeColors.black),
                              fit: BoxFit.scaleDown,
                              height: 38,
                              width: 38,
                            ),
                          )),
                      title: Text(
                        messageList[index].title,
                        style: const TextStyle(
                            fontSize: 12, fontWeight: FontWeight.w500),
                      ),
                      subtitle: Text(
                        messageList[index].subTitle,
                        style: const TextStyle(
                            fontSize: 10, color: Color(0xff818181)),
                      ),
                      trailing: messageList[index].hasMessage
                          ? Container(
                              padding: const EdgeInsets.only(right: 30),
                              child: Column(
                                children: [
                                  Text(messageList[index].time,
                                      style: const TextStyle(
                                          fontSize: 10,
                                          color: Color(0xff818181))),
                                  Container(
                                      padding: const EdgeInsets.only(top: 5),
                                      child: const CircleAvatar(
                                        radius: 10,
                                        backgroundColor: Colors.black,
                                        child: Text(
                                          "1",
                                          style: TextStyle(
                                              fontSize: 10,
                                              color: Colors.white),
                                        ),
                                      ))
                                ],
                              ),
                            )
                          : Container(
                              padding: const EdgeInsets.only(right: 30),
                              child: Text(messageList[index].time,
                                  style: const TextStyle(
                                      fontSize: 10, color: Color(0xff818181))),
                            )));
            }));
  }
}
