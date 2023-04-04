import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smartkit_pro/ui/snippets/dialogs/dialog1.dart';
import 'package:smartkit_pro/ui/snippets/dialogs/dialog2.dart';
import 'package:smartkit_pro/ui/snippets/dialogs/dialog3.dart';
import 'package:smartkit_pro/ui/snippets/dialogs/dialogListButton.dart';

const String imagePath = "assets/images/dialogs/";

class DialogsScreen extends StatefulWidget {
  const DialogsScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _DialogsScreenState();
  }
}

class _DialogsScreenState extends State<DialogsScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      resizeToAvoidBottomInset: true,
      body: ListView(
        shrinkWrap: true,
        children: [
          SizedBox(
            height: size.height * .15,
          ),
          DialogListButton(
            title: 'Dialog 1',
            onTap: () {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return dialog1(
                      title: "Oops!",
                      description:
                          "No Internet Connection.\nMake sure that WiFi or mobile data is tured on, Then\nTry again.",
                      text: "OK",
                      svgPath: "${imagePath}opps_not_internet.svg",
                    );
                  });
            },
          ),
          DialogListButton(
            title: 'Dialog 2',
            onTap: () {
              showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (BuildContext context) {
                    return dialog2(
                      title: "Success!",
                      description:
                      "Thank you for your request and interest in collaboration with us. We will get back to you as quickly as we can.",
                      text: "OK",
                      svgPath: "${imagePath}panda.svg",
                      dialog2BorderRadius: 15,
                    );
                  });
            },
          ),
          Spacer(),
          DialogListButton(
            title: 'Dialog 3',
            onTap: () {
              showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (BuildContext context) {
                    return dialog3(
                      title: "Alert!",
                      description: "Do you want to turn off the services?",
                      textPositiveButton: "Yes",
                      textNegativeButton: "No",
                      svgPath: "${imagePath}info.svg",
                      dialogBoxRadius: 50,
                      topLeftRadius: 200,
                      bottomLeftRadius: 200,
                    );
                  });
            },
          ),
          Spacer(),
        ],
      ),
    );
  }
}

//Button Widget
class customButton extends StatelessWidget {
  String buttonText;
  VoidCallback? voidCallback;
  Color? backgroundColor;
  Color? textColor;
  TextStyle? textStyle;
  bool? isTextBold;
  double? height;
  double? width;
  double? fontSize;
  double? buttonBorderRadius;

  customButton({
    Key? key,
    required this.buttonText,
    this.voidCallback,
    this.backgroundColor,
    this.textColor,
    this.textStyle,
    this.isTextBold,
    this.height,
    this.width,
    this.fontSize,
    this.buttonBorderRadius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: MaterialButton(
        color: backgroundColor,
        height: height,
        minWidth: width,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(buttonBorderRadius ?? 0)),
        onPressed: voidCallback,
        child: Text(
          buttonText,
          style: TextStyle(
              color: textColor,
              fontSize: fontSize,
              fontWeight:
                  isTextBold == true ? FontWeight.bold : FontWeight.normal),
        ),
      ),
    );
  }
}
