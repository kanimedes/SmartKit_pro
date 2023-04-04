import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:smartkit_pro/ui/fullApps/jobseekApp/UI/animation/showup.dart';
import 'package:smartkit_pro/ui/fullApps/jobseekApp/UI/widgets/imageConstant.dart';
import 'package:smartkit_pro/ui/fullApps/jobseekApp/widget/app_large_text.dart';
import 'package:smartkit_pro/ui/fullApps/jobseekApp/widget/app_text.dart';

import 'apply_content.dart';

class Detail_page extends StatefulWidget {
  const Detail_page({Key? key}) : super(key: key);

  @override
  State<Detail_page> createState() => _Detail_pageState();
}

class _Detail_pageState extends State<Detail_page> {
  int currentIndex = 0;
  List menu = ["Description", "Reqruiments", "About", "Reviews"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomPaint(
              painter: RPSCustomPainter(
                  color: Theme.of(context).colorScheme.primary),
              //clipper: CustomClipPath(),
              child: Container(
                padding: const EdgeInsetsDirectional.only(
                    top: 60, start: 20, end: 20),
                height: MediaQuery.of(context).size.height * 0.6,
                width: MediaQuery.of(context).size.width,
                child: Stack(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: ShowUp(
                        delay: 400,
                        child: Align(
                            alignment: Alignment.topLeft,
                            child: Icon(
                              Icons.arrow_back_ios,
                              color: Theme.of(context).colorScheme.secondary,
                            )),
                      ),
                    ),
                    ShowUp(
                      delay: 400,
                      child: Align(
                        alignment: Alignment.topRight,
                        child: Icon(
                          Icons.bookmark_border_outlined,
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                      ),
                    ),
                    ShowUp(
                      delay: 400,
                      child: Align(
                        alignment: Alignment.topCenter,
                        child: Column(
                          children: [
                            Container(
                              width: 70,
                              height: 70,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    image: AssetImage(
                                        JobappConstant.getImagePath(
                                            "google.png")),
                                    fit: BoxFit.cover),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            AppLargeText(
                              text: "Product Designer",
                              color: Theme.of(context).colorScheme.secondary,
                              size: 20,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            AppText(
                              text: "Google",
                              color: Theme.of(context)
                                  .colorScheme
                                  .secondary
                                  .withOpacity(0.6),
                            ),
                            Container(
                              padding: const EdgeInsets.only(),
                              height: 50,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(right: 20),
                                    width: 70,
                                    height: 25,
                                    decoration: BoxDecoration(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .secondary
                                            .withOpacity(0.25),
                                        borderRadius:
                                            BorderRadius.circular(30)),
                                    child: Center(
                                        child: AppText(
                                      text: "Design",
                                      size: 14,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .secondary,
                                    )),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(right: 20),
                                    width: 70,
                                    height: 25,
                                    decoration: BoxDecoration(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .secondary
                                            .withOpacity(0.25),
                                        borderRadius:
                                            BorderRadius.circular(30)),
                                    child: Center(
                                        child: AppText(
                                      text: "Design",
                                      size: 14,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .secondary,
                                    )),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(right: 20),
                                    width: 70,
                                    height: 25,
                                    decoration: BoxDecoration(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .secondary
                                            .withOpacity(0.25),
                                        borderRadius:
                                            BorderRadius.circular(30)),
                                    child: Center(
                                        child: AppText(
                                      text: "Design",
                                      size: 14,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .secondary,
                                    )),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 15),
                              child: Row(
                                children: [
                                  AppLargeText(
                                    text: "\$160.00/year",
                                    color:
                                        Theme.of(context).colorScheme.secondary,
                                    size: 16,
                                  ),
                                  SizedBox(
                                    width: 80,
                                  ),
                                  AppLargeText(
                                    text: "\$California, USA",
                                    color:
                                        Theme.of(context).colorScheme.secondary,
                                    size: 16,
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Transform.translate(
              offset: Offset(0, -MediaQuery.of(context).size.height * 0.110),
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: List.generate(4, (index) => index)
                      .map(
                        (e) => ShowUp(
                          delay: 500,
                          child: Container(
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            child: GestureDetector(
                              onTap: () {
                                _onItemTapped(e);
                              },
                              child: Row(
                                children: [
                                  AppLargeText(
                                    text: menu[e],
                                    color: currentIndex == e
                                        ? Theme.of(context)
                                            .colorScheme
                                            .secondary
                                            .withOpacity(0.8)
                                        : Theme.of(context)
                                            .colorScheme
                                            .secondary
                                            .withOpacity(0.4),
                                    size: 18,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),
            ),
            Transform.translate(
              offset: Offset(0, -MediaQuery.of(context).size.height * 0.100),
              child: ShowUp(delay: 600, child: _buildviewcontent(currentIndex)),
            ),
            Transform.translate(
                offset: Offset(0, -MediaQuery.of(context).size.height * 0.040),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Detail_content(),
                        ));
                  },
                  child: ShowUp(
                    delay: 700,
                    child: Container(
                      margin:
                          const EdgeInsetsDirectional.only(start: 20, end: 20),
                      width: MediaQuery.of(context).size.width,
                      height: 60,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Theme.of(context).colorScheme.primary),
                      child: Center(
                        child: AppLargeText(
                          text: "Apply Now",
                          color: Theme.of(context)
                              .colorScheme
                              .secondary
                              .withOpacity(0.9),
                          size: 22,
                        ),
                      ),
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  Widget _buildviewcontent(int index) {
    if (index == 0) {
      return descripationView();
    } else if (index == 1) {
      return requirmentsView();
    } else if (index == 2) {
      return descripationView();
    } else {
      return descripationView();
    }
  }

  Widget descripationView() {
    return Container(
      margin: const EdgeInsets.all(15),
      child: Text(
        "We are looking for an Accounts Payable Specialist to join our team and work with our accounting department to oversee our organization’s expenses.\n\nAccounts Payable Specialist responsibilities include processing payments, verifying invoices and performing account reconciliations as needed. \n\nUltimately, you will work with our accounting team to ensure our organization’s expenditures are accurate and our accounting practices are standardized across the organization.",
        style: TextStyle(color: Colors.white.withOpacity(0.6)),
        textAlign: TextAlign.left,
      ),
    );
  }

  Widget requirmentsView() {
    return Container(
      margin: const EdgeInsets.all(15),
      child: Text(
        "Charge expenses to accounts and cost centers and control petty cash spending\n\n"
        "Verify vendor accounts, pay vendors and resolve purchase order, invoice or payment discrepancies\n\n"
        "Issue purchase order amendments and stop payments\n"
        "Monitor payroll expense claims, including salary advances and overtime payments\n"
        "Reconcile account transactions with the general ledger\n"
        "Perform recordkeeping and prepare financial reports"
        "Keep informed of regulatory requirements and best practices in accounting",
        style: TextStyle(color: Colors.white.withOpacity(0.6)),
        textAlign: TextAlign.left,
      ),
    );
  }
}

class RPSCustomPainter extends CustomPainter {
  Color color;

  RPSCustomPainter({
    required this.color,
  });

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint0 = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    Path path0 = Path();
    //path0.moveTo(size.width , size.height * 0.0);
    path0.quadraticBezierTo(size.width * -0.08, size.height * 0.60,
        size.width * 0.05, size.height * 0.63);
    path0.cubicTo(size.width * 0.72, size.height * 0.73, size.width * 0.7,
        size.height * 0.73, size.width * 0.6, size.height * 0.71);
    path0.quadraticBezierTo(size.width * 1.3, size.height * 0.88,
        size.width * 1.0, size.height * 0.1);
    path0.lineTo(size.width, size.height * 0.0);
    path0.close();

    canvas.drawPath(path0, paint0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class CustomClipPath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double w = size.width;
    double h = size.height;
    final path = new Path();
    path.lineTo(0, h * 0.8);
    path.quadraticBezierTo(0, h, w * 0.1, h);
    path.lineTo(w, h * 2);
    path.lineTo(w, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
