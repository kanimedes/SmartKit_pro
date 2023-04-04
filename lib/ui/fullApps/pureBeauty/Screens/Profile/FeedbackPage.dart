import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smartkit_pro/ui/fullApps/pureBeauty/helper/DesignConfig.dart';
import 'package:smartkit_pro/ui/fullApps/pureBeauty/styles/colors.dart';

class FeedbackPage extends StatefulWidget {
  const FeedbackPage({Key? key}) : super(key: key);

  @override
  _FeedbackPageState createState() => _FeedbackPageState();
}

class _FeedbackPageState extends State<FeedbackPage> {
  int rate = 1;
  TextEditingController edtmsg = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.dark,
      ),
      child: Scaffold(
          backgroundColor: salonbgcolor,
          body: Column(children: [
            Container(
              height: 120.0,
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
                SizedBox(width: 15),
                Text(
                  "Feedback",
                  style: Theme.of(context).textTheme.headline6!.merge(TextStyle(
                      color: salonappcolor,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.5)),
                ),
              ]),
            ),
            Expanded(
                child: ListView(
                    physics: BouncingScrollPhysics(
                        parent: AlwaysScrollableScrollPhysics()),
                    children: [
                  Wrap(
                      alignment: WrapAlignment.center,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      spacing: 5,
                      children: List.generate(5, (index) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              rate = index + 1;
                            });
                          },
                          child: AnimatedContainer(
                            duration: DesignConfig.animationtime,
                            // padding: EdgeInsets.all(18),
                            margin: EdgeInsets.only(
                                right: index < rate ? 5 : 0,
                                bottom: index < rate ? 8 : 0),
                            padding: EdgeInsets.all(18),
                            decoration: index < rate
                                ? DesignConfig.outerCircularDecoration()
                                : DesignConfig.newInnerDecorationCircle(),
                            child: Icon(
                              Icons.star,
                              color: Colors.yellow[700],
                            ),
                          ),
                        );
                      })),
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Please share your opinion about Product",
                      textAlign: TextAlign.center,
                      style: Theme.of(context)
                          .textTheme
                          .headline6!
                          .merge(TextStyle(color: salonappcolor)),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 15, top: 25, right: 15),
                    decoration: DesignConfig.newInnerDecoration(15),
                    // decoration: DesignConfig.innerDecoration(15),
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.all(
                      10,
                    ),
                    child: TextFormField(
                      style: TextStyle(color: salonappcolor),
                      cursorColor: salonappcolor,
                      decoration: InputDecoration(
                        hintText: "Write your feedback..",
                        hintStyle: Theme.of(context).textTheme.subtitle2!.merge(
                            TextStyle(
                                color: salonlightfont, letterSpacing: 0.5)),
                        border: InputBorder.none,
                      ),
                      maxLines: null,
                      minLines: 10,
                      keyboardType: TextInputType.multiline,
                      controller: edtmsg,
                    ),
                  ),
                  SizedBox(height: 15),
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Container(
                            decoration: DesignConfig.outerDecoration(10),
                            padding: EdgeInsets.symmetric(
                                horizontal: 8, vertical: 10),
                            child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Container(
                                      padding: EdgeInsets.all(15),
                                      decoration: DesignConfig
                                          .outerCircularDecorationtest(),
                                      child: SvgPicture.asset(
                                          "assets/images/fullApps/pureBeauty/svgimg/addphoto.svg")),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Text(
                                    "Add your Photos",
                                    style: Theme.of(context)
                                        .textTheme
                                        .caption!
                                        .merge(TextStyle(color: salonappcolor)),
                                  ),
                                ]),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Container(),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 15),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      decoration: DesignConfig.outerDecorationService(
                          30, salonappcolor),
                      alignment: Alignment.center,
                      padding: EdgeInsets.symmetric(vertical: 20),
                      margin:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                      child: Text(
                        "Submit",
                        style: Theme.of(context).textTheme.headline6!.merge(
                            TextStyle(color: Colors.white, letterSpacing: 0.5)),
                      ),
                    ),
                  ),
                ]))
          ])),
    );
  }
}
