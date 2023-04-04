import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smartkit_pro/ui/fullApps/jobseekApp/widget/app_large_text.dart';


class settingContent extends StatefulWidget {
  const settingContent({Key? key}) : super(key: key);

  @override
  State<settingContent> createState() => _settingContentState();
}

class _settingContentState extends State<settingContent> {

  List menu=[
    "Profile Visibilty",
    "Notification",
    "Change Password",
    "Language",
    "Theme",
    "Delete Account"
  ];

  List menuAbout=[
    "Privacy",
    "Term and conditions",
    "Help Center",
    "Support",
    "About"
  ];

  List aboutIcon=[
    Icons.privacy_tip_outlined,
    Icons.ac_unit,
    Icons.help_outline,
    Icons.support_agent_rounded,
    Icons.account_balance_outlined
  ];

  List icons=[
    Icons.account_circle_outlined,
    Icons.notifications_active_outlined,
    Icons.password,
    Icons.language,
    Icons.dark_mode,
    Icons.delete_outline
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           Padding(
             padding:  EdgeInsets.only(top: MediaQuery.of(context).padding.top+10),
             child: Stack(
               children: [
                 Align(
                     alignment: Alignment.topCenter,
                     child: AppLargeText(
                       text: "Setting",
                       color: Theme.of(context).colorScheme.secondary,
                       size: 18,
                     )),
               ],
             ),
           ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: AppLargeText(
                text: "Applications",
                color: Theme.of(context).colorScheme.secondary.withOpacity(0.6),
                size: 16,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20,right: 20,top: 20),
              child: Column(
                children: List.generate(6, (index) => index)
                    .map((e) => Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: Row(
                            children: [
                              Icon(icons[e],color: e==5?Colors.red:Theme.of(context).colorScheme.secondary.withOpacity(0.6),size: 30,),
                              SizedBox(width: 15,),
                              AppLargeText(text: menu[e],color:e==5?Colors.red: Theme.of(context).colorScheme.secondary,size: 14,)
                            ],
                          ),
                    ))
                    .toList(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20,top: 10),
              child: AppLargeText(
                text: "About",
                color: Theme.of(context).colorScheme.secondary.withOpacity(0.6),
                size: 16,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20,right: 20,top: 20),
              child: Column(
                children: List.generate(5, (index) => index)
                    .map((e) => Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Row(
                    children: [
                      Icon(aboutIcon[e],color: Theme.of(context).colorScheme.secondary.withOpacity(0.6),size: 30,),
                      SizedBox(width: 15,),
                      AppLargeText(text: menuAbout[e],color:Theme.of(context).colorScheme.secondary,size: 14,)
                    ],
                  ),
                ))
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
