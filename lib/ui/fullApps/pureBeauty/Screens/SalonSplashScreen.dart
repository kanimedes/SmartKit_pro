import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'authentication/SalonLogin.dart';

class SalonSplashScreen extends StatefulWidget {
  const SalonSplashScreen({Key? key}) : super(key: key);

  @override
  _SalonSplashScreenState createState() => _SalonSplashScreenState();
}

class _SalonSplashScreenState extends State<SalonSplashScreen> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: [SystemUiOverlay.bottom]);
    Future.delayed(Duration(milliseconds: 2000), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => SalonLogin()),
      );
    });
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.light,
      ),
      child: Scaffold(
        body: Container(
          height: double.maxFinite,
          width: double.maxFinite,
          constraints: BoxConstraints.expand(),
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                      'assets/images/fullApps/pureBeauty/splashscreen.jpg'),
                  fit: BoxFit.cover)),
          child: /*SmartKitProConstant.isfirebaseimage
              ? OctoImage(
                  image: CachedNetworkImageProvider(
                      'https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/salonapp%2Fsplashscreen.jpg?alt=media&token=ec262751-a8b3-4cf0-b968-7a76138f657b'),
                  placeholderBuilder:
                      OctoPlaceholder.blurHash('L5RymRoM_N%MxuaytRof~qa}4nRj'),
                  errorBuilder: OctoError.icon(color: Colors.black),
                  fit: BoxFit.cover,
                  height: double.maxFinite,
                  width: double.maxFinite,
                )
              : */
              Image.asset(
            'assets/images/fullApps/pureBeauty/splashscreen.jpg',
            width: double.maxFinite,
            height: double.maxFinite,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
