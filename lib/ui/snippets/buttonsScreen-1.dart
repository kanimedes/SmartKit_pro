import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smartkit_pro/ui/snippets/helper/snippetsColors.dart';

class ButtonsScreen_1 extends StatefulWidget {
  const ButtonsScreen_1({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return _ButtonsScreen_1State();
  }
}

class _ButtonsScreen_1State extends State<ButtonsScreen_1> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: ColorRes.bgColor,
      resizeToAvoidBottomInset: true,
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: ListView(
          shrinkWrap: true,
          children: [
            SizedBox(
              height: size.height * .15,
            ),
            buttonRow1(size),
            SizedBox(
              height: size.height * .05,
            ),
            buttonRow2(size),
            SizedBox(
              height: size.height * .05,
            ),
            buttonRow3(size),
            SizedBox(
              height: size.height * .05,
            ),
            buttonRow4(size),
            SizedBox(
              height: size.height * .05,
            ),
            buttonRow5(size),
            SizedBox(
              height: size.height * .05,
            ),
            buttonRow6(size)
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
            setState(() {
              HapticFeedback.vibrate();
            });
          },
          child: Text(
            "Get Started",
            style: TextStyle(
                fontWeight: FontWeight.w600, color: Colors.white, fontSize: 18),
          ),
          style: ElevatedButton.styleFrom(
            minimumSize: const Size(170, 55),
            //alignment: Alignment.center,
            primary: Color(0xff4b84f5),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(7.0),
            ),
          ),
        ),
        Container(
          height: size.height * .065,
          width: size.width * .42,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(7),
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: const [Color(0xff7362fc), Color(0xffcd53ff)],
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
              primary: Colors.transparent,
              //minimumSize:  Size(150, 50),
            ),
          ),
        ),
      ],
    );
  }

  Widget buttonRow2(dynamic size) {
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
            minimumSize: const Size(170, 55),
            //alignment: Alignment.center,
            primary: Color(0xffeb4060),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
          ),
        ),
        Container(
          height: size.height * .065,
          width: size.width * .42,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: const [Color(0xff2f8f93), Color(0xff4de1b1)],
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
              primary: Colors.transparent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
              //minimumSize:  Size(150, 50),
            ),
          ),
        ),
      ],
    );
  }

  Widget buttonRow3(dynamic size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        OutlinedButton(
          child: Text(
            'Get Started',
            style: const TextStyle(fontSize: 18),
          ),
          style: OutlinedButton.styleFrom(
            minimumSize: const Size(170, 55),
            primary: Color(0xffe6b2f4),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(7.0),
            ),
            side: BorderSide(color: Color(0xffe6b2f4), width: 1),
          ),
          onPressed: () {
            HapticFeedback.vibrate();
          },
        ),
        SizedBox(
            height: size.height * .065,
            width: size.width * .42,
            child: MyOutlinedButton(
              style: OutlinedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(7.0),
                ),
              ),
              onPressed: () {
                HapticFeedback.vibrate();
              },
              gradient: LinearGradient(
                  colors: const [Color(0xff7a76b1), Color(0xfff2edd9)]),
              child: GradientText(
                'Get Started',
                style: const TextStyle(fontSize: 18),
                gradient: LinearGradient(
                    colors: const [Color(0xff7a76b1), Color(0xfff2edd9)]),
              ),
            )),
      ],
    );
  }

  Widget buttonRow4(dynamic size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          height: size.height * .065,
          width: size.width * .42,
          decoration: BoxDecoration(
            color: Color(0xfffacc66),
            boxShadow: [
              BoxShadow(
                color: Color(0xfffacc66).withOpacity(0.3), //color of shadow
                spreadRadius: 3, //spread radius
                blurRadius: 5, // blur radius
                offset: const Offset(5, 5), // changes position of shadow
              )
            ],
          ),
          child: InkWell(
              splashColor: Color(0xfffacc66).withOpacity(0.5),
              focusColor: Colors.grey,
              hoverColor: Colors.grey,
              onTap: () {
                HapticFeedback.vibrate();
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Get Started",
                    style: TextStyle(color: Colors.black, fontSize: 18),
                  ),
                  SizedBox(
                    width: size.width * .02,
                  ),
                  Icon(Icons.arrow_forward_outlined)
                ],
              )),
        ),
        InkWell(
          splashColor: Colors.grey,
          focusColor: Colors.grey,
          hoverColor: Colors.grey,
          onTap: () {
            HapticFeedback.vibrate();
          },
          child: Container(
              height: size.height * .065,
              width: size.width * .42,
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Shop now",
                    style: TextStyle(color: Colors.black, fontSize: 18),
                  ),
                  SizedBox(
                    width: size.width * .02,
                  ),
                  Icon(
                    Icons.add_shopping_cart,
                    size: 18,
                  )
                ],
              )),
        ),
      ],
    );
  }

  Widget buttonRow5(dynamic size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        InkWell(
          splashColor: Color(0xff339e68),
          onTap: () {
            HapticFeedback.vibrate();
          },
          child: Container(
              height: size.height * .065,
              width: size.width * .42,
              decoration: BoxDecoration(
                  color: Color(0xFF44CC74),
                  borderRadius: BorderRadius.circular(10)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Get Started",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  SizedBox(
                    width: size.width * .02,
                  ),
                  CircleAvatar(
                      radius: 15,
                      backgroundColor: Color(0xff339e68),
                      child: Icon(
                        Icons.arrow_forward_outlined,
                        size: 20,
                        color: Colors.white,
                      ))
                ],
              )),
        ),
        ElevatedButton.icon(
          onPressed: () {
            HapticFeedback.vibrate();
          },
          style: ElevatedButton.styleFrom(
            minimumSize: const Size(170, 55),
            primary: Color(0xff6c63fd),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
          label: Text(
            "Add to cart",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontWeight: FontWeight.w600, color: Colors.white, fontSize: 16),
          ),
          icon: Container(
            height: size.height * .05,
            width: size.width * .1,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Color(0xff584ff7),
            ),
            child: Icon(
              Icons.add_shopping_cart,
              size: 18,
            ),
          ),
        ),
      ],
    );
  }

  Widget buttonRow6(dynamic size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        InkWell(
          splashColor: Color(0xff41b6f1).withOpacity(0.2),
          onTap: () {
            HapticFeedback.vibrate();
          },
          child: Container(
              height: size.height * .065,
              width: size.width * .42,
              decoration: BoxDecoration(
                  color: Color(0xff41b6f1),
                  borderRadius: BorderRadius.circular(10)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Download App",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  SizedBox(
                    width: size.width * .02,
                  ),
                  Icon(
                    Icons.download_sharp,
                    size: 20,
                    color: Colors.white,
                  )
                ],
              )),
        ),
        InkWell(
          splashColor: Color(0xffa2e005),
          onTap: () {
            HapticFeedback.vibrate();
          },
          child: Container(
              height: size.height * .065,
              width: size.width * .42,
              decoration: BoxDecoration(
                color: Color(0xFF44CC74),
                borderRadius: BorderRadius.circular(10),
                gradient: LinearGradient(
                  colors: [
                    Color(0xFFdefe81),
                    Color(0xFFdefe81).withOpacity(0.8),
                  ],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: size.width * .005,
                  ),
                  Text(
                    "Download App",
                    style: TextStyle(color: Colors.black, fontSize: 16),
                  ),
                  Container(
                      height: size.height * .1,
                      width: size.width * .12,
                      decoration: BoxDecoration(
                        color: Color(0xffa2e005),
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(10),
                            bottomRight: Radius.circular(10)),
                      ),
                      child: Icon(
                        Icons.download_sharp,
                        size: 20,
                        color: Colors.black,
                      ))
                ],
              )),
        ),
      ],
    );
  }
}

class GradientText extends StatelessWidget {
  const GradientText(
    this.text, {
    required this.gradient,
    this.style,
  });

  final String text;
  final TextStyle? style;
  final Gradient gradient;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      blendMode: BlendMode.srcIn,
      shaderCallback: (bounds) => gradient.createShader(
        Rect.fromLTWH(0, 0, bounds.width, bounds.height),
      ),
      child: Text(text, style: style),
    );
  }
}

class MyOutlinedButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Widget child;
  final ButtonStyle? style;
  final Gradient? gradient;
  final double thickness;

  const MyOutlinedButton({
    Key? key,
    required this.onPressed,
    required this.child,
    this.style,
    this.gradient,
    this.thickness = 2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
          gradient: gradient, borderRadius: BorderRadius.circular(5)),
      child: Container(
        color: ColorRes.bgColor,
        margin: EdgeInsets.all(thickness),
        child: OutlinedButton(
          onPressed: onPressed,
          style: style,
          child: child,
        ),
      ),
    );
  }
}
