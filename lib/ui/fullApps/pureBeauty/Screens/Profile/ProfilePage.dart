import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:octo_image/octo_image.dart';
import 'package:smartkit_pro/ui/fullApps/pureBeauty/Screens/Profile/FeedbackPage.dart';
import 'package:smartkit_pro/ui/fullApps/pureBeauty/helper/DesignConfig.dart';
import 'package:smartkit_pro/ui/fullApps/pureBeauty/styles/colors.dart';
import 'ChangePassword.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.light,
      ),
      child: Scaffold(
        backgroundColor: salonbgcolor,
        appBar: DesignConfig.setAppbar("Profile", context, true)
            as PreferredSizeWidget?,
        body: SingleChildScrollView(
          physics:
              BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            Center(
              child: Container(
                height: 130,
                width: 130,
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                        color: salondarkshadow.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 8),
                  ],
                  gradient: LinearGradient(
                    //stops: [0, 1],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [salondarkshadow, salonlightshadow],
                  ),
                ),
                child: ClipOval(
                  child: OctoImage(
                    image: CachedNetworkImageProvider(
                        'https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/salonapp%2Fprofile.jpg?alt=media&token=f41bbc23-031b-4ebb-bcfa-0e7feb0e675a'),
                    placeholderBuilder: OctoPlaceholder.blurHash(
                        'LsMQhl%M?wRj9Ya}xuj[S4j[s:oe'),
                    errorBuilder: OctoError.icon(color: Colors.black),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            Text(
              "NOT A MEMBER",
              style: Theme.of(context)
                  .textTheme
                  .caption!
                  .merge(TextStyle(color: salonmainlight)),
            ),
            SizedBox(height: 10),
            Text(
              "WRTeam",
              style: Theme.of(context).textTheme.subtitle1!.merge(
                  TextStyle(color: salonappcolor, fontWeight: FontWeight.bold)),
            ),
            SizedBox(height: 5),
            Text(
              "+919988765432",
              style: Theme.of(context)
                  .textTheme
                  .subtitle1!
                  .merge(TextStyle(color: salonappcolor)),
            ),
            SizedBox(height: 15),
            Row(children: [
              Expanded(
                child: Container(
                  decoration: DesignConfig.outerDecoration(10),
                  padding: EdgeInsets.all(8),
                  child: Column(
                    children: [
                      Text(
                        "Visits (In 6 Months)",
                        style: Theme.of(context)
                            .textTheme
                            .caption!
                            .merge(TextStyle(color: salonappcolor)),
                      ),
                      SizedBox(height: 22),
                      Text(
                        "0",
                        style: Theme.of(context).textTheme.headline6!.merge(
                            TextStyle(
                                color: salonappcolor,
                                fontWeight: FontWeight.bold)),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(8),
                  decoration: DesignConfig.outerDecoration(10),
                  child: Column(
                    children: [
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                                text: "Runway Rewards\t\t",
                                style: Theme.of(context)
                                    .textTheme
                                    .caption!
                                    .merge(TextStyle(color: salonappcolor))),
                            WidgetSpan(
                              alignment: PlaceholderAlignment.middle,
                              child: SvgPicture.asset(
                                  "assets/images/fullApps/pureBeauty/svgimg/help.svg"),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 15),
                      Text(
                        "0",
                        style: Theme.of(context).textTheme.headline6!.merge(
                            TextStyle(
                                color: salonappcolor,
                                fontWeight: FontWeight.bold)),
                      ),
                    ],
                  ),
                ),
              ),
            ]),
            SizedBox(height: 20),
            Container(
              decoration: DesignConfig.outerDecoration(10),
              child: ListTile(
                leading: SvgPicture.asset(
                    "assets/images/fullApps/pureBeauty/svgimg/discount02.svg"),
                title: Text(
                  "Free/Discount Services & Other Offers",
                  style: TextStyle(color: salonappcolor),
                ),
                trailing: Icon(
                  Icons.keyboard_arrow_right,
                  color: salonappcolor,
                ),
              ),
            ),
            SizedBox(height: 10),
            Container(
              decoration: DesignConfig.outerDecoration(10),
              child: ListTile(
                leading: Icon(
                  Icons.watch_later,
                  color: salonappcolor,
                ),
                title: Text(
                  "No Recent Appointments",
                  style: TextStyle(color: salonappcolor),
                ),
                trailing: Icon(
                  Icons.keyboard_arrow_right,
                  color: salonappcolor,
                ),
              ),
            ),
            SizedBox(height: 10),
            Container(
              decoration: DesignConfig.outerDecoration(10),
              child: ListTile(
                leading: SvgPicture.asset(
                    "assets/images/fullApps/pureBeauty/svgimg/refere.svg"),
                title: Text(
                  "Refer & Get Rewards",
                  style: TextStyle(color: salonappcolor),
                ),
                trailing: Icon(
                  Icons.keyboard_arrow_right,
                  color: salonappcolor,
                ),
              ),
            ),
            SizedBox(height: 10),
            Container(
              decoration: DesignConfig.outerDecoration(10),
              child: ListTile(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ChangePassword()));
                },
                leading: SvgPicture.asset(
                    "assets/images/fullApps/pureBeauty/svgimg/changepass.svg"),
                title: Text(
                  "Change Password",
                  style: TextStyle(color: salonappcolor),
                ),
                trailing: Icon(
                  Icons.keyboard_arrow_right,
                  color: salonappcolor,
                ),
              ),
            ),
            SizedBox(height: 10),
            Container(
              decoration: DesignConfig.outerDecoration(10),
              child: ListTile(
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => FeedbackPage()));
                },
                leading: Icon(
                  Icons.rate_review,
                  color: salonappcolor,
                ),
                title: Text(
                  "Feedback",
                  style: TextStyle(color: salonappcolor),
                ),
                trailing: Icon(
                  Icons.keyboard_arrow_right,
                  color: salonappcolor,
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
