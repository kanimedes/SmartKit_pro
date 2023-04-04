import 'dart:math';

import 'package:flutter/material.dart';
import 'package:playing_cards/playing_cards.dart';
import 'package:smartkit_pro/ui/games/card/models/card.dart';

class CardContainer extends StatefulWidget {
  final CardDetails cardDetails;
  final bool isUserCard;
  final AnimationController animationController;
  const CardContainer(
      {Key? key,
      required this.animationController,
      required this.isUserCard,
      required this.cardDetails})
      : super(key: key);

  @override
  State<CardContainer> createState() => _CardContainerState();
}

class _CardContainerState extends State<CardContainer>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: AnimatedBuilder(
            animation: widget.animationController,
            builder: (context, child) {
              double angle = 270 +
                  Tween<double>(begin: 0, end: 90)
                      .animate(CurvedAnimation(
                          parent: widget.animationController,
                          curve: Curves.easeInOutBack))
                      .value;

              return Opacity(
                opacity: widget.animationController.value,
                child: Transform(
                    alignment: Alignment.center,
                    transform: Matrix4.identity()..rotateY((pi / 180) * angle),
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 5.0),
                      width: MediaQuery.of(context).size.width * (0.32),
                      child: PlayingCardView(
                          card: PlayingCard(widget.cardDetails.suit,
                              widget.cardDetails.cardValue)),
                    )),
              );
            },
          ),
        ),
        Center(
          child: AnimatedBuilder(
            animation: widget.animationController,
            builder: (context, child) {
              double angle = 0 +
                  Tween<double>(begin: 0, end: 90)
                      .animate(CurvedAnimation(
                          parent: widget.animationController,
                          curve: Curves.easeInOutBack))
                      .value;

              return Opacity(
                opacity: 1.0 - widget.animationController.value,
                child: Transform(
                  alignment: Alignment.center,
                  transform: Matrix4.identity()..rotateY((pi / 180) * angle),
                  child: Container(
                      alignment: Alignment.center,
                      margin: const EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 5.0),
                      width: MediaQuery.of(context).size.width * (0.32),
                      child: LayoutBuilder(builder: (context, boxConstraints) {
                        return Stack(
                          children: [
                            PlayingCardView(
                                showBack: true,
                                elevation: 5,
                                card: PlayingCard(Suit.clubs, CardValue.ace)),
                            widget.isUserCard
                                ? Container(
                                    alignment: Alignment.center,
                                    width: boxConstraints.maxWidth,
                                    child: Text(
                                      "Tap here",
                                      style: TextStyle(
                                          fontSize: 16.5,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    margin: EdgeInsets.only(
                                      left: 5.0,
                                      right: 5.0,
                                      top: boxConstraints.maxWidth * (0.575),
                                    ),
                                    height: boxConstraints.maxWidth * (0.25),
                                    color: Colors.white,
                                  )
                                : SizedBox()
                          ],
                        );
                      })),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
