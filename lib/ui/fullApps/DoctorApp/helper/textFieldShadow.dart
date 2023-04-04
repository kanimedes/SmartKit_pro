import 'package:flutter/material.dart';

import 'ColorRes.dart';

class TextFieldWithBoxShadow extends StatelessWidget {
  final String? errorText;
  final double height;
  final Widget child;
  final double? borderRadius;

  const TextFieldWithBoxShadow({
    Key? key,
    this.errorText,
    this.height = 40,
    this.borderRadius,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const errorStyle = TextStyle(
      fontSize: 14,
    );

    // Wrap everything in LayoutBuilder so that the available maxWidth is taken into account for the height calculation (important if you error text exceeds one line)
    return LayoutBuilder(builder: (context, constraints) {
      // Use tp to calculate the height of the errorText
      final textPainter = TextPainter()
        ..text = TextSpan(text: errorText, style: errorStyle)
        ..textDirection = TextDirection.ltr
        ..layout(maxWidth: constraints.maxWidth);

      final heightErrorMessage = textPainter.size.height;
      return Stack(
        children: [
          // Separate container with identical height of text field which is placed behind the actual textfield
          Container(
            height: height,
            decoration: BoxDecoration(
              color: ColorRes.white,
              borderRadius: BorderRadius.circular(borderRadius ?? 30),
              border: Border.all(color: Colors.black12, width: 1),
              boxShadow: [
                new BoxShadow(
                  color: Color(0x0f000000),
                  blurRadius: 10.0,
                ),
              ],
            ),
          ),
          Container(
              // Add height of error message if it is displayed
              height: errorText != null ? height + heightErrorMessage : height,
              alignment: Alignment.topCenter,
              child: child),
        ],
      );
    });
  }
}
