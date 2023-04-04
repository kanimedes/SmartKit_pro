import 'package:playing_cards/playing_cards.dart';
import 'package:smartkit_pro/ui/games/card/models/card.dart';

const String bot = "Computer";
const String player = "You";
const String bothWinner = "BothWinner";

enum CardsRank { highCard, double, color, sequence, realSequence, triple }

CardsRank getCardsRank(List<CardDetails> cards) {
  if (_isTriple(cards)) {
    return CardsRank.triple;
  }
  if (_isRealSequence(cards)) {
    return CardsRank.realSequence;
  }
  if (_isSequence(cards)) {
    return CardsRank.sequence;
  }

  if (_isColor(cards)) {
    return CardsRank.color;
  }

  if (_isPair(cards)) {
    return CardsRank.double;
  }

  return CardsRank.highCard;
}

bool _isTriple(List<CardDetails> cards) {
  CardValue cardValue = cards.first.cardValue;

  return cards
          .where((element) => element.cardValue == cardValue)
          .toList()
          .length ==
      3;
}

bool _isColor(List<CardDetails> cards) {
  Suit suitValue = cards.first.suit;

  return cards.where((element) => element.suit == suitValue).toList().length ==
      3;
}

bool _isPair(List<CardDetails> cards) {
  bool isPair = false;
  for (var card in cards) {
    if (cards
            .where((element) => element.cardValue == card.cardValue)
            .toList()
            .length ==
        2) {
      isPair = true;
      break;
    }
  }
  return isPair;
}

CardValue _pairCardValue(List<CardDetails> cards) {
  CardValue cardValue = cards.first.cardValue;

  for (var card in cards) {
    List<CardDetails> result =
        cards.where((element) => element.cardValue == card.cardValue).toList();
    if (cards.length == 2) {
      cardValue = result.first.cardValue;
      break;
    }
  }

  return cardValue;
}

bool _isSequence(List<CardDetails> cards) {
  bool isSequence = false;

  if (cards[0].cardValue == CardValue.two &&
      cards[1].cardValue == CardValue.three &&
      cards[2].cardValue == CardValue.ace) {
    isSequence = true;
    return isSequence;
  }

  int firstCardValueIndex = cards.first.cardValue.index;

  for (var i = 1; i < cards.length; i++) {
    if (cards[i].cardValue.index == (firstCardValueIndex + i)) {
      isSequence = true;
    } else {
      isSequence = false;
      break;
    }
  }

  return isSequence;
}

bool _isRealSequence(List<CardDetails> cards) {
  return _isSequence(cards) && _isColor(cards);
}

//logic for determining winner for color and high card winner is same
String _highCardWinner(
    {required List<CardDetails> botCards, required List<CardDetails> myCards}) {
  String winner = bothWinner;

  for (var i = botCards.length - 1; i >= 0; i--) {
    //if cards value are not same
    if (botCards[i].cardValue.index != myCards[i].cardValue.index) {
      //
      if (botCards[i].cardValue.index > myCards[i].cardValue.index) {
        //
        winner = bot;
      } else {
        //
        winner = player;
      }
      break;
    }
  }

  return winner;
}

String _pairedCardWinner(
    {required List<CardDetails> botCards, required List<CardDetails> myCards}) {
  String winner = "";

  if (_pairCardValue(botCards).index == _pairCardValue(myCards).index) {
    winner = bothWinner;
    return winner;
  }
  if (_pairCardValue(botCards).index > _pairCardValue(myCards).index) {
    winner = bot;
    return winner;
  }

  winner = player;

  return winner;
}

String _tripleWinner(
    {required List<CardDetails> botCards, required List<CardDetails> myCards}) {
  if (botCards.last.cardValue.index > myCards.last.cardValue.index) {
    return bot;
  }
  return player;
}

String determineWinner(
    {required List<CardDetails> botCards, required List<CardDetails> myCards}) {
  CardsRank botCardRank = getCardsRank(botCards);
  CardsRank myCardRank = getCardsRank(myCards);

  if (botCardRank == myCardRank) {
    //if card rank is highcard for both bot and user
    if (botCardRank == CardsRank.highCard) {
      return _highCardWinner(botCards: botCards, myCards: myCards);
    }

    if (botCardRank == CardsRank.double) {
      return _pairedCardWinner(botCards: botCards, myCards: myCards);
    }

    //if card rank is color for both bot and user
    if (botCardRank == CardsRank.color) {
      return _highCardWinner(botCards: botCards, myCards: myCards);
    }

    //
    if (botCardRank == CardsRank.sequence) {
      return _highCardWinner(botCards: botCards, myCards: myCards);
    }

    if (botCardRank == CardsRank.realSequence) {
      return _highCardWinner(botCards: botCards, myCards: myCards);
    }

    return _tripleWinner(botCards: botCards, myCards: myCards);
  }
  if (botCardRank.index > myCardRank.index) {
    return bot;
  }

  return player;
}
