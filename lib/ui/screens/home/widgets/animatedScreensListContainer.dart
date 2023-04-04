import 'package:flutter/material.dart';
import 'package:smartkit_pro/app/routes.dart';
import 'package:smartkit_pro/ui/screens/home/widgets/menuTileContainer.dart';
import 'package:smartkit_pro/ui/screens/home/widgets/moreFeaturesComingSoonContainer.dart';
import 'package:smartkit_pro/ui/screens/home/widgets/topBackgroundContainer.dart';
import 'package:smartkit_pro/utils/constants.dart';

class AnimatedScreenListContainer extends StatelessWidget {
  AnimatedScreenListContainer({Key? key}) : super(key: key);

  //map will have title and route of this screen
  final List<Map<String, dynamic>> _animatedScreens = [
    {"title": "Sign-in Form Animation", "route": Routes.signInFormAnimation},
    {"title": "Music Animation", "route": Routes.musicAnimation},
    {"title": "Shopping Animation", "route": Routes.shoppingAnimation},
    {"title": "Fitness Animation", "route": Routes.fitnessAnimation},
    {"title": "Movie Animation", "route": Routes.movieAnimation},
    {"title": "Travel Animation", "route": Routes.travelAnimation},
    {"title": "Recipe Animation", "route": Routes.recipeAnimation},
    {"title": "Pizza Animation", "route": Routes.pizzaOrderAnimation},
    {"title": "Toy Order Animation", "route": Routes.toyStoreAnimation},
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
              title: "Animations",
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * (0.15)),
                child: Column(
                  children: [
                    ..._animatedScreens
                        .map((e) => MenuTileContainer(
                              onTap: () {
                                Navigator.of(context).pushNamed(
                                    e['route'].toString(),
                                    arguments: MediaQuery.of(context).size);
                              },
                              title: e['title'],
                            ))
                        .toList(),
                    const MoreFeatureComingSoonContainer(
                      featureTitle: "Animations",
                      googleFormLink: animationsGoogleForm,
                    )
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
