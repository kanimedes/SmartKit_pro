import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:smartkit_pro/ui/animatedScreens/addToCartAnimation/helper/AddToCartModel.dart';

import '../../helper/addTOCartData.dart';
import '../../helper/addToCartConstant.dart';
import '../addToCartAnimationList.dart';

List<AddToCartModel> cartList = [];
late AnimationController cartController;
late Animation cartAnimation;

class DragTargetWidget extends StatefulWidget {
  const DragTargetWidget({Key? key}) : super(key: key);

  @override
  State<DragTargetWidget> createState() => _DragTargetWidgetState();
}

class _DragTargetWidgetState extends State<DragTargetWidget>
    with TickerProviderStateMixin {
  @override
  void initState() {
    cartController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 100))
      ..addListener(() {
        setState(() {});
      });
    cartAnimation = Tween(begin: 2.0, end: 4.0).animate(cartController);
  }

  @override
  void dispose() {
    cartController.dispose();
    super.dispose();
  }

/* AddToCartConstant.dragStart*/
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: Container(
            height: Provider.of<AddToCartData>(context, listen: false).dragStart
                ? MediaQuery.of(context).size.height * .4
                : MediaQuery.of(context).size.height * .15,
            width: MediaQuery.of(context).size.width * .5,
            //  color: Colors.blueGrey,
            padding: EdgeInsets.only(
                left: AddToCartConstant.dragStart ? 50 : 30,
                top: AddToCartConstant.dragStart ? 30 : 10),
            child: DragTarget(
              onWillAccept: (AddToCartModel? data) {
                Provider.of<AddToCartData>(context, listen: false)
                    .changeAnimationValue(0.2);
                Provider.of<AddToCartData>(context, listen: false)
                    .changeSuccessDrop(true);
                Provider.of<AddToCartData>(context, listen: false)
                    .changeAnimationValue(0.2);

                Provider.of<AddToCartData>(context, listen: false)
                    .changeAcceptedData(data!);

                cartList.add(data);
                // cartController.reverse(from: 0.0);
                return true;
              },
              onAccept: (AddToCartModel? data) {
                Provider.of<AddToCartData>(context, listen: false)
                    .changeDragStart(false);
                /*Provider.of<AddToCartData>(context, listen: false)
                    .changeAnimationValue(0.2);

                Provider.of<AddToCartData>(context, listen: false)
                    .changeAcceptedData(data!);
                Provider.of<AddToCartData>(context, listen: false)
                    .changeDragStart(false);
                cartList!.add(data);*/
                //cartController.forward(from: 0.0);
              },
              builder: (BuildContext context,
                  List<AddToCartModel?> candidateData,
                  List<dynamic> rejectedData) {
                return Container(
                    alignment: Alignment.topLeft,
                    child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  const AddToCartList(),
                            ),
                          );
                        },
                        child: Provider.of<AddToCartData>(context,
                                    listen: false)
                                .dragStart
                            ? AnimatedBuilder(
                                animation: cartController,
                                builder: (_, __) {
                                  return Transform.scale(
                                      scale: cartAnimation.value,
                                      child: SvgPicture.asset(
                                        "assets/images/animatedScreens/addToCartAnimation/bag_icon.svg",
                                      ));
                                })
                            : Row(
                                children: [
                                  AnimatedBuilder(
                                      animation: cartController,
                                      builder: (_, __) {
                                        return Transform.scale(
                                            scale: cartAnimation.value,
                                            child: SvgPicture.asset(
                                              "assets/images/animatedScreens/addToCartAnimation/bag_icon_02.svg",
                                            ));
                                      }),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Container(
                                    padding: const EdgeInsets.only(
                                        left: 15, right: 15, top: 8, bottom: 8),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: Colors.white,
                                        border: Border.all(
                                            color: Colors.grey, width: 1)),
                                    child: Text(
                                      cartList.length.toString() +
                                          " " +
                                          "items",
                                      style: TextStyle(color: Colors.black),
                                    ),
                                  )
                                ],
                              )));
              },
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(right: 15),
          child: ElevatedButton(
            onPressed: () {},
            child: const Text(
              "Check Out",
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                  fontSize: 14),
            ),
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(100, 35),
              //alignment: Alignment.center,
              primary: Color(0xff4b84f5),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
            ),
          ),
        )
      ],
    );
  }
}
