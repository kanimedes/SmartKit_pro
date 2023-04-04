import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smartkit_pro/ui/fullApps/jobseekApp/Pages/home/fillters_page.dart';
import 'package:smartkit_pro/ui/fullApps/jobseekApp/UI/widgets/imageConstant.dart';
import 'package:smartkit_pro/ui/fullApps/jobseekApp/widget/app_large_text.dart';
import 'package:smartkit_pro/ui/fullApps/jobseekApp/widget/app_text.dart';

class jobFinder extends StatefulWidget {
  const jobFinder({Key? key}) : super(key: key);

  @override
  State<jobFinder> createState() => _jobFinderState();
}

class _jobFinderState extends State<jobFinder> {

  List designation=[
    "UX Designer",
    "UX Designer L3",
    "UX Designer L2",
    "UX Designer"
  ];
  List company=[
    "Google",
    "Facebook",
    "Dribble"
  ];

  List salary=[
    "160.00/year",
    "180.00/year",
    "200.00/year",
    "140.00/year"
  ];

  List companyLogo=[
    "drible.jpg",
    "facebook.jpg",
    "drible.jpg",
    "beats.png"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).padding.top + 10,
                  left: 10,
                  right: 10),
              height: MediaQuery.of(context).size.height * 0.2,
              decoration:
                  BoxDecoration(color: Theme.of(context).colorScheme.onPrimary),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: (){
                          Navigator.pop(context);
                        },
                        child: Icon(
                          Icons.arrow_back_ios,
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Flexible(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 3),
                          child: TextField(
                            decoration: InputDecoration.collapsed(
                              hintText: "UX Designer",
                              hintStyle: TextStyle(
                                  color:
                                      Theme.of(context).colorScheme.secondary),
                              border: InputBorder.none,
                            ),
                            style: TextStyle(
                                color: Theme.of(context).colorScheme.secondary),
                            maxLines: null,
                          ),
                        ),
                      ),
                      Icon(
                        Icons.close,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 7,
                  ),
                  Divider(
                    color: Theme.of(context).colorScheme.secondary,
                    height: 1,
                  ),
                  Spacer(),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: AppLargeText(
                          text: "293 Jobs Found",
                          color: Theme.of(context).colorScheme.primary,
                          size: 16,
                        ),
                      ),
                      Spacer(),
                      GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>FilltersPage()));
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Icon(
                            Icons.settings_input_component_outlined,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            GridView.count(
              padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              childAspectRatio: 1,
              mainAxisSpacing: 20,
              crossAxisSpacing: 20,
              children: List.generate(4, (index) => index)
                  .map((e) => Container(
                        decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.onPrimary,
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(5),
                              width: MediaQuery.of(context).size.width * 0.1,
                              height: MediaQuery.of(context).size.height * 0.08,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Theme.of(context).colorScheme.onPrimary,
                                  image: DecorationImage(
                                    scale: 12,
                                      image: AssetImage(
                                       JobappConstant.getImagePath(companyLogo[e])
                                      ),
                                      )),
                            ),
                            AppLargeText(
                              text: designation[e],
                              size: 16,
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                            SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.003,
                            ),
                            AppText(
                              text: "Dribble",
                              color: Theme.of(context)
                                  .colorScheme
                                  .secondary
                                  .withOpacity(0.4),
                              size: 14,
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.02,
                            ),
                            AppLargeText(
                              text: salary[e],
                              color: Theme.of(context)
                                  .colorScheme
                                  .secondary
                                  .withOpacity(0.8),
                              size: 14,
                            )
                          ],
                        ),
                      ))
                  .toList(),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Row(
                children: [
                  AppLargeText(
                    text: "Popular jobs",
                    color: Theme.of(context).colorScheme.secondary,
                    size: 16,
                  ),
                  Spacer(),
                  AppText(
                    text: "See all",
                    color: Theme.of(context)
                        .colorScheme
                        .secondary
                        .withOpacity(0.6),
                  )
                ],
              ),
            ),
            GridView.count(
              padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              childAspectRatio: 1,
              mainAxisSpacing: 20,
              crossAxisSpacing: 20,
              children: List.generate(2, (index) => index)
                  .map((e) => Container(
                decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.onPrimary,
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.1,
                      height: MediaQuery.of(context).size.height * 0.08,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: AssetImage(
                                JobappConstant.getImagePath("drible.jpg"),
                              ),
                              fit: BoxFit.cover)),
                    ),
                    AppLargeText(
                      text: "UX Designer",
                      size: 16,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                    SizedBox(
                      height:
                      MediaQuery.of(context).size.height * 0.003,
                    ),
                    AppText(
                      text: "Dribble",
                      color: Theme.of(context)
                          .colorScheme
                          .secondary
                          .withOpacity(0.4),
                      size: 14,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    AppLargeText(
                      text: "\$80,000/y",
                      color: Theme.of(context)
                          .colorScheme
                          .secondary
                          .withOpacity(0.8),
                      size: 14,
                    )
                  ],
                ),
              ))
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
