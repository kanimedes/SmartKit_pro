import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smartkit_pro/ui/theme/colors.dart';
import 'package:smartkit_pro/ui/theme/theme.dart';
import 'package:smartkit_pro/utils/constants.dart';
import 'package:url_launcher/url_launcher.dart';

class MoreMenuBottomSheet extends StatelessWidget {
  const MoreMenuBottomSheet({Key? key}) : super(key: key);

  void _vibrate() {
    HapticFeedback.heavyImpact();
    HapticFeedback.vibrate();
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0)),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: LayoutBuilder(builder: (context, constraints) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: constraints.maxHeight * (0.05),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Text(
                  "Theme",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                      fontSize: 22.5,
                      fontWeight: FontWeight.w500),
                ),
              ),
              SizedBox(
                height: constraints.maxHeight * (0.05),
              ),
              Wrap(
                alignment: WrapAlignment.center,
                direction: Axis.horizontal,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: colorThemes
                    .map((colorTheme) => GestureDetector(
                          onTap: () {
                            _vibrate();
                            context
                                .read<ThemeAndRTLCubit>()
                                .changeTheme(colorTheme);
                          },
                          child: Container(
                              margin: EdgeInsets.only(
                                  right: constraints.maxWidth * (0.04),
                                  left: constraints.maxWidth * (0.04),
                                  bottom: constraints.maxHeight * (0.05)),
                              width: constraints.maxWidth * (0.25),
                              height: constraints.maxWidth * (0.25),
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                      offset: const Offset(0, 2.5),
                                      blurRadius: 15,
                                      spreadRadius: 0,
                                      color: colorTheme.darkPrimaryColor
                                          .withOpacity(0.5))
                                ],
                                shape: BoxShape.circle,
                                gradient: LinearGradient(colors: [
                                  colorTheme.primaryColor,
                                  colorTheme.darkPrimaryColor
                                ]),
                              )),
                        ))
                    .toList(),
              ),
              SizedBox(
                height: constraints.maxHeight * (0.025),
              ),
              Padding(
                padding: EdgeInsets.only(
                    right: constraints.maxWidth * (0.04),
                    left: constraints.maxWidth * (0.04)),
                child: Row(
                  children: [
                    Text(
                      "RTL Enable",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                          fontSize: 22.5,
                          fontWeight: FontWeight.w500),
                    ),
                    Spacer(),
                    BlocBuilder<ThemeAndRTLCubit, ThemeAndRTLState>(
                      builder: (context, state) {
                        return Switch.adaptive(
                            activeColor: state.theme.colorScheme.primary,
                            value: TextDirection.rtl == state.textDirection,
                            onChanged: (value) {
                              if (value) {
                                context
                                    .read<ThemeAndRTLCubit>()
                                    .changeTextDirection(TextDirection.rtl);
                              } else {
                                context
                                    .read<ThemeAndRTLCubit>()
                                    .changeTextDirection(TextDirection.ltr);
                              }
                            });
                      },
                    )
                  ],
                ),
              ),
              SizedBox(
                height: constraints.maxHeight * (0.04),
              ),
              Divider(
                color: Theme.of(context).colorScheme.primary,
              ),
              SizedBox(
                height: constraints.maxHeight * (0.025),
              ),
              GestureDetector(
                onTap: () async {
                  final canLaunchUrl = await canLaunch(productBuyLink);
                  if (canLaunchUrl) {
                    launch(productBuyLink);
                  }
                },
                child: Container(
                  alignment: Alignment.center,
                  child: Text(
                    "Buy Now",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.background),
                  ),
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            offset: const Offset(2.5, 2.5),
                            blurRadius: 15,
                            spreadRadius: 1,
                            color: Theme.of(context)
                                .colorScheme
                                .primaryContainer
                                .withOpacity(0.5))
                      ],
                      borderRadius: BorderRadius.circular(20.0),
                      gradient: LinearGradient(colors: [
                        Theme.of(context).colorScheme.primary,
                        Theme.of(context).colorScheme.primaryContainer
                      ])),
                  width: constraints.maxWidth,
                  height: constraints.maxHeight * (0.1125),
                ),
              ),
              const Spacer(),
              Center(
                child: Text("Made By",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: 15.0),
                    textAlign: TextAlign.center),
              ),
              SizedBox(
                height: constraints.maxHeight * (0.0125),
              ),
              Center(
                child: SvgPicture.asset(
                  "assets/images/wrteam_logo.svg",
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
            ],
          );
        }),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * (0.75),
        decoration: const BoxDecoration(
            color: Colors.white24,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0),
              topRight: Radius.circular(20.0),
            )),
      ),
    );
  }
}
