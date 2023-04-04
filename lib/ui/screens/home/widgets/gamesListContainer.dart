import 'package:flutter/material.dart';
import 'package:smartkit_pro/app/routes.dart';
import 'package:smartkit_pro/ui/screens/home/widgets/menuTileContainer.dart';
import 'package:smartkit_pro/ui/screens/home/widgets/moreFeaturesComingSoonContainer.dart';
import 'package:smartkit_pro/ui/screens/home/widgets/topBackgroundContainer.dart';
import 'package:smartkit_pro/utils/constants.dart';

class GamesListContainer extends StatelessWidget {
  GamesListContainer({Key? key}) : super(key: key);

  final List<Map<String, dynamic>> _games = [
    {
      "title": "Snack",
      "route": Routes.snackGame,
    },
    {
      "title": "Card",
      "route": Routes.cardGame,
    },
    {
      "title": "Brick Breaker",
      "route": Routes.brickBreakerGame,
    },
    {
      "title": "Flappy Ball",
      "route": Routes.flappyBallGame,
    },
  ]; //"Snack", "Brick Breaker", "Flappy Ball"

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
              title: "Games",
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * (0.15)),
                child: Column(
                  children: [
                    ..._games
                        .map((game) => MenuTileContainer(
                              onTap: () {
                                Navigator.of(context).pushNamed(game['route']);
                              },
                              title: game['title'],
                            ))
                        .toList(),
                    const MoreFeatureComingSoonContainer(
                        googleFormLink: gamesGoogleForm, featureTitle: "Games")
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
