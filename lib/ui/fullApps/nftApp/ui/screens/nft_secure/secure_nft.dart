import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smartkit_pro/ui/fullApps/nftApp/ui/screens/nft_secure/successfull_secure.dart';
import 'package:smartkit_pro/ui/fullApps/nftApp/ui/styles/login_box.dart';

class secureNft extends StatefulWidget {
  const secureNft({Key? key}) : super(key: key);

  @override
  State<secureNft> createState() => _secureNftState();
}

class _secureNftState extends State<secureNft> {
  bool hide = true;

  final PageController _controller = PageController();
  bool onLastPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding:
              EdgeInsets.only(top: MediaQuery.of(context).padding.top + 20),
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Stack(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    margin: EdgeInsets.only(left: 20),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Theme.of(context).colorScheme.onBackground),
                    child: Icon(
                      Icons.arrow_back_ios_new,
                      size: 20,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.05),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.7,
                  child: PageView(
                    controller: _controller,
                    scrollDirection: Axis.horizontal,
                    onPageChanged: (index) {
                      setState(() {
                        onLastPage = (index == 2);
                      });
                    },
                    physics: NeverScrollableScrollPhysics(),
                    children: [phaseOne(), phaseSecound(), phaseThird()],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    if (onLastPage) {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => successfullSecure()));
                    } else {
                      _controller.nextPage(
                          duration: Duration(milliseconds: 500),
                          curve: Curves.easeInOut);
                    }
                  },
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      margin: EdgeInsets.only(
                          left: 20,
                          right: 20,
                          bottom: MediaQuery.of(context).size.height * 0.09),
                      height: MediaQuery.of(context).size.height * 0.08,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Theme.of(context).colorScheme.primary),
                      child: Center(
                        child: onLastPage
                            ? Text(
                                "Done",
                                style: TextStyle(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onBackground,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600),
                              )
                            : Text(
                                "Next",
                                style: TextStyle(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onBackground,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600),
                              ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget phaseThird() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(
              left: 20, top: MediaQuery.of(context).size.height * 0.05),
          child: Text(
            "Confirm secret Phrase!",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 26,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
              left: 20, top: MediaQuery.of(context).size.height * 0.01),
          child: Text(
            "Select earch word in the order it was presented to you",
            style: TextStyle(
              fontSize: 16,
            ),
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.09,
        ),
        Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: Container(
                    width: 25,
                    height: 25,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                          color: Theme.of(context).colorScheme.primary),
                    ),
                    child: Center(
                        child: Icon(
                      Icons.check,
                      size: 18,
                    )),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 1,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                Container(
                  width: 25,
                  height: 25,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                        color: Theme.of(context).colorScheme.primary),
                  ),
                  child: Center(
                      child: Icon(
                    Icons.check,
                    size: 18,
                  )),
                ),
                Expanded(
                  child: Container(
                    height: 1,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 30),
                  child: Container(
                    width: 25,
                    height: 25,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    child: Center(
                      child: Text(
                        "3",
                        style: TextStyle(
                            color: Theme.of(context).scaffoldBackgroundColor),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Create\nPassword",
                    textAlign: TextAlign.center,
                    style:
                        TextStyle(color: Theme.of(context).colorScheme.primary),
                  ),
                  Text(
                    "Secure\nPassword",
                    textAlign: TextAlign.center,
                    style:
                        TextStyle(color: Theme.of(context).colorScheme.primary),
                  ),
                  Text(
                    "Confirm\nPassword",
                    textAlign: TextAlign.center,
                    style:
                        TextStyle(color: Theme.of(context).colorScheme.primary),
                  )
                ],
              ),
            )
          ],
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.01,
        ),
        Flexible(
          child: GridView.count(
            physics: NeverScrollableScrollPhysics(),
            childAspectRatio: 5,
            mainAxisSpacing: 10,
            crossAxisSpacing: 1,
            crossAxisCount: 2,
            children: List.generate(4, (index) => index)
                .map((e) => Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("${e + 1}."),
                        Container(
                          width: 120,
                          decoration: BoxDecoration(
                            color: Theme.of(context)
                                .colorScheme
                                .onSecondary
                                .withOpacity(0.2),
                            border: Border.all(
                                color:
                                    Theme.of(context).colorScheme.onSecondary),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ],
                    ))
                .toList(),
          ),
        ),
        Flexible(
          child: GridView.count(
            physics: NeverScrollableScrollPhysics(),
            childAspectRatio: 5,
            mainAxisSpacing: 10,
            crossAxisSpacing: 1,
            crossAxisCount: 2,
            children: List.generate(4, (index) => index)
                .map((e) => Container(
                      margin: EdgeInsets.only(left: 20, right: 20),
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: Theme.of(context).colorScheme.onSecondary),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(child: Text("Let'sGet")),
                    ))
                .toList(),
          ),
        )
      ],
    );
  }

  Widget phaseSecound() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(
              left: 20, top: MediaQuery.of(context).size.height * 0.05),
          child: Text(
            "Secure Your Password!",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 26,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
              left: 20, top: MediaQuery.of(context).size.height * 0.01),
          child: Text(
            "Write to down on a paper and keep it in a safe place",
            style: TextStyle(
              fontSize: 16,
            ),
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.09,
        ),
        Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: Container(
                    width: 25,
                    height: 25,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                          color: Theme.of(context).colorScheme.primary),
                    ),
                    child: Center(
                        child: Icon(
                      Icons.check,
                      size: 18,
                    )),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 1,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                Container(
                  width: 25,
                  height: 25,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  child: Center(
                    child: Text(
                      "2",
                      style: TextStyle(
                          color: Theme.of(context).scaffoldBackgroundColor),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 1,
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 30),
                  child: Container(
                    width: 25,
                    height: 25,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                          color: Theme.of(context).colorScheme.onBackground,
                          width: 2),
                    ),
                    child: Center(
                      child: Text(
                        "3",
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.onSecondary),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Create\nPassword",
                    textAlign: TextAlign.center,
                    style:
                        TextStyle(color: Theme.of(context).colorScheme.primary),
                  ),
                  Text(
                    "Secure\nPassword",
                    textAlign: TextAlign.center,
                    style:
                        TextStyle(color: Theme.of(context).colorScheme.primary),
                  ),
                  Text(
                    "Confirm\nPassword",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.onSecondary),
                  )
                ],
              ),
            )
          ],
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.08,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Text(
              "Write down your Secret Recovery Phase on a piece of paper and store in safe place."),
        ),
        SizedBox(
          height: 20,
        ),
        Flexible(
          child: GridView.count(
            physics: NeverScrollableScrollPhysics(),
            childAspectRatio: 5,
            mainAxisSpacing: 10,
            crossAxisSpacing: 1,
            crossAxisCount: 2,
            children: List.generate(6, (index) => index)
                .map((e) => Container(
                      margin: EdgeInsets.only(left: 20, right: 20),
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: Theme.of(context).colorScheme.onSecondary),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(child: Text("Let'sGet")),
                    ))
                .toList(),
          ),
        )
      ],
    );
  }

  Widget phaseOne() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(
              left: 20, top: MediaQuery.of(context).size.height * 0.05),
          child: Text(
            "Secure Your NFT!",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 26,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
              left: 20, top: MediaQuery.of(context).size.height * 0.01),
          child: Text(
            "Join our marketplace",
            style: TextStyle(
              fontSize: 16,
            ),
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.09,
        ),
        Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: Container(
                    width: 25,
                    height: 25,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Theme.of(context).colorScheme.primary),
                    child: Center(
                      child: Text(
                        "1",
                        style: TextStyle(
                            color: Theme.of(context).scaffoldBackgroundColor),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 1,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                Container(
                  width: 25,
                  height: 25,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                        color: Theme.of(context).colorScheme.onBackground,
                        width: 2),
                  ),
                  child: Center(
                    child: Text(
                      "2",
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.onSecondary),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 1,
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 30),
                  child: Container(
                    width: 25,
                    height: 25,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                          color: Theme.of(context).colorScheme.onBackground,
                          width: 2),
                    ),
                    child: Center(
                      child: Text(
                        "3",
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.onSecondary),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Create\nPassword",
                    textAlign: TextAlign.center,
                    style:
                        TextStyle(color: Theme.of(context).colorScheme.primary),
                  ),
                  Text(
                    "Secure\nPassword",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.onSecondary),
                  ),
                  Text(
                    "Confirm\nPassword",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.onSecondary),
                  )
                ],
              ),
            )
          ],
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.08,
        ),
        loginBox(
          hintText: 'Password',
          iconColor: Color(0xff89a9fc),
          boxColor: Color(0xffdfe9fe),
          topMargin: 0,
          icons: Icons.lock_outline,
          visibleIcon: true,
        ),
        loginBox(
          hintText: 'Re-type Password',
          iconColor: Color(0xff89a9fc),
          boxColor: Color(0xffdfe9fe),
          topMargin: MediaQuery.of(context).size.height * 0.03,
          icons: Icons.lock_outline,
          visibleIcon: true,
        ),
      ],
    );
  }
}
