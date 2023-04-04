import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:smartkit_pro/ui/snippets/pagination/actionButton.dart';
import 'package:smartkit_pro/ui/snippets/pagination/boxShadow.dart';

Color mainColor = Color(0xFFF2F3F7);
Color textColor = Color(0xffc5c2ce);
late Color activeTextColor = Color(0xFF3180FF);
int currentIndex = 0;
String imagePath = "assets/images/pagination/";

void main() {
  runApp(
    const PaginationScreen(),
  );
}

class PaginationScreen extends StatefulWidget {
  const PaginationScreen({Key? key}) : super(key: key);

  @override
  State<PaginationScreen> createState() => _PaginationScreenState();
}

class _PaginationScreenState extends State<PaginationScreen> {
  PageController controller =
      PageController(viewportFraction: 1, keepPage: true);
  var myController = TextEditingController(text: "$currentIndex");

  @override
  void initState() {
    currentIndex = 0;
  }

  void onTap(int index) {
    setState(() {
      currentIndex = index;
      int str = index + 1;
      myController.text = "$str";
      HapticFeedback.heavyImpact();
      HapticFeedback.vibrate();
    });
    controller.jumpToPage(index);

    //
    // controller.animateToPage(index,
    //     curve: Curves.fastOutSlowIn,
    //     duration: Duration(
    //         milliseconds:
    //         100)); // for animated jump. Requires a curve and a duration
  }

  void onNextTap(int currentIndex) {
    if (currentIndex < 4) {
      "${currentIndex++}";
      onTap(currentIndex);
    }
  }

  void onBackTap(int currentIndex) {
    if (currentIndex > 0) {
      "${currentIndex--}";
      onTap(currentIndex);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: mainColor,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(30))),
                margin: EdgeInsetsDirectional.only(top: 60),
                height: MediaQuery.of(context).size.height / 3,
                width: MediaQuery.of(context).size.width,
                child: PageView.builder(
                  controller: controller,
                  onPageChanged: onTap,
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsetsDirectional.only(start: 10, end: 10),
                      child: Image.asset(
                        "${imagePath}pagination$index.jpg",
                      ),
                    );
                  },
                ),
              ),
              // 1st Pagination With Numbers
              Container(
                padding: EdgeInsetsDirectional.only(
                    top: 10, bottom: 10, start: 15, end: 15),
                height: 60,
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsetsDirectional.only(start: 10, end: 10, top: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7),
                  color: mainColor,
                  boxShadow: boxShadow(),
                ),
                child: Row(
                  children: [
                    ActionButton(
                      btnHeight: 15,
                      btnWidth: 15,
                      voidCallBack: () {
                        onTap(0);
                      },
                      svgPath: '${imagePath}ic_first.svg',
                    ),
                    Spacer(),
                    ActionButton(
                      btnHeight: 15,
                      btnWidth: 15,
                      voidCallBack: () {
                        onBackTap(currentIndex);
                      },
                      svgPath: '${imagePath}ic_previous.svg',
                    ),
                    Spacer(),
                    Pagination1Widget(
                      text: '1',
                      voidCallBack: () {
                        onTap(0);
                      },
                      currentIndex: currentIndex,
                      count: 0,
                    ),
                    Spacer(),
                    Pagination1Widget(
                      text: '2',
                      voidCallBack: () {
                        onTap(1);
                      },
                      currentIndex: currentIndex,
                      count: 1,
                    ),
                    Spacer(),
                    Pagination1Widget(
                      text: '3',
                      voidCallBack: () {
                        onTap(2);
                      },
                      currentIndex: currentIndex,
                      count: 2,
                    ),
                    Spacer(),
                    Pagination1Widget(
                      text: '4',
                      voidCallBack: () {
                        onTap(3);
                      },
                      currentIndex: currentIndex,
                      count: 3,
                    ),
                    Spacer(),
                    Pagination1Widget(
                      text: '5',
                      voidCallBack: () {
                        onTap(4);
                      },
                      currentIndex: currentIndex,
                      count: 4,
                    ),
                    Spacer(),
                    ActionButton(
                      btnHeight: 15,
                      btnWidth: 15,
                      voidCallBack: () {
                        onNextTap(currentIndex);
                      },
                      svgPath: '${imagePath}ic_next.svg',
                    ),
                    Spacer(),
                    ActionButton(
                      btnHeight: 15,
                      btnWidth: 15,
                      voidCallBack: () {
                        onTap(4);
                      },
                      svgPath: '${imagePath}ic_last.svg',
                    )
                  ],
                ),
              ),
              // 2nd Pagination With bullets
              Container(
                padding: EdgeInsetsDirectional.only(
                    top: 10, bottom: 10, start: 15, end: 15),
                height: 60,
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsetsDirectional.only(start: 10, end: 10, top: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7),
                  color: mainColor,
                  boxShadow: boxShadow(),
                ),
                child: Row(
                  children: [
                    ActionButton(
                      btnHeight: 15,
                      btnWidth: 15,
                      voidCallBack: () {
                        onTap(0);
                      },
                      svgPath: '${imagePath}ic_first.svg',
                    ),
                    Spacer(),
                    ActionButton(
                      btnHeight: 15,
                      btnWidth: 15,
                      voidCallBack: () {
                        onBackTap(currentIndex);
                      },
                      svgPath: '${imagePath}ic_previous.svg',
                    ),
                    Spacer(),
                    Pagination2(
                      text: '1',
                      voidCallBack: () {
                        onTap(0);
                      },
                      currentIndex: currentIndex,
                      count: 0,
                    ),
                    Spacer(),
                    Pagination2(
                      text: '2',
                      voidCallBack: () {
                        onTap(1);
                      },
                      currentIndex: currentIndex,
                      count: 1,
                    ),
                    Spacer(),
                    Pagination2(
                      text: '3',
                      voidCallBack: () {
                        onTap(2);
                      },
                      currentIndex: currentIndex,
                      count: 2,
                    ),
                    Spacer(),
                    Pagination2(
                      text: '4',
                      voidCallBack: () {
                        onTap(3);
                      },
                      currentIndex: currentIndex,
                      count: 3,
                    ),
                    Spacer(),
                    Pagination2(
                      text: '5',
                      voidCallBack: () {
                        onTap(4);
                      },
                      currentIndex: currentIndex,
                      count: 4,
                    ),
                    Spacer(),
                    ActionButton(
                      btnHeight: 15,
                      btnWidth: 15,
                      voidCallBack: () {
                        onNextTap(currentIndex);
                      },
                      svgPath: '${imagePath}ic_next.svg',
                    ),
                    Spacer(),
                    ActionButton(
                      btnHeight: 15,
                      btnWidth: 15,
                      voidCallBack: () {
                        onTap(4);
                      },
                      svgPath: '${imagePath}ic_last.svg',
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsetsDirectional.only(top: 20, start: 10, end: 10),
                child: Row(
                  children: [
                    // Pagination 3 With widget 2 next and previous button and in middle current page text
                    Container(
                      height: 60,
                      width: 60,
                      child: Center(
                          child: ActionButton(
                        btnHeight: 20,
                        btnWidth: 20,
                        svgPath: "${imagePath}ic_previous.svg",
                        voidCallBack: () {
                          onBackTap(currentIndex);
                        },
                      )),
                      decoration: BoxDecoration(
                          color: mainColor,
                          boxShadow: boxShadow(),
                          borderRadius: BorderRadius.all(Radius.circular(50))),
                    ),
                    Spacer(),
                    Center(
                      child: Text(
                        "0${currentIndex + 1}",
                        style: TextStyle(
                            color: activeTextColor,
                            fontSize: 20,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    Spacer(),
                    // Pagination 4 With widget only current page number and total number of page
                    Container(
                      height: 60,
                      width: 60,
                      child: Center(
                          child: ActionButton(
                        btnHeight: 20,
                        btnWidth: 20,
                        svgPath: "${imagePath}ic_next.svg",
                        voidCallBack: () {
                          onNextTap(currentIndex);
                        },
                      )),
                      decoration: BoxDecoration(
                          color: mainColor,
                          boxShadow: boxShadow(),
                          borderRadius: BorderRadius.all(Radius.circular(50))),
                    ),
                    Spacer(),
                    Center(
                      child: Container(
                          padding: EdgeInsetsDirectional.all(20),
                          height: 70,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(7),
                            color: mainColor,
                            boxShadow: boxShadow(),
                          ),
                          child: Row(
                            children: [
                              Text(
                                "0${currentIndex + 1}",
                                style: TextStyle(
                                    color: activeTextColor,
                                    fontSize: 25,
                                    fontWeight: FontWeight.w500),
                              ),
                              VerticalDivider(
                                width: 30,
                                color: textColor,
                                thickness: 2.0,
                              ),
                              Text("5")
                            ],
                          )),
                    ),
                  ],
                ),
              ),
              Container(
                height: 150,
                margin: EdgeInsetsDirectional.only(top: 20, start: 10, end: 10),
                padding: EdgeInsetsDirectional.all(40),
                decoration: BoxDecoration(
                    color: mainColor,
                    boxShadow: boxShadow(),
                    borderRadius: BorderRadius.all(Radius.circular(30))),
                child: Center(
                    child: Row(
                  children: [
                    Container(
                        padding: EdgeInsetsDirectional.only(end: 20),
                        child: Text("Go to page")),
                    Expanded(
                      child: Container(
                        margin: EdgeInsetsDirectional.only(end: 20),
                        child: TextField(
                          onChanged: (String newString) {
                            if (int.parse(newString.toString()) > 5) {
                              myController.text = "5";
                            } else if (int.parse(newString.toString()) < 0) {
                              myController.text = "0";
                            } else {
                              myController.text = newString;
                            }
                          },
                          textAlign: TextAlign.center,
                          controller: myController,
                          style: TextStyle(color: activeTextColor),
                          autocorrect: true,
                          keyboardType: TextInputType.numberWithOptions(
                              signed: false, decimal: false),
                          decoration: InputDecoration(
                            hintTextDirection: Directionality.of(context),
                            hintStyle: TextStyle(color: Colors.grey),
                            filled: true,
                            fillColor: mainColor,
                            enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(50)),
                              borderSide: BorderSide(color: activeTextColor),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(50)),
                              borderSide: BorderSide(color: activeTextColor),
                            ),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        if (int.parse(myController.text.toString()) > 5) {
                          onTap(4);
                        } else if (int.parse(myController.text.toString()) <
                            0) {
                          onTap(0);
                        } else {
                          onTap((int.parse(myController.text.toString()) - 1));
                        }
                      },
                      child: Container(
                        padding: EdgeInsetsDirectional.all(20),
                        decoration: BoxDecoration(
                            color: activeTextColor,
                            borderRadius:
                                BorderRadius.all(Radius.circular(120))),
                        child: Text(
                          "Go to page",
                          style: TextStyle(color: mainColor),
                        ),
                      ),
                    )
                  ],
                )),
              )
            ],
          ),
        ));
  }
}

// 1st Pagination With Numbers
class Pagination1Widget extends StatelessWidget {
  String text;
  VoidCallback voidCallBack;
  int currentIndex;
  int count;

  Pagination1Widget(
      {Key? key,
      required this.text,
      required this.voidCallBack,
      required this.currentIndex,
      required this.count})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: voidCallBack,
      child: Text(
        text,
        style: TextStyle(
            color: (currentIndex == count) ? activeTextColor : textColor,
            fontWeight: FontWeight.w600),
      ),
    );
  }
}

//2nd Pagination With bullets
class Pagination2 extends StatelessWidget {
  String text;
  VoidCallback voidCallBack;
  int currentIndex;
  int count;

  Pagination2(
      {Key? key,
      required this.text,
      required this.voidCallBack,
      required this.currentIndex,
      required this.count})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: voidCallBack,
        child: Container(
          height: 8,
          width: 8,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(50)),
            color: (currentIndex == count) ? activeTextColor : textColor,
          ),
        ));
  }
}
