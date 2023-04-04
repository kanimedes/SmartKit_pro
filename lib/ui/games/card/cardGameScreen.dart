import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:playing_cards/playing_cards.dart';
import 'package:smartkit_pro/ui/games/card/models/card.dart';
import 'package:smartkit_pro/ui/games/card/utils.dart';
import 'package:smartkit_pro/ui/games/card/widgets/cardContainer.dart';
import 'package:smartkit_pro/utils/uiUtils.dart';

class CardGameScreen extends StatefulWidget {
  const CardGameScreen({Key? key}) : super(key: key);

  @override
  _CardGameScreenState createState() => _CardGameScreenState();
}

class _CardGameScreenState extends State<CardGameScreen>
    with TickerProviderStateMixin {
  List<CardDetails> cards = [];
  //total 6 cards per player 3
  List<CardDetails> cardsInTable = [];

  List<AnimationController> botCardsAnimationControllers = [];

  List<AnimationController> playerCardsAnimationControllers = [];

  @override
  void initState() {
    super.initState();

    UiUtils.changeStatusBarBrightness(Brightness.light);
    for (var i = 0; i < 3; i++) {
      playerCardsAnimationControllers.add(AnimationController(
          vsync: this, duration: const Duration(milliseconds: 750)));

      botCardsAnimationControllers.add(AnimationController(
          vsync: this, duration: const Duration(milliseconds: 750)));
    }

    Future.delayed(Duration.zero, () {
      initCards();
    });
  }

  @override
  void dispose() {
    for (var i = 0; i < 3; i++) {
      //
      playerCardsAnimationControllers[i].dispose();

      botCardsAnimationControllers[i].dispose();
    }
    super.dispose();
  }

  Future<void> initCards() async {
    if (cards.isNotEmpty) {
      cards = [];
      cardsInTable = [];

      for (var i = 0; i < 3; i++) {
        //
        playerCardsAnimationControllers[i].value = 0;

        botCardsAnimationControllers[i].value = 0;
      }

      setState(() {});
    }
    Random random = Random.secure();
    //
    for (var suit in Suit.values) {
      for (var card in CardValue.values) {
        cards.add(CardDetails(cardValue: card, suit: suit));
      }
    }
    for (var i = 0; i < 6; i++) {
      int selectedIndex = random.nextInt(cards.length);
      cardsInTable.add(cards[selectedIndex]);
      cards.removeAt(selectedIndex);
    }
    setState(() {});
  }

  Future<void> showWinner() async {
    bool canShowWinner = true;

    for (var animationController in playerCardsAnimationControllers) {
      if (!animationController.isCompleted) {
        canShowWinner = false;
        break;
      }
    }

    if (!canShowWinner) {
      return;
    }

    await Future.delayed(const Duration(milliseconds: 1000));
    showDialog(
        context: context,
        builder: (_) {
          return WillPopScope(
            onWillPop: () {
              return Future.value(false);
            },
            child: AlertDialog(
              actions: [
                CupertinoButton(
                    child: const Text(
                      "Play again",
                      style: TextStyle(color: Colors.black),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                      initCards();
                    }),
                CupertinoButton(
                    child: const Text(
                      "Exit",
                      style: TextStyle(color: Colors.black),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();

                      Navigator.of(context).pop();
                    }),
              ],
              title: Text(
                  determineWinner(
                              botCards: _buildBotCards(sortCards: true),
                              myCards: _buildMyCards(sortCards: true)) ==
                          player
                      ? "You won"
                      : "Better luck next time",
                  style: const TextStyle(color: Colors.black)),
            ),
          );
        });
  }

  List<CardDetails> _buildBotCards({required bool sortCards}) {
    List<CardDetails> botCards = [];
    if (cardsInTable.isEmpty) return [];
    for (var i = 0; i < 6; i++) {
      if (i.isEven) {
        botCards.add(cardsInTable[i]);
      }
    }

    if (sortCards) {
      botCards.sort((first, second) =>
          first.cardValue.index.compareTo(second.cardValue.index));
    }

    return botCards;
  }

  List<CardDetails> _buildMyCards({required bool sortCards}) {
    List<CardDetails> myCards = [];

    if (cardsInTable.isEmpty) return [];
    for (var i = 0; i < 6; i++) {
      if (i.isOdd) {
        myCards.add(cardsInTable[i]);
      }
    }

    if (sortCards) {
      myCards.sort((first, second) =>
          first.cardValue.index.compareTo(second.cardValue.index));
    }

    return myCards;
  }

  List<Widget> _buildCardsContainer({required bool forPlayer}) {
    List<Widget> cards = [];
    final cardDetails = forPlayer
        ? _buildMyCards(sortCards: false)
        : _buildBotCards(sortCards: false);

    for (var i = 0; i < cardDetails.length; i++) {
      cards.add(
        GestureDetector(
          onTap: () async {
            if (forPlayer) {
              //
              await playerCardsAnimationControllers[i].forward();

              await botCardsAnimationControllers[i].forward();

              showWinner();
            }
          },
          child: CardContainer(
              isUserCard: forPlayer,
              animationController: forPlayer
                  ? playerCardsAnimationControllers[i]
                  : botCardsAnimationControllers[i],
              cardDetails: cardDetails[i]),
        ),
      );
    }

    return cards;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text("Card"),
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * (0.5),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Text(
                    bot,
                    style: TextStyle(fontSize: 30.0, color: Colors.white),
                  ),
                  const Divider(
                    color: Colors.white,
                  ),
                  ..._buildCardsContainer(forPlayer: false)
                ],
              ),
            ),
          ),
          Container(
            decoration: const BoxDecoration(
                border: Border(left: BorderSide(color: Colors.white))),
            width: MediaQuery.of(context).size.width * (0.5),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Text(
                    player,
                    style: TextStyle(fontSize: 30.0, color: Colors.white),
                  ),
                  const Divider(color: Colors.white),
                  ..._buildCardsContainer(forPlayer: true),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
