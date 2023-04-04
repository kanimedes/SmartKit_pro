import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:smartkit_pro/ui/fullApps/fitness/routes.dart';
import 'package:smartkit_pro/ui/fullApps/fitness/widget/customrRoundedButton.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({Key? key}) : super(key: key);

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  Widget _buildSmsCodeContainer() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: PinCodeTextField(
        onChanged: (value) {},
        keyboardType: TextInputType.number,
        appContext: context,
        length: 4,
        obscureText: false,
        textStyle: TextStyle(
          color: Theme.of(context).primaryColor,
        ),
        pinTheme: PinTheme(
          selectedFillColor: Theme.of(context).backgroundColor,
          inactiveColor: Theme.of(context).primaryColor,
          activeColor: Theme.of(context).backgroundColor.withOpacity(0.1),
          inactiveFillColor: Theme.of(context).primaryColor,
          selectedColor: Theme.of(context).primaryColor,
          shape: PinCodeFieldShape.box,
          borderRadius: BorderRadius.circular(10),
          fieldHeight: 50,
          fieldWidth: 40,
          activeFillColor: Theme.of(context).primaryColor,
          borderWidth: 1.5,
        ),
        cursorColor: Theme.of(context).primaryColor,
        animationDuration: Duration(milliseconds: 300),
        backgroundColor: Theme.of(context).backgroundColor,

        //enableActiveFill: true,
        controller: _controller,
      ),
    );
  }

  Widget _buildforgottype() {
    return Text(
      "Code has been send to +1 814****474,",
      style: TextStyle(
        fontSize: 15,
      ),
    );
  }

  Widget _buildsubmitbutton() {
    return CustomeRoundedButton(
      title: "Verify",
      width: MediaQuery.of(context).size.width * 0.84,
      hight: MediaQuery.of(context).size.height * 0.082,
      buttonmargin: true,
      ontap: () {
        Navigator.of(context).pushNamed(Routes.passwordscreen);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Theme.of(context).primaryColor.withOpacity(0.1),
      body: Stack(
        alignment: Alignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildforgottype(),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.025,
                ),
                _buildSmsCodeContainer(),
              ],
            ),
          ),
          Align(alignment: Alignment.bottomCenter, child: _buildsubmitbutton())
        ],
      ),
    );
  }
}
