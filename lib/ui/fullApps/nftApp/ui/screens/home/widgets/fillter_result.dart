import 'package:flutter/material.dart';
import 'package:smartkit_pro/ui/fullApps/nftApp/utils/image_path.dart';

class fillterResult extends StatefulWidget {
  const fillterResult({Key? key}) : super(key: key);

  @override
  State<fillterResult> createState() => _fillterResultState();
}

class _fillterResultState extends State<fillterResult> {
  List image = [
    "nftgirl.jpg",
    "nftgirl1.jpg",
    "profile.jpg",
    "nftgirl.jpg",
    "nftgirl1.jpg",
    "profile.jpg",
    "nftgirl.jpg",
  ];
  List portFolioName = [
    "All Categories",
    "Paintings",
    "Sculpture",
    "Theatre",
    "Drawing",
    "Architecture"
  ];

  List gridAll = [
    "All Chains",
    "Ethereum",
    "Polygan",
    "Klytan",
    "Theatre",
  ];

  List days = ["All Days", "24 Hours", "1 Day", "1 Month", "6 Month", "1 Year"];

  int currentIndexAll = 0, currentIndexType = 0, currentIndexDays = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top + 20),
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.16,
                bottom: MediaQuery.of(context).size.height * 0.08),
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              padding: EdgeInsets.only(top: 30, right: 20, left: 20),
              child: Column(
                children: List.generate(7, (index) => index)
                    .map((e) => Column(
                          children: [
                            Row(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(bottom: 10),
                                  width: 60,
                                  height: 60,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                        image: AssetImage(
                                            NftConstant.getImagePath(image[e])),
                                        fit: BoxFit.cover),
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Cryptocat",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      "056 ETH",
                                      style: TextStyle(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .secondary
                                              .withOpacity(0.6)),
                                    )
                                  ],
                                ),
                                Spacer(),
                                Text("0.000021"),
                                SizedBox(
                                    width: 20,
                                    height: 20,
                                    child: Image(
                                        image: AssetImage(
                                            NftConstant.getImagePath(
                                                "eth.jpg"))))
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 10),
                              child: Divider(
                                color: Colors.grey.withOpacity(0.6),
                                height: 1,
                              ),
                            )
                          ],
                        ))
                    .toList(),
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    "Fllter Results",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(
                        left: 20,
                        right: 10,
                        top: MediaQuery.of(context).size.height * 0.04),
                    padding: EdgeInsets.only(left: 20),
                    width: MediaQuery.of(context).size.width * 0.71,
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
                                  color:
                                      Theme.of(context).colorScheme.secondary),
                              maxLines: 1,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Spacer(),
                  GestureDetector(
                    onTap: () {
                      _bottomDailogFillter();
                    },
                    child: Container(
                      padding: EdgeInsets.only(left: 15, right: 15),
                      margin: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.04,
                          right: 20),
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
                          color: Colors.blue),
                      child: Icon(
                        Icons.settings_input_component_outlined,
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Future<void> _bottomDailogFillter() {
    return showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.only(top: 20, left: 20, right: 20),
          height: MediaQuery.of(context).size.height * 0.8,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(20), topLeft: Radius.circular(20)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    "Filter",
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.w600),
                  ),
                  Spacer(),
                  Text(
                    "Reset",
                    style: TextStyle(
                        fontSize: 12,
                        color: Theme.of(context)
                            .colorScheme
                            .secondary
                            .withOpacity(0.6),
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "All Categories",
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.w600),
              ),
              maxAllCatGrid(),
              SizedBox(
                height: 20,
              ),
              Text(
                "All Categories",
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.w600),
              ),
              allCateGrid(),
              SizedBox(
                height: 20,
              ),
              Text(
                "Days",
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.w600),
              ),
              Days(),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              Container(
                margin: EdgeInsets.only(
                  left: 20,
                  right: 20,
                ),
                height: MediaQuery.of(context).size.height * 0.08,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Theme.of(context).colorScheme.primary),
                child: Center(
                  child: Text(
                    "Apply Filter",
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.onBackground,
                        fontSize: 18,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget maxAllCatGrid() {
    return GridView.count(
      padding: const EdgeInsets.only(top: 20),
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      crossAxisCount: 3,
      childAspectRatio: 3,
      mainAxisSpacing: 10,
      crossAxisSpacing: 10,
      children: List.generate(6, (index) => index)
          .map((e) => GestureDetector(
                onTap: () {
                  setState(() {
                    currentIndexAll = e;
                  });
                },
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: currentIndexAll == e
                              ? Colors.transparent
                              : Theme.of(context)
                                  .colorScheme
                                  .secondary
                                  .withOpacity(0.2)),
                      color: currentIndexAll == e
                          ? Colors.deepPurpleAccent
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(5)),
                  child: Center(
                    child: Text(
                      portFolioName[e],
                      style: TextStyle(
                          color: currentIndexAll == e
                              ? Colors.white
                              : Theme.of(context).colorScheme.secondary),
                    ),
                  ),
                ),
              ))
          .toList(),
    );
  }

  Widget Days() {
    return GridView.count(
      padding: const EdgeInsets.only(top: 20),
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      crossAxisCount: 3,
      childAspectRatio: 3,
      mainAxisSpacing: 10,
      crossAxisSpacing: 10,
      children: List.generate(6, (index) => index)
          .map((e) => GestureDetector(
                onTap: () {
                  setState(() {
                    currentIndexDays = e;
                  });
                },
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: currentIndexDays == e
                              ? Colors.transparent
                              : Theme.of(context)
                                  .colorScheme
                                  .secondary
                                  .withOpacity(0.2)),
                      color: currentIndexDays == e
                          ? Colors.deepPurpleAccent
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(5)),
                  child: Center(
                    child: Text(
                      days[e],
                      style: TextStyle(
                          color: currentIndexDays == e
                              ? Colors.white
                              : Theme.of(context).colorScheme.secondary),
                    ),
                  ),
                ),
              ))
          .toList(),
    );
  }

  Widget allCateGrid() {
    return GridView.count(
      padding: const EdgeInsets.only(top: 20),
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      crossAxisCount: 3,
      childAspectRatio: 3,
      mainAxisSpacing: 10,
      crossAxisSpacing: 10,
      children: List.generate(5, (index) => index)
          .map((e) => GestureDetector(
                onTap: () {
                  setState(() {
                    currentIndexType = e;
                  });
                },
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: currentIndexType == e
                              ? Colors.transparent
                              : Theme.of(context)
                                  .colorScheme
                                  .secondary
                                  .withOpacity(0.2)),
                      color: currentIndexType == e
                          ? Colors.deepPurpleAccent
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(5)),
                  child: Center(
                    child: Text(
                      gridAll[e],
                      style: TextStyle(
                          color: currentIndexType == e
                              ? Colors.white
                              : Theme.of(context).colorScheme.secondary),
                    ),
                  ),
                ),
              ))
          .toList(),
    );
  }
}
