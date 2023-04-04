class Bric {
  final double dx;
  final double heightPercentage;
  final bool isTopPosition;

  Bric({required this.heightPercentage, required this.dx, required this.isTopPosition});

  Bric copyWith({double? dx, double? heightPercentage}) {
    return Bric(
      isTopPosition: isTopPosition,
      heightPercentage: heightPercentage ?? this.heightPercentage,
      dx: dx ?? this.dx,
    );
  }
}
