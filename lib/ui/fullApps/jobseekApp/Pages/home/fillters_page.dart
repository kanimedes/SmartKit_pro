import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smartkit_pro/ui/fullApps/jobseekApp/UI/widgets/app_bar.dart';
import 'package:smartkit_pro/ui/fullApps/jobseekApp/widget/app_large_text.dart';
import 'package:smartkit_pro/ui/fullApps/jobseekApp/widget/app_text.dart';


class FilltersPage extends StatefulWidget {
  const FilltersPage({Key? key}) : super(key: key);

  @override
  State<FilltersPage> createState() => _FilltersPageState();
}

class _FilltersPageState extends State<FilltersPage> {
  RangeLabels labels = RangeLabels('10000', "200000");
  var selectedRange = RangeValues(10000, 200000);

  int currentIndex = 0;
  List companyName = [
    "Google",
    "Meta",
    "Amazon",
    "Apple",
    "Microsoft",
    "Netflix"
  ];

  List jobTypes = ["Any", "Full-Time", "Contract", "Part-Time"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding:
              EdgeInsets.only(top: MediaQuery.of(context).padding.top + 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: CommanAppBar(
                  title: "Filters",
                  edit: "Done",
                  editColor: Theme.of(context).colorScheme.primary,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Container(
                  width: MediaQuery.of(context).size.width * 1.0,
                  height: MediaQuery.of(context).size.height * 0.07,
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: Theme.of(context)
                              .colorScheme
                              .secondary
                              .withOpacity(0.6)),
                      borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Icon(
                          Icons.search,
                          color: Theme.of(context)
                              .colorScheme
                              .secondary
                              .withOpacity(0.4),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Flexible(
                        child: Center(
                          child: TextField(
                            decoration: InputDecoration.collapsed(
                              hintText: "Add a role or company or type",
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
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                child: GridView.count(
                    padding: EdgeInsets.only(top: 10),
                    crossAxisCount: 3,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    childAspectRatio: 3,
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 20,
                    children: List.generate(6, (index) => index)
                        .map((e) => Container(
                              width: MediaQuery.of(context).size.height * 0.02,
                              decoration: BoxDecoration(
                                  color:
                                      Theme.of(context).colorScheme.onPrimary,
                                  borderRadius: BorderRadius.circular(20)),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Center(
                                    child: AppText(
                                      text: companyName[e],
                                      color: Theme.of(context)
                                          .colorScheme
                                          .secondary,
                                      size: 12,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Icon(
                                    Icons.close,
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                    size: 14,
                                  )
                                ],
                              ),
                            ))
                        .toList()),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                child: Divider(
                  height: 1,
                  color: Colors.white,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, top: 20),
                child: AppLargeText(
                  text: "Salary Range",
                  color:
                      Theme.of(context).colorScheme.secondary.withOpacity(0.4),
                  size: 16,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, top: 10),
                child: Row(
                  children: [
                    AppText(
                      text: "The average listing price is ",
                      color: Theme.of(context)
                          .colorScheme
                          .secondary
                          .withOpacity(0.4),
                    ),
                    AppText(
                      text: "\$84,000",
                      color: Theme.of(context)
                          .colorScheme
                          .secondary
                          .withOpacity(0.2),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              RangeSlider(
                  divisions: 5,
                  activeColor: Theme.of(context).colorScheme.primary,
                  inactiveColor: Theme.of(context).colorScheme.secondary,
                  min: 1,
                  max: 2000000,
                  values: selectedRange,
                  labels: labels,
                  onChanged: (value) {
                    print("START: ${value.start}, End: ${value.end}");
                    setState(() {
                      selectedRange = value;
                      labels = RangeLabels(
                        "${value.start.toInt().toString()}\$",
                        "${value.end.toInt().toString()}\$",
                      );
                    });
                  }),
              Padding(
                padding: const EdgeInsets.only(left: 20, top: 30, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppText(
                      text: "Experience Level",
                      color: Theme.of(context)
                          .colorScheme
                          .secondary
                          .withOpacity(0.4),
                      size: 14,
                    ),
                    AppLargeText(
                      text: "Entery Level,Mid Le...",
                      size: 14,
                      color: Theme.of(context)
                          .colorScheme
                          .secondary
                          .withOpacity(0.7),
                    ),
                    Container(
                        width: 20,
                        height: 20,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Theme.of(context).colorScheme.secondary),
                        child: Icon(
                          Icons.edit,
                          size: 15,
                        ))
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20, left: 20, right: 20),
                child: Divider(
                  height: 1,
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, top: 30, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppText(
                      text: "Location",
                      color: Theme.of(context)
                          .colorScheme
                          .secondary
                          .withOpacity(0.4),
                      size: 14,
                    ),
                    AppLargeText(
                      text: "Los Angels, San Jose, San F... ",
                      size: 14,
                      color: Theme.of(context)
                          .colorScheme
                          .secondary
                          .withOpacity(0.7),
                    ),
                    Container(
                        width: 20,
                        height: 20,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Theme.of(context).colorScheme.secondary),
                        child: Icon(
                          Icons.edit,
                          size: 15,
                        ))
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20, left: 20, right: 20),
                child: Divider(
                  height: 1,
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, top: 40),
                child: AppLargeText(
                  text: "Job Types",
                  color:
                      Theme.of(context).colorScheme.secondary.withOpacity(0.4),
                  size: 16,
                ),
              ),
              SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    ...List.generate(4, (index) => index)
                        .map((e) => GestureDetector(
                              onTap: () {
                                setState(() {
                                  currentIndex = e;
                                });
                              },
                              child: Container(
                                margin: const EdgeInsets.only(
                                    left: 10, top: 20, right: 10),
                                width: MediaQuery.of(context).size.width * 0.3,
                                height:
                                    MediaQuery.of(context).size.height * 0.05,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: currentIndex == e
                                        ? Theme.of(context).colorScheme.primary
                                        : Theme.of(context)
                                            .colorScheme
                                            .onPrimary),
                                child: Center(
                                  child: AppLargeText(
                                    text: jobTypes[e],
                                    size: 16,
                                    color: currentIndex == e
                                        ? Theme.of(context)
                                            .colorScheme
                                            .secondary
                                        : Theme.of(context)
                                            .colorScheme
                                            .secondary
                                            .withOpacity(0.6),
                                  ),
                                ),
                              ),
                            ))
                        .toList(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
