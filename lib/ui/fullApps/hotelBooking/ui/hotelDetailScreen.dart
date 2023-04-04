import 'package:flutter/material.dart';
import 'package:smartkit_pro/ui/fullApps/hotelBooking/helper/constants.dart';
import 'package:smartkit_pro/ui/fullApps/hotelBooking/helper/route.dart';
import 'package:smartkit_pro/ui/fullApps/hotelBooking/model/galleryPhotos.dart';
import 'package:smartkit_pro/ui/fullApps/hotelBooking/model/hotel.dart';
import 'package:smartkit_pro/ui/fullApps/hotelBooking/theme/colors.dart';
import 'package:smartkit_pro/ui/fullApps/hotelBooking/widget/appButton.dart';
import 'package:smartkit_pro/ui/fullApps/hotelBooking/widget/imageAsset.dart';
import 'package:smartkit_pro/ui/fullApps/hotelBooking/widget/roundedImageView.dart';

class HotelDetailScreen extends StatelessWidget {
  HotelModel hotel;

  HotelDetailScreen({Key? key, required this.hotel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            actions: [
              IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, hotelListingScreen,
                        arguments: hotelList);
                  },
                  icon: Icon(
                    Icons.bookmark_border,
                    color: AppColors.white,
                  )),
              IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.more_horiz_sharp, color: AppColors.white))
            ],
            backgroundColor: Colors.transparent,
            pinned: true,
            snap: true,
            floating: true,
            expandedHeight: 300.0,
            leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.arrow_back_ios_new,
                  color: AppColors.white,
                )),
            flexibleSpace: FlexibleSpaceBar(
              background: Hero(
                tag: hotel.id,
                child:
                    imageAsset(fileName: hotel.mainImage, isNormalImage: true),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Padding(
                  padding: EdgeInsetsDirectional.only(
                      start: 20, end: 20, bottom: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      getSizedBox(height: 20),
                      Text(
                        hotel.name,
                        style: appTextTheme(context).titleMedium,
                      ),
                      getSizedBox(height: 20),
                      Row(
                        children: [
                          Icon(Icons.location_on,
                              color: AppColors.primaryColor),
                          getSizedBox(width: 10),
                          Expanded(
                              child: Text(
                                hotel.address,
                            softWrap: true,
                            style: appTextTheme(context).labelSmall,
                          ))
                        ],
                      ),
                      getSizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Gallery Photos',
                              style: appTextTheme(context)
                                  .labelSmall
                                  ?.copyWith(fontWeight: FontWeight.bold)),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, hotelGalleryScreen);
                            },
                            child: Text('See All',
                                style: appTextTheme(context)
                                    .labelSmall
                                    ?.copyWith(
                                        fontWeight: FontWeight.bold,
                                        color: AppColors.primaryColor)),
                          ),
                        ],
                      ),
                      getSizedBox(height: 20),
                      SingleChildScrollView(
                        physics: BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: List.generate(
                            5,
                            (index) => Padding(
                              padding: EdgeInsetsDirectional.only(end: 10),
                              child: Hero(
                                tag: galleryPhotos[index].id,
                                child: roundedImageView(
                                    context,
                                    galleryPhotos[index].imageName,
                                    true,
                                    100,
                                    100,
                                    0),
                              ),
                            ),
                          ),
                        ),
                      ),
                      getSizedBox(height: 20),
                      Text('Details',
                          style: appTextTheme(context)
                              .labelSmall
                              ?.copyWith(fontWeight: FontWeight.bold)),
                      getSizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Icon(
                                Icons.home_work_rounded,
                                color: AppColors.primaryColor,
                                size: 50,
                              ),
                              Text('Hotels',
                                  softWrap: true,
                                  style: appTextTheme(context)
                                      .labelSmall
                                      ?.copyWith(fontSize: 12))
                            ],
                          ),
                          Column(
                            children: [
                              Icon(
                                Icons.king_bed_sharp,
                                color: AppColors.primaryColor,
                                size: 50,
                              ),
                              Text('4 Bedrooms',
                                  softWrap: true,
                                  style: appTextTheme(context)
                                      .labelSmall
                                      ?.copyWith(fontSize: 12))
                            ],
                          ),
                          Column(
                            children: [
                              Icon(
                                Icons.bathtub,
                                color: AppColors.primaryColor,
                                size: 50,
                              ),
                              Text('2 Bathrooms',
                                  softWrap: true,
                                  style: appTextTheme(context)
                                      .labelSmall
                                      ?.copyWith(fontSize: 12))
                            ],
                          ),
                          Column(
                            children: [
                              Icon(
                                Icons.width_wide_sharp,
                                color: AppColors.primaryColor,
                                size: 50,
                              ),
                              Text('4000 sqft',
                                  softWrap: true,
                                  style: appTextTheme(context)
                                      .labelSmall
                                      ?.copyWith(fontSize: 12))
                            ],
                          ),
                        ],
                      ),
                      getSizedBox(height: 20),
                      Text('Description',
                          style: appTextTheme(context)
                              .labelSmall
                              ?.copyWith(fontWeight: FontWeight.bold)),
                      getSizedBox(height: 20),
                      Text(
                        hotel.description,
                        softWrap: true,
                      ),
                      getSizedBox(height: 20),
                      Text('Facilities',
                          style: appTextTheme(context)
                              .labelSmall
                              ?.copyWith(fontWeight: FontWeight.bold)),
                      getSizedBox(height: 20),
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  Icon(
                                    Icons.pool,
                                    color: AppColors.primaryColor,
                                    size: 40,
                                  ),
                                  Text('Swimming Pool',
                                      softWrap: true,
                                      style: appTextTheme(context)
                                          .labelSmall
                                          ?.copyWith(fontSize: 10))
                                ],
                              ),
                              Column(
                                children: [
                                  Icon(
                                    Icons.wifi,
                                    color: AppColors.primaryColor,
                                    size: 40,
                                  ),
                                  Text('Wifi',
                                      softWrap: true,
                                      style: appTextTheme(context)
                                          .labelSmall
                                          ?.copyWith(fontSize: 10))
                                ],
                              ),
                              Column(
                                children: [
                                  Icon(
                                    Icons.restaurant_menu,
                                    color: AppColors.primaryColor,
                                    size: 40,
                                  ),
                                  Text('Restaurant',
                                      softWrap: true,
                                      style: appTextTheme(context)
                                          .labelSmall
                                          ?.copyWith(fontSize: 10))
                                ],
                              ),
                              Column(
                                children: [
                                  Icon(
                                    Icons.local_parking,
                                    color: AppColors.primaryColor,
                                    size: 40,
                                  ),
                                  Text('Parking',
                                      softWrap: true,
                                      style: appTextTheme(context)
                                          .labelSmall
                                          ?.copyWith(fontSize: 10))
                                ],
                              ),
                            ],
                          ),
                          getSizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  Icon(
                                    Icons.meeting_room,
                                    color: AppColors.primaryColor,
                                    size: 40,
                                  ),
                                  Text('Meeting room',
                                      softWrap: true,
                                      style: appTextTheme(context)
                                          .labelSmall
                                          ?.copyWith(fontSize: 10))
                                ],
                              ),
                              Column(
                                children: [
                                  Icon(
                                    Icons.monitor_weight_outlined,
                                    color: AppColors.primaryColor,
                                    size: 40,
                                  ),
                                  Text('Elevator',
                                      softWrap: true,
                                      style: appTextTheme(context)
                                          .labelSmall
                                          ?.copyWith(fontSize: 10))
                                ],
                              ),
                              Column(
                                children: [
                                  Icon(
                                    Icons.fitness_center,
                                    color: AppColors.primaryColor,
                                    size: 40,
                                  ),
                                  Text('Gym',
                                      softWrap: true,
                                      style: appTextTheme(context)
                                          .labelSmall
                                          ?.copyWith(fontSize: 10))
                                ],
                              ),
                              Column(
                                children: [
                                  Icon(
                                    Icons.home_repair_service,
                                    color: AppColors.primaryColor,
                                    size: 40,
                                  ),
                                  Text('24x7 Service',
                                      softWrap: true,
                                      style: appTextTheme(context)
                                          .labelSmall
                                          ?.copyWith(fontSize: 10))
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                      getSizedBox(height: 20),
                      AppButton(
                          btnText: 'Book Hotel',
                          voidCallBack: () {
                            Navigator.pushNamed(
                                context, bookHotelSelectDateScreen);
                          }),
                      getSizedBox(height: 20),
                    ],
                  ),
                );
              },
              childCount: 1,
            ),
          ),
        ],
      ),
    );
  }
}
