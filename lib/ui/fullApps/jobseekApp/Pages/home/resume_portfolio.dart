import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:smartkit_pro/ui/fullApps/jobseekApp/UI/widgets/app_bar.dart';
import 'package:smartkit_pro/ui/fullApps/jobseekApp/UI/widgets/imageConstant.dart';
import 'package:smartkit_pro/ui/fullApps/jobseekApp/widget/app_large_text.dart';
import 'package:smartkit_pro/ui/fullApps/jobseekApp/widget/app_text.dart';

class ResumePortfolio extends StatefulWidget {
  const ResumePortfolio({Key? key}) : super(key: key);

  @override
  State<ResumePortfolio> createState() => _ResumePortfolioState();
}

class _ResumePortfolioState extends State<ResumePortfolio> {
  List portFolioName = ["Portfolio Link", "Add Slide", "Add PDF", "Add Photos"];
  bool _lightIsOn = false;
  bool _fileUploaded = false;

  Widget dashborderBox() {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.4,
      width: MediaQuery.of(context).size.width,
      child: DottedBorder(
        borderType: BorderType.RRect,
        radius: Radius.circular(15),
        dashPattern: const [10, 5, 10, 5, 10, 5],
        color: Theme.of(context).colorScheme.primary,
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            Center(
                child: Text(
              "Upload your CV or Resume and\nuse it when you apply for jobs",
              style: TextStyle(
                  color:
                      Theme.of(context).colorScheme.secondary.withOpacity(0.6),
                  fontSize: 16,
                  decoration: TextDecoration.none),
            )),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.04,
            ),
            _lightIsOn
                ? CircularPercentIndicator(
                    radius: 35.0,
                    lineWidth: 8.0,
                    animation: true,
                    percent: 1.0,
                    animationDuration: 1500,
                    onAnimationEnd: () {
                      setState(() {
                        // Toggle light when tapped.
                        _lightIsOn = !_lightIsOn;
                        _fileUploaded = !_fileUploaded;
                      });
                    },
                    backgroundColor: Theme.of(context)
                        .colorScheme
                        .secondary
                        .withOpacity(0.8),
                    center: new Text(
                      "100%",
                      style: new TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 12.0,
                          color: Theme.of(context).colorScheme.secondary),
                    ),
                    circularStrokeCap: CircularStrokeCap.round,
                    progressColor: Theme.of(context).colorScheme.primary,
                  )
                : Container(
                    width: MediaQuery.of(context).size.width,
                    margin:
                        const EdgeInsetsDirectional.only(start: 20, end: 20),
                    height: MediaQuery.of(context).size.height * 0.09,
                    decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.onPrimary,
                        borderRadius: BorderRadius.circular(15)),
                    child: _fileUploaded
                        ? Row(
                            children: [
                              Container(
                                margin:
                                    const EdgeInsetsDirectional.only(start: 20),
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                            JobappConstant.getImagePath(
                                                "pdf.png")))),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  AppLargeText(
                                    text: "James_CV_UX Designer",
                                    size: 14,
                                    color:
                                        Theme.of(context).colorScheme.secondary,
                                  ),
                                  AppText(
                                      text: "287 KB",
                                      size: 14,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .secondary
                                          .withOpacity(0.6))
                                ],
                              ),
                              Spacer(),
                              Transform.translate(
                                offset: Offset(5, -8),
                                child: Stack(
                                  children: [
                                    Align(
                                      alignment: Alignment.topRight,
                                      child: Container(
                                        width: 20,
                                        height: 20,
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Colors.black),
                                        child: Icon(
                                          Icons.close,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .secondary,
                                          size: 15,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          )
                        : Center(
                            child: AppText(
                              text: "Upload a Doc/Docs/PDF",
                              size: 16,
                              color: Theme.of(context)
                                  .colorScheme
                                  .primary
                                  .withOpacity(0.8),
                            ),
                          )),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  // Toggle light when tapped.
                  _lightIsOn = !_lightIsOn;
                });
              },
              child: Container(
                margin: const EdgeInsetsDirectional.only(start: 60, end: 60),
                height: MediaQuery.of(context).size.height * 0.08,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primary,
                    borderRadius: BorderRadius.circular(15)),
                child: Center(
                  child: AppText(
                    text: "Upload",
                    color: Theme.of(context).colorScheme.secondary,
                    size: 18,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget portfolioGrid() {
    return GridView.count(
      padding: const EdgeInsets.only(top: 20),
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      childAspectRatio: 3,
      mainAxisSpacing: 20,
      crossAxisSpacing: 20,
      children: List.generate(4, (index) => index)
          .map((e) => Container(
                width: MediaQuery.of(context).size.height * 0.02,
                decoration: BoxDecoration(
                    border: Border.all(
                        color: Theme.of(context).colorScheme.secondary),
                    borderRadius: BorderRadius.circular(20)),
                child: Center(
                  child: AppText(
                    text: portFolioName[e],
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                ),
              ))
          .toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsetsDirectional.only(start: 20, top: 45, end: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              CommanAppBar(
                title: "Resume & Portfolio",
                edit: "Skip",
                editColor: Theme.of(context).colorScheme.primary,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppLargeText(
                    text: "Resume or CV",
                    color: Theme.of(context).colorScheme.secondary,
                    size: 16,
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              dashborderBox(),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              Row(
                children: [
                  AppLargeText(
                    text: "Portfolio",
                    color: Theme.of(context).colorScheme.secondary,
                    size: 16,
                  ),
                  SizedBox(
                    width: 6,
                  ),
                  AppText(
                    text: "(Optional)",
                    color: Theme.of(context)
                        .colorScheme
                        .secondary
                        .withOpacity(0.6),
                  )
                ],
              ),
              portfolioGrid(),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.06,
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.08,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primary,
                    borderRadius: BorderRadius.circular(15)),
                child: Center(
                  child: AppLargeText(
                    text: "Save",
                    color: Theme.of(context).colorScheme.secondary,
                    size: 22,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
