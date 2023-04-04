import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:smartkit_pro/ui/fullApps/jobseekApp/Pages/details/succesfully_apply.dart';
import 'package:smartkit_pro/ui/fullApps/jobseekApp/Pages/home/resume_portfolio.dart';
import 'package:smartkit_pro/ui/fullApps/jobseekApp/UI/animation/showup.dart';
import 'package:smartkit_pro/ui/fullApps/jobseekApp/UI/widgets/custom_appbar.dart';
import 'package:smartkit_pro/ui/fullApps/jobseekApp/UI/widgets/imageConstant.dart';
import 'package:smartkit_pro/ui/fullApps/jobseekApp/widget/app_large_text.dart';
import 'package:smartkit_pro/ui/fullApps/jobseekApp/widget/app_text.dart';

class Detail_content extends StatefulWidget {
  const Detail_content({Key? key}) : super(key: key);

  @override
  State<Detail_content> createState() => _Detail_contentState();
}

class _Detail_contentState extends State<Detail_content> {
  int currentindex = 0;
  List userProfile = [
    "girl.jpg",
    "boy1.jpg",
    "girl2.jpg",
  ];

  List userName = [
    "Jessica Jenith",
    "Erik John",
    "Olivia Ken",
  ];

  List designation = ["UX Designer", "Product Designer", "UI Designer"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ShowUp(
              delay: 400,
              child: CustomAppbar(
                text: "Apply",
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ShowUp(
              delay: 500,
              child: Padding(
                padding: const EdgeInsets.only(left: 12),
                child: AppLargeText(
                  text: "Select a profile",
                  color: Theme.of(context).colorScheme.secondary,
                  size: 14,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ShowUp(
              delay: 600,
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(3, (index) => index)
                      .map((e) => GestureDetector(
                            onTap: () {
                              setState(() {
                                currentindex = e;
                              });
                            },
                            child: Container(
                              margin: const EdgeInsets.only(
                                left: 12,
                              ),
                              width: MediaQuery.of(context).size.width * 0.4,
                              height: 150,
                              decoration: BoxDecoration(
                                  color: Theme.of(context).colorScheme.onPrimary,
                                  borderRadius: BorderRadius.circular(20)),
                              child: Column(
                                children: [
                                  Stack(
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.only(top: 20),
                                        child: Align(
                                          alignment: Alignment.topCenter,
                                          child: Container(
                                            width: 60,
                                            height: 60,
                                            decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                image: DecorationImage(
                                                    image: AssetImage(
                                                        JobappConstant.getImagePath(userProfile[e])),
                                                    fit: BoxFit.cover)),
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment.topRight,
                                        child: currentindex == e
                                            ? Container(
                                                margin: const EdgeInsets.all(12),
                                                width: 20,
                                                height: 20,
                                                decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    color: Colors.blueAccent),
                                                child: Icon(
                                                  Icons.check,
                                                  size: 16,
                                                ),
                                              )
                                            : Container(
                                                margin: const EdgeInsets.all(12),
                                                width: 20,
                                                height: 20,
                                                decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    border: Border.all(
                                                        color: Theme.of(context)
                                                            .colorScheme
                                                            .secondary)),
                                              ),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  AppLargeText(
                                    text: userName[e],
                                    color:
                                        Theme.of(context).colorScheme.secondary,
                                    size: 14,
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      AppText(
                                        text: designation[e],
                                        color: Theme.of(context)
                                            .colorScheme
                                            .secondary
                                            .withOpacity(0.6),
                                        size: 10,
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Container(
                                        width: 5,
                                        height: 5,
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Colors.blueAccent),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ))
                      .toList(),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ShowUp(
              delay: 700,
              child: Padding(
                padding: const EdgeInsets.only(left: 12),
                child: AppLargeText(
                  text: "Select a resume",
                  color: Theme.of(context).colorScheme.secondary,
                  size: 14,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ShowUp(
              delay: 800,
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(3, (index) => index)
                      .map((e) => GestureDetector(
                            onTap: () {
                              setState(() {
                                currentindex = e;
                              });
                            },
                            child: Container(
                              margin: const EdgeInsets.only(
                                left: 12,
                              ),
                              width: MediaQuery.of(context).size.width * 0.4,
                              height: 60,
                              decoration: BoxDecoration(
                                  color: Theme.of(context).colorScheme.onPrimary,
                                  borderRadius: BorderRadius.circular(12)),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                    children: [
                                      currentindex == e
                                          ? Container(
                                              margin: const EdgeInsets.all(10),
                                              width: 20,
                                              height: 20,
                                              decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: Colors.blueAccent),
                                              child: Icon(
                                                Icons.check,
                                                size: 16,
                                              ),
                                            )
                                          : Container(
                                              margin: const EdgeInsets.all(10),
                                              width: 20,
                                              height: 20,
                                              decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  border: Border.all(
                                                      color: Theme.of(context)
                                                          .colorScheme
                                                          .secondary)),
                                            ),
                                      Column(
                                        children: [
                                          Container(
                                              margin:
                                                  const EdgeInsets.only(left: 5),
                                              padding: const EdgeInsets.all(3),
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(3),
                                                  color: Colors.deepPurpleAccent),
                                              child: AppLargeText(
                                                text: designation[e],
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .secondary,
                                                size: 8,
                                              )),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          AppText(
                                            text: userName[e],
                                            color: Theme.of(context)
                                                .colorScheme
                                                .secondary,
                                            size: 10,
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ))
                      .toList(),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ShowUp(
              delay: 900,
              child: Padding(
                padding: const EdgeInsets.only(left: 12),
                child: AppLargeText(
                  text: "Cover Later(Optional)",
                  color: Theme.of(context).colorScheme.secondary,
                  size: 14,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ShowUp(
              delay:1000 ,
              child: Row(
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 10),
                    padding: const EdgeInsets.all(10),
                    width: MediaQuery.of(context).size.width * 0.7,
                    height: MediaQuery.of(context).size.height * 0.12,
                    child: TextField(
                      decoration: InputDecoration.collapsed(
                        hintText: "Write a cover letter...",
                        hintStyle: TextStyle(
                            color: Theme.of(context)
                                .colorScheme
                                .secondary
                                .withOpacity(0.4)),
                        border: InputBorder.none,
                      ),
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.secondary),
                      maxLines: null,
                    ),
                    decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.onPrimary,
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.04,
                  ),
                  GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>ResumePortfolio()));
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.2,
                      height: MediaQuery.of(context).size.height * 0.12,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Theme.of(context).colorScheme.onPrimary),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.cloud_upload_outlined,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                          Text(
                            "Upload\nPDF",
                            style: TextStyle(
                                color: Theme.of(context).colorScheme.primary,
                                fontSize: 12),
                            textAlign: TextAlign.center,
                          ),
                          //AppLargeText(text: "Upload\nPDF",color: Theme.of(context).colorScheme.primary,size: 10,)
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder:
                    (context) => Successfully_Apply(),));
              },
              child: ShowUp(
                delay: 1100,
                child: Container(
                  margin: const EdgeInsetsDirectional.only(start: 40, end: 40),
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Theme.of(context).colorScheme.primary),
                  child: Center(
                    child: AppLargeText(
                      text: "Apply Now",
                      color:
                          Theme.of(context).colorScheme.secondary.withOpacity(0.9),
                      size: 20,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
