import 'package:flutter/material.dart';
import 'package:smartkit_pro/ui/fullApps/hotelBooking/helper/constants.dart';
import 'package:smartkit_pro/ui/fullApps/hotelBooking/model/hotel.dart';
import 'package:smartkit_pro/ui/fullApps/hotelBooking/theme/colors.dart';
import 'package:smartkit_pro/ui/fullApps/hotelBooking/widget/actionChip.dart';
import 'package:smartkit_pro/ui/fullApps/hotelBooking/widget/appButton.dart';
import 'package:smartkit_pro/ui/fullApps/hotelBooking/widget/appTextField.dart';

List<String> countries = [
  'Canada',
  'China',
  'France',
  'Finland',
  'Kenya',
  'Japan',
  'Canada',
  'China',
];

List<String> sortBy = [
  'Recommended',
  'Top Rated',
  'Bookmarked',
  'Popular',
  'Trending',
  'Top Cheapest',
];

List<String> facilities = [
  'Spa',
  'Outdoor restaurant',
  'Poolside bar',
  'Car parking',
  'Swimming pool',
  'Jacuzzi',
  'Public computer',
  'Interconnecting rooms',
  '24 Hour security'
];

List<String> accommodation = [
  'Hotel',
  'Motel',
  'Camping',
  'Tourist' 'house',
  'Youth' 'hostel',
  'Camping field',
  'Boutique hotel',
  'Hostel',
  'Bungalow',
  'Agro Tourism'
];

class NavigationSearchScreen extends StatefulWidget {
  const NavigationSearchScreen({Key? key}) : super(key: key);

  @override
  State<NavigationSearchScreen> createState() => _NavigationSearchScreenState();
}

class _NavigationSearchScreenState extends State<NavigationSearchScreen> {
  late FocusNode focusNode = FocusNode();

  List<int> selectedCountry = List.empty(growable: true);
  List<int> selectedSortResults = List.empty(growable: true);
  List<int> selectedStarRatings = List.empty(growable: true);
  List<int> selectedFacilities = List.empty(growable: true);
  List<int> selectedAccommodationTypes = List.empty(growable: true);

  RangeValues _currentRangeValues = const RangeValues(50, 2000);

  void onCountryTap(int index, StateSetter setter, String from) {
    setter(() {
      if (from == 'country') {
        selectedCountry.contains(index)
            ? selectedCountry.remove(index)
            : selectedCountry.add(index);
      } else if (from == 'sort') {
        selectedSortResults.contains(index)
            ? selectedSortResults.remove(index)
            : selectedSortResults.add(index);
      } else if (from == 'rating') {
        selectedStarRatings.contains(index)
            ? selectedStarRatings.remove(index)
            : selectedStarRatings.add(index);
      } else if (from == 'facilities') {
        selectedFacilities.contains(index)
            ? selectedFacilities.remove(index)
            : selectedFacilities.add(index);
      } else if (from == 'accommodation') {
        selectedAccommodationTypes.contains(index)
            ? selectedAccommodationTypes.remove(index)
            : selectedAccommodationTypes.add(index);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppTextFieldWithSuffixIcon(
              prefixIcon: Icons.search_outlined,
              focusNode: focusNode,
              hintText: 'Search Hotels',
              postfixIcon: Icons.filter_list_alt,
              postfixIconCallBack: () {
                showModalBottomSheet(
                  isScrollControlled: true,
                  isDismissible: false,
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25),
                        topRight: Radius.circular(25)),
                  ),
                  context: context,
                  builder: (BuildContext context) {
                    return Padding(
                      padding: EdgeInsetsDirectional.all(20),
                      child:
                          StatefulBuilder(builder: (context, bottomSheetState) {
                        return SingleChildScrollView(
                          child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                getSizedBox(height: 40),
                                Text(
                                  'Filter Hotel',
                                  textAlign: TextAlign.center,
                                  style: appTextTheme(context).titleSmall,
                                ),
                                getSizedBox(height: 25),
                                Padding(
                                    padding: EdgeInsetsDirectional.only(
                                        start: 10, end: 10),
                                    child: Divider(
                                        color: AppColors.grey,
                                        height: 2,
                                        thickness: 1)),
                                getSizedBox(height: 15),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    getSizedBox(height: 15),
                                    Text('Country',
                                        textAlign: TextAlign.start,
                                        style: appTextTheme(context)
                                            .labelSmall
                                            ?.copyWith(
                                                fontWeight: FontWeight.bold)),
                                    getSizedBox(height: 15),
                                    SizedBox(
                                      height: 35,
                                      child: ListView.builder(
                                        scrollDirection: Axis.horizontal,
                                        itemCount: countries.length,
                                        shrinkWrap: true,
                                        physics: BouncingScrollPhysics(),
                                        itemBuilder: (context, index) {
                                          return multiSelectActionChip(
                                              context,
                                              countries[index],
                                              selectedCountry.contains(index),
                                              index, () {
                                            onCountryTap(index,
                                                bottomSheetState, 'country');
                                          }, false, Icons.star);
                                        },
                                      ),
                                    ),
                                    getSizedBox(height: 15),
                                    Text('Sort Results',
                                        textAlign: TextAlign.start,
                                        style: appTextTheme(context)
                                            .labelSmall
                                            ?.copyWith(
                                                fontWeight: FontWeight.bold)),
                                    getSizedBox(height: 15),
                                    SizedBox(
                                      height: 35,
                                      child: ListView.builder(
                                        scrollDirection: Axis.horizontal,
                                        itemCount: sortBy.length,
                                        shrinkWrap: true,
                                        physics: BouncingScrollPhysics(),
                                        itemBuilder: (context, index) {
                                          return multiSelectActionChip(
                                              context,
                                              sortBy[index],
                                              selectedSortResults
                                                  .contains(index),
                                              index, () {
                                            onCountryTap(index,
                                                bottomSheetState, 'sort');
                                          }, false, Icons.star);
                                        },
                                      ),
                                    ),
                                    getSizedBox(height: 15),
                                    Text('Price Range Per Night',
                                        textAlign: TextAlign.start,
                                        style: appTextTheme(context)
                                            .labelSmall
                                            ?.copyWith(
                                                fontWeight: FontWeight.bold)),
                                    getSizedBox(height: 15),
                                    SizedBox(
                                      height: 50,
                                      child: RangeSlider(
                                        activeColor: AppColors.primaryColor,
                                        inactiveColor:
                                            AppColors.primaryLightColor,
                                        values: _currentRangeValues,
                                        max: 5000,
                                        divisions: 5000,
                                        labels: RangeLabels(
                                          "\$" +
                                              _currentRangeValues.start
                                                  .round()
                                                  .toString(),
                                          "\$" +
                                              _currentRangeValues.end
                                                  .round()
                                                  .toString(),
                                        ),
                                        onChanged: (RangeValues values) {
                                          bottomSheetState(() {
                                            _currentRangeValues = values;
                                          });
                                        },
                                      ),
                                    ),
                                    getSizedBox(height: 15),
                                    Text('Start Ratings',
                                        textAlign: TextAlign.start,
                                        style: appTextTheme(context)
                                            .labelSmall
                                            ?.copyWith(
                                                fontWeight: FontWeight.bold)),
                                    getSizedBox(height: 15),
                                    SizedBox(
                                      height: 35,
                                      child: ListView.builder(
                                        scrollDirection: Axis.horizontal,
                                        itemCount: 5,
                                        shrinkWrap: true,
                                        physics: BouncingScrollPhysics(),
                                        itemBuilder: (context, index) {
                                          return multiSelectActionChip(
                                              context,
                                              "${index + 1}",
                                              selectedStarRatings
                                                  .contains(index),
                                              index, () {
                                            onCountryTap(index,
                                                bottomSheetState, 'rating');
                                          }, true, Icons.star);
                                        },
                                      ),
                                    ),
                                    getSizedBox(height: 15),
                                    Text('Facilities',
                                        textAlign: TextAlign.start,
                                        style: appTextTheme(context)
                                            .labelSmall
                                            ?.copyWith(
                                                fontWeight: FontWeight.bold)),
                                    getSizedBox(height: 15),
                                    SizedBox(
                                      height: 35,
                                      child: ListView.builder(
                                        scrollDirection: Axis.horizontal,
                                        itemCount: facilities.length,
                                        shrinkWrap: true,
                                        physics: BouncingScrollPhysics(),
                                        itemBuilder: (context, index) {
                                          return multiSelectActionChip(
                                              context,
                                              facilities[index],
                                              selectedFacilities
                                                  .contains(index),
                                              index, () {
                                            onCountryTap(index,
                                                bottomSheetState, 'facilities');
                                          }, false, Icons.star);
                                        },
                                      ),
                                    ),
                                    getSizedBox(height: 15),
                                    Text('Accommodation Types',
                                        textAlign: TextAlign.start,
                                        style: appTextTheme(context)
                                            .labelSmall
                                            ?.copyWith(
                                                fontWeight: FontWeight.bold)),
                                    getSizedBox(height: 15),
                                    SizedBox(
                                      height: 35,
                                      child: ListView.builder(
                                        scrollDirection: Axis.horizontal,
                                        itemCount: facilities.length,
                                        shrinkWrap: true,
                                        physics: BouncingScrollPhysics(),
                                        itemBuilder: (context, index) {
                                          return multiSelectActionChip(
                                              context,
                                              accommodation[index],
                                              selectedAccommodationTypes
                                                  .contains(index),
                                              index, () {
                                            onCountryTap(
                                                index,
                                                bottomSheetState,
                                                'accommodation');
                                          }, false, Icons.star);
                                        },
                                      ),
                                    ),
                                    getSizedBox(height: 15),
                                  ],
                                ),
                                getSizedBox(height: 30),
                                Padding(
                                  padding:
                                      EdgeInsetsDirectional.only(bottom: 20),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Padding(
                                          padding: EdgeInsetsDirectional.only(
                                              end: 5),
                                          child: AppButton(
                                            voidCallBack: () {
                                              Navigator.pop(context);
                                            },
                                            height: 120,
                                            width: 500,
                                            btnText: 'Cancel',
                                            backgroundColor:
                                                AppColors.primaryLightColor,
                                            textColor: AppColors.primaryColor,
                                            textSize: 15,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding: EdgeInsetsDirectional.only(
                                              start: 5),
                                          child: AppButton(
                                            voidCallBack: () {
                                              Navigator.pop(context);
                                            },
                                            height: 120,
                                            width: 500,
                                            btnText: 'Apply Filter',
                                            textSize: 15,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ]),
                        );
                      }),
                    );
                  },
                );
              },
            ),
            Text(
              'Recent',
              style: appTextTheme(context)
                  .labelSmall
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
            Column(
                children: List.generate(
              5,
              (index) => Padding(
                padding: EdgeInsetsDirectional.only(top: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      hotelList[index].name,
                      style: appTextTheme(context).labelSmall,
                    ),
                    Icon(
                      Icons.close,
                      color: AppColors.textColorLight,
                    )
                  ],
                ),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
