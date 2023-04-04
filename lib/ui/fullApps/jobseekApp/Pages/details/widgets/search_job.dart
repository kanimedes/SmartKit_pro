import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smartkit_pro/ui/fullApps/jobseekApp/UI/widgets/app_bar.dart';
import 'package:smartkit_pro/ui/fullApps/jobseekApp/widget/app_large_text.dart';
import 'package:smartkit_pro/ui/fullApps/jobseekApp/widget/app_text.dart';


class serachJob extends StatefulWidget {
  const serachJob({Key? key}) : super(key: key);

  @override
  State<serachJob> createState() => _serachJobState();
}

class _serachJobState extends State<serachJob> {
  List Roles=[
    "Designer",
    "Administrate",
    "NGO",
    "Manager",
    "Management",
    "IT",
    "Marketing",
    "Developer",
    "SEO"
  ];


  Widget popularJobs() {
    return GridView.count(
      padding: const EdgeInsets.only(top: 20),
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      crossAxisCount: 3,
      childAspectRatio: 3,
      mainAxisSpacing: 20,
      crossAxisSpacing: 20,
      children: List.generate(9, (index) => index)
          .map((e) => Container(
                width: MediaQuery.of(context).size.height * 0.02,
                decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.onPrimary,
                    border: Border.all(
                        color: Theme.of(context).colorScheme.primary),
                    borderRadius: BorderRadius.circular(8)),
                child: Center(
                  child: AppText(
                    text: Roles[e],
                    color: Theme.of(context).colorScheme.secondary,
                    size: 14,
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
        padding: EdgeInsets.only(
            top: MediaQuery.of(context).padding.top + 10, left: 10, right: 10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CommanAppBar(
                  title: "Search", edit: "", editColor: Colors.transparent),
              Row(
                children: [
                  Container(
                      width: MediaQuery.of(context).size.width * 0.75,
                      height: MediaQuery.of(context).size.height * 0.07,
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: Theme.of(context).colorScheme.primary),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Row(
                          children: [
                            Icon(
                              Icons.search,
                              color: Theme.of(context)
                                  .colorScheme
                                  .secondary
                                  .withOpacity(0.6),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Flexible(
                              child: Center(
                                child: TextField(
                                  decoration: InputDecoration.collapsed(
                                    hintText: "Search a job or position",
                                    hintStyle: TextStyle(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .secondary
                                            .withOpacity(0.7)),
                                    border: InputBorder.none,
                                  ),
                                  style: TextStyle(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .secondary),
                                  maxLines: null,
                                ),
                              ),
                            ),
                          ],
                        ),
                      )),
                  Spacer(),
                  Container(
                    margin: EdgeInsets.only(right: 15),
                    width: MediaQuery.of(context).size.width * 0.12,
                    height: MediaQuery.of(context).size.height * 0.07,
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: Theme.of(context).colorScheme.primary),
                        borderRadius: BorderRadius.circular(10)),
                    child: Icon(
                      Icons.settings_input_composite_outlined,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).padding.top,
              ),
              AppLargeText(
                text: "Recent Searches",
                color: Theme.of(context).colorScheme.secondary,
                size: 16,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              AppText(
                text: "You don't have any search history",
                color: Theme.of(context).colorScheme.secondary.withOpacity(0.4),
              ),
              SizedBox(
                height: MediaQuery.of(context).padding.top,
              ),
              AppLargeText(
                text: "Popular Roles",
                color: Theme.of(context).colorScheme.secondary,
                size: 16,
              ),
              popularJobs()
            ],
          ),
        ),
      ),
    );
  }
}
