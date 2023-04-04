import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smartkit_pro/ui/fullApps/cryptoTech/helper/ColorsRes.dart';
import 'package:smartkit_pro/ui/fullApps/cryptoTech/helper/DesignConfig.dart';
import 'package:smartkit_pro/ui/fullApps/cryptoTech/helper/StringsRes.dart';

class NotificationSettings extends StatefulWidget {
  const NotificationSettings({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return NotificationSettingsState();
  }
}

class NotificationSettingsState extends State<NotificationSettings> {
  bool isLoading = false;
  TextStyle? textStyle;
  bool sales = false, news = false, unusualactivity = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    textStyle = Theme.of(context).textTheme.subtitle2!.merge(TextStyle(
          fontWeight: FontWeight.bold,
          color: ColorsRes.black,
        ));

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.dark,
      ),
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.only(
              right: 25,
              top: kToolbarHeight - MediaQuery.of(context).padding.top),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: SvgPicture.asset(
                      'assets/images/fullApps/cryptotech/close_button.svg',
                    )),
                SizedBox(height: 20),
                SwitchListTile(
                    title: Text("${StringsRes.notification_sales} ",
                        style: textStyle),
                    activeColor: ColorsRes.firstgradientcolor,
                    controlAffinity: ListTileControlAffinity.leading,
                    value: sales,
                    onChanged: (bool ischecked) {
                      setState(() {
                        sales = ischecked;
                      });
                    }),
                SwitchListTile(
                    title: Text("${StringsRes.notification_news} ",
                        style: textStyle),
                    activeColor: ColorsRes.firstgradientcolor,
                    controlAffinity: ListTileControlAffinity.leading,
                    value: news,
                    onChanged: (bool ischecked) {
                      setState(() {
                        news = ischecked;
                      });
                    }),
                SwitchListTile(
                    title: Text("${StringsRes.notification_unusalactivity} ",
                        style: textStyle),
                    activeColor: ColorsRes.firstgradientcolor,
                    controlAffinity: ListTileControlAffinity.leading,
                    value: unusualactivity,
                    onChanged: (bool ischecked) {
                      setState(() {
                        unusualactivity = ischecked;
                      });
                    }),
                GestureDetector(
                  onTap: () async {},
                  child: Container(
                    margin: EdgeInsets.all(30),
                    decoration: DesignConfig.circulargradient_box,
                    padding: const EdgeInsets.only(top: 12, bottom: 12),
                    child: Center(
                      child: Text(
                        StringsRes.update,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: ColorsRes.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
