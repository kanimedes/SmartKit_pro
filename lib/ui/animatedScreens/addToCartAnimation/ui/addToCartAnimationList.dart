import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smartkit_pro/ui/animatedScreens/addToCartAnimation/ui/widget/dragTargetWidget.dart';

class AddToCartList extends StatefulWidget {
  const AddToCartList({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return AddToCartListState();
  }
}

class AddToCartListState extends State<AddToCartList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          "Cart List",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: cartList.isEmpty
          ? const Center(
              child: Text(
                "No data Found",
                style: TextStyle(color: Colors.black),
              ),
            )
          : ListView.builder(
              itemCount: cartList.length,
              padding: EdgeInsets.only(bottom: 10, top: 10),
              itemBuilder: (BuildContext context, int i) {
                return Card(
                  margin: EdgeInsets.only(left: 15, right: 15, top: 5),
                  elevation: 8,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  child: ListTile(
                    contentPadding: EdgeInsets.all(8),
                    dense: true,
                    leading: CircleAvatar(
                      radius: 20,
                      backgroundImage: AssetImage(
                          "assets/images/animatedScreens/addToCartAnimation/${cartList[i].assetName!}"),
                    ),
                    title: Text(
                      cartList[i].name!,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    trailing: Text(
                      cartList[i].price!,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                );
              }),
    );
  }
}
