import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'models/character.dart';

const List<String> relatedMoviesImages = [
  "assets/images/animatedScreens/movieAnimation/relatedMovie-1.jpg",
  "assets/images/animatedScreens/movieAnimation/relatedMovie-2.jpg",
  "assets/images/animatedScreens/movieAnimation/relatedMovie-3.jpg",
];

const List<String> latestMoviesImages = [
  "assets/images/animatedScreens/movieAnimation/latestMovie-1.jpg",
  "assets/images/animatedScreens/movieAnimation/latestMovie-2.jpg",
  "assets/images/animatedScreens/movieAnimation/latestMovie-3.jpg",
];

class CharacterDetailsScreen extends StatefulWidget {
  final int characterIndex;
  final Character character;
  const CharacterDetailsScreen(
      {Key? key, required this.character, required this.characterIndex})
      : super(key: key);

  @override
  State<CharacterDetailsScreen> createState() => _CharacterDetailsScreenState();
}

class _CharacterDetailsScreenState extends State<CharacterDetailsScreen>
    with TickerProviderStateMixin {
  late final AnimationController _bottomMenuHeightAnimationController =
      AnimationController(
          vsync: this, duration: const Duration(milliseconds: 900));

  late final Animation<double> _bottomMenuHeightUpAnimation =
      Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
          parent: _bottomMenuHeightAnimationController,
          curve: const Interval(0.0, 0.6, curve: Curves.easeInOut)));

  late final Animation<double> _bottomMenuHeightDownAnimation =
      Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
          parent: _bottomMenuHeightAnimationController,
          curve: const Interval(0.6, 1.0, curve: Curves.easeInOut)));

  late final Animation<double> _backButtonAnimation =
      Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
          parent: _bottomMenuHeightAnimationController,
          curve: const Interval(0.0, 0.6, curve: Curves.easeInOut)));

  late final AnimationController _latestMoviesTitleAnimationController =
      AnimationController(
          vsync: this, duration: const Duration(milliseconds: 500));

  late final Animation<double> _latestMoviesTitleFadeAnimation =
      Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
          parent: _latestMoviesTitleAnimationController,
          curve: Curves.easeInOut));

  late final List<AnimationController>
      _latestMoviesContainerAnimationControllers = [];

  late final AnimationController _relatedMoviesTitleAnimationController =
      AnimationController(
          vsync: this, duration: const Duration(milliseconds: 500));

  late final Animation<double> _relatedMoviesTitleFadeAnimation =
      Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
          parent: _latestMoviesTitleAnimationController,
          curve: Curves.easeInOut));

  late final List<AnimationController>
      _relatedMoviesContainerAnimationControllers = [];

  @override
  void initState() {
    super.initState();
    startAnimation();
  }

  Future<void> startAnimation() async {
    for (var i = 0; i < latestMoviesImages.length; i++) {
      _latestMoviesContainerAnimationControllers.add(AnimationController(
          vsync: this, duration: const Duration(milliseconds: 400)));

      _relatedMoviesContainerAnimationControllers.add(AnimationController(
          vsync: this, duration: const Duration(milliseconds: 400)));
    }
    await Future.delayed(const Duration(milliseconds: 250));

    await _bottomMenuHeightAnimationController.forward();

    _latestMoviesTitleAnimationController.forward();
    await _relatedMoviesTitleAnimationController.forward();
  }

  Widget _buildBackButton() {
    return Align(
      alignment: Alignment.topLeft,
      child: Padding(
        padding: EdgeInsets.only(
            left: MediaQuery.of(context).size.width * (0.025),
            top: MediaQuery.of(context).padding.top +
                MediaQuery.of(context).size.height * (0.0125)),
        child: FadeTransition(
          opacity: _backButtonAnimation,
          child: IconButton(
              onPressed: () {
                onBackCallback();
              },
              icon: Transform.rotate(
                angle: (pi / 180) * 270,
                child: const Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                ),
              )),
        ),
      ),
    );
  }

  void onBackCallback() async {
    if (!_bottomMenuHeightAnimationController.isAnimating) {
      await _bottomMenuHeightAnimationController.reverse();
      Navigator.of(context).pop();
    }
  }

  Widget _buildBackgroundContainer() {
    return Hero(
      tag: "${widget.characterIndex}backgroundColor",
      child: Container(
        color: widget.character.backgroundColor,
      ),
    );
  }

  Widget _buildCharacterName() {
    return Align(
      alignment: Alignment.topLeft,
      child: Padding(
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).size.height * (0.365),
          left: MediaQuery.of(context).size.width * (0.075),
        ),
        child: Hero(
          tag: "${widget.characterIndex}name",
          child: Material(
            type: MaterialType.transparency,
            child: Text(
              widget.character.name,
              style: const TextStyle(color: Colors.white, fontSize: 30),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBottomMenu() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: AnimatedBuilder(
          animation: _bottomMenuHeightAnimationController,
          builder: (context, _) {
            final height = (MediaQuery.of(context).size.height *
                    0.45 *
                    _bottomMenuHeightUpAnimation.value) -
                (MediaQuery.of(context).size.height *
                    0.025 *
                    _bottomMenuHeightDownAnimation.value);

            return Container(
              child: _bottomMenuHeightAnimationController.value != 1.0
                  ? const SizedBox()
                  : LayoutBuilder(builder: (context, boxConstraints) {
                      return Column(
                        children: [
                          SizedBox(
                            height: boxConstraints.maxHeight * (0.075),
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: EdgeInsets.only(
                                  left: MediaQuery.of(context).size.width *
                                      (0.075)),
                              child: FadeTransition(
                                opacity: _latestMoviesTitleFadeAnimation,
                                child: const Text(
                                  "Latest Movies",
                                  style: TextStyle(
                                      fontSize: 22.0,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: boxConstraints.maxHeight * (0.05),
                          ),
                          Flexible(
                            child: Container(
                              clipBehavior: Clip.none,
                              child: ListView.builder(
                                  clipBehavior: Clip.none,
                                  padding: EdgeInsets.only(
                                      left: MediaQuery.of(context).size.width *
                                          (0.075)),
                                  scrollDirection: Axis.horizontal,
                                  itemCount: latestMoviesImages.length,
                                  itemBuilder: ((context, index) =>
                                      LatestMovieContainer(
                                          initialAnimationDelayInMilliSeconds:
                                              500,
                                          animationController:
                                              _latestMoviesContainerAnimationControllers[
                                                  index],
                                          imageUrl: latestMoviesImages[index],
                                          index: index,
                                          character: widget.character))),
                              height: boxConstraints.maxHeight * (0.225),
                            ),
                          ),
                          SizedBox(
                            height: boxConstraints.maxHeight * (0.05),
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: EdgeInsets.only(
                                  left: MediaQuery.of(context).size.width *
                                      (0.075)),
                              child: FadeTransition(
                                opacity: _relatedMoviesTitleFadeAnimation,
                                child: const Text(
                                  "Related Movies",
                                  style: TextStyle(
                                      fontSize: 22.0,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: boxConstraints.maxHeight * (0.05),
                          ),
                          Container(
                            clipBehavior: Clip.none,
                            child: ListView.builder(
                                clipBehavior: Clip.none,
                                padding: EdgeInsets.only(
                                    left: MediaQuery.of(context).size.width *
                                        (0.075)),
                                scrollDirection: Axis.horizontal,
                                itemCount: relatedMoviesImages.length,
                                itemBuilder: ((context, index) =>
                                    LatestMovieContainer(
                                        initialAnimationDelayInMilliSeconds:
                                            1000,
                                        imageUrl: relatedMoviesImages[index],
                                        animationController:
                                            _relatedMoviesContainerAnimationControllers[
                                                index],
                                        index: index,
                                        character: widget.character))),
                            height: boxConstraints.maxHeight * (0.225),
                          ),
                        ],
                      );
                    }),
              width: MediaQuery.of(context).size.width,
              height: height,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20))),
            );
          }),
    );
  }

  Widget _buildDescription() {
    return Align(
      alignment: Alignment.topLeft,
      child: Padding(
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).size.height * (0.425),
          left: MediaQuery.of(context).size.width * (0.075),
          right: MediaQuery.of(context).size.width * (0.075),
        ),
        child: Hero(
          tag: "${widget.characterIndex}description",
          child: Material(
            type: MaterialType.transparency,
            child: Text(widget.character.description,
                textAlign: TextAlign.start,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(color: Colors.white, fontSize: 20)),
          ),
        ),
      ),
    );
  }

  Widget _buildChracterBackgroundImage() {
    return Align(
      alignment: Alignment.topCenter,
      child: Padding(
        padding: EdgeInsets.only(
            top: MediaQuery.of(context).padding.top +
                MediaQuery.of(context).size.height * (0.05)),
        child: Hero(
            tag: widget.character.backgroundImageUrl,
            child: SvgPicture.asset(widget.character.backgroundImageUrl)),
      ),
    );
  }

  Widget _buildChracterForegroundImage() {
    return Align(
      alignment: Alignment.topCenter,
      child: Hero(
          tag: widget.character.foregroundImageUrl,
          child: Image.asset(widget.character.foregroundImageUrl)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        onBackCallback();
        return Future.value(false);
      },
      child: Scaffold(
        body: Stack(
          children: [
            _buildBackgroundContainer(),
            _buildChracterBackgroundImage(),
            _buildChracterForegroundImage(),
            _buildCharacterName(),
            _buildDescription(),

            _buildBottomMenu(),
            //
            _buildBackButton(),
          ],
        ),
      ),
    );
  }
}

class LatestMovieContainer extends StatefulWidget {
  final AnimationController animationController;
  final int initialAnimationDelayInMilliSeconds;

  final Character character;
  final String imageUrl;
  final int index;
  const LatestMovieContainer(
      {Key? key,
      required this.initialAnimationDelayInMilliSeconds,
      required this.animationController,
      required this.index,
      required this.imageUrl,
      required this.character})
      : super(key: key);

  @override
  State<LatestMovieContainer> createState() => _LatestMovieContainerState();
}

class _LatestMovieContainerState extends State<LatestMovieContainer> {
  late Animation<double> scaleAnimation = Tween<double>(begin: 0.0, end: 1.0)
      .animate(CurvedAnimation(
          parent: widget.animationController, curve: Curves.easeInOut));

  late Animation<double> fadeAnimation = Tween<double>(begin: 0.0, end: 1.0)
      .animate(CurvedAnimation(
          parent: widget.animationController, curve: Curves.easeInOut));

  late Animation<Offset> slideAnimation = Tween<Offset>(
          begin: Offset(0.0, 0.25 + (widget.index * 0.1)), end: Offset.zero)
      .animate(CurvedAnimation(
          parent: widget.animationController, curve: Curves.easeInOut));

  @override
  void initState() {
    Future.delayed(
        Duration(
            milliseconds: widget.initialAnimationDelayInMilliSeconds +
                (widget.index * 200)), () {
      widget.animationController.forward();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: slideAnimation,
      child: FadeTransition(
        opacity: fadeAnimation,
        child: Container(
          margin: const EdgeInsets.only(right: 15.0),
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(widget.imageUrl), fit: BoxFit.cover),
              borderRadius: BorderRadius.circular(10.0),
              color: widget.character.backgroundColor),
          width: MediaQuery.of(context).size.width * (0.4),
        ),
      ),
    );
  }
}
