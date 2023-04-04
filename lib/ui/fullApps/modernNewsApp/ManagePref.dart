import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'Helper/Color.dart';
import 'Helper/Session.dart';
import 'Helper/String.dart';
import 'Model/Category.dart';

class ManagePref extends StatefulWidget {
  final int? from;

  const ManagePref({Key? key, this.from}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return StateManagePref();
  }
}

class StateManagePref extends State<ManagePref> with TickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey, appBar: getAppBar(), body: contentView());
  }

  //set skip login btn
  skipBtn() {
    return widget.from == 2
        ? Padding(
            padding: EdgeInsetsDirectional.only(end: 10.0),
            child: InkWell(
              child: Align(
                  alignment: Alignment.topRight,
                  child: Container(
                      height: 44,
                      width: 43,
                      padding: EdgeInsets.all(12.0),
                      decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.boxColor,
                          boxShadow: <BoxShadow>[
                            BoxShadow(
                                color: colors.tempdarkColor.withOpacity(0.4),
                                blurRadius: 2.0,
                                offset: Offset(0.0, 0.3),
                                spreadRadius: 0.1)
                          ],
                          borderRadius: BorderRadius.circular(15.0)),
                      child: SvgPicture.asset(
                        "assets/images/fullApps/modernNews/svg/skip_icon.svg",
                        semanticsLabel: 'skip icon',
                      ))),
              onTap: () {},
            ))
        : Container();
  }

  //show snackbar msg
  setSnackbar(String msg) {
    ScaffoldMessenger.of(context).showSnackBar(new SnackBar(
      content: new Text(
        msg,
        textAlign: TextAlign.center,
        style: TextStyle(color: Theme.of(context).colorScheme.fontColor),
      ),
      backgroundColor: isDark! ? colors.tempdarkColor : colors.bgColor,
      elevation: 1.0,
    ));
  }

  //set appbar
  getAppBar() {
    return PreferredSize(
        preferredSize: Size(double.infinity, 45),
        child: AppBar(
          leadingWidth: 50,
          elevation: 0.0,
          centerTitle: true,
          backgroundColor: Colors.transparent,
          title: Text(
            getTranslated(context, 'manage_prefrences')!,
            style: Theme.of(context).textTheme.headline6?.copyWith(
                color: colors.primary,
                fontWeight: FontWeight.w600,
                letterSpacing: 0.5),
          ),
          actions: [skipBtn()],
          leading: Builder(builder: (BuildContext context) {
            return widget.from == 1
                ? Padding(
                    padding: EdgeInsetsDirectional.only(
                        start: 15.0, top: 5.0, bottom: 5.0),
                    child: Container(
                        height: 38,
                        padding: EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.boxColor,
                            boxShadow: [
                              BoxShadow(
                                  blurRadius: 10.0,
                                  offset: const Offset(5.0, 5.0),
                                  color: Theme.of(context)
                                      .colorScheme
                                      .fontColor
                                      .withOpacity(0.1),
                                  spreadRadius: 1.0),
                            ],
                            borderRadius: BorderRadius.circular(6.0)),
                        child: InkWell(
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          child: SvgPicture.asset(
                            "assets/images/fullApps/modernNews/svg/back_icon.svg",
                            semanticsLabel: 'back icon',
                            color: Theme.of(context).colorScheme.fontColor,
                          ),
                        )))
                : Container();
          }),
        ));
  }

  contentView() {
    return SingleChildScrollView(
      padding: EdgeInsetsDirectional.only(
          start: 15.0, end: 15.0, top: 30.0, bottom: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [selectCatTxt(), catListContent(), saveBtn()],
      ),
    );
  }

  selectCatTxt() {
    return Center(
        child: Text(
      getTranslated(context, 'sel_pref_cat')!,
      style: Theme.of(context).textTheme.headline6?.copyWith(
          color: Theme.of(context).colorScheme.fontColor,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.5),
    ));
  }

  catListContent() {
    return Padding(
        padding: EdgeInsetsDirectional.only(top: 25.0),
        child: ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: catList.length,
            itemBuilder: (context, index) {
              return Padding(
                  padding: EdgeInsets.only(top: 10.0),
                  child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Theme.of(context).colorScheme.boxColor,
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 10.0,
                              offset: const Offset(5.0, 5.0),
                              color: Theme.of(context)
                                  .colorScheme
                                  .fontColor
                                  .withOpacity(0.1),
                              spreadRadius: 1.0),
                        ],
                      ),
                      child: Material(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Theme.of(context).colorScheme.boxColor,
                        child: InkWell(
                          highlightColor:
                              Theme.of(context).colorScheme.boxColor,
                          splashColor: colors.primary,
                          borderRadius: BorderRadius.circular(10.0),
                          child: Container(
                            height: 65,
                            padding: EdgeInsetsDirectional.only(
                                start: 20.0,
                                end: 15.0,
                                top: 10.0,
                                bottom: 10.0),
                            child: Row(
                              children: [
                                Text(
                                  catList[index].categoryName!,
                                  style: Theme.of(context)
                                      .textTheme
                                      .subtitle1
                                      ?.copyWith(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .fontColor,
                                          fontWeight: FontWeight.w600,
                                          letterSpacing: 0.5,
                                          fontSize: 18),
                                ),
                                Spacer(),
                                Container(
                                  height: 40.0,
                                  width: 40.0,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: colors.bgColor,
                                  ),
                                  child: Icon(
                                    Icons.check,
                                    color: catList[index].status!
                                        ? colors.primary
                                        : Theme.of(context)
                                            .colorScheme
                                            .boxColor,
                                  ),
                                )
                              ],
                            ),
                          ),
                          onTap: () {
                            if (catList[index].status!) {
                              catList[index].status = false;
                              setState(() {});
                            } else {
                              catList[index].status = true;
                              setState(() {});
                            }
                          },
                        ),
                      )));
            }));
  }

  saveBtn() {
    return Padding(
      padding: EdgeInsets.only(top: 30.0),
      child: InkWell(
          child: Container(
            height: 45.0,
            width: 190.0,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: colors.primary,
                borderRadius: BorderRadius.circular(15.0)),
            child: Text(
              getTranslated(context, 'save_lbl')!,
              style: Theme.of(this.context).textTheme.headline6?.copyWith(
                  color: Theme.of(context).colorScheme.boxColor,
                  fontWeight: FontWeight.w600,
                  fontSize: 21),
            ),
          ),
          onTap: () async {
            Navigator.of(context).pushNamedAndRemoveUntil(
                "/home", (Route<dynamic> route) => false);
          }),
    );
  }
}
