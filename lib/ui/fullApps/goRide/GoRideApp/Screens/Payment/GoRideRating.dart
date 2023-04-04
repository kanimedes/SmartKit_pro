import 'package:cached_network_image/cached_network_image.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:octo_image/octo_image.dart';
import 'package:smartkit_pro/ui/fullApps/goRide/GoRideApp/Helper/GoRIdeConstant.dart';
import 'package:smartkit_pro/ui/fullApps/goRide/GoRideApp/Helper/GoRideColor.dart';
import 'package:smartkit_pro/ui/fullApps/goRide/GoRideApp/Helper/GoRideStringRes.dart';
import 'package:smartkit_pro/ui/fullApps/goRide/GoRideApp/Screens/Payment/GoRideYourRide.dart';

class GoRideRating extends StatefulWidget {
  const GoRideRating({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return GoRideRatingState();
  }
}

class GoRideRatingState extends State<GoRideRating> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            height: MediaQuery.of(context).size.height,
            decoration: GoRideConstant.boxDecorationContainer(
                GoRideColors.white, false),
            child: Column(children: [
              Stack(
                children: [imageShow(), bodyDataShow()],
              ),
            ])));
  }

  Widget imageShow() {
    return SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(children: [
          SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: OctoImage(
              image: CachedNetworkImageProvider(
                  "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/goride%2Fmap.jpg?alt=media&token=39013a81-98ea-4e47-aea4-919963651f0e"),
              placeholderBuilder: OctoPlaceholder.blurHash(
                "L2Pt0\$S;F_Y83N];^8I+3p9_[dD~",
              ),
              errorBuilder: OctoError.icon(color: GoRideColors.black),
              fit: BoxFit.fill,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                left: MediaQuery.of(context).size.width * .07,
                top: MediaQuery.of(context).size.height * .07),
            child: CircleAvatar(
              radius: 15,
              child: FloatingActionButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                mini: true,
                backgroundColor: GoRideColors.white,
                elevation: 3,
                child: Icon(
                  Icons.arrow_back_ios_outlined,
                  color: GoRideColors.black,
                ),
              ),
            ),
          ),
        ]));
  }

  Widget bodyDataShow() {
    return Container(
        height: MediaQuery.of(context).size.height * .6,
        margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * .4),
        decoration:
            GoRideConstant.boxDecorationContainer(GoRideColors.white, false),
        child: Column(children: [
          Container(
              alignment: Alignment.topLeft,
              padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * .1, top: 30),
              child: Text(
                GoRideStringRes.youReach,
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 12),
              )),
          Container(
              margin: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * .1,
                  right: MediaQuery.of(context).size.width * .1,
                  top: 5),
              child: Divider(
                color: Color(0x25707070),
                thickness: 2,
              )),
          useDetail(),
          Container(
              margin: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * .1,
                  right: MediaQuery.of(context).size.width * .1,
                  top: 5),
              child: Divider(
                color: Color(0x25707070),
                thickness: 2,
              )),
          Container(
              alignment: Alignment.topLeft,
              padding:
                  EdgeInsets.only(left: MediaQuery.of(context).size.width * .1),
              child: Text(
                GoRideStringRes.TripRoute,
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 12),
              )),
          Container(
              margin: EdgeInsets.only(
                left: MediaQuery.of(context).size.width * .1,
                right: MediaQuery.of(context).size.width * .1,
              ),
              child: Divider(
                color: Color(0x25707070),
                thickness: 2,
              )),
          picUpDrop(),
          Container(
              margin: EdgeInsets.only(
                left: MediaQuery.of(context).size.width * .1,
                right: MediaQuery.of(context).size.width * .1,
              ),
              child: Divider(
                color: Color(0x25707070),
                thickness: 2,
              )),
          SizedBox(height: 10),
          tripText(),
          SizedBox(height: 10),
          feedbackText(),
          SizedBox(height: 25),
          RatingBar.builder(
            initialRating: 3,
            itemCount: 5,
            itemBuilder: (context, index) {
              switch (index) {
                case 0:
                  return Icon(
                    Icons.star,
                    /*Icons.sentiment_very_dissatisfied,*/
                    color: Colors.amber,
                  );
                case 1:
                  return Icon(
                    Icons.star,
                    //Icons.sentiment_dissatisfied,
                    color: Colors.amber,
                  );
                case 2:
                  return Icon(
                    Icons.star,
                    // Icons.sentiment_neutral,
                    color: Colors.amber,
                  );
                case 3:
                  return Icon(
                    Icons.star,
                    //  Icons.sentiment_satisfied,
                    color: Colors.amber,
                  );
                case 4:
                  return Icon(
                    Icons.star,
                    // Icons.sentiment_very_satisfied,
                    color: Colors.amber,
                  );
              }
              return Container();
            },
            onRatingUpdate: (rating) {
              rating == 5.0
                  ? Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) => GoRideYourRide(),
                      ),
                    )
                  : Null;
              print(rating);
            },
          ),
          /* GestureDetector(
                  onTap: (){
                   // Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => GoRideYourRide(),),);
                  },
                  child: GoRideConstant.displayRating("0",true))*/
        ]));
  }

  Widget useDetail() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            Container(
              height: 60,
              width: 65,
              margin: EdgeInsets.only(
                left: MediaQuery.of(context).size.width * .1,
              ),
              child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  child: OctoImage(
                    image: CachedNetworkImageProvider(
                        "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/travelapp%2Ftoptrip_b.jpg?alt=media&token=cd01d6b2-2892-4da7-bfee-4069e2e4f7e8"),
                    placeholderBuilder: OctoPlaceholder.blurHash(
                      "L5Jk_:009FDi00oJ-oRj00~VMwM{",
                    ),
                    errorBuilder: OctoError.icon(color: GoRideColors.black),
                    fit: BoxFit.contain,
                  )),
            )
          ],
        ),
        Container(
          alignment: Alignment.topLeft,
          padding: EdgeInsets.only(left: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 8,
              ),
              Text(
                "JOHN DOE",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                "Mercedes A - 6250",
                style: TextStyle(fontSize: 12, color: Color(0xff676767)),
              ),
              SizedBox(
                height: 5,
              ),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  children: const <TextSpan>[
                    TextSpan(
                        text: "OTP :",
                        style:
                            TextStyle(fontSize: 12, color: Color(0xff676767))),
                    TextSpan(
                      text: "3653",
                      style:
                          TextStyle(fontSize: 12, color: GoRideColors.yellow),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Container(
          alignment: Alignment.topLeft,
          padding: EdgeInsets.only(left: 25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              SizedBox(
                height: 8,
              ),
              Text(
                GoRideStringRes.FinalCost,
                style: TextStyle(
                  fontSize: 12,
                ),
              ),
              SizedBox(
                height: 7,
              ),
              Text(
                "\$50.00",
                style: TextStyle(
                    fontSize: 14,
                    color: Color(0xff676767),
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        Container(
          alignment: Alignment.topLeft,
          padding: EdgeInsets.only(left: 25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              SizedBox(
                height: 8,
              ),
              Text(
                GoRideStringRes.time,
                style: TextStyle(fontSize: 12),
              ),
              SizedBox(
                height: 7,
              ),
              Text(
                "4.00",
                style: TextStyle(
                    fontSize: 14,
                    color: Color(0xff676767),
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget picUpDrop() {
    return Container(
      height: MediaQuery.of(context).size.height * .135,
      margin: EdgeInsets.only(
          left: MediaQuery.of(context).size.width * .08,
          /*right: MediaQuery.of(context).size.width*.1,*/ top: 5),
      child: Column(
        children: [
          Row(
            children: [
              SizedBox(
                width: 5,
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: const [
                      Icon(
                        Icons.circle,
                        size: 25,
                        color: Colors.black38,
                      ),
                      Icon(
                        Icons.circle,
                        size: 15,
                        color: Colors.black,
                      ),
                    ],
                  )
                ],
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * .05,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    GoRideStringRes.pickUp,
                    style: TextStyle(color: Color(0xff959595)),
                  ),
                  Row(
                    children: [
                      Text(
                        "80, Vile Parle West",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                      Container(
                        //alignment: Alignment.topRight,
                        padding: EdgeInsets.only(left: 85),
                        child: Text(
                          "9:30 PM",
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.w600),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                width: 20,
              ),
            ],
          ),
          Stack(
            children: [
              Container(
                  alignment: Alignment.topLeft,
                  height: 25,
                  padding: EdgeInsets.only(left: 17),
                  child: DottedLine(
                    dashLength: 3,
                    direction: Axis.vertical,
                    lineThickness: 1.0,
                    dashColor: Colors.black38,
                  )),
              Container(
                  margin: EdgeInsets.only(left: 40, top: 5, right: 40),
                  child: Divider(
                    color: Color(0x25707070),
                    thickness: 2,
                  )),
            ],
          ),
          Row(
            children: [
              SizedBox(
                width: 5,
              ),
              Column(
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Icon(
                        Icons.circle,
                        size: 25,
                        color: GoRideColors.yellow.withOpacity(0.5),
                      ),
                      Icon(Icons.circle, size: 15, color: GoRideColors.yellow),
                    ],
                  )
                ],
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * .05,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    GoRideStringRes.dropOff,
                    style: TextStyle(color: Color(0xff959595)),
                  ),
                  Row(
                    children: const [
                      Text(
                        "80, Vile Parle Eest",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 85),
                        child: Text(
                          "10:10 PM",
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.w600),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget tripText() {
    return Text(
      GoRideStringRes.tripReview,
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
    );
  }

  Widget feedbackText() {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.only(
          left: MediaQuery.of(context).size.width * .1,
          right: MediaQuery.of(context).size.width * .1,
          top: 20),
      child: Text(
        GoRideStringRes.feedback,
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 14, color: Color(0xff989898)),
      ),
    );
  }
}
