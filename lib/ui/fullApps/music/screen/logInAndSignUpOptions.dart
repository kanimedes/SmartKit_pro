import 'package:flutter/material.dart';
import 'package:smartkit_pro/ui/fullApps/music/helper/constanat.dart';
import 'package:smartkit_pro/ui/fullApps/music/screen/login.dart';
import 'package:smartkit_pro/ui/fullApps/music/screen/signUp.dart';
import 'package:smartkit_pro/ui/fullApps/music/widgets/customButtons.dart';
import 'package:smartkit_pro/ui/fullApps/music/helper/string.dart';
import 'package:smartkit_pro/ui/fullApps/music/helper/colors.dart';

class LogInOptions extends StatelessWidget {
  const LogInOptions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: backgroundColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.39,
              child: Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.10),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      "${imagePath}music_banner_girl.jpg",
                    )),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsetsDirectional.fromSTEB(20.0, 10.0, 20.0, 0),
              child: Text(
                findTheBestMusic,
                maxLines: 2,
                textAlign: TextAlign.center,
                softWrap: true,
                overflow: TextOverflow.clip,
                style: TextStyle(
                    fontFamily: 'SFPro',
                    color: black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.none),
              ),
            ),
            SimpleImageButton(
              image: "${imagePath}apple_logo.png",
              width: MediaQuery.of(context).size.width * 0.8,
              height: MediaQuery.of(context).size.width * 0.13,
              borderRadius: 10,
              backgroundColor: backgroundColor,
              buttonText: signInWithApple,
              textColor: black,
              textFontSize: 16,
              borderColor: black,
              borderWidth: 1,
              onButtonPressed: () {},
            ),
            SimpleImageButton(
              image: "${imagePath}google_logo.png",
              width: MediaQuery.of(context).size.width * 0.8,
              height: MediaQuery.of(context).size.width * 0.13,
              borderRadius: 10,
              backgroundColor: backgroundColor,
              buttonText: signInWithGoogle,
              textColor: black,
              textFontSize: 16,
              borderWidth: 1,
              borderColor: black,
              onButtonPressed: () {},
            ),
            Row(
              children: const [
                Expanded(
                  child: Padding(
                    padding: EdgeInsetsDirectional.only(start: 15.0),
                    child: Divider(
                        indent: 20.0,
                        endIndent: 5.0,
                        thickness: 1,
                        color: Colors.black45),
                  ),
                ),
                Text(orText,
                    style: TextStyle(
                        decoration: TextDecoration.none,
                        fontSize: 12,
                        color: black)),
                Expanded(
                  child: Padding(
                    padding: EdgeInsetsDirectional.only(end: 15.0),
                    child: Divider(
                        indent: 5.0,
                        endIndent: 20.0,
                        thickness: 1,
                        color: Colors.black45),
                  ),
                ),
              ],
            ),
            SimpleButton(
              width: MediaQuery.of(context).size.width * 0.8,
              height: MediaQuery.of(context).size.width * 0.13,
              borderRadius: 10,
              backgroundColor: primary,
              buttonText: signUp,
              textColor: white,
              textFontSize: 16,
              onButtonPressed: () {
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (_) => SignUp()));
              },
            ),
            SimpleButton(
              width: MediaQuery.of(context).size.width * 0.8,
              height: MediaQuery.of(context).size.width * 0.13,
              borderRadius: 10,
              backgroundColor: backgroundColor,
              buttonText: logIn,
              textColor: black,
              textFontSize: 16,
              borderWidth: 0,
              borderColor: backgroundColor,
              onButtonPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (_) => LogIn()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
