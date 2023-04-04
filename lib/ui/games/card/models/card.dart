import 'package:playing_cards/playing_cards.dart';

class CardDetails {
  final CardValue cardValue;
  final Suit suit;

  CardDetails({required this.cardValue, required this.suit});

  @override
  String toString() {
    return "${suit.toString()}-${cardValue.toString()}";
  }
}
