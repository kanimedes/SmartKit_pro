import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smartkit_pro/ui/snippets/helper/snippetsColors.dart';

class SearchBarScreen extends StatefulWidget {
  const SearchBarScreen({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return _SearchBarScreenState();
  }
}

class _SearchBarScreenState extends State<SearchBarScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: ColorRes.bgColor,
        resizeToAvoidBottomInset: true,
        body: Container(
            margin: EdgeInsets.only(
                left: size.width * .04, right: size.width * .04),
            child: ListView(children: [
              SizedBox(
                height: size.height * .05,
              ),
              search1(size),
              SizedBox(
                height: size.height * .04,
              ),
              search2(size),
              SizedBox(
                height: size.height * .04,
              ),
              search3(size),
              SizedBox(
                height: size.height * .04,
              ),
              search4(size),
              SizedBox(
                height: size.height * .04,
              ),
              search5(size),
              SizedBox(
                height: size.height * .04,
              ),
              search6(size),
              SizedBox(
                height: size.height * .04,
              ),
              search7(size)
            ])));
  }

  Widget search1(dynamic size) {
    return design(
        sizes: size,
        child: TextFormField(
          textAlignVertical: TextAlignVertical.center,
          style: TextStyle(color: Colors.black87, fontSize: 20),
          cursorColor: ColorRes.textColor,
          decoration: InputDecoration(
            suffixIcon: Icon(Icons.search,
                size: 28, color: Theme.of(context).colorScheme.primary),
            contentPadding: EdgeInsets.only(
              left: size.width * .08,
            ),
            isDense: true,
            hintText: "Type Keyword...",
            hintStyle: TextStyle(color: ColorRes.textColor, fontSize: 20),
            border: InputBorder.none,
          ),
        ));
  }

  Widget search2(dynamic size) {
    return Row(
      children: [
        Expanded(
          flex: 10,
          child: Container(
            height: size.height * .07,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
            ),
            child: TextFormField(
              textAlignVertical: TextAlignVertical.center,
              style: TextStyle(color: Colors.black87, fontSize: 20),
              cursorColor: ColorRes.textColor,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(left: size.width * .08),
                isDense: true,
                hintText: "Type Keyword...",
                hintStyle: TextStyle(color: Color(0xff69686c), fontSize: 20),
                border: InputBorder.none,
              ),
            ),
          ),
        ),
        SizedBox(
          width: size.width * .03,
        ),
        Expanded(
          flex: 2,
          child: Container(
            height: size.height * .067,
            width: size.width * .03,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                gradient: LinearGradient(
                  colors: [
                    Theme.of(context).colorScheme.primary,
                    Theme.of(context).colorScheme.primaryContainer
                  ],
                )),
            child: Icon(
              Icons.search,
              color: Colors.white,
              size: 30,
            ),
          ),
        )
      ],
    );
  }

  Widget search3(dynamic size) {
    return design(
        child: TextFormField(
          style: TextStyle(color: Colors.black87, fontSize: 20),
          textAlignVertical: TextAlignVertical.center,
          cursorColor: ColorRes.textColor,
          decoration: InputDecoration(
            icon: Container(
              padding: EdgeInsets.only(left: size.width * .08),
              child: Icon(Icons.search,
                  size: 28, color: Theme.of(context).colorScheme.primary),
            ),
            suffixIcon: Icon(Icons.more_vert,
                size: 28, color: Theme.of(context).colorScheme.primary),
            isDense: true,
            hintText: "Type Keyword...",
            hintStyle: TextStyle(color: ColorRes.textColor, fontSize: 20),
            border: InputBorder.none,
          ),
        ),
        sizes: size);
  }

  Widget search4(dynamic size) {
    return design(
        child: TextFormField(
          style: TextStyle(color: Colors.black87, fontSize: 20),
          textAlignVertical: TextAlignVertical.center,
          cursorColor: ColorRes.textColor,
          decoration: InputDecoration(
            icon: Container(
                padding: EdgeInsets.only(left: size.width * .08),
                child: Icon(Icons.search,
                    size: 28, color: Theme.of(context).colorScheme.primary)),

            suffixIcon: Container(
              width: size.width * .2,
              padding: const EdgeInsets.only(right: 12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(
                    height: size.height * .03,
                    child: VerticalDivider(
                      color: ColorRes.labelColor,
                      thickness: 1.5,
                    ),
                  ),
                  Icon(Icons.keyboard_voice_outlined,
                      size: 28, color: Theme.of(context).colorScheme.primary),
                ],
              ),
            ),
            // contentPadding: EdgeInsets.only(left:size.width*.08,top: size.height*.013),
            isDense: true,
            hintText: "Type Keyword...",
            hintStyle: TextStyle(color: ColorRes.textColor, fontSize: 20),
            border: InputBorder.none,
          ),
        ),
        sizes: size);
  }

  Widget search5(dynamic size) {
    return Container(
      height: size.height * .08,
      margin: EdgeInsets.only(left: size.width * .03, right: size.width * .03),
      alignment: Alignment.center,
      child: TextFormField(
          textAlignVertical: TextAlignVertical.center,
          style: TextStyle(color: Colors.white, fontSize: 20),
          cursorColor: Colors.white70,
          decoration: InputDecoration(
            suffixIcon: Icon(
              Icons.search,
              color: Theme.of(context).colorScheme.primary,
              size: 28,
            ),
            hintText: "Type Keyword...",
            hintStyle: TextStyle(
                color: Theme.of(context).colorScheme.primary, fontSize: 20),
            enabledBorder: UnderlineInputBorder(
              borderSide:
                  BorderSide(color: Theme.of(context).colorScheme.primary),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide:
                  BorderSide(color: Theme.of(context).colorScheme.primary),
            ),
          )),
    );
  }

  Widget search6(dynamic size) {
    return design(
        child: TextFormField(
          textAlignVertical: TextAlignVertical.center,
          cursorColor: ColorRes.textColor,
          style: TextStyle(color: Colors.black87, fontSize: 20),
          decoration: InputDecoration(
            suffixIconConstraints: BoxConstraints(
                minHeight: size.height * .09, minWidth: size.width * .15),
            suffixIcon: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20),
                      bottomRight: Radius.circular(20)),
                  gradient: LinearGradient(
                    colors: [
                      Theme.of(context).colorScheme.primary,
                      Theme.of(context).colorScheme.primaryContainer
                    ],
                  )),
              child: Icon(
                Icons.search,
                color: Colors.white,
                size: 30,
              ),
            ),
            contentPadding: EdgeInsets.only(left: size.width * .08),
            isDense: true,
            hintText: "Type Keyword...",
            hintStyle: TextStyle(color: ColorRes.textColor, fontSize: 20),
            border: InputBorder.none,
          ),
        ),
        sizes: size);
  }

  Widget search7(dynamic size) {
    return design(
        child: Center(
            child: IntrinsicWidth(
                child: TextFormField(
          style: TextStyle(color: Colors.black87, fontSize: 20),
          textAlignVertical: TextAlignVertical.center,
          cursorColor: ColorRes.textColor,
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.search,
                size: 28, color: Theme.of(context).colorScheme.primary),
            isDense: true,
            hintText: "Type Keyword...",
            hintStyle: TextStyle(color: ColorRes.textColor, fontSize: 20),
            border: InputBorder.none,
          ),
        ))),
        sizes: size);
  }

  Widget design({required Widget child, dynamic sizes}) {
    return Container(
        height: sizes.height * .073,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
        ),
        child: child);
  }
}
