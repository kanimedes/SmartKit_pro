import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class MoreFeatureComingSoonContainer extends StatelessWidget {
  final String featureTitle;
  final String googleFormLink;
  const MoreFeatureComingSoonContainer(
      {Key? key, required this.featureTitle, required this.googleFormLink})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          left: MediaQuery.of(context).size.width * (0.075),
          right: MediaQuery.of(context).size.width * (0.075),
          top: MediaQuery.of(context).size.height * (0.05)),
      child: Opacity(
        opacity: 0.3,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("More ${featureTitle.toLowerCase()} coming soon",
                style: TextStyle(
                    color: Theme.of(context).colorScheme.background,
                    fontWeight: FontWeight.w600,
                    fontSize: 21.0),
                textAlign: TextAlign.center),
            const SizedBox(
              height: 5.0,
            ),
            InkWell(
              onTap: () async {
                final canLaunchUrl = await canLaunch(googleFormLink);
                print(canLaunchUrl);
                if (canLaunchUrl) {
                  launch(googleFormLink);
                }
              },
              child: const Text(
                "Tell us what you want?",
                style: TextStyle(
                    decoration: TextDecoration.underline,
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                    fontSize: 16.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
