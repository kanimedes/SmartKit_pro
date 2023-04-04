// ignore_for_file: no_logic_in_create_state, non_constant_identifier_names

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smartkit_pro/ui/fullApps/cryptoTech/helper/ColorsRes.dart';
import 'package:smartkit_pro/ui/fullApps/cryptoTech/helper/DesignConfig.dart';

class TermsConditionActivity extends StatelessWidget {
  String title;

  TermsConditionActivity(this.title);

  @override
  Widget build(BuildContext context) {
    double toppadding = kToolbarHeight + 40;
    return new Scaffold(
      backgroundColor: ColorsRes.bgcolor,

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
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(20.0),
                child: Center(
                  child: Container(
                    margin: EdgeInsets.all(10),
                    child: TermsConditionPage(title),
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: IntrinsicHeight(
              child: AppBar(
                systemOverlayStyle: SystemUiOverlayStyle.light,
                backgroundColor: Colors.transparent,
                elevation: 0,
                title: Text(title, style: TextStyle(color: ColorsRes.white)),
                leading: GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: SvgPicture.asset(
                      'assets/images/fullApps/cryptotech/back_button.svg'),
                ),
              ),
            ),
          )
        ],
      ),
      //),
    );
  }
}

class TermsConditionPage extends StatefulWidget {
  String title;

  TermsConditionPage(this.title);

  @override
  TermsData createState() {
    return TermsData(title);
  }
}

class TermsData extends State<TermsConditionPage> {
  String title;

  TermsData(this.title);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
        future: GetTermsData(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Html(data: snapshot.data);
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }
          return CircularProgressIndicator();
        });
  }

  Future<String> GetTermsData() async {
    return "$title\ntest data";
  }
}
