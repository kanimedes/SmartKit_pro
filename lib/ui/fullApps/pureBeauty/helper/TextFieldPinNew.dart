// ignore_for_file: prefer_typing_uninitialized_variables, no_logic_in_create_state, non_constant_identifier_names

import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smartkit_pro/ui/fullApps/pureBeauty/helper/DesignConfig.dart';

///your listData length must be equals otp code length.

class TextFieldPinNew extends StatefulWidget {
  final Function(String, bool)? onOtpCallback;
  final double boxSize;
  final InputBorder? borderStyle;
  final bool filled;
  final int codeLength;
  final filledColor;
  final TextStyle? textStyle;
  final double margin;
  final InputBorder? borderStyeAfterTextChange;
  final bool filledAfterTextChange;

  TextFieldPinNew(
      {Key? key,
      this.onOtpCallback,
      this.boxSize = 46,
      this.borderStyle,
      this.filled = false,
      this.filledColor = Colors.grey,
      this.codeLength = 5,
      this.textStyle,
      this.margin = 16,
      this.borderStyeAfterTextChange,
      this.filledAfterTextChange = false})
      : super(key: key);

  _TextFieldPinNewState pinnewState = _TextFieldPinNewState();
  @override
  _TextFieldPinNewState createState() => pinnewState;

  void ClearAllText() {
    pinnewState._ClearBoxText();
  }

  /*@override
    State<StatefulWidget> createState() {
        return _TextFieldPinNewState();
    }*/
}

class _TextFieldPinNewState extends State<TextFieldPinNew> {
  late List<FocusNode> focusNode;
  late List<TextEditingController> textController;

  late List<OtpDefaultData> mListOtpData;
  HashMap<int, String> mapResult = HashMap();

  String _smsCode = "";
  int _nextFocus = 1;
  String _result = "";
  InputBorder? _borderAfterTextChange;

  @override
  void dispose() {
    super.dispose();
    for (int i = 0; i < mListOtpData.length; i++) {
      textController[i].dispose();
    }
    //SmsRetrieved.stopListening();
  }

  @override
  void initState() {
    super.initState();

    _setDefaultTextFieldData();

    //_startListeningOtpCode();

    if (widget.borderStyeAfterTextChange == null) {
      _borderAfterTextChange = OutlineInputBorder(
          borderRadius: BorderRadius.circular(32),
          borderSide: BorderSide(color: Colors.grey, width: 1));
    } else {
      _borderAfterTextChange = widget.borderStyeAfterTextChange;
    }
  }

  void _setDefaultTextFieldData() {
    for (int i = 0; i < widget.codeLength; i++) {
      mListOtpData.add(OtpDefaultData(null));
      focusNode.add(FocusNode());
      textController.add(TextEditingController());
    }
  }

  _ClearBoxText() {
    mListOtpData.clear();
    textController.clear();
    focusNode.clear();
    mapResult.clear();
    _smsCode = "";
    _nextFocus = 1;
    _result = "";
    _setDefaultTextFieldData();
    FocusScope.of(context).requestFocus(focusNode[0]);
    // SmsRetrieved.stopListening();
    setState(() {});

    // _startListeningOtpCode();
  }

  /// auto fill code
  /// clear first list otp data
  /// clear textController
  /// add listOtpData from smsCode value

  /// get number from message ex: your code : 45678 blablabla blabla
  getCode(String sms) {
    if (sms != null) {
      final intRegex = RegExp(r'\d+', multiLine: true);
      final code = intRegex.allMatches(sms).first.group(0);

      return code;
    }
    return null;
  }

  /// get value from textController
  /// check if value already in hashmap ? update value : insert value
  /// convert all values hasmap to string, set as result otp
  _otpNumberCallback(int i, bool isAutoFill) {
    if (mapResult.containsKey(i)) {
      mapResult.update(i, (e) => textController[i].text);
    } else {
      mapResult.putIfAbsent(i, () => textController[i].text);
    }
    _result = mapResult.values
        .toString()
        .replaceAll("(", "")
        .replaceAll(")", "")
        .replaceAll(",", "")
        .replaceAll(" ", "");
    widget.onOtpCallback!(_result, isAutoFill);
  }

  @override
  Widget build(BuildContext context) {
    InputBorder? _border = widget.borderStyle;

    _border ??= OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(
        color: Colors.grey,
        width: 1.0,
      ),
    );

    return SizedBox(
      height: widget.boxSize,
      width: MediaQuery.of(context).size.width,
      child: Center(
        child: ListView.builder(
            itemCount: mListOtpData.length,
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemBuilder: (context, i) {
              /*double rightmargin =
                  i != mListOtpData.length - 1 ? widget.margin : 0;
              double leftmargin =
                  i != mListOtpData.length - 1 ? widget.margin : 0;
                    leftmargin = 0;*/

              return Container(
                width: widget.boxSize,
                height: widget.boxSize,
                //decoration: DesignConfig.innerDecoration(15),
                decoration: DesignConfig.newInnerDecoration(15),
                margin: EdgeInsets.only(
                    right: i != mListOtpData.length - 1 ? widget.margin : 0),
                //padding: EdgeInsets.only(bottom: 5, right: 5),
                child: Center(
                  child: textFieldFill(
                    focusNode: focusNode[i],
                    textEditingController: textController[i],
                    border: _getBorder(i),
                    isFilled: _isFilled(i),
                    onTextChange: (value) {
                      _otpNumberCallback(i, false);

                      if (value.toString().isNotEmpty) {
                        if (_nextFocus != mListOtpData.length) {
                          _nextFocus = i + 1;
                          FocusScope.of(context)
                              .requestFocus(focusNode[_nextFocus]);
                        } else {
                          _nextFocus = (mListOtpData.length - 1) - 1;
                        }
                      } else {
                        if (i >= 1) {
                          _nextFocus = i - 1;
                          FocusScope.of(context)
                              .requestFocus(focusNode[_nextFocus]);
                        } else {
                          _nextFocus = 1;
                        }
                      }
                    },
                  ),
                ),
              );
            }),
      ),
    );
  }

  InputBorder? _getBorder(int i) {
    return textController[i].text.isNotEmpty
        ? _borderAfterTextChange
        : widget.borderStyle;
  }

  bool _isFilled(int i) {
    return textController[i].text.isNotEmpty
        ? widget.filledAfterTextChange
        : widget.filled;
  }

  Widget textFieldFill(
      {ValueChanged? onTextChange,
      FocusNode? focusNode,
      TextEditingController? textEditingController,
      InputBorder? border,
      bool? isFilled}) {
    return SizedBox(
      child: TextFormField(
        focusNode: focusNode,
        //autofocus: true,
        autofocus: false,
        maxLength: 1,
        showCursor: false,
        scrollPadding: EdgeInsets.all(0),
        cursorWidth: 0,
        enableInteractiveSelection: false,
        autocorrect: false,
        textAlign: TextAlign.center,
        style: widget.textStyle,
        decoration: InputDecoration(
            filled: isFilled,
            //border: border,
            border: InputBorder.none,
            fillColor: widget.filledColor,
            isDense: true,
            counterText: ""),
        keyboardType: TextInputType.phone,
        onChanged: onTextChange,
        controller: textEditingController,
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      ),
    );
  }
}

class OtpDefaultData {
  String? code;

  OtpDefaultData(this.code);
}
