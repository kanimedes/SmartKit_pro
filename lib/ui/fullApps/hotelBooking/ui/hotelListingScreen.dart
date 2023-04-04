import 'package:flutter/material.dart';
import 'package:smartkit_pro/ui/fullApps/hotelBooking/helper/constants.dart';
import 'package:smartkit_pro/ui/fullApps/hotelBooking/helper/route.dart';
import 'package:smartkit_pro/ui/fullApps/hotelBooking/model/hotel.dart';
import 'package:smartkit_pro/ui/fullApps/hotelBooking/theme/colors.dart';
import 'package:smartkit_pro/ui/fullApps/hotelBooking/widget/appBar.dart';
import 'package:smartkit_pro/ui/fullApps/hotelBooking/widget/bottomSheetDialog.dart';
import 'package:smartkit_pro/ui/fullApps/hotelBooking/widget/roundedImageView.dart';

bool isGridActive = false;

class HotelListingScreen extends StatefulWidget {
  List<HotelModel> hotelList;

  HotelListingScreen({Key? key, required this.hotelList}) : super(key: key);

  @override
  State<HotelListingScreen> createState() => _HotelListingScreenState();
}

class _HotelListingScreenState extends State<HotelListingScreen> {
  onAppBarIconTap(bool isGrid) {
    setState(() {
      isGridActive = isGrid;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBarWithActions(context, 'Recently Booked', [
          IconButton(
            onPressed: () {
              onAppBarIconTap(false);
            },
            icon: Icon(Icons.view_list_outlined),
            splashRadius: 30,
            color: isGridActive == false
                ? AppColors.primaryColor
                : AppColors.textColorLight,
          ),
          IconButton(
            onPressed: () {
              onAppBarIconTap(true);
            },
            icon: Icon(Icons.grid_view_rounded),
            splashRadius: 30,
            color: isGridActive == true
                ? AppColors.primaryColor
                : AppColors.textColorLight,
          )
        ]),
        body: isGridActive == false
            ? SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                    children: List.generate(
                        widget.hotelList.length,
                        (index) => GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(context, hotelDetailScreen,
                                    arguments: widget.hotelList[index]);
                              },
                              child: Padding(
                                padding: EdgeInsetsDirectional.only(bottom: 15),
                                child: Container(
                                  padding: EdgeInsetsDirectional.all(10),
                                  height: 130,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(25))),
                                  child: Row(
                                    children: [
                                      Hero(
                                        tag: '$index',
                                        child: roundedImageView(
                                            context,
                                            widget.hotelList[index].mainImage,
                                            true,
                                            120,
                                            120,
                                            0),
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding: EdgeInsetsDirectional.only(
                                              start: 10),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                widget.hotelList[index].name,
                                                style: appTextTheme(context)
                                                    .labelSmall
                                                    ?.copyWith(
                                                        fontSize: 17,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                softWrap: false,
                                                overflow: TextOverflow.fade,
                                              ),
                                              Text(
                                                widget.hotelList[index].city,
                                                style: appTextTheme(context)
                                                    .labelSmall
                                                    ?.copyWith(
                                                      fontSize: 15,
                                                    ),
                                                softWrap: false,
                                                overflow: TextOverflow.fade,
                                              ),
                                              Row(
                                                children: [
                                                  Row(
                                                    children: [
                                                      Icon(
                                                        Icons.star,
                                                        color:
                                                            Colors.yellow[800],
                                                        size: 15,
                                                      ),
                                                      Text(
                                                          widget
                                                              .hotelList[index]
                                                              .ratings,
                                                          style: appTextTheme(
                                                                  context)
                                                              .labelSmall
                                                              ?.copyWith(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  fontSize: 12,
                                                                  color: AppColors
                                                                      .primaryColor))
                                                    ],
                                                  ),
                                                  getSizedBox(height: 5),
                                                  Text(
                                                    '(${widget.hotelList[index].totalReviewed} reviews)',
                                                    softWrap: false,
                                                    overflow: TextOverflow.fade,
                                                    style: appTextTheme(context)
                                                        .labelSmall
                                                        ?.copyWith(
                                                            fontSize: 12),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.only(
                                            start: 10, top: 10, bottom: 10),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Column(
                                              children: [
                                                Text(
                                                    '${widget.hotelList[index].price}\$',
                                                    softWrap: true,
                                                    style: appTextTheme(context)
                                                        .labelSmall
                                                        ?.copyWith(
                                                            color: AppColors
                                                                .primaryColor,
                                                            fontSize: 17,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold)),
                                                Text(
                                                  '/night',
                                                  softWrap: true,
                                                  style: appTextTheme(context)
                                                      .labelSmall
                                                      ?.copyWith(fontSize: 10),
                                                )
                                              ],
                                            ),
                                            IconButton(
                                                onPressed: () {
                                                  RemoveBookmarkBottomDialog(
                                                      context, index);
                                                },
                                                icon:
                                                    Icon(Icons.bookmark_border))
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ))),
              )
            : GridView.builder(
                padding: EdgeInsetsDirectional.only(start: 10, end: 10),
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.vertical,
                itemCount: widget.hotelList.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 1 / 1.45,
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10),
                itemBuilder: (BuildContext context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, hotelDetailScreen,
                          arguments: widget.hotelList[index]);
                    },
                    child: Container(
                      padding: EdgeInsetsDirectional.all(10),
                      decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.all(Radius.circular(25))),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Hero(
                            tag: widget.hotelList[index].id,
                            child: roundedImageView(
                                context,
                                widget.hotelList[index].mainImage,
                                true,
                                MediaQuery.of(context).size.width / 2 - 40,
                                MediaQuery.of(context).size.width / 2 - 40,
                                0),
                          ),
                          Text(
                            widget.hotelList[index].name,
                            style: appTextTheme(context).labelSmall?.copyWith(
                                fontSize: 15, fontWeight: FontWeight.bold),
                            softWrap: false,
                            overflow: TextOverflow.fade,
                          ),
                          Row(
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.star,
                                    color: Colors.yellow[800],
                                    size: 15,
                                  ),
                                  Text(widget.hotelList[index].ratings,
                                      style: appTextTheme(context)
                                          .labelSmall
                                          ?.copyWith(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 12,
                                              color: AppColors.primaryColor))
                                ],
                              ),
                              getSizedBox(height: 15),
                              Text(
                                widget.hotelList[index].city,
                                softWrap: false,
                                overflow: TextOverflow.fade,
                                style: appTextTheme(context)
                                    .labelSmall
                                    ?.copyWith(fontSize: 12),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Text(widget.hotelList[index].price,
                                      softWrap: true,
                                      style: appTextTheme(context)
                                          .labelSmall
                                          ?.copyWith(
                                              fontWeight: FontWeight.bold)),
                                  Text(
                                    '/ per night',
                                    softWrap: true,
                                    style: appTextTheme(context)
                                        .labelSmall
                                        ?.copyWith(fontSize: 10),
                                  )
                                ],
                              ),
                              IconButton(
                                onPressed: () {
                                  RemoveBookmarkBottomDialog(context, index);
                                },
                                icon: Icon(
                                  Icons.bookmark_border,
                                  size: 30,
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                }));
  }
}
