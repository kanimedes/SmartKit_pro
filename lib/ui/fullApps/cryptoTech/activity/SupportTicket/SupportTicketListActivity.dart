// ignore_for_file: non_constant_identifier_names

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:smartkit_pro/ui/fullApps/cryptoTech/activity/SupportTicket/CreateTicketActivity.dart';
import 'package:smartkit_pro/ui/fullApps/cryptoTech/activity/SupportTicket/TicketMessageListActivity.dart';
import 'package:smartkit_pro/ui/fullApps/cryptoTech/helper/ColorsRes.dart';
import 'package:smartkit_pro/ui/fullApps/cryptoTech/helper/DesignConfig.dart';
import 'package:smartkit_pro/ui/fullApps/cryptoTech/helper/RelativeDateFormat.dart';
import 'package:smartkit_pro/ui/fullApps/cryptoTech/helper/StringsRes.dart';
import 'package:smartkit_pro/ui/fullApps/cryptoTech/helper/UIData.dart';
import 'package:smartkit_pro/ui/fullApps/cryptoTech/model/SupportTicket.dart';

late SupportTicket selectedticket;
int? ticketpos;
late List<SupportTicket> ticketlist;

class SupportTicketListActivity extends StatefulWidget {
  @override
  SupportTicketListState createState() => new SupportTicketListState();
}

class SupportTicketListState extends State<SupportTicketListActivity> {
  final _scaffoldKeyoutgoing = GlobalKey<ScaffoldState>();
  String message = '';
  int ticketoffset = 0;

  bool ticketisloadmore = true,
      ticketisgettingdata = false,
      ticketisnodata = false;
  late double toppadding;

  @override
  void dispose() {
    //DesignConfig.SetStatusbarColor(ColorsRes.secondgradientcolor);

    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    //DesignConfig.SetStatusbarColor(ColorsRes.firstgradientcolor);
    ticketlist = [];
    ticketlist = UIData.getSupportTicketList();

    ticketoffset = 0;
  }

  @override
  Widget build(BuildContext context) {
    toppadding = kToolbarHeight + 40;
    return Scaffold(
      key: _scaffoldKeyoutgoing,
      backgroundColor: ColorsRes.bgcolor,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => CreateTicketActivity()));
        },
        child: Icon(Icons.add),
      ),
      body: Stack(
        children: [
          Container(
            constraints: BoxConstraints.expand(),
            decoration: BoxDecoration(
              gradient: DesignConfig.gradient,
            ),
            padding: EdgeInsets.only(top: toppadding),
            child: Container(
              padding: EdgeInsets.only(top: 5),
              decoration: BoxDecoration(
                color: ColorsRes.homebgcolor,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(18),
                    topLeft: Radius.circular(18)),
              ),
              child: ticketisnodata
                  ? Center(
                      child: Text(
                      message,
                      style: Theme.of(context).textTheme.subtitle1,
                      textAlign: TextAlign.center,
                    ))
                  : NotificationContent(),
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: IntrinsicHeight(
              child: AppBar(
                  systemOverlayStyle: SystemUiOverlayStyle.light,
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  title: Text(StringsRes.supportticket,
                      style: TextStyle(color: ColorsRes.white)),
                  leading: GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: SvgPicture.asset(
                        'assets/images/fullApps/cryptotech/back_button.svg'),
                  )),
            ),
          )
        ],
      ),
    );
  }

  Widget NotificationContent() {
    return new NotificationListener<ScrollNotification>(
      onNotification: (scrollNotification) {
        return true;
      },
      child: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
                padding: EdgeInsetsDirectional.only(
                    bottom: 5, start: 10, end: 10, top: 12),
                physics: ClampingScrollPhysics(),
                itemCount: ticketlist.length,
                itemBuilder: (context, index) {
                  SupportTicket item = ticketlist[index];

                  return item == null
                      ? Container()
                      : GestureDetector(
                          onTap: () {
                            selectedticket = item;
                            ticketpos = index;

                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        TicketMessageListActivity()));
                          },
                          child: Card(
                            color: ColorsRes.cardbggrey,
                            shape: DesignConfig.roundedrectangleshape,
                            margin: EdgeInsets.only(bottom: 10),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CircleAvatar(
                                    radius: 14,
                                    backgroundColor: colorlist[index % 6],
                                    child: Text(
                                      item.title!.contains(" ")
                                          ? "${item.title!.split(' ')[0].substring(0, 1).toUpperCase()}${item.title!.split(' ')[1].substring(0, 1).toUpperCase()}"
                                          : item.title!
                                              .substring(0, 2)
                                              .toUpperCase(),
                                      style: TextStyle(
                                          color: ColorsRes.white,
                                          fontSize: 10,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  SizedBox(width: 10),
                                  Flexible(
                                    child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            item.title!,
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: Theme.of(context)
                                                .textTheme
                                                .subtitle2!
                                                .merge(TextStyle(
                                                  color: ColorsRes
                                                      .firstgradientcolor,
                                                  fontWeight: FontWeight.bold,
                                                )),
                                          ),
                                          SizedBox(
                                            height: 2,
                                          ),
                                          Text(item.lastmessage!,
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .caption!
                                                  .merge(TextStyle(
                                                      color: ColorsRes.black))),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                RelativeDateFormat.format(
                                                    DateFormat(
                                                            "yyyy-MM-dd hh:mm:ss")
                                                        .parse(
                                                            item.created_on!)),
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .caption!
                                                    .merge(TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: ColorsRes.grey
                                                            .withOpacity(0.7))),
                                              ),
                                              Text(
                                                item.status == '0'
                                                    ? StringsRes.lblclosed
                                                    : StringsRes.lblopen,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .caption!
                                                    .merge(TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: item.status ==
                                                                '0'
                                                            ? ColorsRes.red
                                                            : ColorsRes.green)),
                                              ),
                                            ],
                                          ),
                                        ]),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                }),
          ),
          ticketisgettingdata
              ? Padding(
                  padding: EdgeInsets.only(top: 5, bottom: 5),
                  child: CircularProgressIndicator(),
                )
              : Container(),
        ],
      ),
    );
  }

  List<Color> colorlist = [
    ColorsRes.cardyellow,
    ColorsRes.cardpurple,
    ColorsRes.cardpink,
    ColorsRes.cardblue,
    ColorsRes.cardgreen,
    ColorsRes.cardpich
  ];
}
