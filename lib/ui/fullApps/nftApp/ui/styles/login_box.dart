import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class loginBox extends StatelessWidget {
  final double topMargin;
  final Color boxColor, iconColor;
  final String hintText;
  final bool visibleIcon;
  final IconData icons;

  const loginBox(
      {Key? key,
      required this.topMargin,
      required this.boxColor,
      required this.iconColor,
      required this.hintText,
      this.visibleIcon = false,
      required this.icons})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20, right: 20, top: topMargin),
      height: MediaQuery.of(context).size.height * 0.08,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Theme.of(context).colorScheme.onBackground),
      child: Row(
        children: [
          Center(
            child: Container(
              margin: EdgeInsets.only(left: 10),
              padding: EdgeInsets.all(8),
              decoration:
                  BoxDecoration(shape: BoxShape.circle, color: boxColor),
              child: Icon(
                icons,
                color: iconColor,
                size: 22,
              ),
            ),
          ),
          SizedBox(
            width: 20,
          ),
          Flexible(
            child: Center(
              child: TextFormField(
                decoration: InputDecoration.collapsed(
                  hintText: hintText,
                  hintStyle: TextStyle(
                      color: Theme.of(context)
                          .colorScheme
                          .secondary
                          .withOpacity(0.6)),
                  border: InputBorder.none,
                ),
                style:
                    TextStyle(color: Theme.of(context).colorScheme.secondary),
                maxLines: 1,
              ),
            ),
          ),
          visibleIcon
              ? Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Icon(
                    Icons.visibility_outlined,
                    color: Theme.of(context).colorScheme.onSecondary,
                  ),
                )
              : SizedBox()
        ],
      ),
    );
  }
}
