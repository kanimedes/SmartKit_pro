import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:octo_image/octo_image.dart';
import 'package:smartkit_pro/ui/fullApps/grobag/Helper/GrobagColor.dart';
import 'package:smartkit_pro/ui/fullApps/grobag/Screen/GrobagLogin.dart';
import 'package:smartkit_pro/ui/fullApps/grobag/Screen/GrobagSignup.dart';

import 'GrobagHome.dart';

class GrobagSignupMain extends StatefulWidget {
  const GrobagSignupMain({Key? key}) : super(key: key);

  @override
  _GrobagSignupMainState createState() => _GrobagSignupMainState();
}

class _GrobagSignupMainState extends State<GrobagSignupMain> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text('Grobag'),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Stack(
          children: [
            OctoImage(
              image: CachedNetworkImageProvider(
                "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/grobag%2Fback.jpg?alt=media&token=7cec041b-f724-4042-960b-df38600eeb2f",
              ),
              placeholderBuilder: OctoPlaceholder.blurHash(
                "LgS6DA%Nx]V[M_ogofa#?wMwM{oy",
              ),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              errorBuilder: OctoError.icon(color: black),
              fit: BoxFit.fill,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                applebtn(),
                googlebtn(),
                signupbtn(),
                login(),
              ],
            ),
          ],
        ),
      ),
    );
  }

  login() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Already have an Account? ',
          ),
          InkWell(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => GrobagLogin(),
                ));
              },
              child: Text(
                'Login Here',
                style: Theme.of(context).textTheme.caption!.copyWith(
                    color: primary,
                    decoration: TextDecoration.underline,
                    fontWeight: FontWeight.normal),
              ))
        ],
      ),
    );
  }

  signupbtn() {
    return CupertinoButton(
      padding: EdgeInsets.zero,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        width: double.infinity,
        height: 48,
        decoration: BoxDecoration(
          color: Color(0xff00b65f),
          borderRadius: BorderRadius.circular(5),
          boxShadow: const [
            BoxShadow(
                color: Color(0x29000000),
                offset: Offset(0, 0),
                blurRadius: 3,
                spreadRadius: 0)
          ],
        ),
        child: Center(
          child: Text("Sign Up",
              style: TextStyle(
                color: white,
              )),
        ),
      ),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => GrobagSignup(),
          ),
        );
      },
    );
  }

  googlebtn() {
    return CupertinoButton(
      padding: EdgeInsets.symmetric(vertical: 15),
      child: Container(
        width: double.infinity,
        margin: EdgeInsets.symmetric(horizontal: 20),
        height: 48,
        decoration: BoxDecoration(
          color: white,
          borderRadius: BorderRadius.circular(4),
          boxShadow: const [
            BoxShadow(
                color: Color(0x29000000),
                offset: Offset(0, 0),
                blurRadius: 3,
                spreadRadius: 0)
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset('assets/images/fullApps/grobag/google.svg'),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text("Sign up with Google",
                  style: TextStyle(
                    color: fontColor,
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                  )),
            ),
          ],
        ),
      ),
      onPressed: () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => GrobagHome(),
          ),
        );
      },
    );
  }

  applebtn() {
    return CupertinoButton(
      padding: EdgeInsets.zero,
      child: Container(
        width: double.infinity,
        margin: EdgeInsets.symmetric(horizontal: 20),
        height: 48,
        decoration: BoxDecoration(
          color: fontColor,
          borderRadius: BorderRadius.circular(4),
          boxShadow: const [
            BoxShadow(
                color: Color(0x29000000),
                offset: Offset(0, 0),
                blurRadius: 3,
                spreadRadius: 0)
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset('assets/images/fullApps/grobag/apple.svg'),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text("Sign up with apple",
                  style: TextStyle(
                    color: Color(0xfff8f9fb),
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                  )),
            ),
          ],
        ),
      ),
      onPressed: () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => GrobagHome(),
          ),
        );
      },
    );
  }
}
