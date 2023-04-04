// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OTPTextField extends StatefulWidget {
  final String? lastPin;
  final int fields;
  final ValueChanged<String>? onSubmit, onChange;
  final num fieldWidth;
  final num fontSize;
  final bool isTextObscure;
  final bool showFieldAsBox;
  final cursorColor; // Leaving the data type dynamic for adding Color or Material Color
  final boxColor;
  final textColor;

  const OTPTextField({
    Key? key,
    this.lastPin,
    this.fields = 4,
    this.onSubmit,
    this.onChange,
    this.fieldWidth = 40.0,
    this.fontSize = 20.0,
    this.isTextObscure = false,
    this.showFieldAsBox = false,
    this.cursorColor = Colors
        .blue, // Adding a Material Color so that if the user want black, it get accepted too
    this.boxColor = Colors.blue,
    this.textColor = Colors.blue,
  })  : assert(fields > 0),
        super(key: key);

  @override
  State createState() {
    return OTPTextFieldState();
  }
}

class OTPTextFieldState extends State<OTPTextField> {
  late List<String?> _pin;
  late List<FocusNode?> _focusNodes;
  late List<TextEditingController?> _textControllers;

  Widget textFields = Container();

  @override
  void initState() {
    super.initState();
    _pin = List<String?>.filled(widget.fields, null, growable: false);
    _focusNodes = List<FocusNode?>.filled(widget.fields, null, growable: false);
    _textControllers = List<TextEditingController?>.filled(widget.fields, null,
        growable: false);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        if (widget.lastPin != null) {
          for (var i = 0; i < widget.lastPin!.length; i++) {
            _pin[i] = widget.lastPin![i];
          }
        }
        textFields = generateTextFields(context);
      });
    });
  }

  @override
  void dispose() {
    for (var t in _textControllers) {
      t!.dispose();
    }
    super.dispose();
  }

  Widget generateTextFields(BuildContext context) {
    List<Widget> textFields = List.generate(widget.fields, (int i) {
      return buildTextField(i, context, i == 0);
    });

    if (_pin.first != null) {
      FocusScope.of(context).requestFocus(_focusNodes[0]);
    }

    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        verticalDirection: VerticalDirection.down,
        children: textFields);
  }

  void clearTextFields() {
    for (var tEditController in _textControllers) {
      tEditController!.clear();
    }
    _pin.clear();
  }

  Widget buildTextField(int i, BuildContext context, [bool autofocus = false]) {
    if (_focusNodes[i] == null) {
      _focusNodes[i] = FocusNode();
    }
    if (_textControllers[i] == null) {
      _textControllers[i] = TextEditingController();
      if (widget.lastPin != null) {
        _textControllers[i]!.text = widget.lastPin![i];
      }
    }

    _focusNodes[i]!.addListener(() {
      if (_focusNodes[i]!.hasFocus) {}
    });

    final String lastDigit = _textControllers[i]!.text;

    return Container(
      width: widget.fieldWidth as double?,
      margin: EdgeInsets.only(right: 10.0),
      child: TextField(
        controller: _textControllers[i],
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        cursorColor: widget.cursorColor,
        maxLength: 1,
        autofocus: autofocus,
        style: TextStyle(
            fontWeight: FontWeight.bold,
            color: widget.textColor,
            // color: Colors.black,
            fontSize: widget.fontSize as double?),
        focusNode: _focusNodes[i],
        obscureText: widget.isTextObscure,
        decoration: InputDecoration(
            counterText: "",
            enabledBorder: widget.showFieldAsBox
                ? OutlineInputBorder(
                    borderSide: BorderSide(width: 1.0, color: widget.boxColor))
                : UnderlineInputBorder(
                    borderSide: BorderSide(width: 1.0, color: widget.boxColor)),
            focusedBorder: widget.showFieldAsBox
                ? OutlineInputBorder(
                    borderSide: BorderSide(width: 2.0, color: widget.boxColor))
                : UnderlineInputBorder(
                    borderSide:
                        BorderSide(width: 2.0, color: widget.boxColor))),
        onChanged: (String str) {
          setState(() {
            _pin[i] = str;
          });
          widget.onChange!(_pin.join());
          if (i + 1 != widget.fields) {
            _focusNodes[i]!.unfocus();
            if (lastDigit != null && _pin[i] == '') {
              FocusScope.of(context).requestFocus(_focusNodes[i - 1]);
            } else {
              FocusScope.of(context).requestFocus(_focusNodes[i + 1]);
            }
          } else {
            _focusNodes[i]!.unfocus();
            if (lastDigit != null && _pin[i] == '') {
              FocusScope.of(context).requestFocus(_focusNodes[i - 1]);
            }
          }
          if (_pin.every((String? digit) => digit != null && digit != '')) {
            widget.onSubmit!(_pin.join());
          }
        },
        onSubmitted: (String str) {
          if (_pin.every((String? digit) => digit != null && digit != '')) {
            widget.onSubmit!(_pin.join());
          }
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return textFields;
  }
}
