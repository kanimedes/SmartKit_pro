import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:octo_image/octo_image.dart';
import 'package:smartkit_pro/ui/fullApps/pureBeauty/Screens/Message/ChatUserListPage.dart';
import 'package:smartkit_pro/ui/fullApps/pureBeauty/helper/DataConfig.dart';
import 'package:smartkit_pro/ui/fullApps/pureBeauty/helper/DesignConfig.dart';
import 'package:smartkit_pro/ui/fullApps/pureBeauty/styles/colors.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  TextEditingController edtmsg = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: salonbgcolor,
      body: Column(
        children: [
          Container(
            height: 130.0,
            decoration: BoxDecoration(
              color: salonbgcolor,
              boxShadow: [
                BoxShadow(
                    color: salondarkshadow.withOpacity(0.5),
                    blurRadius: 25.0, // soften the shadow
                    spreadRadius: 5.0, //extend the shadow
                    offset: Offset(0.0, 0.75))
              ],
            ),
            padding: EdgeInsets.only(top: 18, left: 15, right: 15),
            child:
                Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Container(
                  decoration: DesignConfig.outerCircularDecoration(),
                  padding: EdgeInsets.all(15),
                  child: SvgPicture.asset(
                    "assets/images/fullApps/pureBeauty/svgimg/back01.svg",
                    color: salonappcolor,
                  ),
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        //width: 65,
                        padding: EdgeInsets.all(2),
                        margin: EdgeInsets.only(right: 20),
                        decoration: DesignConfig.outerCircularDecoration(),
                        child: CircleAvatar(
                          radius: 25,
                          child: ClipOval(
                            child: OctoImage(
                              image: CachedNetworkImageProvider(
                                  selecteduser['imgurl']),
                              placeholderBuilder: OctoPlaceholder.blurHash(
                                  selecteduser['hash']),
                              errorBuilder: OctoError.icon(color: Colors.black),
                              width: double.maxFinite,
                            ),
                          ),
                        )),
                    Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(selecteduser['name'],
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1!
                                  .merge(TextStyle(
                                      color: salonappcolor,
                                      fontWeight: FontWeight.bold))),
                          SizedBox(height: 5),
                          Text(selecteduser['time'],
                              style: Theme.of(context)
                                  .textTheme
                                  .caption!
                                  .merge(TextStyle(color: salonlightfont))),
                        ]),
                  ],
                ),
              ),
              Container(
                decoration: DesignConfig.outerCircularDecoration(),
                padding: EdgeInsets.all(15),
                child: SvgPicture.asset(
                  "assets/images/fullApps/pureBeauty/svgimg/call.svg",
                ),
              ),
            ]),
          ),
          SizedBox(height: 10),
          Text(
            "Today",
            style: Theme.of(context).textTheme.subtitle1!.merge(TextStyle(
                color: salonappcolor,
                letterSpacing: 0.5,
                fontWeight: FontWeight.bold)),
          ),
          Expanded(
            child: chatListWidget(),
          ),
          Container(
            height: 80.0,
            decoration: BoxDecoration(
              color: salonbgcolor,
              boxShadow: [
                BoxShadow(
                  color: salondarkshadow.withOpacity(0.5),
                  blurRadius: 25.0, // soften the shadow
                  spreadRadius: 5.0, //extend the shadow
                  offset: Offset(
                    0.75, // Move to right 10  horizontally
                    0, // Move to bottom 10 Vertically
                  ),
                )
              ],
            ),
            child: bottomSendMsgWidget(),
          ),
        ],
      ),
    );
  }

  Widget bottomSendMsgWidget() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Container(
            // margin: EdgeInsets.only(left: 15, top: 25, right: 10, bottom: 10),
            margin: EdgeInsets.only(left: 10, top: 10, right: 10, bottom: 10),
            decoration: DesignConfig.newInnerDecoration(30),
            //decoration: DesignConfig.innerDecoration(30),
            //padding: EdgeInsets.only(left: 5, right: 15),
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            alignment: Alignment.centerLeft,

            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Icon(
                Icons.add_circle,
                color: salonappcolor,
                size: 40,
              ),
              SizedBox(width: 12),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 3.0),
                  child: TextField(
                    controller: edtmsg,
                    maxLines: null,
                    keyboardType: TextInputType.multiline,
                    decoration: InputDecoration(
                        hintText: "Message...",
                        border: InputBorder.none,
                        hintStyle: TextStyle(color: salonlightfont)),
                  ),
                ),
              ),
              SizedBox(width: 5),
              SvgPicture.asset(
                "assets/images/fullApps/pureBeauty/svgimg/emoji.svg",
                height: 35,
                width: 35,
                fit: BoxFit.cover,
              ),
            ]),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 5, top: 5),
          child: Icon(
            Icons.mic,
            color: salonappcolor,
            size: 30,
          ),
        )
      ],
    );
  }

  Widget chatListWidget() {
    return ListView.builder(
      itemCount: DataConfig.chatList.length,
      itemBuilder: (context, index) {
        var chat = DataConfig.chatList[index];

        return chat['id'] == 0
            ? Align(
                alignment: Alignment.centerRight,
                child: Container(
                  padding: EdgeInsets.only(
                      top: chat['isaudio'] ? 5 : 10,
                      left: 10,
                      right: 10,
                      bottom: 8),
                  margin: EdgeInsets.only(left: 70, right: 10, bottom: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                      topRight: Radius.circular(10),
                    ),
                    color: salonbgcolor,
                    boxShadow: [
                      BoxShadow(
                        spreadRadius: 1,
                        blurRadius: 8,
                        color: Colors.white,
                        offset: Offset(
                          -5,
                          -5,
                        ),
                      ),
                      BoxShadow(
                        spreadRadius: 1,
                        blurRadius: 2,
                        color: salonlightshadow,
                        offset: Offset(
                          -2,
                          -2,
                        ),
                      ),
                      BoxShadow(
                        spreadRadius: 1,
                        blurRadius: 4,
                        color: salondarkshadow,
                        offset: Offset(
                          4,
                          4,
                        ),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      chat['isaudio']
                          ? Row(mainAxisSize: MainAxisSize.min, children: [
                              SvgPicture.asset(
                                "assets/images/fullApps/pureBeauty/svgimg/audiowave.svg",
                                color: salonappcolor,
                              ),
                              SizedBox(width: 8),
                              Container(
                                padding: EdgeInsets.all(8),
                                decoration:
                                    DesignConfig.outerCircularDecoration(),
                                child: Icon(
                                  Icons.play_arrow,
                                  color: salonappcolor,
                                ),
                              ),
                              SizedBox(width: 8),
                              Text(
                                "1.3",
                                style: TextStyle(color: salonappcolor),
                              )
                            ])
                          : Text(
                              chat['messageContent'],
                              style: TextStyle(
                                  color: salonmainlight, letterSpacing: 0.5),
                            ),
                      SizedBox(height: 5),
                      Text(
                        chat['time'],
                        style: TextStyle(fontSize: 10, color: salonlightfont),
                      )
                    ],
                  ),
                ),
              )
            : Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      width: 60,
                      padding: EdgeInsets.all(2),
                      margin: EdgeInsets.only(left: 10, right: 10),
                      decoration: DesignConfig.outerCircularDecoration(),
                      child: CircleAvatar(
                        child: ClipOval(
                          child: OctoImage(
                            image: CachedNetworkImageProvider(chat['imgurl']),
                            placeholderBuilder:
                                OctoPlaceholder.blurHash(chat['hash']),
                            errorBuilder: OctoError.icon(color: Colors.black),
                          ),
                        ),
                      )),
                  Flexible(
                    child: Container(
                      padding: EdgeInsets.only(
                          top: chat['isaudio'] ? 5 : 10,
                          left: 10,
                          right: 10,
                          bottom: 8),
                      margin: EdgeInsets.only(right: 20, bottom: 20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          bottomLeft: Radius.circular(30),
                          bottomRight: Radius.circular(30),
                          topRight: Radius.circular(30),
                        ),
                        color: salonbgcolor,
                        boxShadow: [
                          BoxShadow(
                            spreadRadius: 1,
                            blurRadius: 8,
                            color: Colors.white,
                            offset: Offset(
                              -5,
                              -5,
                            ),
                          ),
                          BoxShadow(
                            spreadRadius: 1,
                            blurRadius: 2,
                            color: salonlightshadow,
                            offset: Offset(
                              -2,
                              -2,
                            ),
                          ),
                          BoxShadow(
                            spreadRadius: 1,
                            blurRadius: 4,
                            color: salondarkshadow,
                            offset: Offset(
                              4,
                              4,
                            ),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          chat['isaudio']
                              ? Row(mainAxisSize: MainAxisSize.min, children: [
                                  SvgPicture.asset(
                                    "assets/images/fullApps/pureBeauty/svgimg/audiowave.svg",
                                    color: salonappcolor,
                                  ),
                                  SizedBox(width: 8),
                                  Container(
                                    padding: EdgeInsets.all(8),
                                    decoration:
                                        DesignConfig.outerCircularDecoration(),
                                    child: Icon(
                                      Icons.play_arrow,
                                      color: salonappcolor,
                                    ),
                                  ),
                                  SizedBox(width: 8),
                                  Text(
                                    "1.3",
                                    style: TextStyle(color: salonappcolor),
                                  )
                                ])
                              : Text(
                                  chat['messageContent'],
                                  style: TextStyle(
                                      color: salonmainlight,
                                      letterSpacing: 0.5),
                                ),
                          SizedBox(height: 5),
                          Text(
                            chat['time'],
                            style:
                                TextStyle(fontSize: 10, color: salonlightfont),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              );
      },
    );
  }
}
