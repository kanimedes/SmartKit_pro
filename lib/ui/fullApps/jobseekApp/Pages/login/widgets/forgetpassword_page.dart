import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smartkit_pro/ui/fullApps/jobseekApp/Pages/login/widgets/verificaiton_page.dart';
import 'package:smartkit_pro/ui/fullApps/jobseekApp/UI/widgets/app_bar.dart';
import 'package:smartkit_pro/ui/fullApps/jobseekApp/widget/app_large_text.dart';
import 'package:smartkit_pro/ui/fullApps/jobseekApp/widget/app_text.dart';


class forgetPassword extends StatefulWidget {
  const forgetPassword({Key? key}) : super(key: key);

  @override
  State<forgetPassword> createState() => _forgetPasswordState();
}

class _forgetPasswordState extends State<forgetPassword> {
  List forgetPassword = ["E-mail", "Mobile Number"];
  CountryCode? selectedCountrycode;
  final String initialCountryCode = "IN"; // change your initialCountry Code
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
              top: MediaQuery.of(context).padding.top + 10,
              left: 20,
              right: 20),
          child: Column(
            children: [
              CommanAppBar(title: ""),
              AppLargeText(
                text: "Jobseek",
                color: Theme.of(context).colorScheme.primary,
                size: 24,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              AppLargeText(
                text: "Forgot Password",
                color: Theme.of(context).colorScheme.secondary,
                size: 24,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              Text(
                "Enter your email or phone number, we will \nsend you verification code",
                style: TextStyle(
                  color:
                      Theme.of(context).colorScheme.secondary.withOpacity(0.4),
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.07,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Theme.of(context).colorScheme.onPrimary),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(2, (index) => index)
                          .map(
                            (e) => GestureDetector(
                              onTap: () {
                                setState(() {
                                  currentIndex = e;
                                });
                              },
                              child: Container(
                                margin: const EdgeInsets.all(8),
                                width: MediaQuery.of(context).size.width * 0.3,
                                decoration: BoxDecoration(
                                    color: e == currentIndex
                                        ? Color(0xff1d2032)
                                        : Colors.transparent,
                                    borderRadius: BorderRadius.circular(12)),
                                child: Center(
                                  child: AppText(
                                    text: forgetPassword[e],
                                    color:
                                        Theme.of(context).colorScheme.secondary,
                                    size: 12,
                                  ),
                                ),
                              ),
                            ),
                          )
                          .toList(),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.09,
              ),
              forgetTab(currentIndex),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.28,
              ),
              GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>phoneVerificaiton()));
                },
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.07,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  child: Center(
                      child: AppLargeText(
                    text: "Send code",
                    color:
                        Theme.of(context).colorScheme.secondary.withOpacity(0.7),
                    size: 18,
                  )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget forgetTab(int currentindex) {
    if (currentIndex == 0) {
      return emailFoget();
    } else {
      return phoneVerificaitonumber();
    }
  }

  Widget emailFoget() {
    return Container(
      height: MediaQuery.of(context).size.height * 0.07,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
              color: Theme.of(context).colorScheme.secondary.withOpacity(0.5))),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Icon(
              Icons.email_outlined,
              color: Theme.of(context).colorScheme.secondary.withOpacity(0.6),
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.05,
          ),
          Flexible(
            child: Center(
              child: TextFormField(
                /*validator: (value) => validateEmail(value),*/
                decoration: InputDecoration.collapsed(
                  hintText: "E-mail",
                  hintStyle: TextStyle(
                      color: Theme.of(context)
                          .colorScheme
                          .secondary
                          .withOpacity(0.6)),
                  border: InputBorder.none,
                ),
                style:
                    TextStyle(color: Theme.of(context).colorScheme.secondary),
                maxLines: 1,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget phoneVerificaitonumber() {
    return Container(
      height: MediaQuery.of(context).size.height * 0.07,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
              color: Theme.of(context).colorScheme.primary.withOpacity(0.5))),
      child: Row(
        children: [
          Flexible(
            child: Center(
                child:  Row(
                  children: [
                    IgnorePointer(
                      child: CountryCodePicker(
                        onInit: (countryCode) {
                          selectedCountrycode = countryCode;
                        },
                        onChanged: (countryCode) {
                          selectedCountrycode = countryCode;
                        },
                        initialSelection: initialCountryCode,
                        showCountryOnly: false,
                        alignLeft: false,
                        textStyle: TextStyle(color: Colors.red),
                      ),
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Flexible(
                      child: TextField(
                        keyboardType: TextInputType.number,
                        cursorColor: Theme.of(context).primaryColor,
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                        decoration: InputDecoration(
                          isDense: true,
                          border: InputBorder.none,
                          hintStyle: TextStyle(
                              color:
                              Theme.of(context).colorScheme.secondary.withOpacity(0.6)),
                          hintText: "+91 999-999-999",
                        ),
                      ),
                    )
                  ],
                )),
          ),
        ],
      ),
    );
  }

}
