import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smartkit_pro/ui/fullApps/jobseekApp/UI/widgets/imageConstant.dart';
import 'package:smartkit_pro/ui/fullApps/jobseekApp/widget/app_large_text.dart';
import 'package:smartkit_pro/ui/fullApps/jobseekApp/widget/app_text.dart';

class jobApplication extends StatefulWidget {
  const jobApplication({Key? key}) : super(key: key);

  @override
  State<jobApplication> createState() => _jobApplicationState();
}

class _jobApplicationState extends State<jobApplication>
    with TickerProviderStateMixin {
  int currentIndex = 0;
  List menu = ["All", "Deliverd", "Reviewing", "Cancelled"];

  List Result = ["Cancelled", "Reviewing", "Deliverd"];

  List CompanLogo = ["google.png", "beats.png", "fiver.png"];
  List Salary = ["\$115,000/y", "\$86,000/y", "\$96,000/y"];
  List Roles = ["Jr Excutive", "Sr Excutive", "Mid Excutive"];

  List CompanyName = ["Google", "Beats", "Fiverr"];
  List Place = ["Los Angels, US", "San Jose, US", "San Francisco, US"];

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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    Icons.arrow_back_ios,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                  AppLargeText(
                    text: "Applications",
                    color: Theme.of(context).colorScheme.secondary,
                    size: 18,
                  ),
                  Stack(
                    children: [
                      Align(
                        alignment: Alignment.topRight,
                        child: Container(
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                              color: Color(0xffffbd53),
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                  image: AssetImage(
                                      JobappConstant.getImagePath("smoke.jpg")),
                                  fit: BoxFit.cover)),
                        ),
                      ),
                      Positioned(
                        top: -1,
                        right: -1,
                        child: Container(
                          width: 10,
                          height: 10,
                          child: Container(
                            margin: const EdgeInsets.all(3.1),
                            decoration: BoxDecoration(
                              color: Colors.red,
                              shape: BoxShape.circle,
                            ),
                          ),
                          decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(7)),
                        ),
                      ),
                    ],
                  )
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.06,
              ),
              AppLargeText(
                text: "You Have\n27 Application 👍",
                color: Theme.of(context).colorScheme.secondary,
                size: 24,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: List.generate(4, (index) => index)
                      .map(
                        (e) => Container(
                          padding: const EdgeInsets.only(
                              left: 15, right: 15, top: 5, bottom: 5),
                          margin: const EdgeInsets.only(right: 10),
                          decoration: currentIndex == e
                              ? BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Theme.of(context).colorScheme.primary)
                              : BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .secondary
                                          .withOpacity(0.4))),
                          child: GestureDetector(
                            onTap: () {
                              _onItemTapped(e);
                            },
                            child: Row(
                              children: [
                                AppLargeText(
                                  text: menu[e],
                                  color: currentIndex == e
                                      ? Theme.of(context)
                                          .colorScheme
                                          .secondary
                                          .withOpacity(0.8)
                                      : Theme.of(context)
                                          .colorScheme
                                          .secondary
                                          .withOpacity(0.4),
                                  size: 18,
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.04,
              ),
              SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.vertical,
                child: _Details(currentIndex),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget allDetails() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: List.generate(3, (index) => index)
          .map(
            (e) => Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.17,
              margin: const EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Theme.of(context).colorScheme.onPrimary),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 20, left: 20, right: 20),
                    child: Row(
                      children: [
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  image: AssetImage(JobappConstant.getImagePath(
                                      CompanLogo[e])))),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppLargeText(
                              text: Roles[e],
                              color: Theme.of(context).colorScheme.secondary,
                              size: 14,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            AppText(
                              text: CompanyName[e],
                              color: Theme.of(context)
                                  .colorScheme
                                  .secondary
                                  .withOpacity(0.6),
                              size: 12,
                            )
                          ],
                        ),
                        Spacer(),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            AppLargeText(
                              text: Salary[e],
                              color: Theme.of(context).colorScheme.secondary,
                              size: 14,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            AppText(
                              text: Place[e],
                              color: Theme.of(context)
                                  .colorScheme
                                  .secondary
                                  .withOpacity(0.6),
                              size: 12,
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20, top: 20),
                        child: Container(
                          padding: const EdgeInsets.only(
                              left: 20, right: 20, top: 6, bottom: 6),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Color(0xff1d2032),
                          ),
                          child: AppText(
                            text: Result[e],
                            color: e == 0
                                ? Colors.red.withOpacity(0.7)
                                : e == 1
                                    ? Theme.of(context).colorScheme.primary
                                    : Colors.blue,
                          ),
                        ),
                      ),
                      Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(right: 20, top: 20),
                        child: AppLargeText(
                          text: "Full-Time",
                          size: 12,
                          color: Theme.of(context)
                              .colorScheme
                              .secondary
                              .withOpacity(0.8),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          )
          .toList(),
    );
  }

  Widget Deliverd() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: List.generate(1, (index) => index)
          .map(
            (e) => Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.17,
              margin: const EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Theme.of(context).colorScheme.onPrimary),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 20, left: 20, right: 20),
                    child: Row(
                      children: [
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  image: AssetImage(JobappConstant.getImagePath(
                                      CompanLogo[2])))),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppLargeText(
                              text: Roles[2],
                              color: Theme.of(context).colorScheme.secondary,
                              size: 14,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            AppText(
                              text: CompanyName[2],
                              color: Theme.of(context)
                                  .colorScheme
                                  .secondary
                                  .withOpacity(0.6),
                              size: 12,
                            )
                          ],
                        ),
                        Spacer(),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            AppLargeText(
                              text: Salary[2],
                              color: Theme.of(context).colorScheme.secondary,
                              size: 14,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            AppText(
                              text: Place[2],
                              color: Theme.of(context)
                                  .colorScheme
                                  .secondary
                                  .withOpacity(0.6),
                              size: 12,
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20, top: 20),
                        child: Container(
                          padding: const EdgeInsets.only(
                              left: 20, right: 20, top: 6, bottom: 6),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Color(0xff1d2032),
                          ),
                          child: AppText(
                            text: Result[2],
                            color: Colors.blue,
                          ),
                        ),
                      ),
                      Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(right: 20, top: 20),
                        child: AppLargeText(
                          text: "Full-Time",
                          size: 12,
                          color: Theme.of(context)
                              .colorScheme
                              .secondary
                              .withOpacity(0.8),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          )
          .toList(),
    );
  }

  Widget Reviewing() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: List.generate(1, (index) => index)
          .map(
            (e) => Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.17,
              margin: const EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Theme.of(context).colorScheme.onPrimary),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 20, left: 20, right: 20),
                    child: Row(
                      children: [
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  image: AssetImage(JobappConstant.getImagePath(
                                      CompanLogo[1])))),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppLargeText(
                              text: Roles[1],
                              color: Theme.of(context).colorScheme.secondary,
                              size: 14,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            AppText(
                              text: CompanyName[1],
                              color: Theme.of(context)
                                  .colorScheme
                                  .secondary
                                  .withOpacity(0.6),
                              size: 12,
                            )
                          ],
                        ),
                        Spacer(),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            AppLargeText(
                              text: Salary[1],
                              color: Theme.of(context).colorScheme.secondary,
                              size: 14,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            AppText(
                              text: Place[1],
                              color: Theme.of(context)
                                  .colorScheme
                                  .secondary
                                  .withOpacity(0.6),
                              size: 12,
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20, top: 20),
                        child: Container(
                          padding: const EdgeInsets.only(
                              left: 20, right: 20, top: 6, bottom: 6),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Color(0xff1d2032),
                          ),
                          child: AppText(
                            text: Result[1],
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                      ),
                      Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(right: 20, top: 20),
                        child: AppLargeText(
                          text: "Full-Time",
                          size: 12,
                          color: Theme.of(context)
                              .colorScheme
                              .secondary
                              .withOpacity(0.8),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          )
          .toList(),
    );
  }

  Widget Cancelled() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: List.generate(1, (index) => index)
          .map(
            (e) => Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.17,
              margin: const EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Theme.of(context).colorScheme.onPrimary),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 20, left: 20, right: 20),
                    child: Row(
                      children: [
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  image: AssetImage(JobappConstant.getImagePath(
                                      CompanLogo[0])))),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppLargeText(
                              text: Roles[0],
                              color: Theme.of(context).colorScheme.secondary,
                              size: 14,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            AppText(
                              text: CompanyName[0],
                              color: Theme.of(context)
                                  .colorScheme
                                  .secondary
                                  .withOpacity(0.6),
                              size: 12,
                            )
                          ],
                        ),
                        Spacer(),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            AppLargeText(
                              text: Salary[0],
                              color: Theme.of(context).colorScheme.secondary,
                              size: 14,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            AppText(
                              text: Place[0],
                              color: Theme.of(context)
                                  .colorScheme
                                  .secondary
                                  .withOpacity(0.6),
                              size: 12,
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20, top: 20),
                        child: Container(
                          padding: const EdgeInsets.only(
                              left: 20, right: 20, top: 6, bottom: 6),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Color(0xff1d2032),
                          ),
                          child: AppText(
                            text: Result[e],
                            color: e == 0
                                ? Colors.red.withOpacity(0.7)
                                : e == 1
                                    ? Theme.of(context).colorScheme.primary
                                    : Colors.blue,
                          ),
                        ),
                      ),
                      Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(right: 20, top: 20),
                        child: AppLargeText(
                          text: "Full-Time",
                          size: 12,
                          color: Theme.of(context)
                              .colorScheme
                              .secondary
                              .withOpacity(0.8),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          )
          .toList(),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  Widget _Details(int index) {
    if (index == 0) {
      return allDetails();
    } else if (index == 1) {
      return Deliverd();
    } else if (index == 2) {
      return Reviewing();
    } else {
      return Cancelled();
    }
  }
}
