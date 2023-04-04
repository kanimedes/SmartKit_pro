import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smartkit_pro/ui/fullApps/jobseekApp/UI/widgets/imageConstant.dart';
import 'package:smartkit_pro/ui/fullApps/jobseekApp/widget/app_large_text.dart';
import 'package:smartkit_pro/ui/fullApps/jobseekApp/widget/app_text.dart';


class CustomAppbar extends StatelessWidget {
  String text;

   CustomAppbar({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsetsDirectional.only(start: 20, top: 45),
      height: MediaQuery.of(context).size.height * 0.25,
      decoration: BoxDecoration(color: Theme.of(context).colorScheme.onPrimary),
      child: Stack(
        children: [
          GestureDetector(
            onTap: (){
              Navigator.pop(context);
            },
            child: Align(
                alignment: Alignment.topLeft,
                child: Icon(
                  Icons.arrow_back_ios,
                  color: Theme.of(context).colorScheme.secondary,
                )),
          ),
          Align(
              alignment: Alignment.topCenter,
              child: AppLargeText(
                text: text,
                color: Theme.of(context).colorScheme.secondary,
                size: 18,
              )),
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.only(right: 30, top: 40),
              child: Row(
                children: [
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: AssetImage(JobappConstant.getImagePath("fiver.png")))),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AppLargeText(
                        text: "UX intern",
                        size: 16,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      AppText(
                        text: "Fiverr",
                        color: Theme.of(context)
                            .colorScheme
                            .secondary
                            .withOpacity(0.6),
                        size: 14,
                      )
                    ],
                  ),
                  Spacer(),
                  Align(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AppLargeText(
                          text: "\$88,000/y",
                          size: 16,
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        AppText(
                          text: "Los Angels, US",
                          color: Theme.of(context)
                              .colorScheme
                              .secondary
                              .withOpacity(0.6),
                          size: 14,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
