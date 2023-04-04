import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smartkit_pro/ui/animatedScreens/addToCartAnimation/ui/widget/cardStackWidget.dart';
import 'package:smartkit_pro/ui/animatedScreens/addToCartAnimation/ui/widget/dragTargetWidget.dart';

import '../helper/addTOCartData.dart';

class AddToCartAnimationHome extends StatefulWidget {
  const AddToCartAnimationHome({Key? key}) : super(key: key);

  @override
  State<AddToCartAnimationHome> createState() => AddToCartAnimationHomeState();
}

class AddToCartAnimationHomeState extends State<AddToCartAnimationHome>
    with TickerProviderStateMixin {
  // ignore: prefer_typing_uninitialized_variables
  var _dropDownValue;
  late AnimationController bottomButtonController =
      AnimationController(vsync: this, duration: Duration(milliseconds: 500))
        ..repeat(reverse: true);
  late Animation<Offset> bottomButtonAnimation =
      Tween<Offset>(begin: Offset.zero, end: Offset(0.0, -0.3)).animate(
          CurvedAnimation(
              parent: bottomButtonController, curve: Curves.linear));
  @override
  void dispose() {
    bottomButtonController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (_) => AddToCartData(),
          ),
        ],
        child: Scaffold(
          resizeToAvoidBottomInset: true,
          appBar: AppBar(
            backgroundColor: Colors.white,
            centerTitle: true,
            leading: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.black),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            actions: const [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(
                  Icons.filter_alt_rounded,
                  color: Colors.black,
                ),
              )
            ],
            title: Text(
              "Add To Cart",
              style: TextStyle(color: Colors.black),
            ),
          ),
          bottomNavigationBar: Container(
            height: MediaQuery.of(context).size.height * .1,
            padding: EdgeInsets.only(top: 20),
            child: Column(
              children: [
                SlideTransition(
                    position: bottomButtonAnimation,
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.arrow_upward_sharp,
                        color: Colors.blue,
                        size: 30,
                      ),
                    )),
                Text(
                  "Long press then drag the card add food to a bag",
                  style: TextStyle(color: Colors.black45, fontSize: 12),
                )
              ],
            ),
          ),
          body: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height * .04,
                      width: MediaQuery.of(context).size.width * .58,
                      child: TextFormField(
                        cursorColor: const Color(0xffa2a2a2),
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.search,
                            color: Colors.grey,
                          ),
                          fillColor: Colors.white,
                          filled: true,
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.grey.withOpacity(0.5),
                                width: 1.0),
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.grey.withOpacity(0.5),
                                width: 1.0),
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          contentPadding: EdgeInsets.zero,
                          hintText: "Search",
                          hintStyle: const TextStyle(
                            color: Colors.black12,
                          ),
                          border: InputBorder.none,
                        ),
                        keyboardType: TextInputType.emailAddress,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height * .04,
                      width: MediaQuery.of(context).size.width * .33,
                      //padding: EdgeInsets.only(right: 20),
                      child: DropdownButtonFormField(
                        decoration: InputDecoration(
                          // isDense: true,
                          contentPadding: EdgeInsets.only(left: 10),
                          fillColor: Colors.white,
                          filled: true,

                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.grey, width: 1.0),
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.grey, width: 1.0),
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          errorBorder: InputBorder.none,
                          focusedErrorBorder: InputBorder.none,
                        ),
                        hint: _dropDownValue == null
                            ? Text(
                                'Break Fast',
                                style: TextStyle(
                                  color: Colors.grey,
                                ),
                              )
                            : Text(
                                _dropDownValue,
                                style: TextStyle(color: Colors.black),
                              ),
                        iconSize: 20,
                        style: TextStyle(color: Colors.black),
                        items: ['Break Fast', 'Lunch', 'Dinner'].map(
                          (val) {
                            return DropdownMenuItem<String>(
                              value: val,
                              child: Container(
                                padding: EdgeInsets.only(left: 20.0),
                                child: Text(val),
                              ),
                            );
                          },
                        ).toList(),
                        onChanged: (val) {
                          setState(
                            () {
                              _dropDownValue = val.toString();
                            },
                          );
                        },
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * .02,
              ),
              DragTargetWidget(),
              Expanded(child: CardStackWidget()),
            ],
          ),
        ));
  }
}
