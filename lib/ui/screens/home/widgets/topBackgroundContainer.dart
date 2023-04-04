import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smartkit_pro/ui/screens/home/widgets/moreMenuBottomSheet.dart';

class TopBackgroundContainer extends StatelessWidget {
  final String title;

  const TopBackgroundContainer({Key? key, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: BackgroundCardPainter(Theme.of(context).colorScheme.secondary),
      child: Container(
        padding: EdgeInsets.only(
            top: MediaQuery.of(context).padding.top,
            left: MediaQuery.of(context).size.width * (0.075),
            right: MediaQuery.of(context).size.width * (0.075)),
        child: LayoutBuilder(builder: (context, boxConstraints) {
          return Stack(
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding:
                      EdgeInsets.only(top: boxConstraints.maxHeight * (0.05)),
                  child: Row(
                    children: [
                      Container(
                        width: 150,
                        height: 30,
                        child:
                            SvgPicture.asset("assets/images/smartkit_logo.svg"),
                        color: Colors.transparent,
                      ),
                      const Spacer(),
                      Transform.translate(
                        offset: const Offset(8, 0),
                        child: IconButton(
                            iconSize: 30.0,
                            onPressed: () {
                              showModalBottomSheet(
                                  isScrollControlled: true,
                                  shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20.0),
                                    topRight: Radius.circular(20.0),
                                  )),
                                  context: context,
                                  builder: (context) {
                                    return const MoreMenuBottomSheet();
                                  });
                            },
                            icon: Icon(
                              Icons.more_vert,
                              color: Theme.of(context).colorScheme.primary,
                            )),
                      )
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: EdgeInsets.only(
                      bottom: boxConstraints.maxHeight * (0.25)),
                  child: Text(
                    title,
                    style: TextStyle(
                        color: Theme.of(context)
                            .colorScheme
                            .onSecondary
                            .withOpacity(0.15),
                        fontWeight: FontWeight.w600,
                        fontSize: 42),
                  ),
                ),
              ),
            ],
          );
        }),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * (0.225),
      ),
    );
  }
}

class BackgroundCardPainter extends CustomPainter {
  final Color color;

  BackgroundCardPainter(this.color);
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = color;

    Path path = Path();

    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height * (0.825));
    path.quadraticBezierTo(
        size.width * (0.5), size.height * (1.3), 0, size.height * (0.825));
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
