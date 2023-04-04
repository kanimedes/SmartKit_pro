import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'Helper/Color.dart';
import 'Helper/String.dart';

class PrivacyPolicy extends StatefulWidget {
  final String? title;
  final String? from;

  const PrivacyPolicy({Key? key, this.title, this.from}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return StatePrivacy();
  }
}

class StatePrivacy extends State<PrivacyPolicy> with TickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  String? privacy;
  String url = "";

  @override
  void initState() {
    super.initState();
  }

  //set appbar
  getAppBar() {
    return PreferredSize(
        preferredSize: Size(double.infinity, 45),
        child: AppBar(
          leadingWidth: 50,
          elevation: 0.0,
          centerTitle: true,
          backgroundColor: Colors.transparent,
          title: Text(
            widget.title!,
            style: Theme.of(context).textTheme.headline6?.copyWith(
                color: colors.primary,
                fontWeight: FontWeight.w600,
                letterSpacing: 0.5),
          ),
          leading: Builder(builder: (BuildContext context) {
            return Padding(
                padding: EdgeInsetsDirectional.only(
                    start: 15.0, top: 6.0, bottom: 6.0),
                child: Container(
                    height: 38,
                    padding: EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.boxColor,
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 10.0,
                              offset: const Offset(5.0, 5.0),
                              color: Theme.of(context)
                                  .colorScheme
                                  .fontColor
                                  .withOpacity(0.1),
                              spreadRadius: 1.0),
                        ],
                        borderRadius: BorderRadius.circular(6.0)),
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: SvgPicture.asset(
                        "assets/images/fullApps/modernNews/svg/back_icon.svg",
                        semanticsLabel: 'back icon',
                        color: Theme.of(context).colorScheme.fontColor,
                      ),
                    )));
          }),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        appBar: getAppBar(),
        body: SingleChildScrollView(
          padding: EdgeInsetsDirectional.only(start: 15.0, end: 15.0, top: 5.0),
          child: Text(
            privacy!,
            style: TextStyle(
                color: Theme.of(context).colorScheme.darkColor, fontSize: 16.0),
          ),
        ));
  }

//set snackbar msg
  setSnackbar(String msg) {
    ScaffoldMessenger.of(context).showSnackBar(new SnackBar(
      content: new Text(
        msg,
        textAlign: TextAlign.center,
        style: TextStyle(color: Theme.of(context).colorScheme.fontColor),
      ),
      backgroundColor: isDark! ? colors.tempdarkColor : colors.bgColor,
      elevation: 1.0,
    ));
  }
}
