import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:octo_image/octo_image.dart';
import 'package:smartkit_pro/ui/fullApps/pureBeauty/Screens/BookAppointment/BookAppointmentInfoPage.dart';
import 'package:smartkit_pro/ui/fullApps/pureBeauty/helper/DataConfig.dart';
import 'package:smartkit_pro/ui/fullApps/pureBeauty/helper/DesignConfig.dart';
import 'package:smartkit_pro/ui/fullApps/pureBeauty/styles/colors.dart';

import '../SalonDetailPage.dart';

class BookAppointmentListPage extends StatefulWidget {
  const BookAppointmentListPage({Key? key}) : super(key: key);

  @override
  _BookAppointmentListPageState createState() =>
      _BookAppointmentListPageState();
}

class _BookAppointmentListPageState extends State<BookAppointmentListPage> {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.light,
      ),
      child: Scaffold(
        backgroundColor: salonbgcolor,
        appBar: DesignConfig.setAppbar("Book Appointment", context, true)
            as PreferredSizeWidget?,
        body: GridView.builder(
            physics:
                BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
            itemCount: DataConfig.bookappointmentlist.length,
            padding: EdgeInsets.symmetric(horizontal: 10),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 15,
              mainAxisSpacing: 20,
              childAspectRatio: MediaQuery.of(context).size.width /
                  (MediaQuery.of(context).size.height / 1.27),
              //childAspectRatio: MediaQuery.of(context).size.width / (MediaQuery.of(context).size.height / 1.3),
            ),
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => BookAppointmentInfoPage(
                          img: DataConfig.bookappointmentlist[index]['imgurl'],
                          blurUrl: DataConfig.bookappointmentlist[index]
                              ['hash'],
                          localimg: DataConfig.bookappointmentlist[index]
                              ['img'])));
                },
                child: Container(
                  decoration:
                      DesignConfig.outerDecorationService(10, salonbgcolor),
                  child: Column(children: [
                    Expanded(
                        child: ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: const Radius.circular(10),
                        topRight: const Radius.circular(10),
                      ),
                      child: OctoImage(
                        image: CachedNetworkImageProvider(
                            DataConfig.bookappointmentlist[index]['imgurl']),
                        placeholderBuilder: OctoPlaceholder.blurHash(
                            DataConfig.bookappointmentlist[index]['hash']),
                        errorBuilder: OctoError.icon(color: Colors.black),
                        width: double.maxFinite,
                        fit: BoxFit.cover,
                      ),
                    )),
                    SizedBox(height: 10),
                    Text(
                      DataConfig.bookappointmentlist[index]['feature'],
                      style: Theme.of(context).textTheme.bodyText2!.merge(
                          TextStyle(
                              color: salonmainlight,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 0.5)),
                    ),
                    SizedBox(height: 5),
                    Text(
                      DataConfig.bookappointmentlist[index]['title'],
                      textAlign: TextAlign.center,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.subtitle1!.merge(
                          TextStyle(
                              color: salonappcolor,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 0.5)),
                    ),
                    SizedBox(height: 5),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5),
                      child: Text(
                        DataConfig.bookappointmentlist[index]['address'],
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.caption!.merge(
                            TextStyle(
                                color: salonlightfont, letterSpacing: 0.5)),
                      ),
                    ),
                    SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 10, right: 10, bottom: 10),
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => SalonDetailPage(
                                      img: DataConfig.bookappointmentlist[index]
                                          ['img'],
                                      imgurl: DataConfig
                                          .bookappointmentlist[index]['imgurl'],
                                      hash:
                                          DataConfig.bookappointmentlist[index]
                                              ['hash'])));
                            },
                            child: IntrinsicWidth(
                              child: Container(
                                decoration: DesignConfig.outerDecoration(10),
                                padding: EdgeInsets.only(
                                    bottom: 10, top: 10, left: 13, right: 13),
                                child: Text(
                                  "Learn More",
                                  style: //Theme.of(context).textTheme.caption.merge(
                                      TextStyle(
                                          color: salonappcolor,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 10), //),
                                ),
                              ),
                            ),
                          ),
                          // SizedBox(width: 5),
                          Spacer(),
                          // SizedBox(width: 5),
                          GestureDetector(
                            onTap: () {},
                            child: Container(
                              decoration:
                                  DesignConfig.outerCircularDecoration(),
                              padding: EdgeInsets.all(8),
                              child: Icon(
                                Icons.send,
                                size: 16,
                                color: salonappcolor,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ]),
                ),
              );
            }),
      ),
    );
  }
}
