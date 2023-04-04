import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smartkit_pro/ui/fullApps/jobseekApp/widget/app_large_text.dart';

class SuccessfullyApply extends StatefulWidget {
  const SuccessfullyApply({Key? key}) : super(key: key);

  @override
  State<SuccessfullyApply> createState() => _SuccessfullyApplyState();
}

class _SuccessfullyApplyState extends State<SuccessfullyApply> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: const [0.1, 0.9],
            colors: const [Color(0xff091917), Color(0xff0a0a13)],
            tileMode: TileMode.mirror,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.25,
            ),
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                          color: Theme.of(context).colorScheme.secondary,
                          width: 25)),
                ),
                Container(
                  width: 150,
                  height: 150,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: const [Color(0xff86ec7c), Color(0xff52d248)]),
                  ),
                  child: Icon(
                    Icons.check,
                    size: 100,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            AppLargeText(
              text: "Successful",
              size: 22,
              color: Colors.white,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "You've successfully applied to\nFiverr UX intern role.",
              style: TextStyle(
                color: Theme.of(context).colorScheme.secondary.withOpacity(0.6),
                fontSize: 16,
              ),
              textAlign: TextAlign.center,
            ),
            Spacer(),
            SizedBox(
              height: 30,
            ),
            Container(
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
            SizedBox(
              height: 20,
            ),
            Container(
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
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
            )
          ],
        ),
      ),
    );
  }
}
