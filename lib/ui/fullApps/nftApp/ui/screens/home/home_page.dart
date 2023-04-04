import 'dart:async';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:smartkit_pro/ui/fullApps/nftApp/ui/screens/home/widgets/all_categories.dart';
import 'package:smartkit_pro/ui/fullApps/nftApp/ui/screens/home/widgets/create_collection.dart';
import 'package:smartkit_pro/ui/fullApps/nftApp/ui/screens/home/widgets/fillter_result.dart';
import 'package:smartkit_pro/ui/fullApps/nftApp/ui/screens/home/widgets/profile_page.dart';
import 'package:smartkit_pro/ui/fullApps/nftApp/ui/screens/home/widgets/setting_page.dart';
import 'package:smartkit_pro/ui/fullApps/nftApp/ui/screens/home/widgets/top_seller.dart';
import 'package:smartkit_pro/ui/fullApps/nftApp/ui/screens/home/widgets/top_seller_details.dart';
import 'package:smartkit_pro/ui/fullApps/nftApp/utils/image_path.dart';

class homePage extends StatefulWidget {
  const homePage({Key? key}) : super(key: key);

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  final List<IconData> _iconData = [
    Icons.home,
    Icons.leaderboard,
    Icons.add,
    Icons.account_circle_outlined,
    Icons.settings
  ];

  int currentIndex = 0;
  late int followIndex = -1;
  late String _timeString;

  int bottoMenuIndex = 0;
  Timer? _timer;

  @override
  void initState() {
    _timeString = _formatDateTime(DateTime.now());
    _timer = Timer.periodic(Duration(seconds: 1), (Timer t) => _getTime());
    super.initState();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          IndexedStack(
            index: bottoMenuIndex,
            children: [
              homeContent(),
              fillterResult(),
              createCollection(),
              profilePage(),
              settingPage()
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: EdgeInsets.only(left: 20, right: 20),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.08,
              decoration: BoxDecoration(color: Colors.white, boxShadow: const [
                BoxShadow(
                  offset: Offset(2, 2),
                  blurRadius: 10,
                  color: Color.fromRGBO(0, 0, 0, 0.16),
                ),
              ]),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(5, (index) => index)
                    .map((e) => e == 2
                        ? GestureDetector(
                            onTap: () {
                              setState(() {
                                _onItemTapped(e);
                              });
                            },
                            child: Container(
                              padding: EdgeInsets.all(8),
                              decoration: BoxDecoration(boxShadow: const [
                                BoxShadow(
                                  offset: Offset(2, 2),
                                  blurRadius: 10,
                                  color: Color.fromRGBO(0, 0, 0, 0.16),
                                )
                              ], shape: BoxShape.circle, color: Colors.blue),
                              child: Icon(
                                _iconData[2],
                                color: Colors.white,
                              ),
                            ),
                          )
                        : GestureDetector(
                            onTap: () {
                              setState(() {
                                _onItemTapped(e);
                              });
                            },
                            child: Icon(
                              _iconData[e],
                              color: bottoMenuIndex == e
                                  ? Theme.of(context).colorScheme.primary
                                  : Colors.grey,
                            )))
                    .toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      bottoMenuIndex = index;
    });
  }

  Widget homeContent() {
    return Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).size.height * 0.08),
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding:
              EdgeInsets.only(top: MediaQuery.of(context).padding.top + 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Welcome",
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        GradientText(
                          "NFT Market",
                          gradient: LinearGradient(colors: [
                            Color(0xff63ccfc),
                            Color(0xffe196f0),
                            Color(0xfff8b962),
                          ]),
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.w600),
                        )
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Theme.of(context).colorScheme.onBackground),
                      child: Icon(Icons.notifications_outlined),
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                    left: 20,
                    right: 20,
                    top: MediaQuery.of(context).size.height * 0.04),
                padding: EdgeInsets.only(left: 20),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.07,
                decoration: BoxDecoration(
                    boxShadow: const [
                      BoxShadow(
                        offset: Offset(2, 2),
                        blurRadius: 10,
                        color: Color.fromRGBO(0, 0, 0, 0.16),
                      )
                    ],
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white),
                child: Row(
                  children: [
                    Icon(
                      Icons.search_sharp,
                      color: Theme.of(context).colorScheme.onSecondary,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Flexible(
                      child: Center(
                        child: TextFormField(
                          decoration: InputDecoration.collapsed(
                            hintText: "Search",
                            hintStyle: TextStyle(
                                color: Theme.of(context)
                                    .colorScheme
                                    .secondary
                                    .withOpacity(0.4)),
                            border: InputBorder.none,
                          ),
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.secondary),
                          maxLines: 1,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(4, (index) => index)
                      .map((e) => GestureDetector(
                            onTap: () {
                              setState(() {
                                currentIndex = e;
                              });
                            },
                            child: Container(
                              margin: EdgeInsets.only(
                                  left: 20, top: 20, bottom: 20),
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  boxShadow: const [
                                    BoxShadow(
                                      offset: Offset(2, 2),
                                      blurRadius: 10,
                                      color: Color.fromRGBO(0, 0, 0, 0.16),
                                    )
                                  ],
                                  color: currentIndex == e
                                      ? Colors.deepPurpleAccent
                                      : Colors.white,
                                  border: Border.all(
                                      color: currentIndex == e
                                          ? Colors.transparent
                                          : Colors.transparent),
                                  borderRadius: BorderRadius.circular(8)),
                              child: Text(
                                "Sculpture",
                                style: TextStyle(
                                    color: currentIndex == e
                                        ? Colors.white
                                        : Colors.black),
                              ),
                            ),
                          ))
                      .toList(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AllCategories()));
                      },
                      child: Text(
                        "View All",
                        style: TextStyle(color: Colors.blue),
                      ),
                    ),
                  ],
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                physics: BouncingScrollPhysics(),
                child: Row(
                  children: List.generate(3, (index) => index)
                      .map((e) => Container(
                            margin:
                                EdgeInsets.only(left: 20, top: 10, bottom: 20),
                            padding: EdgeInsets.all(10),
                            width: MediaQuery.of(context).size.width * 0.46,
                            height: MediaQuery.of(context).size.height * 0.27,
                            decoration: BoxDecoration(
                                boxShadow: const [
                                  BoxShadow(
                                    offset: Offset(2, 2),
                                    blurRadius: 10,
                                    color: Color.fromRGBO(0, 0, 0, 0.16),
                                  )
                                ],
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: MediaQuery.of(context).size.width,
                                  height:
                                      MediaQuery.of(context).size.height * 0.18,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image(
                                        image: AssetImage(
                                      NftConstant.getImagePath("gem.jpg"),
                                    )),
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "Gucci of Fakurian",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600),
                                ),
                                Text(
                                  "Available ART (70)",
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onSecondary),
                                ),
                              ],
                            ),
                          ))
                      .toList(),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Top sellers",
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => topSeller()));
                      },
                      child: Text(
                        "View all",
                        style: TextStyle(color: Colors.blue, fontSize: 14),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin:
                    EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 20),
                padding: EdgeInsets.only(top: 10, bottom: 10),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: const [
                    BoxShadow(
                      offset: Offset(2, 2),
                      blurRadius: 10,
                      color: Color.fromRGBO(0, 0, 0, 0.16),
                    )
                  ],
                  gradient: LinearGradient(colors: const [
                    Color(0xff63ccfc),
                    Color(0xffe196f0),
                    Color(0xfff8b962),
                  ]),
                ),
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: List.generate(2, (index) => index)
                        .map((e) => Column(
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      margin:
                                          EdgeInsets.only(top: 10, left: 10),
                                      height: 60,
                                      width: 60,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                      ),
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(100),
                                        child: Image(
                                          image: AssetImage(
                                            NftConstant.getImagePath(
                                              "profile.jpg",
                                            ),
                                          ),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Column(
                                      children: [
                                        Text(
                                          "Cryptocat",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                        SizedBox(
                                          height: 3,
                                        ),
                                        Text(
                                          " 6.056 ETH",
                                          style: TextStyle(
                                              color: Theme.of(context)
                                                  .scaffoldBackgroundColor
                                                  .withOpacity(0.6)),
                                        ),
                                      ],
                                    ),
                                    Spacer(),
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          followIndex = e;
                                        });
                                      },
                                      child: Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.25,
                                        margin: EdgeInsets.only(right: 10),
                                        padding: EdgeInsets.only(
                                            left: 10,
                                            right: 10,
                                            top: 5,
                                            bottom: 5),
                                        decoration: BoxDecoration(
                                            color: followIndex == e
                                                ? Colors.blue
                                                : Colors.transparent,
                                            border: Border.all(
                                                color: followIndex == e
                                                    ? Colors.transparent
                                                    : Colors.white),
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                        child: Center(
                                          child: Text(
                                            followIndex == e
                                                ? "Following"
                                                : "Follow",
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                e == 1
                                    ? SizedBox()
                                    : Container(
                                        margin: EdgeInsets.only(
                                            left: 20, right: 20, top: 10),
                                        width:
                                            MediaQuery.of(context).size.width,
                                        height: 0.5,
                                        color: Colors.white,
                                      )
                              ],
                            ))
                        .toList(),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Live Auctions",
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                    ),
                    Container(
                      padding: EdgeInsets.only(
                          left: 10, right: 10, top: 5, bottom: 5),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(
                              color: Theme.of(context)
                                  .colorScheme
                                  .onSecondary
                                  .withOpacity(0.6))),
                      child: Text(
                        _timeString + " Left",
                        style: TextStyle(
                            color: Colors.deepPurpleAccent,
                            fontSize: 14,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => topsellerDetails()));
                },
                child: Container(
                  margin:
                      EdgeInsets.only(left: 20, right: 20, bottom: 20, top: 10),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.3,
                  decoration: BoxDecoration(
                      boxShadow: const [
                        BoxShadow(
                            offset: Offset(2, 2),
                            blurRadius: 10,
                            color: Color.fromRGBO(0, 0, 0, 0.16))
                      ],
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 15, right: 15, top: 15),
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 0.18,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image(
                            image:
                                AssetImage(NftConstant.getImagePath("gem.jpg")),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15, top: 10),
                        child: Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "NFToker #2305",
                                  style: TextStyle(fontWeight: FontWeight.w600),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "Highest bid 1/1",
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onSecondary),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "0.1 wETH",
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onSecondary),
                                ),
                              ],
                            ),
                            Spacer(),
                            Padding(
                              padding: const EdgeInsets.only(right: 15),
                              child: Stack(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(left: 30),
                                    width: 30,
                                    height: 30,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.blue),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(100),
                                      child: Image(
                                        image: AssetImage(
                                          NftConstant.getImagePath(
                                              "nftgirl1.jpg"),
                                        ),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(left: 15),
                                    width: 30,
                                    height: 30,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.red),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(100),
                                      child: Image(
                                        image: AssetImage(
                                          NftConstant.getImagePath(
                                              "profile.jpg"),
                                        ),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(right: 20),
                                    width: 30,
                                    height: 30,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.green),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(100),
                                      child: Image(
                                        image: AssetImage(
                                          NftConstant.getImagePath(
                                              "nftgirl.jpg"),
                                        ),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _getTime() {
    final DateTime now = DateTime.now();
    final String formattedDateTime = _formatDateTime(now);
    if (mounted) {
      setState(() {
        _timeString = formattedDateTime;
      });
    }
  }

  String _formatDateTime(DateTime dateTime) {
    return DateFormat('hh:mm:ss').format(dateTime);
  }
}

class GradientText extends StatelessWidget {
  const GradientText(
    this.text, {
    required this.gradient,
    this.style,
  });

  final String text;
  final TextStyle? style;
  final Gradient gradient;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      blendMode: BlendMode.srcIn,
      shaderCallback: (bounds) => gradient.createShader(
        Rect.fromLTWH(0, 0, bounds.width, bounds.height),
      ),
      child: Text(text, style: style),
    );
  }
}

class GradientContainer extends StatelessWidget {
  const GradientContainer({
    required this.gradient,
    required this.child,
  });

  final Widget child;

  final Gradient gradient;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      blendMode: BlendMode.srcIn,
      shaderCallback: (bounds) => gradient.createShader(
        Rect.fromLTWH(0, 0, bounds.width, bounds.height),
      ),
      child: child,
    );
  }
}
