// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:octo_image/octo_image.dart';
import 'package:smartkit_pro/ui/fullApps/pureBeauty/Screens/Message/ChatPage.dart';
import 'package:smartkit_pro/ui/fullApps/pureBeauty/helper/DataConfig.dart';
import 'package:smartkit_pro/ui/fullApps/pureBeauty/helper/DesignConfig.dart';
import 'package:smartkit_pro/ui/fullApps/pureBeauty/styles/colors.dart';

late var selecteduser;

class ChatUserListPage extends StatefulWidget {
  const ChatUserListPage({Key? key}) : super(key: key);

  @override
  _ChatUserListPageState createState() => _ChatUserListPageState();
}

class _ChatUserListPageState extends State<ChatUserListPage> {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.light,
      ),
      child: Scaffold(
        backgroundColor: salonbgcolor,
        appBar: DesignConfig.setAppbar("Message", context, true)
            as PreferredSizeWidget?,
        body: ListView.builder(
          physics:
              BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
          padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
          itemCount: DataConfig.msgUserlist.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                selecteduser = DataConfig.msgUserlist[index];
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => ChatPage()));
              },
              child: Container(
                margin: EdgeInsets.only(left: 20, right: 10, bottom: 15),
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                decoration: DesignConfig.outerDecoration(10),
                child: Row(children: [
                  Container(
                      //width: 73,
                      padding: EdgeInsets.all(4),
                      margin: EdgeInsets.only(right: 20),
                      decoration: DesignConfig.outerCircularDecoration(),
                      child: CircleAvatar(
                        child: ClipOval(
                          child: OctoImage(
                            image: CachedNetworkImageProvider(
                                DataConfig.msgUserlist[index]['imgurl']),
                            placeholderBuilder: OctoPlaceholder.blurHash(
                                DataConfig.msgUserlist[index]['hash']),
                            errorBuilder: OctoError.icon(color: Colors.black),
                            width: double.maxFinite,
                          ),
                        ),
                      )),
                  Expanded(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                        Row(
                          children: [
                            Expanded(
                              child: Text(DataConfig.msgUserlist[index]['name'],
                                  style: Theme.of(context)
                                      .textTheme
                                      .subtitle1!
                                      .merge(TextStyle(
                                          color: salonappcolor,
                                          fontWeight: FontWeight.bold))),
                            ),
                            SizedBox(width: 5),
                            Text(DataConfig.msgUserlist[index]['time'],
                                style: Theme.of(context)
                                    .textTheme
                                    .caption!
                                    .merge(TextStyle(color: salonlightfont))),
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                  DataConfig.msgUserlist[index]['lastmsg'],
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: Theme.of(context)
                                      .textTheme
                                      .subtitle1!
                                      .merge(TextStyle(color: salonlightfont))),
                            ),
                            if (DataConfig.msgUserlist[index]['unreadcount'] !=
                                0)
                              SizedBox(width: 5),
                            if (DataConfig.msgUserlist[index]['unreadcount'] !=
                                0)
                              Container(
                                margin: EdgeInsets.only(top: 5),
                                decoration: DesignConfig.boxDecorationContainer(
                                    salonappcolor, 10),
                                padding: EdgeInsets.only(
                                    left: 7, right: 7, top: 4, bottom: 4),
                                child: Text(
                                  DataConfig.msgUserlist[index]['unreadcount']
                                      .toString(),
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                          ],
                        ),
                      ])),
                ]),
              ),
            );
          },
        ),
      ),
    );
  }
}
