import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smartkit_pro/ui/snippets/helper/snippetsColors.dart';

class MenuBarsScreen extends StatefulWidget {
  const MenuBarsScreen({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return _MenuBarsScreenState();
  }
}

class _MenuBarsScreenState extends State<MenuBarsScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: ColorRes.bgColor,
      resizeToAvoidBottomInset: true,
      body: Container(
          margin:
              EdgeInsets.only(left: size.width * .05, right: size.width * .05),
          child: ListView(
            children: [
              SizedBox(
                height: size.height * .05,
              ),
              menuBar1(size),
              SizedBox(
                height: size.height * .04,
              ),
              menuBar2(size),
              SizedBox(
                height: size.height * .04,
              ),
              menuBar3(size),
              SizedBox(
                height: size.height * .04,
              ),
              menuBar4(size),
              SizedBox(
                height: size.height * .04,
              ),
              menuBar5(size),
              SizedBox(
                height: size.height * .04,
              ),
              menuBar6(size),
            ],
          )),
    );
  }

  Widget menuBar1(dynamic size) {
    return design(
      size: size,
      child: ListTile(
        leading: RadiantGradientMask(
            child: InkWell(
          splashColor: Colors.blue.withOpacity(0.5),
          focusColor: Colors.blue.withOpacity(0.5),
          hoverColor: Colors.blue.withOpacity(0.5),
          onTap: () {
            HapticFeedback.vibrate();
          },
          child: Icon(
            Icons.menu,
            size: 35,
            color: Theme.of(context).colorScheme.primary,
          ),
        )),
        trailing: Material(
            color: Colors.transparent,
            child: InkWell(
                splashColor: Colors.grey,
                onTap: () {
                  HapticFeedback.vibrate();
                },
                child: Icon(
                  Icons.search,
                  size: 30,
                  color: Theme.of(context).colorScheme.primary,
                ))),
      ),
    );
  }

  Widget menuBar2(dynamic size) {
    return design(
        size: size,
        child: ListTile(
          leading: InkWell(
            splashColor: Colors.blue.withOpacity(0.5),
            focusColor: Colors.blue.withOpacity(0.5),
            hoverColor: Colors.blue.withOpacity(0.5),
            onTap: () {
              HapticFeedback.vibrate();
            },
            child: Container(
              height: size.height * .05,
              width: size.width * .11,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(
                    color: ColorRes.labelColor,
                    width: 1,
                  )),
              child: RadiantGradientMask(
                  child: Icon(
                Icons.menu,
                size: 25,
                color: Theme.of(context).colorScheme.primary,
              )),
            ),
          ),
          trailing: Material(
              color: Colors.transparent,
              child: InkWell(
                  splashColor: Colors.grey,
                  onTap: () {
                    HapticFeedback.vibrate();
                  },
                  child: Icon(
                    Icons.search,
                    size: 30,
                    color: Theme.of(context).colorScheme.primary,
                  ))),
        ));
  }

  Widget menuBar3(dynamic size) {
    return design(
        size: size,
        child: ListTile(
          leading: InkWell(
            splashColor: Colors.blue.withOpacity(0.5),
            focusColor: Colors.blue.withOpacity(0.5),
            hoverColor: Colors.blue.withOpacity(0.5),
            onTap: () {
              HapticFeedback.vibrate();
            },
            child: Container(
                height: size.height * .05,
                width: size.width * .11,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Theme.of(context).colorScheme.primary,
                      Theme.of(context).colorScheme.primaryContainer
                    ],
                  ),
                ),
                child: Icon(
                  Icons.menu,
                  size: 25,
                  color: Colors.white,
                )),
          ),
          trailing: Material(
              color: Colors.transparent,
              child: InkWell(
                  splashColor: Colors.grey,
                  onTap: () {
                    HapticFeedback.vibrate();
                  },
                  child: Icon(
                    Icons.search,
                    size: 30,
                    color: Theme.of(context).colorScheme.primary,
                  ))),
        ));
  }

  Widget menuBar4(dynamic size) {
    return design(
        size: size,
        child: ListTile(
          contentPadding: EdgeInsets.only(left: 0),
          leading: InkWell(
            splashColor: Colors.blue.withOpacity(0.5),
            focusColor: Colors.blue.withOpacity(0.5),
            hoverColor: Colors.blue.withOpacity(0.5),
            onTap: () {
              HapticFeedback.vibrate();
            },
            child: Container(
                height: size.height * .05,
                width: size.width * .15,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20),
                      bottomRight: Radius.circular(20)),
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Theme.of(context).colorScheme.primary,
                      Theme.of(context).colorScheme.primaryContainer
                    ],
                  ),
                ),
                child: Icon(
                  Icons.menu,
                  size: 25,
                  color: Colors.white,
                )),
          ),
          trailing: Padding(
            padding: const EdgeInsets.only(right: 15.0),
            child: Material(
                color: Colors.transparent,
                child: InkWell(
                    splashColor: Colors.grey,
                    onTap: () {
                      HapticFeedback.vibrate();
                    },
                    child: Icon(
                      Icons.search,
                      size: 30,
                      color: Theme.of(context).colorScheme.primary,
                    ))),
          ),
        ));
  }

  Widget menuBar5(dynamic size) {
    return design(
      size: size,
      child: ListTile(
          leading: InkWell(
            splashColor: Colors.blue.withOpacity(0.5),
            focusColor: Colors.blue.withOpacity(0.5),
            hoverColor: Colors.blue.withOpacity(0.5),
            onTap: () {
              HapticFeedback.vibrate();
            },
            child: Container(
                height: size.height * .05,
                width: size.width * .12,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Theme.of(context).colorScheme.primary,
                      Theme.of(context).colorScheme.primaryContainer
                    ],
                  ),
                ),
                child: Icon(
                  Icons.menu,
                  size: 25,
                  color: Colors.white,
                )),
          ),
          trailing: Material(
              color: Colors.transparent,
              child: InkWell(
                  splashColor: Colors.grey,
                  onTap: () {
                    HapticFeedback.vibrate();
                  },
                  child: Icon(
                    Icons.search,
                    size: 30,
                    color: Theme.of(context).colorScheme.primary,
                  )))),
    );
  }

  Widget menuBar6(dynamic size) {
    return design(
        size: size,
        child: ListTile(
          leading: InkWell(
            splashColor: Colors.blue.withOpacity(0.5),
            focusColor: Colors.blue.withOpacity(0.5),
            hoverColor: Colors.blue.withOpacity(0.5),
            onTap: () {
              HapticFeedback.vibrate();
            },
            child: Container(
              height: size.height * .05,
              width: size.width * .11,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
                boxShadow: [
                  BoxShadow(
                    color: Theme.of(context)
                        .colorScheme
                        .primary
                        .withOpacity(0.2), //color of shadow
                    spreadRadius: 5, //spread radius
                    blurRadius: 7, // blur radius
                    offset: Offset(0, 2), // changes position of shadow
                    //first paramerter of offset is left-right
                    //second parameter is top to down
                  ),
                ],
              ),
              child: RadiantGradientMask(
                  child: Icon(
                Icons.menu,
                size: 25,
                color: Colors.white,
              )),
            ),
          ),
          trailing: Material(
            color: Colors.transparent,
            child: InkWell(
              splashColor: Colors.grey,
              onTap: () {
                HapticFeedback.vibrate();
              },
              child: Icon(
                Icons.search,
                size: 30,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
          ),
        ));
  }

  Widget design({required Widget child, dynamic size}) {
    return Stack(
      children: [
        Container(
            height: size.height * .1,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),
            child: child),
        Container(
          margin: EdgeInsets.only(left: size.width * .25),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(5),
                bottomRight: Radius.circular(5)),
            color: ColorRes.bgColor,
          ),
          width: size.width * .4,
          height: size.height * .022,
        ),
      ],
    );
  }
}

class RadiantGradientMask extends StatelessWidget {
  const RadiantGradientMask({required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (Rect bounds) {
        return RadialGradient(
          center: Alignment.bottomRight,
          radius: 0.5,
          colors: <Color>[
            Theme.of(context).colorScheme.primary,
            Theme.of(context).colorScheme.primaryContainer.withOpacity(0.7)
          ],
          tileMode: TileMode.mirror,
        ).createShader(bounds);
      },
      child: child,
    );
  }
}
