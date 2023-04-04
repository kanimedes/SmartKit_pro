import 'dart:ui';

class Character {
  final String name;
  final String description;
  final Color backgroundColor;
  final String backgroundImageUrl;
  final String foregroundImageUrl;

  Character(
      {required this.backgroundColor,
      required this.description,
      required this.backgroundImageUrl,
      required this.foregroundImageUrl,
      required this.name});
}
