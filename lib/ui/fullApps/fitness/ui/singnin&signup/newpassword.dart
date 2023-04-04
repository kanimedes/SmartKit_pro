import 'package:flutter/material.dart';

import 'package:smartkit_pro/ui/fullApps/fitness/Utils/utlis.dart';
import 'package:smartkit_pro/ui/fullApps/fitness/routes.dart';

import 'package:smartkit_pro/ui/fullApps/fitness/widget/customrRoundedButton.dart';

class NewPasswordScreen extends StatefulWidget {
  const NewPasswordScreen({Key? key}) : super(key: key);

  @override
  State<NewPasswordScreen> createState() => _NewPasswordScreenState();
}

class _NewPasswordScreenState extends State<NewPasswordScreen> {
  bool value = false;

  Widget _buildimage() {
    return Image(
      image: AssetImage(
        fitnessUiUtils.getImagePath("password.jpg"),
      ),
      height: MediaQuery.of(context).size.height * 0.45,
      width: MediaQuery.of(context).size.width * 0.84,
    );
  }

  Widget _buildpasswordcontainer() {
    return TextField(
      //textAlign: TextAlign.center,
      style: TextStyle(
          color: Theme.of(context).colorScheme.secondary,
          fontWeight: FontWeight.bold),
      obscureText: true,
      decoration: InputDecoration(
        fillColor: Theme.of(context).primaryColor.withOpacity(0.01),
        filled: true,
        hintText: "Password",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        hintStyle: TextStyle(
            color: Theme.of(context).canvasColor, fontWeight: FontWeight.bold),
        prefixIcon: Icon(
          Icons.lock_outline,
          color: Colors.grey,
        ),
        suffixIcon: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.remove_red_eye,
            color: Colors.grey,
          ),
        ),
      ),
    );
  }

  Widget _buildconfirmpasswordcontainer() {
    return TextField(
      //textAlign: TextAlign.center,
      style: TextStyle(
          color: Theme.of(context).colorScheme.secondary,
          fontWeight: FontWeight.bold),
      obscureText: true,
      decoration: InputDecoration(
        fillColor: Theme.of(context).primaryColor.withOpacity(0.01),
        filled: true,
        hintText: "confirm -Password",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        hintStyle: TextStyle(
            color: Theme.of(context).canvasColor, fontWeight: FontWeight.bold),
        prefixIcon: Icon(
          Icons.lock_outline,
          color: Colors.grey,
        ),
        suffixIcon: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.remove_red_eye,
            color: Colors.grey,
          ),
        ),
      ),
    );
  }

  Widget _buldremebercontainet() {
    return Row(
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
    );
  }

  Widget _buildsubmitbutton() {
    return CustomeRoundedButton(
      title: "Continer",
      width: MediaQuery.of(context).size.width * 0.84,
      hight: MediaQuery.of(context).size.height * 0.08,
      buttonmargin: true,
      ontap: () {
        showDialog(
            context: context,
            builder: (context) => Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: Color(0x00ffffff),
                    borderRadius: BorderRadius.all(
                      Radius.circular(32),
                    ),
                    // color: Theme.of(context).backgroundColor.withOpacity(0.1),
                  ),
                  alignment: Alignment.center,
                  child: AlertDialog(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(32.0))),
                    content: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 0.0, vertical: 10),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image(
                            image: AssetImage(
                              fitnessUiUtils.getImagePath("done.png"),
                            ),
                            height: MediaQuery.of(context).size.height * 0.15,
                          ),
                          SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.035),
                          Text(
                            "Congratulations",
                            style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: 25,
                              letterSpacing: 0.8,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.015),
                          Text(
                            "Your account  ready  to use",
                            style: TextStyle(
                                color: Theme.of(context).colorScheme.secondary),
                          ),
                          SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.015),
                          CustomeRoundedButton(
                            title: "Go To HomePage",
                            fontsize: 15,
                            width: MediaQuery.of(context).size.width * 0.84,
                            hight: MediaQuery.of(context).size.height * 0.06,
                            ontap: () {
                              Navigator.of(context)
                                  .pushReplacementNamed(Routes.fitnesshomepage);
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildimage(),
                    Text(
                      "Create Your New Password,",
                      style: TextStyle(fontSize: 18),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.04,
                    ),
                    _buildpasswordcontainer(),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    _buildconfirmpasswordcontainer(),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.01,
                    ),
                    _buldremebercontainet(),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.01,
                    ),
                    _buildsubmitbutton()
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
