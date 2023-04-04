import 'package:flutter/material.dart';
import 'package:smartkit_pro/ui/fullApps/fitness/Utils/utlis.dart';

import 'package:smartkit_pro/ui/fullApps/fitness/routes.dart';
import 'package:smartkit_pro/ui/fullApps/fitness/widget/customeBackbutton.dart';
import 'package:smartkit_pro/ui/fullApps/fitness/widget/customrRoundedButton.dart';
import 'package:smartkit_pro/ui/fullApps/fitness/widget/yourselfappbartitle.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen>
    with TickerProviderStateMixin {
  bool value = false;

  late AnimationController animationController;
  late AnimationController _titlecontroller;
  late AnimationController _buttoncontroller;
  late Animation<Offset> _titleanimation;

  late Animation<Offset> _buttonanimation;

  @override
  void initState() {
    super.initState();
    animationController = new AnimationController(
      vsync: this,
      duration: new Duration(milliseconds: 700),
    );
    animationController.forward();
    _titlecontroller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 800));
    _buttoncontroller = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1000));
    _titleanimation = Tween<Offset>(begin: Offset(0, 1), end: Offset.zero)
        .animate(CurvedAnimation(
            parent: _titlecontroller, curve: Curves.decelerate));
    _buttonanimation = Tween<Offset>(begin: Offset(0, 1), end: Offset.zero)
        .animate(CurvedAnimation(
            parent: _buttoncontroller, curve: Curves.decelerate));
    _buttoncontroller.forward();
    _titlecontroller.forward(from: 0.01);
    animationController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  Widget _builappbar() {
    return SlideTransition(
      position: _titleanimation,
      child: CustomeYourselfappbar(
        title: "Login  to Your \n Account",
        titlesize: 33,
        crossAxisAlignment: CrossAxisAlignment.start,
        letterspacing: 1.2,
      ),
    );
  }

  Widget _buildemailcontainer() {
    return SlideTransition(
      position: _titleanimation,
      child: TextField(
        //textAlign: TextAlign.center,
        style: TextStyle(
          color: Theme.of(context).colorScheme.secondary,
        ),
        decoration: InputDecoration(
            fillColor: Theme.of(context).primaryColor.withOpacity(0.01),
            filled: true,
            hintText: "Email",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            hintStyle: TextStyle(
                color: Theme.of(context).canvasColor,
                fontWeight: FontWeight.bold),
            prefixIcon: Icon(Icons.email_outlined)),
      ),
    );
  }

  Widget _buildpassword() {
    return SlideTransition(
      position: _titleanimation,
      child: TextField(
        //textAlign: TextAlign.center,
        style: TextStyle(
          color: Theme.of(context).colorScheme.secondary,
        ),
        decoration: InputDecoration(
          fillColor: Theme.of(context).primaryColor.withOpacity(0.01),
          filled: true,
          hintText: "Password",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          hintStyle: TextStyle(
              color: Theme.of(context).canvasColor,
              fontWeight: FontWeight.bold),
          prefixIcon: Icon(Icons.lock_outline),
          suffixIcon: IconButton(
            onPressed: () {},
            icon: Icon(Icons.remove_red_eye),
          ),
        ),
      ),
    );
  }

  Widget _buldremebercontainet() {
    return SlideTransition(
      position: _buttonanimation,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Checkbox(
              activeColor: Theme.of(context).primaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              value: value,
              onChanged: (status) {
                setState(() {
                  value = status!;
                });
              }),
          Text("Remeber Me",
              style: TextStyle(color: Theme.of(context).primaryColor))
        ],
      ),
    );
  }

  Widget _buildSignUpButton() {
    return SlideTransition(
      position: _buttonanimation,
      child: CustomeRoundedButton(
        title: "Sign In",
        width: MediaQuery.of(context).size.width * 0.90,
        hight: MediaQuery.of(context).size.height * 0.06,
        borderradius: 40,
        ontap: () {
          Navigator.of(context).pushReplacementNamed(Routes.fitnesshomepage);
        },
      ),
    );
  }

  Widget _buildor() {
    return SlideTransition(
      position: _buttonanimation,
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              height: 1,
              //  width: 150,
              child: Divider(
                color: Theme.of(context).colorScheme.secondary.withOpacity(0.4),
              ),
            ),
          ),
          Text(
            "or continue with",
            style: TextStyle(
              fontSize: 15,
              //fontWeight: FontWeight.bold,
              //letterSpacing: 1,
            ),
            textAlign: TextAlign.center,
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              height: 1,
              //  width: 150,
              child: Divider(
                color: Theme.of(context).colorScheme.secondary.withOpacity(0.4),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _roundedbuttonforsocialmedia(
      {required String imagename, Function? ontap}) {
    return SlideTransition(
      position: _buttonanimation,
      child: GestureDetector(
        onTap: ontap as void Function()?,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          width: MediaQuery.of(context).size.width * 0.25,
          height: MediaQuery.of(context).size.height * 0.07,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: Colors.grey.withOpacity(0.1),
            ),
            // shape: BoxShape.circle,
          ),
          child: Image(
            image: AssetImage(
              fitnessUiUtils.getImagePath(imagename),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSocalmediabutton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _roundedbuttonforsocialmedia(imagename: "fb.png"),
        _roundedbuttonforsocialmedia(imagename: "google.png"),
        _roundedbuttonforsocialmedia(imagename: "apple.png"),
      ],
    );
  }

  Widget _buildnoaccounttext() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Don't Have AAccount "),
        TextButton(
            onPressed: () {
              Navigator.of(context).pushNamed(Routes.signUpscreen);
            },
            child: Text("Sign In"))
      ],
    );
  }

  Widget _buildforgetpasswordcontainer() {
    return Center(
      child: SlideTransition(
        position: _buttonanimation,
        child: TextButton(
          onPressed: () {
            Navigator.of(context).pushNamed(Routes.forgetpasseord);
          },
          child: Text(
            "Forgt the password?",
            style: TextStyle(color: Theme.of(context).primaryColor),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _builappbar(),
                SizedBox(height: MediaQuery.of(context).size.height * 0.035),
                _buildemailcontainer(),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                _buildpassword(),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.015,
                ),
                _buldremebercontainet(),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                _buildSignUpButton(),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                _buildforgetpasswordcontainer(),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                ),
                _buildor(),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                _buildSocalmediabutton(),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 15.0),
              child: _buildnoaccounttext(),
            ),
          ),
          Positioned(
            top: 15,
            left: 10,
            child: Padding(
              padding: const EdgeInsets.only(top: 45.0),
              child: CustomBackButton(),
            ),
          ),
        ],
      ),
    );
  }
}
