import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smartkit_pro/ui/animatedScreens/recipeAnimation/models/recipe.dart';

class VideoDetailsContainer extends StatelessWidget {
  final Recipe recipe;
  final int index;
  final int currentSelectedVideoIndex;
  const VideoDetailsContainer(
      {Key? key,
      required this.recipe,
      required this.currentSelectedVideoIndex,
      required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: LayoutBuilder(builder: (context, boxConstraints) {
        return Stack(
          clipBehavior: Clip.none,
          children: [
            Positioned(
              top: -15,
              right: 25,
              child: Container(
                padding: const EdgeInsets.only(top: 5.0),
                child: Center(
                  child: SvgPicture.asset(
                      "assets/images/animatedScreens/recipeAnimation/favorite.svg"),
                ),
                width: 50.0,
                height: 50.0,
                decoration: const BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color: Color(0x4d932243),
                          offset: Offset(0, 2),
                          blurRadius: 10,
                          spreadRadius: 0)
                    ],
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                        colors: [Color(0xffff747a), Color(0xfff7699b)])),
              ),
            ),
            Align(
                alignment: Alignment.topCenter,
                child: Container(
                  margin:
                      const EdgeInsets.only(top: 40.0, left: 15.0, right: 15.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const CircleAvatar(),
                          const SizedBox(
                            width: 10.0,
                          ),
                          Flexible(
                            child: Text(
                              recipe.name,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                  fontSize: 16.0, color: Color(0xffc74c74)),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: boxConstraints.maxHeight * (0.1),
                      ),
                      Text(
                        recipe.description,
                        maxLines: 4,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            color: Color(0xff9e8b91), fontSize: 12.0),
                      ),
                      SizedBox(
                        height: boxConstraints.maxHeight * (0.1),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                              "assets/images/animatedScreens/recipeAnimation/view.svg"),
                          SizedBox(
                            width: boxConstraints.maxWidth * (0.025),
                          ),
                          Text(
                            recipe.views,
                            style: const TextStyle(
                                color: Color(0xff9e8b91), fontSize: 12),
                          ),
                          SizedBox(
                            width: boxConstraints.maxWidth * (0.05),
                          ),
                          Container(
                            width: 1.0,
                            height: 15.0,
                            color: const Color(0xff9e8b91),
                          ),
                          SizedBox(
                            width: boxConstraints.maxWidth * (0.05),
                          ),
                          SvgPicture.asset(
                              "assets/images/animatedScreens/recipeAnimation/fav.svg"),
                          SizedBox(
                            width: boxConstraints.maxWidth * (0.025),
                          ),
                          Text(
                            recipe.likes,
                            style: const TextStyle(
                                color: Color(0xff9e8b91), fontSize: 12),
                          ),
                        ],
                      )
                    ],
                  ),
                )),
          ],
        );
      }),
      decoration: BoxDecoration(boxShadow: const [
        BoxShadow(
          offset: Offset(0, 5),
          blurRadius: 5.0,
          color: Colors.black12,
        )
      ], color: Colors.white, borderRadius: BorderRadius.circular(20.0)),
      width: MediaQuery.of(context).size.width * (0.7),
      height: MediaQuery.of(context).size.height * (0.25),
    );
  }
}
