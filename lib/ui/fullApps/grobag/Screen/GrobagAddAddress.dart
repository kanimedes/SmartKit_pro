import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smartkit_pro/ui/fullApps/grobag/Helper/GrobagAppbar.dart';
import 'package:smartkit_pro/ui/fullApps/grobag/Helper/GrobagColor.dart';

class GrobagAddAddress extends StatefulWidget {
  const GrobagAddAddress({Key? key}) : super(key: key);

  @override
  _GrobagAddAddressState createState() => _GrobagAddAddressState();
}

class _GrobagAddAddressState extends State<GrobagAddAddress> {
  List<String> cityList = ['Ahmdabad', 'Mumbai', 'Pune', 'Delhi', 'Banglore'];
  List<String> areaList = ['Time Square', 'New Delhi', 'Adalaj'];
  TextEditingController? nameC,
      mobileC,
      pincodeC,
      addressC,
      landmarkC,
      stateC,
      countryC,
      altMobC;
  FocusNode? nameFocus,
      monoFocus,
      almonoFocus,
      addFocus,
      landFocus,
      locationFocus = FocusNode();

  bool checkedDefault = false, isArea = true;
  int selectedType = 1;
  String? area = 'Time Square', city = 'Ahmdabad';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GrobagAppbar(
        title: 'Add Address',
      ),
      body: Column(
        children: [
          Expanded(
            child: Form(
                // key: _formkey,
                child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          child: Column(
                            children: <Widget>[
                              setUserName(),
                              setMobileNo(),
                              setAltMobileNo(),
                              setAddress(),
                              setCities(),
                              setArea(),
                              setPincode(),
                              setStateField(),
                              setCountry(),
                              typeOfAddress(),
                            ],
                          ),
                        ),
                        defaultAdd(),
                      ],
                    ),
                  ),
                ),
              ],
            )),
          ),
          CupertinoButton(
            padding: EdgeInsets.zero,
            child: Container(
              margin: EdgeInsets.all(20),
              height: 48,
              decoration: BoxDecoration(
                color: primary,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Center(
                child: Text("Save",
                    style: TextStyle(
                      color: white,
                    )),
              ),
            ),
            onPressed: () {
              //  Navigator.push(context,MaterialPageRoute(builder: (context) => GrobagCheckout()));
            },
          ),
        ],
      ),
    );
  }

  typeOfAddress() {
    return Card(
      elevation: 0.1,
      child: Row(
        children: [
          Flexible(
            fit: FlexFit.loose,
            child: InkWell(
              child: Row(
                children: [
                  Radio(
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    groupValue: selectedType,
                    activeColor: fontColor,
                    value: 1,
                    onChanged: (dynamic val) {},
                  ),
                  Text('Home')
                ],
              ),
              onTap: () {
                setState(() {
                  selectedType = 1;
                });
              },
            ),
          ),
          Flexible(
            fit: FlexFit.loose,
            child: InkWell(
              child: Row(
                children: [
                  Radio(
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    groupValue: selectedType,
                    activeColor: fontColor,
                    value: 2,
                    onChanged: (dynamic val) {},
                  ),
                  Text('Office')
                ],
              ),
              onTap: () {
                setState(() {
                  selectedType = 2;
                });
              },
            ),
          ),
          Flexible(
            fit: FlexFit.loose,
            child: InkWell(
              child: Row(
                children: [
                  Radio(
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    groupValue: selectedType,
                    activeColor: fontColor,
                    value: 3,
                    onChanged: (dynamic val) {},
                  ),
                  Text('Other')
                ],
              ),
              onTap: () {
                setState(() {
                  selectedType = 3;
                });
              },
            ),
          )
        ],
      ),
    );
  }

  defaultAdd() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Card(
        elevation: 0.1,
        child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
            ),
            child: SwitchListTile(
              value: checkedDefault,
              activeColor: Theme.of(context).accentColor,
              dense: true,
              onChanged: (newValue) {
                if (mounted) {
                  setState(() {
                    checkedDefault = newValue;
                  });
                }
              },
              title: Text(
                'Default Address',
                style: Theme.of(context)
                    .textTheme
                    .subtitle2!
                    .copyWith(color: fontLight, fontWeight: FontWeight.bold),
              ),
            )),
      ),
    );
  }

  setCountry() {
    return Card(
      elevation: 0.1,
      child: TextFormField(
        keyboardType: TextInputType.text,
        textCapitalization: TextCapitalization.sentences,
        controller: countryC,
        style:
            Theme.of(context).textTheme.subtitle2!.copyWith(color: fontColor),
        onSaved: (String? value) {},
        decoration: InputDecoration(
            hintText: 'Country',
            isDense: true,
            enabledBorder: outlineborderedittext,
            focusedBorder: outlineborderedittext),
      ),
    );
  }

  setStateField() {
    return Card(
      elevation: 0.1,
      child: TextFormField(
        keyboardType: TextInputType.text,
        textCapitalization: TextCapitalization.sentences,
        controller: stateC,
        style:
            Theme.of(context).textTheme.subtitle2!.copyWith(color: fontColor),
        onChanged: (v) => setState(() {}),
        onSaved: (String? value) {},
        decoration: InputDecoration(
            hintText: 'State',
            isDense: true,
            enabledBorder: outlineborderedittext,
            focusedBorder: outlineborderedittext),
      ),
    );
  }

  setUserName() {
    return Card(
      elevation: 0.1,
      child: TextFormField(
        keyboardType: TextInputType.text,
        textInputAction: TextInputAction.next,
        focusNode: nameFocus,
        controller: nameC,
        textCapitalization: TextCapitalization.words,
        onSaved: (String? value) {},
        onFieldSubmitted: (v) {
          _fieldFocusChange(context, nameFocus!, monoFocus);
        },
        style:
            Theme.of(context).textTheme.subtitle2!.copyWith(color: fontColor),
        decoration: InputDecoration(
            isDense: true,
            hintText: 'Name',
            enabledBorder: outlineborderedittext,
            focusedBorder: outlineborderedittext),
      ),
    );
  }

  OutlineInputBorder outlineborderedittext = OutlineInputBorder(
    borderSide: BorderSide(width: 0.5, color: white),
    borderRadius: BorderRadius.circular(10.0),
  );

  setMobileNo() {
    return Card(
      elevation: 0.1,
      child: TextFormField(
        keyboardType: TextInputType.number,
        controller: mobileC,
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        textInputAction: TextInputAction.next,
        focusNode: monoFocus,
        style:
            Theme.of(context).textTheme.subtitle2!.copyWith(color: fontColor),
        onSaved: (String? value) {},
        onFieldSubmitted: (v) {
          _fieldFocusChange(context, monoFocus!, almonoFocus);
        },
        decoration: InputDecoration(
            hintText: 'Mobile Number',
            isDense: true,
            enabledBorder: outlineborderedittext,
            focusedBorder: outlineborderedittext),
      ),
    );
  }

  _fieldFocusChange(
      BuildContext context, FocusNode currentFocus, FocusNode? nextFocus) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  setAltMobileNo() {
    return Card(
      elevation: 0.1,
      child: TextFormField(
        keyboardType: TextInputType.number,
        controller: altMobC,
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        textInputAction: TextInputAction.next,
        focusNode: almonoFocus,
        style:
            Theme.of(context).textTheme.subtitle2!.copyWith(color: fontColor),
        onSaved: (String? value) {},
        onFieldSubmitted: (v) {
          _fieldFocusChange(context, almonoFocus!, addFocus);
        },
        decoration: InputDecoration(
            isDense: true,
            hintText: 'Alternative Mobile',
            enabledBorder: outlineborderedittext,
            focusedBorder: outlineborderedittext),
      ),
    );
  }

  setCities() {
    return Card(
        elevation: 0.1,
        child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8),
            child: DropdownButtonFormField(
              iconEnabledColor: fontColor,
              isDense: true,
              hint: Text(
                'City',
              ),
              value: city,
              style: Theme.of(context)
                  .textTheme
                  .subtitle2!
                  .copyWith(color: fontColor),
              onChanged: (String? newValue) {
                if (mounted) {
                  setState(() {
                    city = newValue;
                  });
                }
              },
              items: cityList.map((String user) {
                return DropdownMenuItem<String>(
                  value: user,
                  child: Text(
                    user,
                  ),
                );
              }).toList(),
              decoration: InputDecoration(
                  isDense: true,
                  contentPadding: EdgeInsets.symmetric(vertical: 5),
                  enabledBorder: outlineborderedittext,
                  focusedBorder: outlineborderedittext),
            )));
  }

  setArea() {
    return Card(
      elevation: 0.1,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8),
        child: DropdownButtonFormField(
          iconEnabledColor: fontColor,
          isDense: true,
          style:
              Theme.of(context).textTheme.subtitle2!.copyWith(color: fontColor),
          hint: Text(
            'Area',
          ),
          value: area,
          onChanged: isArea
              ? (dynamic newValue) {
                  if (mounted) {
                    setState(() {
                      area = newValue;
                    });
                  }
                }
              : null,
          items: areaList.map((String user) {
            return DropdownMenuItem<String>(
              value: user,
              child: Text(
                user,
              ),
            );
          }).toList(),
          decoration: InputDecoration(
              isDense: true,
              contentPadding: EdgeInsets.symmetric(vertical: 5),
              enabledBorder: outlineborderedittext,
              focusedBorder: outlineborderedittext),
        ),
      ),
    );
  }

  setAddress() {
    return Row(
      children: [
        Expanded(
          child: Card(
            elevation: 0.1,
            child: TextFormField(
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.next,
              textCapitalization: TextCapitalization.sentences,
              style: Theme.of(context)
                  .textTheme
                  .subtitle2!
                  .copyWith(color: fontColor),
              focusNode: addFocus,
              controller: addressC,
              onSaved: (String? value) {},
              onFieldSubmitted: (v) {
                _fieldFocusChange(context, addFocus!, locationFocus);
              },
              decoration: InputDecoration(
                  hintText: 'Address',
                  isDense: true,
                  enabledBorder: outlineborderedittext,
                  focusedBorder: outlineborderedittext),
            ),
          ),
        ),
        Card(
          margin: EdgeInsetsDirectional.only(start: 5),
          elevation: 0.1,
          child: IconButton(
            icon: Icon(
              Icons.my_location,
              size: 20,
            ),
            focusNode: locationFocus,
            onPressed: () {},
          ),
        )
      ],
    );
  }

  setPincode() {
    return Card(
      elevation: 0.1,
      child: TextFormField(
        keyboardType: TextInputType.number,
        controller: pincodeC,
        style:
            Theme.of(context).textTheme.subtitle2!.copyWith(color: fontColor),
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        onSaved: (String? value) {},
        decoration: InputDecoration(
            hintText: 'Pincode',
            isDense: true,
            enabledBorder: outlineborderedittext,
            focusedBorder: outlineborderedittext),
      ),
    );
  }
}
