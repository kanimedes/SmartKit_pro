import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../helper/ColorRes.dart';
import '../helper/DoctorAnimation.dart';
import '../helper/StringRes.dart';
import '../helper/doctore_DesignConfig.dart';
import '../home/doctor_HomePageScreen.dart';
import 'doctor_writeReview.dart';

class DoctorMessageEnd extends StatefulWidget {
  final String? title, image, callType;
  const DoctorMessageEnd({Key? key, this.title, this.image, this.callType})
      : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return DoctorMessageEndState();
  }
}

class DoctorMessageEndState extends State<DoctorMessageEnd>
    with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: ColorRes.white,
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: Column(
          children: [
            SizedBox(
              height: size.height * .3,
            ),
            DoctorAnimation(
                delay: 100,
                child: Text(
                  "${widget.callType} Ended",
                  style: TextStyle(
                      color: ColorRes.fontColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                )),
            SizedBox(
              height: size.height * .01,
            ),
            DoctorAnimation(
                delay: 200,
                child: Text(
                  "30:00 Minutes",
                  style: TextStyle(
                      color: ColorRes.blue,
                      fontSize: 18,
                      fontWeight: FontWeight.w600),
                )),
            SizedBox(
              height: size.height * .01,
            ),
            DoctorAnimation(
                delay: 300,
                child: Text(
                  "Recording has been saved in history",
                  style: TextStyle(
                      color: ColorRes.fontColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w600),
                )),
            SizedBox(
              height: size.height * .02,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(100.0),
              child: Image.asset(
                widget.image!,
                height: size.height * .2,
                width: size.width * .4,
                fit: BoxFit.fill,
              ),
            ),
            SizedBox(
              height: size.height * .02,
            ),
            DoctorAnimation(
                delay: 400,
                child: Text(
                  widget.title!,
                  style: TextStyle(
                      color: ColorRes.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                )),
            SizedBox(
              height: size.height * .03,
            ),
            DoctorAnimation(
                delay: 500,
                child: DoctorDesignConfig.Button(
                    onpress: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) => DoctorWriteReview(
                              image: widget.image, title: widget.title),
                        ),
                      );
                    },
                    name: DoctorStringRes.writeReview,
                    foreground: ColorRes.blue,
                    TextColor: ColorRes.white)),
            SizedBox(
              height: size.height * .02,
            ),
            DoctorAnimation(
                delay: 500,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                            builder: (context) => DoctorHomeScreen()),
                        (Route<dynamic> route) => false);
                  },
                  child: Text(
                    DoctorStringRes.goToDash,
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: ColorRes.blue,
                        fontSize: 16),
                  ),
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(330, 50),
                    primary: ColorRes.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                        side: BorderSide(
                          width: 2.0,
                          color: ColorRes.blue,
                        )),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
