import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:smartkit_pro/ui/fullApps/fitness/routes.dart';
import 'package:smartkit_pro/ui/fullApps/fitness/widget/customrRoundedButton.dart';

class Profilescreen extends StatefulWidget {
  const Profilescreen({Key? key}) : super(key: key);

  @override
  State<Profilescreen> createState() => _ProfilescreenState();
}

class _ProfilescreenState extends State<Profilescreen>
    with TickerProviderStateMixin {
  late AnimationController _boxcontainer;
  late Animation<Offset> _titleanimation;

  @override
  void initState() {
    super.initState();

    _boxcontainer =
        AnimationController(vsync: this, duration: Duration(milliseconds: 800));

    _titleanimation = Tween<Offset>(begin: Offset(0, 1), end: Offset(0, 0))
        .animate(
            CurvedAnimation(parent: _boxcontainer, curve: Curves.decelerate));

    _boxcontainer.forward(from: 0.0);
  }

  @override
  void dispose() {
    _boxcontainer.dispose();
    super.dispose();
  }

  _showmodalbottamsheet() {
    return showModalBottomSheet<void>(
        backgroundColor: Theme.of(context).backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(50),
            topRight: Radius.circular(
              50,
            ),
          ),
        ),
        context: context,
        builder: (BuildContext context) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                Text(
                  "Logout",
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Divider(),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                Text(
                  "Are you sure you  want to log out?",
                  style: TextStyle(
                    fontSize: 18,
                    //fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                CustomeRoundedButton(
                  title: "Yes, Logout",
                  width: MediaQuery.of(context).size.width * 0.84,
                  hight: MediaQuery.of(context).size.height * 0.07,
                  borderradius: 40,
                  ontap: () {
                    Navigator.of(context)
                        .pushReplacementNamed(Routes.signInscreen);
                  },
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                CustomeRoundedButton(
                  title: "Cancle",
                  width: MediaQuery.of(context).size.width * 0.84,
                  hight: MediaQuery.of(context).size.height * 0.07,
                  borderradius: 40,
                  ontap: () {
                    Navigator.of(context).pop();
                  },
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
              ],
            ),
          );
        });
  }

  bool swichvalue = false;
  Widget _buildappbar() {
    return SlideTransition(
      position: _titleanimation,
      child: Row(
        children: [
          Image.asset(
            "assets/images/fullApps/fitness/smalllogo.png",
            height: 50,
            width: 50,
          ),
          SizedBox(
            width: 15,
          ),
          Text(
            "Profile",
            style: TextStyle(
              fontSize: 19,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildlisttile(
      {required IconData iconData,
      required String title,
      Color? colors,
      Function? ontap,
      bool? isdarkmode = false}) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: GestureDetector(
        onTap: ontap as void Function()?,
        child: Row(
          children: [
            Icon(
              iconData,
              color: colors ?? Colors.black,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.08,
            ),
            Text(
              title,
              style: TextStyle(
                  fontWeight: FontWeight.w500, color: colors ?? Colors.black),
            ),
            Spacer(),
            isdarkmode!
                ? CupertinoSwitch(
                    value: swichvalue,
                    activeColor: Theme.of(context).primaryColor,
                    onChanged: (value) {
                      swichvalue = value;
                      setState(() {});
                    })
                : Container(),
          ],
        ),
      ),
    );
  }

  Widget _buildpersonaldetail() {
    return SlideTransition(
      position: _titleanimation,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 60,
            backgroundColor: Theme.of(context).primaryColor,
            backgroundImage: AssetImage(
              "assets/images/fullApps/fitness/profileimages.jpg",
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.01,
          ),
          const Text(
            "Christina Ainsley",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.01,
          ),
          const Text(
            "Christina_Ainsley@yourdomin.com",
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.03,
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed(Routes.primescreen);
            },
            child: Container(
              height: MediaQuery.of(context).size.height * 0.13,
              width: MediaQuery.of(context).size.width * 0.90,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: Theme.of(context).primaryColor,
                  gradient: LinearGradient(colors: [
                    Theme.of(context).primaryColor.withOpacity(0.9),
                    Theme.of(context).primaryColor,
                  ])),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height * 0.04,
                          width: MediaQuery.of(context).size.width * 0.15,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.orangeAccent),
                          child: const Center(
                            child: Text(
                              "PRO",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.05,
                        ),
                        const Text(
                          "Upgrade to Premium",
                          style: TextStyle(color: Colors.white),
                        ),
                        const Spacer(),
                        Container(
                          padding: const EdgeInsets.all(5),
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle, color: Colors.white),
                          child: const Icon(
                            Icons.arrow_forward_ios,
                            size: 12,
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.01,
                    ),
                    const Text(
                      "Enjoy Workout Access WIthout ads restriction",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w300),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildlistofbutton() {
    return SlideTransition(
      position: _titleanimation,
      child: Column(
        children: [
          _buildlisttile(
              iconData: Icons.person_outline,
              title: "Edit Profile",
              ontap: () {
                Navigator.of(context).pushNamed(Routes.editprofile);
              }),
          _buildlisttile(
              iconData: Icons.notifications_none,
              title: "Notification",
              ontap: () {
                Navigator.of(context).pushNamed(Routes.editprofile);
              }),
          _buildlisttile(iconData: Icons.security_sharp, title: "Security"),
          _buildlisttile(iconData: Icons.help, title: "Help"),
          _buildlisttile(
              iconData: Icons.remove_red_eye_outlined,
              title: "Dark Theme",
              isdarkmode: true),
          _buildlisttile(
            iconData: Icons.logout,
            title: "Log Out",
            colors: Colors.red,
            ontap: () {
              _showmodalbottamsheet();
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * 0.08,
              left: MediaQuery.of(context).size.width * 0.05,
              right: MediaQuery.of(context).size.width * 0.05),
          child: Column(
            children: [
              _buildappbar(),
              _buildpersonaldetail(),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              Divider(),
              _buildlistofbutton(),
            ],
          ),
        ),
      ),
    );
  }
}
