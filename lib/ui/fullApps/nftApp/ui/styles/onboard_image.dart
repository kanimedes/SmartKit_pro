import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smartkit_pro/ui/fullApps/nftApp/utils/image_path.dart';

class OnBoardimage extends StatelessWidget {
  final Color firstColor, secoundColor;
  final int flexone, flextwo;
  final String txtMain, txtSub, imageName;

  const OnBoardimage(
      {Key? key,
      required this.firstColor,
      required this.secoundColor,
      required this.flexone,
      required this.flextwo,
      required this.txtMain,
      required this.txtSub,
      required this.imageName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.6,
            child: Stack(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                        flex: flexone,
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.5,
                          color: firstColor,
                        )),
                    Expanded(
                        flex: flextwo,
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.5,
                          color: secoundColor,
                        )),
                  ],
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    margin: EdgeInsets.only(left: 80, right: 80),
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.3,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(100),
                          topRight: Radius.circular(100),
                        ),
                        image: DecorationImage(
                            image: AssetImage(
                              NftConstant.getImagePath(imageName),
                            ),
                            fit: BoxFit.cover)),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 10, top: 40),
            child: Text(
              txtMain,
              style: TextStyle(
                  color: Theme.of(context).colorScheme.secondary,
                  fontWeight: FontWeight.bold,
                  fontSize: 28),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 10, top: 20),
            child: Text(
              txtSub,
              style: TextStyle(
                color: Theme.of(context).colorScheme.secondary,
                fontSize: 16,
              ),
              maxLines: 2,
            ),
          ),
        ],
      ),
    );
  }
}
