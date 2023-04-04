import 'package:flutter/material.dart';

class CustomeYourselfappbar extends StatelessWidget {
  final String title;
  final String? substring;
  final double? titlesize;
  final CrossAxisAlignment? crossAxisAlignment;
  final double? letterspacing;

  const CustomeYourselfappbar({
    Key? key,
    required this.title,
    this.substring,
    this.titlesize,
    this.crossAxisAlignment,
    this.letterspacing,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: crossAxisAlignment ?? CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.03,
          ),
          Text(
            title,
            style: TextStyle(
              fontSize: titlesize ?? 25,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.01,
          ),
          Center(
            child: Text(
              substring ?? "",
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  letterSpacing: letterspacing),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
