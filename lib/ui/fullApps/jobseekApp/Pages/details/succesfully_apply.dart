import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smartkit_pro/ui/fullApps/jobseekApp/Pages/details/track_application.dart';
import 'package:smartkit_pro/ui/fullApps/jobseekApp/Pages/jobfind/job_find.dart';
import 'package:smartkit_pro/ui/fullApps/jobseekApp/UI/animation/showup.dart';
import 'package:smartkit_pro/ui/fullApps/jobseekApp/UI/widgets/custom_appbar.dart';
import 'package:smartkit_pro/ui/fullApps/jobseekApp/widget/app_large_text.dart';

class Successfully_Apply extends StatefulWidget {
  const Successfully_Apply({Key? key}) : super(key: key);

  @override
  State<Successfully_Apply> createState() => _Successfully_ApplyState();
}

class _Successfully_ApplyState extends State<Successfully_Apply> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Container(
      height: MediaQuery.of(context).size.height,
      color: Theme.of(context).colorScheme.onPrimary,
      child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        ShowUp(
          delay: 400,
          child: CustomAppbar(
            text: "Confirmation",
          ),
        ),
        SizedBox(
          height: 20,
          child: Container(
            color: Theme.of(context).scaffoldBackgroundColor,
          ),
        ),
        ShowUp(
          delay: 500,
          child: Container(
            padding: const EdgeInsets.only(top: 40),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                          color: Theme.of(context).colorScheme.secondary,
                          width: 25)),
                ),
                Container(
                  width: 90,
                  height: 90,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: const [Color(0xff86ec7c), Color(0xff52d248)]),
                  ),
                  child: Icon(
                    Icons.check,
                    size: 90,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        ShowUp(
          delay: 600,
          child: AppLargeText(
            text: "Successful",
            size: 22,
            color: Colors.white,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        ShowUp(
          delay: 700,
          child: Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Text(
              "You've successfully applied to Fiverr ux intern role.you can see the job status from Application Tracking.",
              style: TextStyle(
                  color:
                      Theme.of(context).colorScheme.secondary.withOpacity(0.6),
                  fontSize: 16,
                  decoration: TextDecoration.none),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.1,
        ),
        ShowUp(
          delay: 800,
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TrackApplication(),
                  ));
            },
            child: Container(
              margin: const EdgeInsetsDirectional.only(start: 40, end: 40),
              width: MediaQuery.of(context).size.width,
              height: 50,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Theme.of(context).colorScheme.primary),
              child: Center(
                child: AppLargeText(
                  text: "Track",
                  color:
                      Theme.of(context).colorScheme.secondary.withOpacity(0.9),
                  size: 20,
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        ShowUp(
          delay: 900,
          child: GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => jobFinder()));
            },
            child: Container(
              margin: const EdgeInsetsDirectional.only(start: 40, end: 40),
              width: MediaQuery.of(context).size.width,
              height: 50,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border:
                      Border.all(color: Theme.of(context).colorScheme.primary)),
              child: Center(
                child: AppLargeText(
                  text: "Browse Jobs ",
                  color: Theme.of(context).colorScheme.primary.withOpacity(0.9),
                  size: 20,
                ),
              ),
            ),
          ),
        ),
      ]),
    ));
  }
}
