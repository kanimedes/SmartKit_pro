import 'package:flutter/material.dart';
import 'package:smartkit_pro/app/routes.dart';
import 'package:smartkit_pro/ui/screens/home/widgets/menuTileContainer.dart';
import 'package:smartkit_pro/ui/screens/home/widgets/moreFeaturesComingSoonContainer.dart';
import 'package:smartkit_pro/ui/screens/home/widgets/topBackgroundContainer.dart';
import 'package:smartkit_pro/utils/constants.dart';

class SnippetsListContainer extends StatelessWidget {
  SnippetsListContainer({Key? key}) : super(key: key);

  final List<Map<String, dynamic>> _snippets = [
    {
      "title": "Dialogs",
      "route": Routes.dialogs,
    },
    {
      "title": "Pagination",
      "route": Routes.pagination,
    },
    {
      "title": "Bottom Navs",
      "route": Routes.bottomNavs,
    },
    {
      "title": "Search Bars",
      "route": Routes.searchBars,
    },
    {
      "title": "Menu Bars",
      "route": Routes.menuBars,
    },
    {
      "title": "Buttons - 1",
      "route": Routes.buttons_1,
    },
    {
      "title": "Buttons - 2",
      "route": Routes.buttons_2,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: SingleChildScrollView(
        padding: const EdgeInsets.only(bottom: 100.0),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            const TopBackgroundContainer(
              title: "Snippets",
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * (0.15)),
                child: Column(
                  children: [
                    ..._snippets
                        .map((e) => MenuTileContainer(
                              onTap: () {
                                Navigator.of(context).pushNamed(e['route']);
                              },
                              title: e['title'],
                            ))
                        .toList(),
                    const MoreFeatureComingSoonContainer(
                        googleFormLink: snippetsGoogleForm,
                        featureTitle: "Snippets")
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
