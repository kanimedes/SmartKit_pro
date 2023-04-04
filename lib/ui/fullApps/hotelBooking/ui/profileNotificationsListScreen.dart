import 'package:flutter/material.dart';
import 'package:smartkit_pro/ui/fullApps/hotelBooking/helper/constants.dart';
import 'package:smartkit_pro/ui/fullApps/hotelBooking/model/notifications.dart';
import 'package:smartkit_pro/ui/fullApps/hotelBooking/theme/colors.dart';
import 'package:smartkit_pro/ui/fullApps/hotelBooking/widget/appBar.dart';
import 'package:smartkit_pro/ui/fullApps/hotelBooking/widget/roundedImageView.dart';

class ProfileNotificationsListScreen extends StatefulWidget {
  const ProfileNotificationsListScreen({Key? key}) : super(key: key);

  @override
  State<ProfileNotificationsListScreen> createState() =>
      _ProfileNotificationsListScreenState();
}

class _ProfileNotificationsListScreenState
    extends State<ProfileNotificationsListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context, 'Notifications'),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsetsDirectional.all(20),
          child: Column(
            children: List.generate(
              notificationModel.length,
              (index) => Container(
                margin: EdgeInsetsDirectional.only(top: 20),
                padding: EdgeInsetsDirectional.all(10),
                height: 150,
                decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.all(Radius.circular(25))),
                child: Row(
                  children: [
                    roundedImageView(context,
                        notificationModel[index].imageFile, true, 100, 120, 0),
                    getSizedBox(width: 10),
                    Expanded(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          notificationModel[index].title,
                          softWrap: true,
                          overflow: TextOverflow.fade,
                          style: appTextTheme(context)
                              .labelMedium
                              ?.copyWith(fontWeight: FontWeight.bold),
                        ),
                        Text(
                            notificationModel[index].subTitle,
                            softWrap: true,
                            overflow: TextOverflow.fade,
                            style: appTextTheme(context).labelSmall),
                        Align(
                          alignment: AlignmentDirectional.centerEnd,
                          child: Text(
                            'On ${notificationModel[index].date}',
                            softWrap: true,
                            overflow: TextOverflow.fade,
                            style: appTextTheme(context)
                                .labelMedium
                                ?.copyWith(fontSize: 10),
                          ),
                        ),
                      ],
                    ))
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
