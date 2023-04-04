import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:smartkit_pro/ui/fullApps/jobseekApp/UI/widgets/imageConstant.dart';
import 'package:smartkit_pro/ui/fullApps/jobseekApp/widget/app_large_text.dart';
import 'package:smartkit_pro/ui/fullApps/jobseekApp/widget/app_text.dart';

class EmailContent extends StatefulWidget {
  const EmailContent({Key? key}) : super(key: key);

  @override
  State<EmailContent> createState() => _EmailContentState();
}

class _EmailContentState extends State<EmailContent> {
  List company = ["Google", "Facebook", "Dribble"];
  List companyLogo = ["google.png", "facebook.jpg", "drible.jpg"];

  List userProfile = [
    "girl.jpg",
    "boy1.jpg",
    "girl2.jpg",
    "boy2.jpg",
    "girl.jpg",
    "boy1.jpg",
    "girl2.jpg",
    "boy2.jpg",
    "girl.jpg",
    "boy1.jpg",
  ];

  List userName = [
    "Jessica Jenith",
    "Erik John",
    "Olivia Ken",
    "Nicolas Pooran",
    "Jessica Jenith",
    "Erik John",
    "Olivia Ken",
    "Nicolas Pooran",
    "Jessica Jenith",
    "Erik John",
  ];

  List message = [
    "Are you available for an interview",
    "We are looking forward to taking",
    "Are you available for an interview"
  ];

  List userMessage = [
    "We are looking for web developer",
    "I checked your portfolio,it looks..",
    "Are you available for an interview",
    "We are looking for web developer",
    "I checked your portfolio,it looks..",
    "Are you available for an interview",
    "We are looking for web developer",
    "I checked your portfolio,it looks..",
    "Are you available for an interview",
    "We are looking for web developer",
  ];

  List notificationCount = ["2", "1", "4"];
  List notificationuserCount = [
    "2",
    "1",
    "4",
    "6",
    "3",
    "8",
    "2",
    "4",
    "1",
    "3"
  ];

  Widget topBuild() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AppLargeText(
          text: "Message",
          size: 18,
          color: Theme.of(context).colorScheme.secondary,
        ),
        Row(
          children: [
            Icon(
              Icons.search,
              color: Theme.of(context).colorScheme.primary,
            ),
            SizedBox(
              width: 15,
            ),
            Icon(
              Icons.edit_location_outlined,
              color: Theme.of(context).colorScheme.primary,
            )
          ],
        )
      ],
    );
  }

  Widget searchBuild(){

    return               Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.06,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
              color: Theme.of(context)
                  .colorScheme
                  .secondary
                  .withOpacity(0.8))),
      child: Row(
        children: [
          SizedBox(
            width: 20,
          ),
          Icon(
            Icons.search,
            color: Theme.of(context)
                .colorScheme
                .secondary
                .withOpacity(0.8),
          ),
          SizedBox(
            width: 10,
          ),
          AppText(
            text: "Search chat or message",
            color: Theme.of(context)
                .colorScheme
                .secondary
                .withOpacity(0.8),
          )
        ],
      ),
    );
  }

  Widget compnayMessageBuild(){

    return Column(
      children: List.generate(3, (index) => index)
          .map(
            (e) => Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 12),
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image:
                        AssetImage(JobappConstant.getImagePath(companyLogo[e])))),
              ),
              SizedBox(
                width: 10,
              ),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment:
                      MainAxisAlignment.spaceBetween,
                      children: [
                        AppText(
                          text: company[e],
                          color: Theme.of(context)
                              .colorScheme
                              .secondary
                              .withOpacity(0.8),
                        ),
                        AppText(
                          text: "11.45 am",
                          color: Theme.of(context)
                              .colorScheme
                              .secondary
                              .withOpacity(0.8),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        AppText(
                          text: message[e],
                          color: Theme.of(context)
                              .colorScheme
                              .secondary
                              .withOpacity(0.8),
                        ),
                        Spacer(),
                        Container(
                          width: 18,
                          height: 15,
                          decoration: BoxDecoration(
                              borderRadius:
                              BorderRadius.circular(20),
                              color: Colors.blueAccent),
                          child: Center(
                              child: AppLargeText(
                                text: notificationCount[e],
                                size: 12,
                              )),
                        )
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      )
          .toList(),
    );
  }

  Widget individualMessageBuild(){

    return Column(
      children: List.generate(10, (index) => index)
          .map(
            (e) => Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 12),
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image:
                        AssetImage(JobappConstant.getImagePath(userProfile[e])),
                        fit: BoxFit.cover)),
              ),
              SizedBox(
                width: 10,
              ),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment:
                      MainAxisAlignment.spaceBetween,
                      children: [
                        AppText(
                          text: userName[e],
                          color: Theme.of(context)
                              .colorScheme
                              .secondary
                              .withOpacity(0.8),
                        ),
                        AppText(
                          text: "11.45 am",
                          color: Theme.of(context)
                              .colorScheme
                              .secondary
                              .withOpacity(0.8),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        AppText(
                          text: userMessage[e],
                          color: Theme.of(context)
                              .colorScheme
                              .secondary
                              .withOpacity(0.8),
                        ),
                        Spacer(),
                        Container(
                          width: 18,
                          height: 15,
                          decoration: BoxDecoration(
                              borderRadius:
                              BorderRadius.circular(20),
                              color: Colors.blueAccent),
                          child: Center(
                              child: AppLargeText(
                                text: notificationuserCount[e],
                                size: 12,
                              )),
                        )
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      )
          .toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: BouncingScrollPhysics(),
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              topBuild(),
              SizedBox(
                height: 20,
              ),
              searchBuild(),
              SizedBox(
                height: 20,
              ),
              AppLargeText(
                text: "Companies",
                size: 14,
                color: Theme.of(context).colorScheme.secondary,
              ),
              SizedBox(
                height: 20,
              ),
              compnayMessageBuild(),
              SizedBox(
                height: 10,
              ),
              AppLargeText(
                text: "Individual Messages",
                size: 14,
                color: Theme.of(context).colorScheme.secondary,
              ),
              SizedBox(
                height: 20,
              ),
              individualMessageBuild(),
            ],
          ),
        )
      ],
    );
  }
}
