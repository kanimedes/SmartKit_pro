import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../helper/AddToCartModel.dart';
import '../../helper/addTOCartData.dart';
import '../../helper/addToCartConstant.dart';
import 'dragTargetWidget.dart';

class CardStackWidget extends StatefulWidget {
  const CardStackWidget({Key? key}) : super(key: key);

  @override
  State<CardStackWidget> createState() => _CardStackWidgetState();
}

class _CardStackWidgetState extends State<CardStackWidget>
    with TickerProviderStateMixin {
  late PageController pageController = PageController(viewportFraction: 0.8);
  double pageOffset = 0, dragVal = 0.5;
  late AnimationController _controller;
  late Animation<double> animation;

  @override
  void initState() {
    pageController.addListener(() {
      setState(() => pageOffset = pageController.page!);
    });
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );
    animation = Tween<double>(
            begin: 1.0,
            end:
                Provider.of<AddToCartData>(context, listen: false).animationVal)
        .animate(
            CurvedAnimation(parent: _controller, curve: Curves.bounceInOut));
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return slidingCards();
  }

  slidingCards() {
    return PageView.builder(
        controller: pageController,
        itemCount: Provider.of<AddToCartData>(context).itemsList!.length,
        onPageChanged: (index1) {
          setState(() {
            AddToCartConstant.pageIndex = index1;
          });
        },
        itemBuilder: (BuildContext context, int i) {
          AddToCartConstant.currentIndex = i;
          final _scale = AddToCartConstant.pageIndex == i ? 1.0 : 0.87;
          return TweenAnimationBuilder<double>(
              tween: Tween<double>(begin: _scale, end: _scale),
              duration: const Duration(milliseconds: 350),
              curve: Curves.bounceInOut,
              builder: (context, double value, Widget? child) {
                return Transform.scale(scale: value, child: child);
              },
              child: Listener(
                onPointerMove: (data) {
                  setState(() {
                    dragVal = Provider.of<AddToCartData>(context, listen: false)
                        .animationVal;
                  });
                  _controller.forward(from: 0.0);
                },
                child: LongPressDraggable(
                    data: Provider.of<AddToCartData>(context).itemsList![i],
                    onDragEnd: (detail) {
                      setState(() {
                        Provider.of<AddToCartData>(context, listen: false)
                            .changeDragStart(false);
                        AddToCartConstant.dragStart = false;
                        cartController.reverse(from: 0.0);
                      });
                      if (Provider.of<AddToCartData>(context, listen: false)
                          .isSuccessDrop) {
                        setState(() {
                          Provider.of<AddToCartData>(context, listen: false)
                              .itemsList!
                              .removeAt(i);
                        });
                        if (Provider.of<AddToCartData>(context, listen: false)
                            .itemsList!
                            .isEmpty) {
                          Provider.of<AddToCartData>(context, listen: false)
                              .itemsList!
                              .addAll(itemList2);
                        }
                      }
                      Provider.of<AddToCartData>(context, listen: false)
                          .changeAnimationValue(0.5);
                    },
                    onDragStarted: () {
                      setState(() {
                        Provider.of<AddToCartData>(context, listen: false)
                            .changeDragStart(true);
                        AddToCartConstant.dragStart = true;
                        cartController.forward(from: 0.0);
                      });

                      _controller.forward(from: 0.0);
                    },
                    childWhenDragging: Container(),
                    feedback: animationWidget(i),
                    child: Card(
                      elevation: 5,
                      margin: EdgeInsets.only(bottom: 10),
                      child: Container(
                        margin: const EdgeInsets.all(3),
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            /*  boxShadow: const [
                              BoxShadow(
                                color: Colors.grey, //color of shadow
                                spreadRadius: 1, //spread radius
                                blurRadius: 5, // blur radius
                                // changes position of shadow
                              )
                            ],*/
                            borderRadius: BorderRadius.circular(15)),
                        child: SingleChildScrollView(
                          physics: NeverScrollableScrollPhysics(),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              ListTile(
                                dense: true,
                                contentPadding:
                                    EdgeInsets.only(left: 5, right: 5),
                                title: Text(
                                  Provider.of<AddToCartData>(context)
                                      .itemsList![i]
                                      .name!,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                ),
                                trailing: Text(
                                  Provider.of<AddToCartData>(context)
                                      .itemsList![i]
                                      .price!,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                ),
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * .42,
                                width: MediaQuery.of(context).size.width,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.asset(
                                    'assets/images/animatedScreens/addToCartAnimation/${Provider.of<AddToCartData>(context).itemsList![i].assetName}',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    flex: 7,
                                    child: Text(
                                      Provider.of<AddToCartData>(context)
                                          .itemsList![i]
                                          .subTitle!,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(color: Colors.black45),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 3,
                                    child: ElevatedButton(
                                      onPressed: () {},
                                      child: const Text(
                                        "Sour",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            color: Colors.white,
                                            fontSize: 14),
                                      ),
                                      style: ElevatedButton.styleFrom(
                                        minimumSize: const Size(70, 30),
                                        //alignment: Alignment.center,

                                        primary:
                                            /* Colors.red*/ Color(0xFFE53935),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(30.0),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    )),
              ));
        });
  }

  animationWidget(int i) {
    return AnimatedBuilder(
        animation: _controller,
        builder: (_, __) {
          return Transform.scale(
              scale: dragVal,
              child: Container(
                width: 280,
                height: 400,
                margin: const EdgeInsets.all(3),
                padding: const EdgeInsets.only(left: 10, right: 10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    /*   boxShadow: const [
                      BoxShadow(
                        color: Colors.grey, //color of shadow
                        spreadRadius: 1, //spread radius
                        blurRadius: 5, // blur radius
                        // changes position of shadow
                      )
                    ],*/
                    borderRadius: BorderRadius.circular(15)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Card(
                      margin: EdgeInsets.zero,
                      elevation: 0,
                      child: ListTile(
                        dense: true,
                        contentPadding: EdgeInsets.zero,
                        title: Text(
                          Provider.of<AddToCartData>(context)
                              .itemsList![i]
                              .name!,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        trailing: Text(
                          Provider.of<AddToCartData>(context)
                              .itemsList![i]
                              .price!,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * .3,
                      width: MediaQuery.of(context).size.width,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.asset(
                          'assets/images/animatedScreens/addToCartAnimation/${Provider.of<AddToCartData>(context).itemsList![i].assetName}',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Card(
                      elevation: 0,
                      child: ListTile(
                        dense: true,
                        title: Text(
                          Provider.of<AddToCartData>(context)
                              .itemsList![i]
                              .subTitle!,
                          softWrap: true,
                          style: TextStyle(color: Colors.black45),
                        ),
                        trailing: ElevatedButton(
                          onPressed: () {},
                          child: const Text(
                            "Sour",
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                                fontSize: 14),
                          ),
                          style: ElevatedButton.styleFrom(
                            minimumSize: const Size(40, 20),
                            //alignment: Alignment.center,
                            primary: Color(0xFFE53935),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ));
        });
  }
}
