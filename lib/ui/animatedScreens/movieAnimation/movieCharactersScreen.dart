import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smartkit_pro/ui/animatedScreens/movieAnimation/characterDetailsScreen.dart';
import 'package:smartkit_pro/ui/animatedScreens/movieAnimation/models/character.dart';
import 'package:smartkit_pro/utils/convertNumber.dart';

final List<Character> characters = [
  Character(
      backgroundImageUrl:
          "assets/images/animatedScreens/movieAnimation/spider_man.svg",
      foregroundImageUrl:
          "assets/images/animatedScreens/movieAnimation/spider_man.png",
      backgroundColor: const Color(0xfff13b17),
      description:
          "In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before the final copy is available",
      name: "Spider Man"),
  Character(
      backgroundImageUrl:
          "assets/images/animatedScreens/movieAnimation/iron_man.svg",
      foregroundImageUrl:
          "assets/images/animatedScreens/movieAnimation/iron_man.png",
      backgroundColor: const Color(0xffa82b2a),
      description:
          "In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before the final copy is available",
      name: "Iron Man"),
  Character(
      backgroundImageUrl:
          "assets/images/animatedScreens/movieAnimation/captain_america.svg",
      foregroundImageUrl:
          "assets/images/animatedScreens/movieAnimation/captain_america.png",
      backgroundColor: const Color(0xff1f7dd0),
      description:
          "In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before the final copy is available",
      name: "Captain America"),
  Character(
      backgroundImageUrl:
          "assets/images/animatedScreens/movieAnimation/blackwidow.svg",
      foregroundImageUrl:
          "assets/images/animatedScreens/movieAnimation/blackwidow.png",
      backgroundColor: const Color(0xff244267),
      description:
          "In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before the final copy is available",
      name: "Black Widow"),
];

class MovieCharactersScreen extends StatefulWidget {
  const MovieCharactersScreen({Key? key}) : super(key: key);

  @override
  State<MovieCharactersScreen> createState() => _MovieCharactersScreenState();
}

class _MovieCharactersScreenState extends State<MovieCharactersScreen>
    with TickerProviderStateMixin {
  late final PageController _pageController =
      PageController(initialPage: 1, viewportFraction: 0.825)
        ..addListener(pageControllerListener);

  late int currentCharacterIndex = 1;
  double _currentCharacterPage = 1.0;

  void pageControllerListener() {
    setState(() {
      _currentCharacterPage = _pageController.page!;
    });
  }

  @override
  void dispose() {
    _pageController.removeListener(pageControllerListener);
    _pageController.dispose();
    super.dispose();
  }

  Widget _buildTopMenu() {
    return Align(
      alignment: Alignment.topCenter,
      child: Padding(
        padding: EdgeInsets.only(
            left: MediaQuery.of(context).size.width * (0.05),
            right: MediaQuery.of(context).size.width * (0.05),
            top: MediaQuery.of(context).padding.top +
                MediaQuery.of(context).size.height * (0.0125)),
        child: Row(
          children: [
            IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: const Icon(Icons.arrow_back_ios)),
            const Spacer(),
            IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
          ],
        ),
      ),
    );
  }

  void navigateToDetailsScreen(int characterIndex) {
    Navigator.of(context).push(
      PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 500),
        reverseTransitionDuration: const Duration(milliseconds: 500),
        pageBuilder: (context, firstAnimation, secondAnimation) {
          return CharacterDetailsScreen(
            character: characters[characterIndex],
            characterIndex: characterIndex,
          );
        },
      ),
    );
  }

  Widget _buildCharacterPageView() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * (0.6),
        child: PageView.builder(
            clipBehavior: Clip.none,
            onPageChanged: (index) {
              setState(() {
                currentCharacterIndex = index;
              });
            },
            controller: _pageController,
            itemCount: characters.length,
            itemBuilder: (context, index) {
              double pageOffset = 1.0 * (index) - _currentCharacterPage;
              //to measure the scale of container
              double scale = 1.0;
              //
              double backgroundImageDx = 0;

              if (pageOffset >= 0) {
                scale = ConvertNumber.inRange(
                    currentValue: pageOffset,
                    minValue: 0.0,
                    maxValue: 1.0,
                    newMaxValue: 0.9,
                    newMinValue: 1.0);
                backgroundImageDx = ConvertNumber.inRange(
                    currentValue: pageOffset,
                    minValue: 0.0,
                    maxValue: 1.0,
                    newMaxValue: 25,
                    newMinValue: 0);
              } else {
                scale = ConvertNumber.inRange(
                    currentValue: pageOffset,
                    minValue: -1.0,
                    maxValue: 0.0,
                    newMaxValue: 1.0,
                    newMinValue: 0.9);
                backgroundImageDx = ConvertNumber.inRange(
                    currentValue: pageOffset,
                    minValue: -1.0,
                    maxValue: 0.0,
                    newMaxValue: 0,
                    newMinValue: -25);
              }

              return Transform.scale(
                scale: scale,
                child: GestureDetector(
                  onTap: () {
                    navigateToDetailsScreen(index);
                  },
                  child: Container(
                    child: LayoutBuilder(builder: (context, boxConstraints) {
                      return Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Hero(
                            tag: "${index}backgroundColor",
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30.0),
                                color: characters[index].backgroundColor,
                              ),
                            ),
                          ),
                          Positioned(
                            top: -75,
                            left: boxConstraints.maxWidth * (0.25),
                            child: SizedBox(
                              width: boxConstraints.maxWidth * (0.5),
                              child: Hero(
                                tag: characters[index].backgroundImageUrl,
                                child: SvgPicture.asset(
                                  characters[index].backgroundImageUrl,
                                  color:
                                      Theme.of(context).scaffoldBackgroundColor,
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            top: boxConstraints.maxHeight * (-0.25),
                            left: backgroundImageDx * 3,
                            child: Hero(
                              tag: characters[index].foregroundImageUrl,
                              child: SizedBox(
                                width: boxConstraints.maxWidth,
                                child: Image.asset(
                                    characters[index].foregroundImageUrl),
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                              padding: EdgeInsets.only(
                                left: boxConstraints.maxWidth * (0.075),
                                top: boxConstraints.maxHeight * (0.4),
                              ),
                              child: Hero(
                                tag: "${index}name",
                                child: Material(
                                  type: MaterialType.transparency,
                                  child: Text(
                                    characters[index].name,
                                    style: const TextStyle(
                                        color: Colors.white, fontSize: 30),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                              padding: EdgeInsets.only(
                                left: boxConstraints.maxWidth * (0.075),
                                right: boxConstraints.maxWidth * (0.075),
                                top: boxConstraints.maxHeight * (0.5),
                              ),
                              child: Hero(
                                tag: "${index}description",
                                child: Material(
                                  type: MaterialType.transparency,
                                  child: Text(
                                    characters[index].description,
                                    textAlign: TextAlign.start,
                                    maxLines: 3,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                        color: Colors.white, fontSize: 20),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Padding(
                              padding: EdgeInsets.only(
                                  bottom: boxConstraints.maxHeight * (0.05)),
                              child: Transform.rotate(
                                angle: (pi / 180) * (270),
                                child: Icon(
                                  Icons.arrow_back_ios,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    }),
                    margin: const EdgeInsets.symmetric(horizontal: 5.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30.0)),
                  ),
                ),
              );
            }),
        margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).size.height * (0.025),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          //
          _buildCharacterPageView(),
          _buildTopMenu(),
        ],
      ),
    );
  }
}
