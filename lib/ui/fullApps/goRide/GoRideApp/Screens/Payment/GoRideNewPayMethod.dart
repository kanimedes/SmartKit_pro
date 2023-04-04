import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:octo_image/octo_image.dart';
import 'package:smartkit_pro/ui/fullApps/goRide/GoRideApp/Helper/GoRIdeConstant.dart';
import 'package:smartkit_pro/ui/fullApps/goRide/GoRideApp/Helper/GoRideColor.dart';
import 'package:smartkit_pro/ui/fullApps/goRide/GoRideApp/Helper/GoRideStringRes.dart';

import '../Widget/AppBar.dart';
import 'GoRidePlaymentMehod.dart';

class GoRideNewPayMethod extends StatefulWidget {
  const GoRideNewPayMethod({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return GoRideNewPayMethodState();
  }
}

class GoRideNewPayMethodState extends State<GoRideNewPayMethod> {
  List<ListDataView> rides = [
    ListDataView(
      localImage: GoRideConstant.getPngImagePath("master_atm.png"),
      blurUrl: "L99adO%M~qogNdr=R%Rj.8xux^sS",
      imageUrl:
          "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/goride%2Fmaster_atm.png?alt=media&token=43db5018-07df-4117-8ab1-f7771ad324c9",
    ),
    ListDataView(
      localImage: GoRideConstant.getPngImagePath("visa_atm.png"),
      blurUrl: "L7OvHR-:4Rxa;7I.WAM{3.%2t,s9",
      imageUrl:
          "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/goride%2Fvisa_atm.png?alt=media&token=d4cb48b6-81ba-4927-b97a-f1d9dec31d9f",
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: GoRideColors.yellow,
        resizeToAvoidBottomInset: false,
        appBar: PreferredSize(
            preferredSize: Size(
              MediaQuery.of(context).size.width,
              MediaQuery.of(context).size.height * .15,
            ),
            child: PreferredSizeAppBar(
              title: "New Payment Method ",
            )),
        body: Container(
            height: MediaQuery.of(context).size.height,
            decoration: GoRideConstant.boxDecorationContainer(
                GoRideColors.white, false),
            child: Column(children: [
              SizedBox(
                height: 30,
              ),
              cardList(),
              SizedBox(
                height: 30,
              ),
              Container(
                  alignment: Alignment.topLeft,
                  padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * .1),
                  child: Text(
                    GoRideStringRes.CardNumber,
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        color: Color(0xffababab),
                        fontSize: 14,
                        fontWeight: FontWeight.w600),
                  )),
              SizedBox(
                height: 10,
              ),
              cardNoEnter(),
              SizedBox(
                height: 20,
              ),
              Container(
                  alignment: Alignment.topLeft,
                  padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * .1),
                  child: Text(
                    GoRideStringRes.Nameoncard,
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        color: Color(0xffababab),
                        fontSize: 14,
                        fontWeight: FontWeight.w600),
                  )),
              SizedBox(
                height: 10,
              ),
              nameOnCardEnter(),
              SizedBox(
                height: 20,
              ),
              dateAndCvv(),
              SizedBox(
                height: MediaQuery.of(context).size.height * .18,
              ),
              addNewCardBtn()
            ])));
  }

  Widget cardList() {
    return Container(
      height: MediaQuery.of(context).size.height * .25,
      padding: EdgeInsets.only(left: 15),
      margin: EdgeInsets.all(8),
      child: ListView.builder(
          shrinkWrap: true,
          itemCount: rides.length,
          scrollDirection: Axis.horizontal,
          physics: AlwaysScrollableScrollPhysics(),
          itemBuilder: (BuildContext context, int index) {
            return Row(
              children: [
                OctoImage(
                  image: CachedNetworkImageProvider(rides[index].imageUrl),
                  placeholderBuilder: OctoPlaceholder.blurHash(
                    rides[index].blurUrl,
                  ),
                  errorBuilder: OctoError.icon(color: GoRideColors.black),
                  fit: BoxFit.contain,
                  height: MediaQuery.of(context).size.height * .8,
                  width: MediaQuery.of(context).size.width * .8,
                ),
              ],
            );
          }),
    );
  }

  Widget cardNoEnter() {
    return Container(
      alignment: Alignment.topLeft,
      padding: EdgeInsets.only(
        left: MediaQuery.of(context).size.width * .1,
        right: MediaQuery.of(context).size.width * .1,
      ),
      child: TextFormField(
          cursorColor: Color(0xffa2a2a2),
          decoration: InputDecoration(
            isDense: true,
            contentPadding: EdgeInsets.zero,
            hintText: "* * * *     * * * *     0568",
            hintStyle: TextStyle(
                color: GoRideColors.black,
                fontSize: 18,
                fontWeight: FontWeight.w600),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Color(0xffababab)),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Color(0xffababab)),
            ),
          )),
    );
  }

  Widget nameOnCardEnter() {
    return Container(
      alignment: Alignment.topLeft,
      padding: EdgeInsets.only(
        left: MediaQuery.of(context).size.width * .1,
        top: MediaQuery.of(context).size.height * .01,
        right: MediaQuery.of(context).size.width * .1,
      ),
      child: TextFormField(
          cursorColor: Color(0xffa2a2a2),
          decoration: InputDecoration(
            isDense: true,
            contentPadding: EdgeInsets.zero,
            hintText: "Divy M. Jani",
            hintStyle: TextStyle(
                color: GoRideColors.black,
                fontSize: 18,
                fontWeight: FontWeight.w600),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Color(0xffababab)),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Color(0xffababab)),
            ),
          )),
    );
  }

  Widget dateAndCvv() {
    return Container(
        height: 64,
        // alignment: Alignment.topLeft,
        padding: EdgeInsets.only(
          left: MediaQuery.of(context).size.width * .01,
        ),
        child: Row(
          children: [
            Expanded(
              flex: 8,
              child: Column(
                children: [
                  Container(
                      alignment: Alignment.topLeft,
                      padding: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width * .1),
                      child: Text(
                        GoRideStringRes.ValidThru,
                        style: TextStyle(
                            color: Color(0xffababab),
                            fontSize: 14,
                            fontWeight: FontWeight.w600),
                      )),
                  Container(
                    //  alignment: Alignment.topLeft,
                    padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * .1, top: 10),
                    child: TextFormField(
                        cursorColor: Color(0xffa2a2a2),
                        decoration: InputDecoration(
                          isDense: true,
                          contentPadding: EdgeInsets.zero,
                          hintText: "12/13",
                          hintStyle: TextStyle(
                              color: GoRideColors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.w600),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Color(0xffababab)),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Color(0xffababab)),
                          ),
                        )),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 7,
              child: Column(
                children: [
                  Container(
                      alignment: Alignment.topLeft,
                      padding: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width * .05),
                      child: Text(
                        GoRideStringRes.CVV,
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            color: Color(0xffababab),
                            fontSize: 14,
                            fontWeight: FontWeight.w600),
                      )),
                  Container(
                    //alignment: Alignment.topLeft,
                    padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * .05,
                      top: 10,
                      right: MediaQuery.of(context).size.width * .1,
                    ),
                    child: TextFormField(
                        cursorColor: Color(0xffa2a2a2),
                        decoration: InputDecoration(
                          isDense: true,
                          contentPadding: EdgeInsets.zero,
                          hintText: "325",
                          hintStyle: TextStyle(
                              color: GoRideColors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.w600),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Color(0xffababab)),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Color(0xffababab)),
                          ),
                        )),
                  )
                ],
              ),
            )
          ],
        ));
  }

  Widget addNewCardBtn() {
    return Container(
      padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * .017),
      child: ElevatedButton(
        onPressed: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => GoRidePaymentMethod(),
            ),
          );
        },
        child: Text(
          GoRideStringRes.AddNewcard,
          style: TextStyle(
              fontWeight: FontWeight.w600,
              color: GoRideColors.black,
              fontSize: 16),
        ),
        style: ElevatedButton.styleFrom(
          minimumSize: Size(310, 50),
          primary: GoRideColors.yellow,
        ),
      ),
    );
  }
}

class ListDataView {
  late final String imageUrl;
  late final String blurUrl;
  late final String localImage;

  ListDataView(
      {required this.imageUrl,
      required this.blurUrl,
      required this.localImage});
}
