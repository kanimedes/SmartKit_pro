import 'package:flutter/material.dart';

import 'package:smartkit_pro/ui/fullApps/fitness/model/primedata.dart';
import 'package:smartkit_pro/ui/fullApps/fitness/widget/customrRoundedButton.dart';

class BuyPrime extends StatefulWidget {
  const BuyPrime({Key? key}) : super(key: key);

  @override
  State<BuyPrime> createState() => _BuyPrimeState();
}

class _BuyPrimeState extends State<BuyPrime> {
  List goalid = [];
  int selectedlevel = -1;

  Widget _builsbutton() {
    return CustomeRoundedButton(
      title: "Subscribe",
      width: MediaQuery.of(context).size.width * 0.94,
      hight: MediaQuery.of(context).size.height * 0.07,
      borderradius: 40,
      ontap: () {
        Navigator.of(context).pop();
      },
    );
  }

  Widget _buildtextlistcolumn() {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20, bottom: 50),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Be Premium",
            style: TextStyle(
              fontSize: 40,
              color: Theme.of(context).primaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            "Be Premium",
            style: TextStyle(
              fontSize: 30,
              color: Theme.of(context).primaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Text(
            "Enjoy workout access without ads and restrictions",
            style: TextStyle(
              fontSize: 18,
              // color: Theme.of(context).primaryColor,
              // fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.40,
            child: ListView.builder(
              physics: BouncingScrollPhysics(),
              padding: EdgeInsets.only(top: 50),
              itemCount: primelist.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    selectedlevel = index;
                    setState(() {});
                  },
                  child: Container(
                    margin: EdgeInsets.only(top: 10),
                    width: MediaQuery.of(context).size.width * 0.85,
                    height: MediaQuery.of(context).size.height * 0.1,
                    decoration: BoxDecoration(
                      color: selectedlevel == index
                          ? Theme.of(context).primaryColor.withOpacity(0.2)
                          : Colors.white.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(20),
                      border: selectedlevel == index
                          ? Border.all(
                              width: 2, color: Theme.of(context).primaryColor)
                          : Border.all(width: 0, color: Colors.transparent),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width * 0.04),
                      child: Row(
                        children: [
                          selectedlevel != index
                              ? Icon(
                                  Icons.circle_outlined,
                                  color: Theme.of(context).primaryColor,
                                )
                              : Icon(
                                  Icons.check_circle,
                                  color: Theme.of(context).primaryColor,
                                ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.08,
                          ),
                          Text(
                            primelist[index].month,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                          Spacer(),
                          Text(
                            "\$ ${primelist[index].amount}/m",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Image(
                image: NetworkImage(
                    "https://images.unsplash.com/photo-1538805060514-97d9cc17730c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NXx8Zml0bmVzc3xlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60"),
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.cover,
              ),
              Positioned(
                top: 50,
                left: 20,
                child: IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: Icon(
                    Icons.arrow_back_ios,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.white.withOpacity(0.0),
                        Colors.white.withOpacity(0.0),
                        Colors.white.withOpacity(0.2),
                        Colors.white.withOpacity(0.2),
                        Colors.white.withOpacity(0.2),
                        Colors.white.withOpacity(0.3),
                        Colors.white.withOpacity(0.4),
                        Colors.white.withOpacity(0.5),
                        Colors.white.withOpacity(0.5),
                        Colors.white.withOpacity(0.6),
                        Colors.white.withOpacity(0.7),
                      ],
                      begin: AlignmentDirectional.topCenter,
                      end: AlignmentDirectional.bottomCenter,
                    ),
                    // borderRadius: BorderRadius.circular(25),
                  ),
                  child: Column(children: [
                    _buildtextlistcolumn(),
                    _builsbutton(),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.05,
                    )
                  ]),
                ),
              ),

              //_buildgoal(),
            ],
          ),
        ],
      ),
    ));
  }
}

/*   Widget _buildgoal() {
    return Align(
      alignment: Alignment.topRight,
      child: SlideTransition(
        position: _goalanimation,
        child: Container(
          margin: EdgeInsets.only(
            top: MediaQuery.of(context).size.height * 0.15,
            left: MediaQuery.of(context).size.width * 0.08,
            right: MediaQuery.of(context).size.width * 0.08,
          ),
          height: MediaQuery.of(context).size.height * 0.70,
          child: ListView.builder(
            physics: BouncingScrollPhysics(),
            padding: EdgeInsets.only(top: 50),
            itemCount: fitnessUiUtils.goalList.length,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () {
                  if (goalid.contains(fitnessUiUtils.goalList[index].id)) {
                    goalid.removeWhere((element) =>
                        element == fitnessUiUtils.goalList[index].id);
                    print("value cointain");
                    setState(() {});
                  } else {
                    goalid.add(fitnessUiUtils.goalList[index].id);
                    setState(() {});
                  }
                },
                child: Container(
                  margin: EdgeInsets.only(top: 10),
                  width: MediaQuery.of(context).size.width * 0.85,
                  height: MediaQuery.of(context).size.height * 0.09,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: goalid.contains(fitnessUiUtils.goalList[index].id)
                        ? Border.all(
                            color: Theme.of(context).primaryColor,
                            width: 2,
                          )
                        : Border.all(width: 0, color: Colors.transparent),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width * 0.1),
                    child: Row(
                      children: [
                        Text(
                          fitnessUiUtils.goalList[index].goalname,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                        Spacer(),
                        !goalid.contains(fitnessUiUtils.goalList[index].id)
                            ? Icon(
                                Icons.circle_outlined,
                                color: Theme.of(context).primaryColor,
                              )
                            : Icon(
                                Icons.check_circle,
                                color: Theme.of(context).primaryColor,
                              ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  } */
