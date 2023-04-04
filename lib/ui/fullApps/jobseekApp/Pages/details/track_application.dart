import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smartkit_pro/ui/fullApps/jobseekApp/UI/widgets/custom_appbar.dart';
import 'package:smartkit_pro/ui/fullApps/jobseekApp/widget/app_text.dart';

class TrackApplication extends StatefulWidget {
  const TrackApplication({Key? key}) : super(key: key);

  @override
  State<TrackApplication> createState() => _TrackApplicationState();
}

class _TrackApplicationState extends State<TrackApplication> {
  final listState = [StepState.indexed, StepState.editing, StepState.complete];
  bool hide = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            CustomAppbar(
              text: "Applied Job Details",
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Stepper(
                currentStep: 6,
                controlsBuilder: (BuildContext ctx, ControlsDetails dtl) {
                  return Row(
                    children: <Widget>[
                      TextButton(
                        onPressed: dtl.onStepContinue,
                        child: Text(hide == true ? '' : 'NEXT'),
                      ),
                      TextButton(
                        onPressed: dtl.onStepCancel,
                        child: Text(hide == true ? '' : 'CANCEL'),
                      ),
                    ],
                  );
                },
                physics: NeverScrollableScrollPhysics(),
                type: StepperType.vertical,
                steps: [
                  Step(
                      subtitle: AppText(
                        text: "not yet",
                        color: Theme.of(context)
                            .colorScheme
                            .secondary
                            .withOpacity(0.6),
                      ),
                      title: AppText(
                        text: "Offer letter",
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                      content: AppText(
                        text: "",
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                      state: StepState.indexed),
                  Step(
                      subtitle: AppText(
                        text: "16/07/22",
                        color: Theme.of(context)
                            .colorScheme
                            .secondary
                            .withOpacity(0.6),
                      ),
                      title: AppText(
                        text: "Team matching",
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                      content: AppText(
                        text: "",
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                      state: StepState.indexed),
                  Step(
                      title: AppText(
                        text: "Final HR interview",
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                      subtitle: AppText(
                        text: "13/07/22",
                        color: Theme.of(context)
                            .colorScheme
                            .secondary
                            .withOpacity(0.6),
                      ),
                      content: AppText(
                        text: "",
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                      isActive: true,
                      state: StepState.indexed),
                  Step(
                    title: AppText(
                      text: "Techinal interview",
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                    subtitle: AppText(
                      text: "09/07/22",
                      color: Theme.of(context)
                          .colorScheme
                          .secondary
                          .withOpacity(0.6),
                    ),
                    content: AppText(
                      text: "",
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                    state: StepState.complete,
                    isActive: true,
                  ),
                  Step(
                      title: AppText(
                        text: "Screening interview",
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                      subtitle: AppText(
                        text: "07/07/22",
                        color: Theme.of(context)
                            .colorScheme
                            .secondary
                            .withOpacity(0.6),
                      ),
                      content: AppText(
                        text: "",
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                      isActive: true,
                      state: StepState.complete),
                  Step(
                      title: AppText(
                        text: "Reviewed by Fiverr team",
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                      subtitle: AppText(
                        text: "01/07/22",
                        color: Theme.of(context)
                            .colorScheme
                            .secondary
                            .withOpacity(0.6),
                      ),
                      content: AppText(
                        text: "",
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                      isActive: true,
                      state: StepState.complete),
                  Step(
                      title: AppText(
                        text: "Application submitted",
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                      subtitle: AppText(
                        text: "29/06/22",
                        color: Theme.of(context)
                            .colorScheme
                            .secondary
                            .withOpacity(0.6),
                      ),
                      content: AppText(
                        text: "",
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                      isActive: true,
                      state: StepState.complete),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
