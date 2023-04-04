import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:smartkit_pro/ui/fullApps/jobseekApp/Pages/details/widgets/email_content.dart';
import 'package:smartkit_pro/ui/fullApps/jobseekApp/Pages/home/profile_page.dart';
import 'package:smartkit_pro/ui/fullApps/jobseekApp/Pages/home/widgets/home_content.dart';
import 'package:smartkit_pro/ui/fullApps/jobseekApp/Pages/home/widgets/notification_content.dart';
import 'package:smartkit_pro/ui/fullApps/jobseekApp/Pages/home/widgets/setting_content.dart';
import 'package:smartkit_pro/ui/fullApps/jobseekApp/UI/animation/showdown.dart';
import 'package:smartkit_pro/ui/fullApps/jobseekApp/UI/widgets/imageConstant.dart';
import 'package:smartkit_pro/ui/fullApps/jobseekApp/widget/app_large_text.dart';
import 'package:smartkit_pro/ui/fullApps/jobseekApp/widget/app_text.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;
  final List<IconData> _iconData = [
    Icons.home,
    Icons.mail,
    Icons.bookmark,
    Icons.category
  ];

  Widget buildBottomnavItem(IconData iconData, int valueindex) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          iconData,
        ),
        currentIndex == valueindex
            ? Container(
                margin: const EdgeInsetsDirectional.only(top: 5),
                width: 5,
                height: 5,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Theme.of(context).colorScheme.primary),
              )
            : SizedBox()
      ],
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: nevigationDrawer(),
      body: IndexedStack(
        index: currentIndex,
        children: const [
          HomeContent(),
          EmailContent(),
          NotificationContent(),
          settingContent()
        ],
      ),
      bottomNavigationBar: ShowDown(
        delay: 1200,
        child: BottomNavigationBar(
          currentIndex: currentIndex,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Theme.of(context).colorScheme.onPrimary,
          unselectedItemColor: Theme.of(context).colorScheme.secondary,
          items: List.generate(_iconData.length, (index) => index)
              .map((e) => BottomNavigationBarItem(
                  icon: buildBottomnavItem(_iconData[e], e), label: ""))
              .toList(),
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}

class nevigationDrawer extends StatelessWidget {
  Widget createDrawerHeader(BuildContext context) {
    return DrawerHeader(
        margin: EdgeInsets.zero,
        padding: EdgeInsets.zero,
        child: Stack(children: <Widget>[
          Column(
            children: [
              Align(
                alignment: Alignment.center,
                child: Container(
                  margin: const EdgeInsets.only(top: 15),
                  width: 70,
                  height: 70,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: AssetImage(
                              JobappConstant.getImagePath("smoke.jpg")),
                          fit: BoxFit.cover)),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Align(
                  alignment: Alignment.center,
                  child: AppLargeText(
                    text: "James Cotter",
                    color: Theme.of(context).colorScheme.secondary,
                    size: 20,
                  )),
              SizedBox(
                height: 5,
              ),
              Align(
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AppText(
                      text: "UX Designer",
                      color: Theme.of(context)
                          .colorScheme
                          .secondary
                          .withOpacity(0.6),
                      size: 14,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Container(
                      width: 12,
                      height: 12,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Colors.blue),
                      child: Icon(
                        Icons.check,
                        size: 8,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 5,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Profile_Page()));
                },
                child: Align(
                    alignment: Alignment.center,
                    child: AppLargeText(
                      text: "View Profile",
                      color: Theme.of(context).colorScheme.primary,
                      size: 10,
                    )),
              ),
            ],
          )
        ]));
  }

  Widget createDrawerBodyItem(BuildContext context,
      {required IconData icon,
      required String text,
      GestureTapCallback? onTap}) {
    return ListTile(
      title: Row(
        children: <Widget>[
          Icon(
            icon,
            color: Theme.of(context).colorScheme.onSecondary.withOpacity(0.6),
          ),
          Padding(
              padding: EdgeInsets.only(left: 8.0),
              child: AppLargeText(
                text: text,
                color: Theme.of(context).colorScheme.secondary.withOpacity(0.7),
                size: 14,
              ))
        ],
      ),
      onTap: onTap,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        decoration:
            BoxDecoration(color: Theme.of(context).colorScheme.onPrimary),
        child: ListView(
          children: [
            Container(
              decoration:
                  BoxDecoration(color: Theme.of(context).colorScheme.onPrimary),
              child: Column(
                children: [
                  createDrawerHeader(context),
                  createDrawerBodyItem(
                    context,
                    icon: Icons.perm_device_info,
                    text: 'Personal info',
                    /*     onTap: () =>
                 Navigator.pushReplacementNamed(context, pageRoutes.home),*/
                  ),
                  createDrawerBodyItem(
                    context,
                    icon: Icons.event_note_sharp,
                    text: 'Application',
                    /*  onTap: () =>
                 Navigator.pushReplacementNamed(context, pageRoutes.profile),*/
                  ),
                  createDrawerBodyItem(
                    context,
                    icon: Icons.mail,
                    text: 'Proposals',
                    /*     onTap: () =>
                 Navigator.pushReplacementNamed(context, pageRoutes.event),*/
                  ),
                  /*Divider(),*/
                  createDrawerBodyItem(
                    context,
                    icon: Icons.document_scanner,
                    text: 'Resumes',
                    /*onTap: () =>
                 Navigator.pushReplacementNamed(context, pageRoutes.notification),*/
                  ),
                  createDrawerBodyItem(
                    context,
                    icon: Icons.view_carousel_rounded,
                    text: 'Protfolio',
                    /*    onTap: () =>
                 Navigator.pushReplacementNamed(context, pageRoutes.contact),*/
                  ),
                  createDrawerBodyItem(
                    context,
                    icon: Icons.newspaper,
                    text: 'Cover Letters',
                    /*    onTap: () =>
                 Navigator.pushReplacementNamed(context, pageRoutes.contact),*/
                  ),
                  createDrawerBodyItem(
                    context,
                    icon: Icons.settings,
                    text: 'Setting',
                    /*    onTap: () =>
                 Navigator.pushReplacementNamed(context, pageRoutes.contact),*/
                  ),
                  ListTile(
                    title: Row(
                      children: <Widget>[
                        Icon(
                          Icons.logout,
                          color: Colors.redAccent,
                        ),
                        Padding(
                            padding: EdgeInsets.only(left: 8.0),
                            child: AppLargeText(
                              text: "Logout",
                              color: Theme.of(context)
                                  .colorScheme
                                  .secondary
                                  .withOpacity(0.7),
                              size: 14,
                            ))
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ListTile(
                    title: Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.4,
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Theme.of(context).colorScheme.primary,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Align(
                                  child: Icon(
                                Icons.workspace_premium,
                                color: Theme.of(context).colorScheme.secondary,
                              )),
                              SizedBox(
                                width: 5,
                              ),
                              Align(
                                  child: AppLargeText(
                                text: "Go Premium",
                                color: Theme.of(context).colorScheme.secondary,
                                size: 16,
                              ))
                            ],
                          ),
                        )
                      ],
                      /* child: Container(
                        width: MediaQuery.of(context).size.width * 0.4,
                        height: 50,
                        */ /*color: Colors.green,*/ /*
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),*/
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
