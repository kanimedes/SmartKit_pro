import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smartkit_pro/ui/fullApps/jobseekApp/Pages/details/detail_page.dart';
import 'package:smartkit_pro/ui/fullApps/jobseekApp/Pages/home/fillters_page.dart';
import 'package:smartkit_pro/ui/fullApps/jobseekApp/UI/animation/showup.dart';
import 'package:smartkit_pro/ui/fullApps/jobseekApp/UI/widgets/imageConstant.dart';
import 'package:smartkit_pro/ui/fullApps/jobseekApp/widget/app_large_text.dart';
import 'package:smartkit_pro/ui/fullApps/jobseekApp/widget/app_text.dart';

class HomeContent extends StatefulWidget {
  const HomeContent({Key? key}) : super(key: key);

  @override
  State<HomeContent> createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  List designation = [
    "Product Desginer",
    "Android Developer",
    "Flutter Developer"
  ];
  List company = ["Google", "Facebook", "Dribble"];

  List salary = ["160.00/year", "180.00/year", "200.00/year"];

  List location = ["California, USA", "Toranto, Canada", "London, UK"];

  List companyLogo = ["google.png", "facebook.jpg", "drible.jpg"];

  List requriments = ["Design", "Full-Time", "Junior"];

  Widget profileBuild() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ShowUp(
                    delay: 300,
                    child: AppText(
                      text: "Welcome Back!",
                      color: Theme.of(context).colorScheme.onSecondary,
                    ),
                  ),
                  ShowUp(
                    delay: 300,
                    child: AppLargeText(
                      text: "James Cotter👋",
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                  ),
                ],
              ),
              GestureDetector(
                onTap: () {
                  Scaffold.of(context).openDrawer();
                },
                child: ShowUp(
                  delay: 300,
                  child: Stack(
                    clipBehavior: Clip.none,
                    alignment: Alignment.topRight,
                    children: [
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                            color: Color(0xffffbd53),
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                                image: AssetImage(
                                    JobappConstant.getImagePath("smoke.jpg")),
                                fit: BoxFit.cover)),
                      ),
                      Positioned(
                        top: -2,
                        right: -2,
                        child: Container(
                          width: 13,
                          height: 13,
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
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget searchBuild() {
    return ShowUp(
      delay: 600,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                alignment: Alignment.center,
                margin: const EdgeInsetsDirectional.only(start: 10),
                width: MediaQuery.of(context).size.width * 0.7,
                height: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Theme.of(context).colorScheme.onPrimary),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.search,
                      color: Theme.of(context).colorScheme.onSecondary,
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    AppText(
                      text: "Search a job or position",
                      color: Theme.of(context).colorScheme.onSecondary,
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => FilltersPage()));
                },
                child: Container(
                  alignment: Alignment.center,
                  margin: const EdgeInsetsDirectional.only(start: 10, end: 10),
                  width: 50,
                  height: 50,
                  child: Icon(
                    Icons.settings_input_composite_outlined,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget featuredBuild(List designation, List Company, List Salary,
      List location, List companylogo, List requriments) {
    return ShowUp(
      delay: 900,
      child: Container(
        height: 180,
        margin: const EdgeInsetsDirectional.only(start: 10),
        child: ListView.builder(
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: 3,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Detail_page(),
                      ));
                },
                child: Container(
                  width: 280,
                  margin: const EdgeInsetsDirectional.only(end: 10),
                  decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary,
                      borderRadius: BorderRadius.circular(20)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(top: 20, left: 20),
                            width: 50,
                            height: 50,
                            padding: const EdgeInsets.all(10),
                            child: ClipRRect(
                                child: Image.asset(JobappConstant.getImagePath(
                                    companylogo[index])),
                                borderRadius: BorderRadius.circular(10)),
                            decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.secondary,
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 20, left: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                AppLargeText(
                                  text: designation[index],
                                  color:
                                      Theme.of(context).colorScheme.secondary,
                                  size: 16,
                                ),
                                AppText(
                                  text: Company[index],
                                  color: Theme.of(context)
                                      .colorScheme
                                      .secondary
                                      .withOpacity(0.6),
                                  size: 14,
                                )
                              ],
                            ),
                          ),
                          Container(
                              margin: const EdgeInsets.only(top: 20, left: 10),
                              child: Icon(
                                Icons.bookmark_border_outlined,
                                color: Theme.of(context).colorScheme.secondary,
                              )),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 20),
                        height: 50,
                        child: ListView.builder(
                          physics: BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemCount: 3,
                          itemBuilder: (BuildContext context, int index) {
                            return Row(
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(right: 10),
                                  width: 70,
                                  height: 25,
                                  decoration: BoxDecoration(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .secondary
                                          .withOpacity(0.25),
                                      borderRadius: BorderRadius.circular(30)),
                                  child: Center(
                                      child: AppText(
                                    text: requriments[index],
                                    size: 14,
                                    color:
                                        Theme.of(context).colorScheme.secondary,
                                  )),
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                          margin: const EdgeInsets.only(left: 20, right: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              AppText(
                                text: Salary[index],
                                color: Theme.of(context)
                                    .colorScheme
                                    .secondary
                                    .withOpacity(0.80),
                              ),
                              AppText(
                                text: location[index],
                                color: Theme.of(context)
                                    .colorScheme
                                    .secondary
                                    .withOpacity(0.80),
                              )
                            ],
                          ))
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }

  Widget recommendedBuild(List designation, List Company, List Salary,
      List location, List companylogo, List requriments) {
    return ShowUp(
      delay: 1200,
      child: Container(
        height: 150,
        margin: const EdgeInsetsDirectional.only(start: 10),
        child: ListView.builder(
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: 3,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                width: 140,
                margin: const EdgeInsetsDirectional.only(end: 20),
                decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.onPrimary,
                    borderRadius: BorderRadius.circular(20)),
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.black,
                          image: DecorationImage(
                            image: AssetImage(JobappConstant.getImagePath(
                                companylogo[index])),
                          )),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    AppLargeText(
                      text: designation[index],
                      size: 14,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    AppText(
                      text: Company[index],
                      size: 12,
                      color: Theme.of(context).colorScheme.onSecondary,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    AppLargeText(
                      text: Salary[index],
                      size: 14,
                      color: Theme.of(context)
                          .colorScheme
                          .secondary
                          .withOpacity(0.7),
                    )
                  ],
                ),
              );
            }),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: BouncingScrollPhysics(),
      children: [
        profileBuild(),
        SizedBox(
          height: 10,
        ),
        searchBuild(),
        SizedBox(
          height: 30,
        ),
        Container(
          padding: const EdgeInsetsDirectional.only(start: 10, end: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppLargeText(
                text: "Featured Jobs",
                color: Theme.of(context).colorScheme.secondary,
                size: 18,
              ),
              AppText(
                text: "See all",
                color: Theme.of(context).colorScheme.onSecondary,
              )
            ],
          ),
        ),
        SizedBox(
          height: 15,
        ),
        featuredBuild(
            designation, company, salary, location, companyLogo, requriments),
        SizedBox(
          height: 30,
        ),
        Container(
          padding: const EdgeInsetsDirectional.only(start: 10, end: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppLargeText(
                text: "Recommended Jobs",
                color: Theme.of(context).colorScheme.secondary,
                size: 18,
              ),
              AppText(
                text: "See all",
                color: Theme.of(context).colorScheme.onSecondary,
              )
            ],
          ),
        ),
        SizedBox(
          height: 15,
        ),
        recommendedBuild(
            designation, company, salary, location, companyLogo, requriments),
        SizedBox(
          height: 30,
        ),
        Container(
          padding: const EdgeInsetsDirectional.only(start: 10, end: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppLargeText(
                text: "Popular Jobs",
                color: Theme.of(context).colorScheme.secondary,
                size: 18,
              ),
              AppText(
                text: "See all",
                color: Theme.of(context).colorScheme.onSecondary,
              )
            ],
          ),
        ),
        SizedBox(
          height: 15,
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          margin: const EdgeInsets.only(left: 10, right: 10),
          child: Column(
            children: List.generate(3, (index) => index)
                .map((e) => Container(
                      margin: const EdgeInsets.only(
                        bottom: 10,
                      ),
                      height: 100,
                      decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.onPrimary,
                          borderRadius: BorderRadius.circular(20)),
                      child: LayoutBuilder(builder: (context, boxconstraint) {
                        return Row(
                          children: [
                            Container(
                              width: boxconstraint.maxWidth * 0.15,
                              height: 30,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      image: AssetImage(
                                          JobappConstant.getImagePath(
                                              "drible.jpg")),
                                      fit: BoxFit.cover)),
                            ),
                            Container(
                              padding: const EdgeInsets.only(left: 10),
                              width: boxconstraint.maxWidth * 0.5,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  AppLargeText(
                                    text: designation[e],
                                    size: 16,
                                    color:
                                        Theme.of(context).colorScheme.secondary,
                                    maxlines: 1,
                                  ),
                                  AppText(
                                    text: company[e],
                                    size: 16,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .secondary
                                        .withOpacity(0.80),
                                  ),
                                  //  Spacer(),
                                  //AppText(text: "96,000/y",size: 16,color: Theme.of(context).colorScheme.secondary.withOpacity(0.80),),
                                ],
                              ),
                            ),
                            Container(
                                padding: const EdgeInsets.only(right: 10),
                                alignment: AlignmentDirectional.centerEnd,
                                width: boxconstraint.maxWidth * 0.35,
                                child: AppText(
                                  text: salary[e],
                                  size: 16,
                                  color: Theme.of(context)
                                      .colorScheme
                                      .secondary
                                      .withOpacity(0.80),
                                )),
                          ],
                        );
                      }),
                    ))
                .toList(),
          ),
        ),
      ],
    );
  }
}
