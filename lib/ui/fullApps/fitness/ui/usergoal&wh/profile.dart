import 'dart:ui';

import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:smartkit_pro/ui/fullApps/fitness/Utils/const.dart';
import 'package:smartkit_pro/ui/fullApps/fitness/Utils/utlis.dart';

import 'package:smartkit_pro/ui/fullApps/fitness/routes.dart';

import 'package:smartkit_pro/ui/fullApps/fitness/widget/customrRoundedButton.dart';
import 'package:smartkit_pro/ui/fullApps/fitness/widget/yourselfappbartitle.dart';
import 'package:country_code_picker/country_code.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen>
    with TickerProviderStateMixin {
  late AnimationController _buttoncontroller;

  late Animation<Offset> _buttonanimation;

  final TextEditingController _fullnamecontoller = TextEditingController();
  TextEditingController nicknamecontoller = TextEditingController();
  TextEditingController emailcontoller = TextEditingController();

  @override
  void initState() {
    super.initState();

    _buttoncontroller = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1500));

    _buttonanimation = Tween<Offset>(begin: Offset(0, 1), end: Offset.zero)
        .animate(CurvedAnimation(
            parent: _buttoncontroller, curve: Curves.decelerate));
    _buttoncontroller.forward();
  }

  @override
  void dispose() {
    super.dispose();

    _buttoncontroller.dispose();
  }

  CountryCode? selectedCountrycode;

  TextEditingController phoneNumberController = TextEditingController();
  Widget _buildappbar() {
    return Align(
      alignment: Alignment.topCenter,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 11.0),
        child: CustomeYourselfappbar(
          title: "Fill Your Profile ",
          substring:
              "Don't worry, you can always change it later, \n or  you can Skip it  for now",
        ),
      ),
    );
  }

  Widget _buildprofilecontainer() {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          // padding: const EdgeInsets.all(7.5),
          decoration: BoxDecoration(
              color: Theme.of(context).backgroundColor, shape: BoxShape.circle),
          child: SizedBox(
              height: MediaQuery.of(context).size.height * (0.15),
              width: MediaQuery.of(context).size.width * (0.3),
              child: CircleAvatar(
                backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                backgroundImage:
                    AssetImage(fitnessUiUtils.getImagePath("profile.jpeg")),
                radius: MediaQuery.of(context).size.height * (0.15),
              )),
        ),
        Align(
          alignment: Alignment.center,
          child: Padding(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.width * (0.225),
              left: MediaQuery.of(context).size.width * (0.22),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(
                  MediaQuery.of(context).size.width * (0.03)),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                child: GestureDetector(
                  onTap: () {
                    // Navigator.of(context).pushNamed(
                    //     Routes.selectProfile,
                    //     arguments: false);
                  },
                  child: Container(
                    alignment: Alignment.center,
                    child: Icon(
                      Icons.edit,
                      color: Theme.of(context).backgroundColor,
                    ),
                    decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor.withOpacity(0.7),
                        borderRadius: BorderRadius.circular(
                            MediaQuery.of(context).size.width * (0.03))),
                    height: MediaQuery.of(context).size.width * (0.08),
                    width: MediaQuery.of(context).size.width * (0.08),
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget _buildFullname() {
    return TextField(
      controller: _fullnamecontoller,
      //textAlign: TextAlign.center,
      style: TextStyle(
        color: Theme.of(context).colorScheme.secondary,
      ),
      cursorColor: Theme.of(context).primaryColor,
      decoration: InputDecoration(
        fillColor: Theme.of(context).primaryColor.withOpacity(0.05),
        filled: true,
        hintText: "Full name",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Theme.of(context).primaryColor,
            width: 1.0,
          ),
          borderRadius: BorderRadius.circular(25.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: BorderSide(color: Colors.transparent),
        ),
        hintStyle: TextStyle(
          color: Theme.of(context).canvasColor,
        ),
      ),
    );
  }

  Widget _buildNickname() {
    return TextField(
      controller: nicknamecontoller,
      //textAlign: TextAlign.center,
      style: TextStyle(
        color: Theme.of(context).colorScheme.secondary,
      ),
      cursorColor: Theme.of(context).primaryColor,
      decoration: InputDecoration(
        fillColor: Theme.of(context).primaryColor.withOpacity(0.05),
        filled: true,
        hintText: "Nick name",
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Theme.of(context).primaryColor,
            width: 1.0,
          ),
          borderRadius: BorderRadius.circular(25.0),
        ),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide: BorderSide(color: Colors.transparent)),
        hintStyle: TextStyle(
          color: Theme.of(context).canvasColor,
        ),
      ),
    );
  }

  Widget _buildemailcontainer() {
    return TextField(
      controller: emailcontoller,
      //textAlign: TextAlign.center,
      style: TextStyle(
        color: Theme.of(context).colorScheme.secondary,
      ),
      cursorColor: Theme.of(context).primaryColor,
      decoration: InputDecoration(
        fillColor: Theme.of(context).primaryColor.withOpacity(0.05),
        filled: true,
        hintText: "Email",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Theme.of(context).primaryColor,
            width: 1.0,
          ),
          borderRadius: BorderRadius.circular(20.0),
        ),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide: BorderSide(color: Colors.transparent)),
        hintStyle: TextStyle(
          color: Theme.of(context).canvasColor,
        ),
        suffixIcon: Icon(Icons.email_outlined),
      ),
    );
  }

  Widget _buildMobileNumberWithCountryCode() {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor.withOpacity(0.05),
        borderRadius: BorderRadius.circular(25),
      ),
      child: Row(
        children: [
          CountryCodePicker(
            onInit: (countryCode) {
              selectedCountrycode = countryCode;
            },
            onChanged: (countryCode) {
              selectedCountrycode = countryCode;
            },
            initialSelection: selectedCountry,
            showCountryOnly: false,
            alignLeft: false,
          ),
          SizedBox(
            width: 10.0,
          ),
          Flexible(
            child: TextField(
              controller: phoneNumberController,
              keyboardType: TextInputType.number,
              cursorColor: Theme.of(context).primaryColor,
              style: TextStyle(
                color: Theme.of(context).colorScheme.secondary,
              ),
              decoration: InputDecoration(
                border: InputBorder.none,
                hintStyle: TextStyle(
                    color: Theme.of(context)
                        .colorScheme
                        .secondary
                        .withOpacity(0.6)),
                hintText: "999-999-999",
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildprofile() {
    return Align(
      alignment: Alignment.center,
      child: Padding(
        padding: EdgeInsets.only(
            top: MediaQuery.of(context).size.height * 0.025,
            left: MediaQuery.of(context).size.width * 0.07,
            right: MediaQuery.of(context).size.width * 0.07),
        child: Column(
          children: [
            _buildprofilecontainer(),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            _buildFullname(),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            _buildNickname(),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            _buildemailcontainer(),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            _buildMobileNumberWithCountryCode(),
          ],
        ),
      ),
    );
  }

  Widget _buildbutton() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CustomeRoundedButton(
            title: "Back",
            width: MediaQuery.of(context).size.width * 0.40,
            hight: MediaQuery.of(context).size.width * 0.15,
            borderradius: 40,
            containercolors: Theme.of(context).primaryColor.withOpacity(0.1),
            textcolor: Theme.of(context).primaryColor,
            ontap: () {
              Navigator.of(context).pop();
            },
            buttonmargin: true,
          ),
          CustomeRoundedButton(
            title: "Next",
            width: MediaQuery.of(context).size.width * 0.40,
            hight: MediaQuery.of(context).size.width * 0.15,
            borderradius: 40,
            ontap: () {
              Navigator.of(context).pushNamed(Routes.signinmethod);
            },
            buttonmargin: true,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SlideTransition(position: _buttonanimation, child: _buildappbar()),
            SlideTransition(position: _buttonanimation, child: _buildprofile()),
            // Spacer(),
            SizedBox(height: MediaQuery.of(context).size.height * 0.15),
            SlideTransition(position: _buttonanimation, child: _buildbutton()),
            //SizedBox(height: MediaQuery.of(context).size.height * 0.15),
          ],
        ),
      ),
    );
  }
}
