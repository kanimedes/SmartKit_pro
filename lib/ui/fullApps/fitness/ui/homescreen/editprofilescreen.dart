import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:smartkit_pro/ui/fullApps/fitness/Utils/const.dart';
import 'package:smartkit_pro/ui/fullApps/fitness/widget/customrRoundedButton.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  // List<String> _locations = ['A', 'B', 'C', 'D'];
  late String _selectedLocation;
  CountryCode? selectedCountrycode;
  TextEditingController phoneNumberController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _selectedLocation = "usa";
  }

  Widget _buildMobileNumberWithCountryCode() {
    return Container(
      decoration: BoxDecoration(
          // color: Theme.of(context).primaryColor.withOpacity(0.1),
          borderRadius: BorderRadius.circular(20),
          border: Border.all()),
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

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: Column(children: [
            Row(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.12,
                ),
                IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: Icon(Icons.arrow_back_ios))
              ],
            ),
            TextField(
              //textAlign: TextAlign.center,
              style: TextStyle(
                  color: Theme.of(context).colorScheme.secondary,
                  fontWeight: FontWeight.bold),
              decoration: InputDecoration(
                fillColor: Theme.of(context).primaryColor.withOpacity(0.01),
                filled: true,
                hintText: "name ",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                hintStyle: TextStyle(
                    color: Theme.of(context).canvasColor,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            TextField(
              //textAlign: TextAlign.center,
              style: TextStyle(
                  color: Theme.of(context).colorScheme.secondary,
                  fontWeight: FontWeight.bold),
              decoration: InputDecoration(
                fillColor: Theme.of(context).primaryColor.withOpacity(0.01),
                filled: true,
                hintText: "middle name ",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                hintStyle: TextStyle(
                    color: Theme.of(context).canvasColor,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            TextField(
              //textAlign: TextAlign.center,
              style: TextStyle(
                  color: Theme.of(context).colorScheme.secondary,
                  fontWeight: FontWeight.bold),
              decoration: InputDecoration(
                fillColor: Theme.of(context).primaryColor.withOpacity(0.01),
                filled: true,
                hintText: "email ",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                hintStyle: TextStyle(
                    color: Theme.of(context).canvasColor,
                    fontWeight: FontWeight.bold),
                suffixIcon: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.email),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            // Container(
            //     color: Colors.pink,
            //     margin: EdgeInsets.symmetric(horizontal: 5),
            //     height: 80,
            //     child: Center(
            //       child: DropdownButton(
            //         isExpanded: true,
            //         iconSize: 30.0,
            //         dropdownColor: Colors.white,
            //         style: TextStyle(color: Colors.blue),
            //         items: _locations.map(
            //           (val) {
            //             return DropdownMenuItem<String>(
            //               value: val,
            //               child: Text(val),
            //             );
            //           },
            //         ).toList(),
            //         onChanged: (String? val) {
            //           setState(
            //             () {
            //               _selectedLocation = val!;
            //             },
            //           );
            //         },
            //         value: _selectedLocation,
            //       ),
            //     ))
            _buildMobileNumberWithCountryCode(),
            Spacer(),
            CustomeRoundedButton(
                title: "Update",
                width: MediaQuery.of(context).size.width * 0.84,
                hight: MediaQuery.of(context).size.height * 0.08),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            )
          ]),
        ),
      ),
    );
  }
}
