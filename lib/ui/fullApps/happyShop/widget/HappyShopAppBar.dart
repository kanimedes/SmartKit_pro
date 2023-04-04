import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smartkit_pro/ui/fullApps/happyShop/Helper/HappyShopString.dart';
import 'package:smartkit_pro/ui/fullApps/happyShop/Screen/HappyShopCart.dart';
import 'package:smartkit_pro/ui/fullApps/happyShop/Screen/HappyShopProfile.dart';

class HappyShopAppBar extends StatelessWidget {
  const HappyShopAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Text(
            "HappyShop",
            style: TextStyle(
              color: Color(0xFF333333),
              fontFamily: 'Open sans',
            ),
          )
        ],
      ),
      centerTitle: true,
      systemOverlayStyle: SystemUiOverlayStyle.dark,
      iconTheme: IconThemeData(color: Color(0xFF333333).withOpacity(0.5)),
      actions: <Widget>[
        InkWell(
          child: new Stack(children: <Widget>[
            Center(
              child: Icon(
                Icons.shopping_cart_rounded,
                color: Color(0xFF333333).withOpacity(0.5),
                size: 26,
              ),
            ),
            (CUR_CART_COUNT != null &&
                    CUR_CART_COUNT.isNotEmpty &&
                    CUR_CART_COUNT != "0")
                ? new Positioned(
                    top: 0.0,
                    right: 5.0,
                    bottom: 15,
                    child: Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: Colors.red),
                        child: new Center(
                          child: Padding(
                            padding: EdgeInsets.all(4),
                            child: new Text(
                              CUR_CART_COUNT,
                              style: TextStyle(fontSize: 8),
                            ),
                          ),
                        )),
                  )
                : Container()
          ]),
          onTap: () async {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HappyShopCart(),
                ));
          },
        ),
        SizedBox(
          width: 10.0,
        ),
        InkWell(
          child: Icon(
            Icons.account_circle,
            color: Color(0xFF333333).withOpacity(0.5),
            size: 26,
          ),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HappyShopPeofile(),
                ));
          },
        ),
        SizedBox(
          width: 10.0,
        ),
      ],
      backgroundColor: Colors.transparent,
      flexibleSpace: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          // gradient: happyshopgradient
        ),
      ),
      elevation: 2.0,
    );
  }
}
