import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smartkit_pro/ui/snippets/helper/snippetsColors.dart';
import 'package:smartkit_pro/ui/snippets/helper/thirdButton.dart';

import 'helper/gradientShadow.dart';

class ButtonsScreen_2 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ButtonsScreen_2State();
  }
}

class _ButtonsScreen_2State extends State<ButtonsScreen_2> {
  bool play1 = false, play2 = false, play3 = false;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: ListView(
          children: [
            SizedBox(
              height: size.height * .15,
            ),
            buttonRow1(size),
            SizedBox(
              height: size.height * .04,
            ),
            buttonRow2(size),
            SizedBox(
              height: size.height * .04,
            ),
            buttonRow3(size),
            SizedBox(
              height: size.height * .04,
            ),
            buttonRow4(size),
            SizedBox(
              height: size.height * .04,
            ),
            buttonRow5(size),
            SizedBox(
              height: size.height * .04,
            ),
            buttonRow6(size),
          ],
        ),
      ),
    );
  }

  Widget buttonRow1(dynamic size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ElevatedButton(
          onPressed: () {
            HapticFeedback.vibrate();
          },
          child: Text(
            "Get Started",
            style: TextStyle(
                fontWeight: FontWeight.w600, color: Colors.white, fontSize: 18),
          ),
          style: ElevatedButton.styleFrom(
            minimumSize: const Size(170, 60),
            //alignment: Alignment.center,
            primary: Color(0xff6c63fc),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(7.0),
            ),
          ),
        ),
        TextButton.icon(
          onPressed: () {
            setState(() {
              play1 = !play1;
              HapticFeedback.vibrate();
            });
          },
          icon: CircleAvatar(
            radius: 17,
            backgroundColor: Color(0xffe9eaf0),
            child: Icon(
              play1 ? Icons.pause : Icons.play_arrow_rounded,
              color: Color(0xff6c63fc),
              size: 17,
            ),
          ),
          label: Text(
            "Watch Demo",
            style: TextStyle(color: Color(0xffa8aaad), fontSize: 18),
          ),
        )
      ],
    );
  }

  Widget buttonRow2(dynamic size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        /*2c8e22*/
        Container(
          height: size.height * .07,
          width: size.width * .44,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(7.0),
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: const [
                Color(0xff41c83c),
                Color(0xff2c8e22),
              ],
            ),
          ),
          child: ElevatedButton(
            onPressed: () {
              HapticFeedback.vibrate();
            },
            child: Text(
              "Get Started",
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                  fontSize: 18),
            ),
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(170, 60),
              //alignment: Alignment.center,
              primary: Colors.transparent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(7.0),
              ),
            ),
          ),
        ),
        OutlinedButton.icon(
          onPressed: () {
            setState(() {
              play2 = !play2;
              HapticFeedback.vibrate();
            });
          },
          style: OutlinedButton.styleFrom(padding: EdgeInsets.all(16)),
          icon: Icon(
            play2 ? Icons.pause : Icons.play_circle_outline,
            color: Colors.black87,
            size: 22,
          ),
          label: Text(
            "Watch Demo",
            style: TextStyle(color: Colors.black87, fontSize: 18),
          ),
        )
      ],
    );
  }

  Widget buttonRow3(dynamic size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        InkWell(
          splashColor: Colors.grey,
          focusColor: Colors.grey,
          hoverColor: Colors.grey,
          onTap: () {
            HapticFeedback.vibrate();
          },
          child: Container(
              height: size.height * .07,
              width: size.width * .5,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30.0),
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: const [
                    Color(0xfff57f22),
                    Color(0xffeb430b),
                  ],
                ),
              ),
              child: Wrap(
                spacing: 10,
                alignment: WrapAlignment.center,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: const [
                  Text(
                    "Get Started",
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                        fontSize: 18),
                  ),
                  Icon(
                    Icons.arrow_right_alt,
                    color: Colors.white,
                  )
                ],
              )),
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              play3 = !play3;
              HapticFeedback.vibrate();
            });
          },
          child: Container(
            height: size.height * .065,
            width: size.width * .35,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: ColorRes.labelColor,
                  width: 1,
                )),
            child: Icon(
              play3 ? Icons.pause : Icons.play_arrow_rounded,
              color: Color(0xfff4601e),
              size: 26,
            ),
          ),
        ),
      ],
    );
  }

  Widget buttonRow4(dynamic size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
            height: size.height * .07,
            width: size.width * .46,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(0.0),
            ),
            child: Button3D(
              style: StyleOf3dButton(
                backColor: Colors.black,
                topColor: Color(0xffface4e),
                borderRadius: BorderRadius.circular(0),
              ),
              height: size.height * .07,
              width: size.width * .5,
              onPressed: () {
                HapticFeedback.vibrate();
              },
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Text(
                  "Get Started",
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(
                  width: size.width * .015,
                ),
                Icon(
                  Icons.arrow_right_alt,
                  color: Colors.black87,
                  size: 25,
                )
              ]),
            )),
        Container(
            height: size.height * .07,
            width: size.width * .35,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(0.0),
            ),
            child: Button3D(
              style: StyleOf3dButton(
                backColor: Colors.black,
                topColor: Color(0xFFE9EAEF),
                borderRadius: BorderRadius.circular(0),
              ),
              height: size.height * .07,
              width: size.width * .5,
              onPressed: () {
                HapticFeedback.vibrate();
              },
              child: Text(
                "Try for free",
                style: TextStyle(fontSize: 18),
              ),
            )),
      ],
    );
  }

  Widget buttonRow5(dynamic size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        InkWell(
            splashColor: Colors.grey,
            focusColor: Colors.grey,
            hoverColor: Colors.grey,
            onTap: () {
              HapticFeedback.vibrate();
            },
            child: Container(
                height: size.height * .07,
                width: size.width * .5,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: const [
                      Color(0xff5b9dfb),
                      Color(0xff2138fe),
                    ],
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: size.width * .02,
                    ),
                    Container(
                      height: size.height * .05,
                      width: size.width * .1,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white12,
                      ),
                      child: Icon(
                        Icons.add_shopping_cart,
                        size: 18,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      width: size.width * .04,
                    ),
                    Text(
                      "Add to cart",
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                          fontSize: 18),
                    ),
                  ],
                ))),
        ElevatedButton(
          onPressed: () {
            HapticFeedback.vibrate();
          },
          style: ElevatedButton.styleFrom(
            primary: Color(0xFFE9EAEF),
            minimumSize: const Size(130, 55),
          ),
          child: Text(
            "Know more",
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.normal,
                fontSize: 18),
          ),
        )
      ],
    );
  }

  Widget buttonRow6(dynamic size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        InkWell(
            splashColor: Colors.grey,
            focusColor: Colors.grey,
            hoverColor: Colors.grey,
            onTap: () {
              HapticFeedback.vibrate();
            },
            child: Container(
                height: size.height * .07,
                width: size.width * .5,
                alignment: Alignment.center,
                decoration: GradientShadow(
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: const [
                      BoxShadow(
                        offset: Offset(0, 17),
                        blurRadius: 25,
                      ),
                    ],
                    gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: const [Color(0xff7762ff), Color(0xffcc6cd9)],
                    )),
                child: Wrap(
                  spacing: 10,
                  alignment: WrapAlignment.center,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: const [
                    Text(
                      "Get Started",
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                          fontSize: 18),
                    ),
                    Icon(
                      Icons.arrow_right_alt,
                      color: Colors.white,
                    )
                  ],
                ))),
        OutlinedButton(
          onPressed: () {
            setState(() {
              play1 = !play1;
              HapticFeedback.vibrate();
            });
          },
          style: OutlinedButton.styleFrom(
            minimumSize: Size(140, 60),
            padding: EdgeInsets.all(16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
          ),
          child: Text(
            "Try for free",
            style: TextStyle(color: Colors.black87, fontSize: 18),
          ),
        )
      ],
    );
  }
}
