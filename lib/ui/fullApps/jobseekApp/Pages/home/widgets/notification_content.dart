import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smartkit_pro/ui/fullApps/jobseekApp/UI/widgets/imageConstant.dart';
import 'package:smartkit_pro/ui/fullApps/jobseekApp/widget/app_large_text.dart';
import 'package:smartkit_pro/ui/fullApps/jobseekApp/widget/app_text.dart';

class NotificationContent extends StatefulWidget {
  const NotificationContent({Key? key}) : super(key: key);

  @override
  State<NotificationContent> createState() => _NotificationContentState();
}

class _NotificationContentState extends State<NotificationContent> {
  List company = ["Fiver", "Macdonald"];
  List companyLogo = ["fiver.png", "mcd.png"];

  List applicationname=["BMW","Booking.com"];

  List applicationlogo=[
    "bmw.jpeg",
    "booking.png"
  ];

  List companytime=[
    "30",
    "10"
  ];

  List applicationtime=[
    "40",
    "5"
  ];

  List interviewtime=[
    "35",
    "15"
  ];
  List interviewname=[
    "Beats",
    "Behance"
  ];

  List interviewlog=[
    "beats.png",
    "behance.png"
  ];

  List message = [
    "Want to take a final interview",
    "Want to contact with in 24 hours",
    "Are you available for an interview"
  ];



  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 100,
                  ),
                  AppLargeText(
                    text: "Notification",
                    color: Theme.of(context).colorScheme.secondary,
                    size: 18,
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              AppLargeText(
                text: "New activity",
                color: Theme.of(context).colorScheme.secondary,
                size: 14,
              ),
              SizedBox(
                height: 20,
              ),
              Column(
                children: List.generate(2, (index) => index)
                    .map(
                      (e) => Padding(
                        padding: const EdgeInsets.only(bottom: 25),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      image: AssetImage(JobappConstant.getImagePath(companyLogo[e])))),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Flexible(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  AppLargeText(
                                    text: company[e],
                                    color: Theme.of(context)
                                        .colorScheme
                                        .secondary
                                        .withOpacity(0.8),
                                    size: 14,
                                  ),
                                  AppText(
                                    text: message[e],
                                    color: Theme.of(context)
                                        .colorScheme
                                        .secondary
                                        .withOpacity(0.8),
                                  ),
                                  SizedBox(
                                    height: 3,
                                  ),
                                  Row(
                                    children: [
                                      AppLargeText(
                                        text: companytime[e]+" min ago",
                                        color: Theme.of(context)
                                            .colorScheme
                                            .secondary,
                                        size: 12,
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Container(
                                        width: 5,
                                        height: 5,
                                        decoration: BoxDecoration(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .primary,
                                            shape: BoxShape.circle),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                    .toList(),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppLargeText(
                    text: "Application",
                    color: Theme.of(context).colorScheme.secondary,
                    size: 14,
                  ),
                  AppText(
                    text: "See all",
                    color: Theme.of(context)
                        .colorScheme
                        .secondary
                        .withOpacity(0.6),
                    size: 14,
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Column(
                children: List.generate(2, (index) => index)
                    .map(
                      (e) => Padding(
                        padding: const EdgeInsets.only(bottom: 25),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      image:
                                          AssetImage(JobappConstant.getImagePath(applicationlogo[e]) ))),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Flexible(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  AppLargeText(
                                    text: applicationname[e],
                                    color: Theme.of(context)
                                        .colorScheme
                                        .secondary
                                        .withOpacity(0.8),
                                    size: 14,
                                  ),
                                  AppText(
                                    text: message[e],
                                    color: Theme.of(context)
                                        .colorScheme
                                        .secondary
                                        .withOpacity(0.8),
                                  ),
                                  SizedBox(
                                    height: 3,
                                  ),
                                  Row(
                                    children: [
                                      AppLargeText(
                                        text: applicationtime[e]+" min ago",
                                        color: Theme.of(context)
                                            .colorScheme
                                            .secondary,
                                        size: 12,
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Container(
                                        width: 5,
                                        height: 5,
                                        decoration: BoxDecoration(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .primary,
                                            shape: BoxShape.circle),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                    .toList(),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppLargeText(
                    text: "Interview",
                    color: Theme.of(context).colorScheme.secondary,
                    size: 14,
                  ),
                  AppText(
                    text: "See all",
                    color: Theme.of(context)
                        .colorScheme
                        .secondary
                        .withOpacity(0.6),
                    size: 14,
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Column(
                children: List.generate(2, (index) => index)
                    .map(
                      (e) => Padding(
                        padding: const EdgeInsets.only(bottom: 25),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      image:
                                          AssetImage(JobappConstant.getImagePath(interviewlog[e])  ))),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Flexible(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  AppLargeText(
                                    text: interviewname[e],
                                    color: Theme.of(context)
                                        .colorScheme
                                        .secondary
                                        .withOpacity(0.8),
                                    size: 14,
                                  ),
                                  AppText(
                                    text: message[e],
                                    color: Theme.of(context)
                                        .colorScheme
                                        .secondary
                                        .withOpacity(0.8),
                                  ),
                                  SizedBox(
                                    height: 3,
                                  ),
                                  Row(
                                    children: [
                                      AppLargeText(
                                        text: interviewtime[e]+" min ago",
                                        color: Theme.of(context)
                                            .colorScheme
                                            .secondary,
                                        size: 12,
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Container(
                                        width: 5,
                                        height: 5,
                                        decoration: BoxDecoration(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .primary,
                                            shape: BoxShape.circle),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                    .toList(),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
