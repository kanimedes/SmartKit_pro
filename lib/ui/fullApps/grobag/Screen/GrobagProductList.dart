import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:octo_image/octo_image.dart';
import 'package:smartkit_pro/ui/fullApps/grobag/Helper/GrobagAppbar.dart';
import 'package:smartkit_pro/ui/fullApps/grobag/Helper/GrobagColor.dart';
import 'package:smartkit_pro/ui/fullApps/grobag/Screen/GrobagProductDetail.dart';

class GrobagProducList extends StatefulWidget {
  final String? title;

  const GrobagProducList({Key? key, this.title}) : super(key: key);
  @override
  _GrobagProducListState createState() => _GrobagProducListState();
}

class _GrobagProducListState extends State<GrobagProducList> {
  ChoiceChip? choiceChip;
  final List<int> _selectedIndex = [0, 1, 5];
  List itemList = [
    {
      'tag': "4",
      'localimg': "assets/images/fullApps/grobag/product_5.jpg",
      'img':
          "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/grobag%2Fproduct_5.jpg?alt=media&token=05c0d79e-c784-4e41-8634-429a88b6ebc5",
      'blurUrl': "LOPEaz_J},ENOpM}\$yoe-iR*EPs.",
      'name': "Pineapple",
      'descprice': "1700",
      'price': "2000",
      'qty': '250 gm',
      'isFav': true,
      'imglist': [
        {
          'localimg': "assets/images/fullApps/grobag/product_5.jpg",
          'img':
              "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/grobag%2Fproduct_5.jpg?alt=media&token=05c0d79e-c784-4e41-8634-429a88b6ebc5",
          'blurUrl': "LOPEaz_J},ENOpM}\$yoe-iR*EPs.",
        },
        {
          'localimg': "assets/images/fullApps/grobag/product_5.jpg",
          'img':
              "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/grobag%2Fproduct_5.jpg?alt=media&token=05c0d79e-c784-4e41-8634-429a88b6ebc5",
          'blurUrl': "LOPEaz_J},ENOpM}\$yoe-iR*EPs.",
        },
        {
          'localimg': "assets/images/fullApps/grobag/product_5.jpg",
          'img':
              "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/grobag%2Fproduct_5.jpg?alt=media&token=05c0d79e-c784-4e41-8634-429a88b6ebc5",
          'blurUrl': "LOPEaz_J},ENOpM}\$yoe-iR*EPs.",
        },
        {
          'localimg': "assets/images/fullApps/grobag/product_5.jpg",
          'img':
              "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/grobag%2Fproduct_5.jpg?alt=media&token=05c0d79e-c784-4e41-8634-429a88b6ebc5",
          'blurUrl': "LOPEaz_J},ENOpM}\$yoe-iR*EPs.",
        },
      ]
    },
    {
      'tag': "5",
      'localimg': "assets/images/fullApps/grobag/product_6.jpg",
      'img':
          "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/grobag%2Fproduct_6.jpg?alt=media&token=ffab6aaa-8bdb-490c-a081-21b330c2e5c2",
      'blurUrl': "LbQZ{8R4~CxGR5aJniWV^+o0E1S#",
      'name': "Strawberry",
      'descprice': "25",
      'price': "2200",
      'qty': '250 gm',
      'isFav': true,
      'imglist': [
        {
          'localimg': "assets/images/fullApps/grobag/product_6.jpg",
          'img':
              "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/grobag%2Fproduct_6.jpg?alt=media&token=ffab6aaa-8bdb-490c-a081-21b330c2e5c2",
          'blurUrl': "LbQZ{8R4~CxGR5aJniWV^+o0E1S#",
        },
        {
          'localimg': "assets/images/fullApps/grobag/product_6.jpg",
          'img':
              "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/grobag%2Fproduct_6.jpg?alt=media&token=ffab6aaa-8bdb-490c-a081-21b330c2e5c2",
          'blurUrl': "LbQZ{8R4~CxGR5aJniWV^+o0E1S#",
        },
        {
          'localimg': "assets/images/fullApps/grobag/product_6.jpg",
          'img':
              "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/grobag%2Fproduct_6.jpg?alt=media&token=ffab6aaa-8bdb-490c-a081-21b330c2e5c2",
          'blurUrl': "LbQZ{8R4~CxGR5aJniWV^+o0E1S#",
        },
        {
          'localimg': "assets/images/fullApps/grobag/product_6.jpg",
          'img':
              "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/grobag%2Fproduct_6.jpg?alt=media&token=ffab6aaa-8bdb-490c-a081-21b330c2e5c2",
          'blurUrl': "LbQZ{8R4~CxGR5aJniWV^+o0E1S#",
        },
      ]
    },
    {
      'tag': "1",
      'localimg': "assets/images/fullApps/grobag/product_7.jpg",
      'img':
          "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/grobag%2Fproduct_7.jpg?alt=media&token=53603a0a-e39d-4858-994b-254d63561f51",
      'blurUrl': "LHR8e+}=:-B7]-RnODS}{ONIOp,@",
      'name': "Pear",
      'descprice': "25",
      'price': "50",
      'qty': "1 kg",
      'isFav': true,
      'imglist': [
        {
          'localimg': "assets/images/fullApps/grobag/product_7.jpg",
          'img':
              "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/grobag%2Fproduct_7.jpg?alt=media&token=53603a0a-e39d-4858-994b-254d63561f51",
          'blurUrl': "LHR8e+}=:-B7]-RnODS}{ONIOp,@",
        },
        {
          'localimg': "assets/images/fullApps/grobag/product_7.jpg",
          'img':
              "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/grobag%2Fproduct_7.jpg?alt=media&token=53603a0a-e39d-4858-994b-254d63561f51",
          'blurUrl': "LHR8e+}=:-B7]-RnODS}{ONIOp,@",
        },
        {
          'localimg': "assets/images/fullApps/grobag/product_7.jpg",
          'img':
              "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/grobag%2Fproduct_7.jpg?alt=media&token=53603a0a-e39d-4858-994b-254d63561f51",
          'blurUrl': "LHR8e+}=:-B7]-RnODS}{ONIOp,@",
        },
        {
          'localimg': "assets/images/fullApps/grobag/product_7.jpg",
          'img':
              "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/grobag%2Fproduct_7.jpg?alt=media&token=53603a0a-e39d-4858-994b-254d63561f51",
          'blurUrl': "LHR8e+}=:-B7]-RnODS}{ONIOp,@",
        },
      ]
    },
    {
      'tag': "2",
      'localimg': "assets/images/fullApps/grobag/product_8.jpg",
      'img':
          "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/grobag%2Fproduct_8.jpg?alt=media&token=4bd2a674-dc5e-4dcf-859d-1a3b9a9f24c7",
      'blurUrl': "LADb}@%J9OM|~VIaR--m04IW-+%1",
      'name': "Avocado",
      'descprice': "1000",
      'price': "1200",
      'qty': '500 gm',
      'isFav': true,
      'imglist': [
        {
          'localimg': "assets/images/fullApps/grobag/product_8.jpg",
          'img':
              "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/grobag%2Fproduct_8.jpg?alt=media&token=4bd2a674-dc5e-4dcf-859d-1a3b9a9f24c7",
          'blurUrl': "LADb}@%J9OM|~VIaR--m04IW-+%1",
        },
        {
          'localimg': "assets/images/fullApps/grobag/product_8.jpg",
          'img':
              "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/grobag%2Fproduct_8.jpg?alt=media&token=4bd2a674-dc5e-4dcf-859d-1a3b9a9f24c7",
          'blurUrl': "LADb}@%J9OM|~VIaR--m04IW-+%1",
        },
        {
          'localimg': "assets/images/fullApps/grobag/product_8.jpg",
          'img':
              "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/grobag%2Fproduct_8.jpg?alt=media&token=4bd2a674-dc5e-4dcf-859d-1a3b9a9f24c7",
          'blurUrl': "LADb}@%J9OM|~VIaR--m04IW-+%1",
        },
        {
          'localimg': "assets/images/fullApps/grobag/product_8.jpg",
          'img':
              "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/grobag%2Fproduct_8.jpg?alt=media&token=4bd2a674-dc5e-4dcf-859d-1a3b9a9f24c7",
          'blurUrl': "LADb}@%J9OM|~VIaR--m04IW-+%1",
        },
      ]
    },
    {
      'tag': "3",
      'localimg': "assets/images/fullApps/grobag/product_9.jpg",
      'img':
          "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/grobag%2Fproduct_9.jpg?alt=media&token=2bee53f6-153e-4937-876a-f3b61a24fd08",
      'blurUrl': "LGRJ*2%a?Tt4HzjaRmag~fRmD;e;",
      'name': "Tomato",
      'descprice': "1300",
      'price': "1400",
      'qty': '2 kg',
      'isFav': true,
      'imglist': [
        {
          'localimg': "assets/images/fullApps/grobag/product_9.jpg",
          'img':
              "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/grobag%2Fproduct_9.jpg?alt=media&token=2bee53f6-153e-4937-876a-f3b61a24fd08",
          'blurUrl': "LGRJ*2%a?Tt4HzjaRmag~fRmD;e;",
        },
        {
          'localimg': "assets/images/fullApps/grobag/product_9.jpg",
          'img':
              "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/grobag%2Fproduct_9.jpg?alt=media&token=2bee53f6-153e-4937-876a-f3b61a24fd08",
          'blurUrl': "LGRJ*2%a?Tt4HzjaRmag~fRmD;e;",
        },
        {
          'localimg': "assets/images/fullApps/grobag/product_9.jpg",
          'img':
              "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/grobag%2Fproduct_9.jpg?alt=media&token=2bee53f6-153e-4937-876a-f3b61a24fd08",
          'blurUrl': "LGRJ*2%a?Tt4HzjaRmag~fRmD;e;",
        },
        {
          'localimg': "assets/images/fullApps/grobag/product_9.jpg",
          'img':
              "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/grobag%2Fproduct_9.jpg?alt=media&token=2bee53f6-153e-4937-876a-f3b61a24fd08",
          'blurUrl': "LGRJ*2%a?Tt4HzjaRmag~fRmD;e;",
        },
      ]
    },
    {
      'tag': "8",
      'localimg': "assets/images/fullApps/grobag/product_10.jpg",
      'img':
          "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/grobag%2Fproduct_10.jpg?alt=media&token=f519d166-e55a-4b19-a228-3a7134940baa",
      'blurUrl': "LNPOYP^O.RJ,-.axM~V@}]9^o}\$*",
      'name': "Capsicum",
      'descprice': "1300",
      'price': "1400",
      'qty': '1 kg',
      'isFav': true,
      'imglist': [
        {
          'localimg': "assets/images/fullApps/grobag/product_10.jpg",
          'img':
              "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/grobag%2Fproduct_10.jpg?alt=media&token=f519d166-e55a-4b19-a228-3a7134940baa",
          'blurUrl': "LNPOYP^O.RJ,-.axM~V@}]9^o}\$*",
        },
        {
          'localimg': "assets/images/fullApps/grobag/product_10.jpg",
          'img':
              "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/grobag%2Fproduct_10.jpg?alt=media&token=f519d166-e55a-4b19-a228-3a7134940baa",
          'blurUrl': "LNPOYP^O.RJ,-.axM~V@}]9^o}\$*",
        },
        {
          'localimg': "assets/images/fullApps/grobag/product_10.jpg",
          'img':
              "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/grobag%2Fproduct_10.jpg?alt=media&token=f519d166-e55a-4b19-a228-3a7134940baa",
          'blurUrl': "LNPOYP^O.RJ,-.axM~V@}]9^o}\$*",
        },
        {
          'localimg': "assets/images/fullApps/grobag/product_10.jpg",
          'img':
              "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/grobag%2Fproduct_10.jpg?alt=media&token=f519d166-e55a-4b19-a228-3a7134940baa",
          'blurUrl': "LNPOYP^O.RJ,-.axM~V@}]9^o}\$*",
        },
      ]
    },
    {
      'tag': "6",
      'localimg': "assets/images/fullApps/grobag/product_11.jpg",
      'img':
          "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/grobag%2Fproduct_11.jpg?alt=media&token=69d788a9-768e-4c74-b02d-2742c4167032",
      'blurUrl': "LABr0D03x[%b.ObZRlt6.j%wRQRn",
      'name': "Cauliflower",
      'descprice': "2500",
      'price': "3500",
      'qty': '250 gm',
      'isFav': true,
      'imglist': [
        {
          'localimg': "assets/images/fullApps/grobag/product_11.jpg",
          'img':
              "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/grobag%2Fproduct_11.jpg?alt=media&token=69d788a9-768e-4c74-b02d-2742c4167032",
          'blurUrl': "LABr0D03x[%b.ObZRlt6.j%wRQRn",
        },
        {
          'localimg': "assets/images/fullApps/grobag/product_11.jpg",
          'img':
              "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/grobag%2Fproduct_11.jpg?alt=media&token=69d788a9-768e-4c74-b02d-2742c4167032",
          'blurUrl': "LABr0D03x[%b.ObZRlt6.j%wRQRn",
        },
        {
          'localimg': "assets/images/fullApps/grobag/product_11.jpg",
          'img':
              "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/grobag%2Fproduct_11.jpg?alt=media&token=69d788a9-768e-4c74-b02d-2742c4167032",
          'blurUrl': "LABr0D03x[%b.ObZRlt6.j%wRQRn",
        },
        {
          'localimg': "assets/images/fullApps/grobag/product_11.jpg",
          'img':
              "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/grobag%2Fproduct_11.jpg?alt=media&token=69d788a9-768e-4c74-b02d-2742c4167032",
          'blurUrl': "LABr0D03x[%b.ObZRlt6.j%wRQRn",
        },
      ]
    },
    {
      'tag': "7",
      'localimg': "assets/images/fullApps/grobag/product_12.jpg",
      'img':
          "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/grobag%2Fproduct_12.jpg?alt=media&token=6d09fde4-a844-4932-83f3-0487f940b24a",
      'blurUrl': "LZIsH=Ip.AoztmWAoNkC?wt7IAV[",
      'name': "Bitter Gourd",
      'descprice': "1000",
      'price': "1000",
      'qty': '250 gm',
      'isFav': true,
      'imglist': [
        {
          'localimg': "assets/images/fullApps/grobag/product_12.jpg",
          'img':
              "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/grobag%2Fproduct_12.jpg?alt=media&token=6d09fde4-a844-4932-83f3-0487f940b24a",
          'blurUrl': "LZIsH=Ip.AoztmWAoNkC?wt7IAV[",
        },
        {
          'localimg': "assets/images/fullApps/grobag/product_12.jpg",
          'img':
              "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/grobag%2Fproduct_12.jpg?alt=media&token=6d09fde4-a844-4932-83f3-0487f940b24a",
          'blurUrl': "LZIsH=Ip.AoztmWAoNkC?wt7IAV[",
        },
        {
          'localimg': "assets/images/fullApps/grobag/product_12.jpg",
          'img':
              "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/grobag%2Fproduct_12.jpg?alt=media&token=6d09fde4-a844-4932-83f3-0487f940b24a",
          'blurUrl': "LZIsH=Ip.AoztmWAoNkC?wt7IAV[",
        },
        {
          'localimg': "assets/images/fullApps/grobag/product_12.jpg",
          'img':
              "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/grobag%2Fproduct_12.jpg?alt=media&token=6d09fde4-a844-4932-83f3-0487f940b24a",
          'blurUrl': "LZIsH=Ip.AoztmWAoNkC?wt7IAV[",
        },
      ]
    },
    {
      'tag': "9",
      'localimg': "assets/images/fullApps/grobag/product_13.jpg",
      'img':
          "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/grobag%2Fproduct_13.jpg?alt=media&token=12432118-e805-4efe-824e-5090e435e985",
      'blurUrl': "LUKT*}?Gy?XS%LVsj[bbYQkDZ\$ae",
      'name': "Red Chili",
      'descprice': "1700",
      'price': "2000",
      'qty': '500 gm',
      'isFav': true,
      'imglist': [
        {
          'localimg': "assets/images/fullApps/grobag/product_13.jpg",
          'img':
              "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/grobag%2Fproduct_13.jpg?alt=media&token=12432118-e805-4efe-824e-5090e435e985",
          'blurUrl': "LUKT*}?Gy?XS%LVsj[bbYQkDZ\$ae",
        },
        {
          'localimg': "assets/images/fullApps/grobag/product_13.jpg",
          'img':
              "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/grobag%2Fproduct_13.jpg?alt=media&token=12432118-e805-4efe-824e-5090e435e985",
          'blurUrl': "LUKT*}?Gy?XS%LVsj[bbYQkDZ\$ae",
        },
        {
          'localimg': "assets/images/fullApps/grobag/product_13.jpg",
          'img':
              "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/grobag%2Fproduct_13.jpg?alt=media&token=12432118-e805-4efe-824e-5090e435e985",
          'blurUrl': "LUKT*}?Gy?XS%LVsj[bbYQkDZ\$ae",
        },
        {
          'localimg': "assets/images/fullApps/grobag/product_13.jpg",
          'img':
              "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/grobag%2Fproduct_13.jpg?alt=media&token=12432118-e805-4efe-824e-5090e435e985",
          'blurUrl': "LUKT*}?Gy?XS%LVsj[bbYQkDZ\$ae",
        },
      ]
    },
    {
      'tag': "5",
      'localimg': "assets/images/fullApps/grobag/product_14.jpg",
      'img':
          "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/grobag%2Fproduct_14.jpg?alt=media&token=853c83b9-c928-4508-91aa-13234c30e85f",
      'blurUrl': "LPRnFFr??*VL~dkUIbV_ToWCiit#",
      'name': "Watermelon",
      'descprice': "25",
      'price': "2200",
      'qty': '250 gm',
      'isFav': true,
      'imglist': [
        {
          'localimg': "assets/images/fullApps/grobag/product_14.jpg",
          'img':
              "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/grobag%2Fproduct_14.jpg?alt=media&token=853c83b9-c928-4508-91aa-13234c30e85f",
          'blurUrl': "LPRnFFr??*VL~dkUIbV_ToWCiit#",
        },
        {
          'localimg': "assets/images/fullApps/grobag/product_14.jpg",
          'img':
              "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/grobag%2Fproduct_14.jpg?alt=media&token=853c83b9-c928-4508-91aa-13234c30e85f",
          'blurUrl': "LPRnFFr??*VL~dkUIbV_ToWCiit#",
        },
        {
          'localimg': "assets/images/fullApps/grobag/product_14.jpg",
          'img':
              "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/grobag%2Fproduct_14.jpg?alt=media&token=853c83b9-c928-4508-91aa-13234c30e85f",
          'blurUrl': "LPRnFFr??*VL~dkUIbV_ToWCiit#",
        },
        {
          'localimg': "assets/images/fullApps/grobag/product_14.jpg",
          'img':
              "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/grobag%2Fproduct_14.jpg?alt=media&token=853c83b9-c928-4508-91aa-13234c30e85f",
          'blurUrl': "LPRnFFr??*VL~dkUIbV_ToWCiit#",
        },
      ]
    },
  ];

  List<String> attList = ['Quantity', 'Type'];

  List valList = [
    [
      '100 gm',
      '250 gm',
      '500 gm',
      '1 kg',
      '5 kg',
      '10 kg',
      '1 L',
      '2 L',
      '5 L',
    ],
    ['Fruits', 'Vegetables', 'Backery', 'Soft Drinks', 'Juice']
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GrobagAppbar(
        title: widget.title,
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                  width: MediaQuery.of(context).size.width * 0.49,
                  child: OutlinedButton(
                      onPressed: showFilter, child: Text('Filter'))),
              SizedBox(
                  width: MediaQuery.of(context).size.width * 0.49,
                  child: OutlinedButton(
                    child: Text('Sort'),
                    onPressed: sortDialog,
                  )),
            ],
          ),
          Expanded(
            child: GridView.count(
                padding: EdgeInsets.all(20),
                crossAxisCount: 2,
                shrinkWrap: true,
                childAspectRatio: 0.8,
                physics: BouncingScrollPhysics(),
                mainAxisSpacing: 15,
                crossAxisSpacing: 10,
                children: List.generate(
                  itemList.length,
                  (index) {
                    return Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => GrobagProductDetail(
                                      pos: 0,
                                      imglist: itemList[index]['imglist'])));
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Expanded(
                              child: Stack(
                                children: [
                                  Positioned.fill(
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10.0),
                                      child: OctoImage(
                                        image: CachedNetworkImageProvider(
                                          itemList[index]['img'],
                                        ),
                                        placeholderBuilder:
                                            OctoPlaceholder.blurHash(
                                          itemList[index]['blurUrl'],
                                        ),
                                        errorBuilder:
                                            OctoError.icon(color: black),
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    right: 5,
                                    top: 5,
                                    child: InkWell(
                                      child: Container(
                                        width: 20,
                                        height: 20,
                                        decoration: BoxDecoration(
                                          color: secondary.withOpacity(0.2),
                                          borderRadius:
                                              BorderRadius.circular(4),
                                        ),
                                        child: Icon(
                                          itemList[index]['isFav']
                                              ? Icons.favorite
                                              : Icons.favorite_border,
                                          size: 15,
                                          color: secondary,
                                        ),
                                      ),
                                      onTap: () {
                                        setState(() {
                                          itemList[index]['isFav'] =
                                              !itemList[index]['isFav'];
                                        });
                                      },
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Text(
                              itemList[index]['qty'],
                              style:
                                  Theme.of(context).textTheme.caption!.copyWith(
                                        color: secondary,
                                      ),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                            Text(
                              itemList[index]['name'],
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle2!
                                  .copyWith(
                                    color: fontColor,
                                    fontWeight: FontWeight.w700,
                                  ),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                            Row(
                              children: [
                                Text(
                                  "\$ " + itemList[index]['descprice'],
                                  style: TextStyle(
                                    color: primary,
                                    fontWeight: FontWeight.w400,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                ),
                                Spacer(),
                                Container(
                                  margin: EdgeInsets.only(bottom: 5, right: 5),
                                  width: 24,
                                  height: 24,
                                  decoration: BoxDecoration(
                                      color: primary.withOpacity(0.3),
                                      borderRadius: BorderRadius.circular(6)),
                                  child: Icon(
                                    Icons.add,
                                    size: 12,
                                    color: primary,
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                )),
          ),
        ],
      ),
    );
  }

  showFilter() {
    RangeValues values = RangeValues(20, 80);
    RangeLabels labels = RangeLabels('1', "100");

    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10), topRight: Radius.circular(10))),
        builder: (builder) {
          return StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
            return Container(
              constraints: BoxConstraints(
                  maxHeight: MediaQuery.of(context).size.height * 0.9),
              child: ListView(
                padding: EdgeInsets.symmetric(horizontal: 20),
                shrinkWrap: true,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Row(
                      children: [
                        InkWell(
                          child: Icon(
                            Icons.close,
                            color: primary,
                          ),
                          onTap: () {
                            Navigator.pop(context);
                          },
                        ),
                        Spacer(),
                        Text(
                          'Filter',
                          style: Theme.of(context)
                              .textTheme
                              .headline6!
                              .copyWith(
                                  color: fontColor,
                                  fontWeight: FontWeight.bold),
                        ),
                        Spacer(),
                        InkWell(
                          onTap: () {},
                          child: Text(
                            'Reset',
                            style: TextStyle(color: primary),
                          ),
                        )
                      ],
                    ),
                  ),
                  Divider(),
                  Text('Price Range'),
                  RangeSlider(
                      divisions: 5,
                      activeColor: secondary,
                      inactiveColor: secondary.withOpacity(0.3),
                      min: 1,
                      max: 100,
                      values: values,
                      labels: labels,
                      onChanged: (value) {
                        setState(() {
                          values = value;
                          labels = RangeLabels(
                              "${value.start.toInt().toString()}\$",
                              "${value.end.toInt().toString()}\$");
                        });
                      }),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: attList.length,
                    itemBuilder: (context, index) {
                      List<Widget> chips = [];

                      for (int i = 0; i < valList[index].length; i++) {
                        choiceChip = ChoiceChip(
                          selected: _selectedIndex.length > index
                              ? _selectedIndex[index] == i
                              : false,
                          label: Text(valList[index][i],
                              style: TextStyle(color: white)),
                          selectedColor: primary,
                          disabledColor: primary.withOpacity(0.5),
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5))),
                          onSelected: (bool selected) {},
                        );

                        chips.add(Padding(
                            padding: EdgeInsets.symmetric(horizontal: 5),
                            child: choiceChip));
                      }
                      return chips.isNotEmpty
                          ? Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    attList[index],
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Wrap(
                                    children: chips.map<Widget>((Widget chip) {
                                      return Padding(
                                        padding: const EdgeInsets.all(2.0),
                                        child: chip,
                                      );
                                    }).toList(),
                                  ),
                                ],
                              ),
                            )
                          : Container();
                    },
                  ),
                ],
              ),
            );
          });
        });
  }

  void sortDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return ButtonBarTheme(
            data: ButtonBarThemeData(
              alignment: MainAxisAlignment.center,
            ),
            child: AlertDialog(
                elevation: 2.0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5.0))),
                contentPadding: const EdgeInsets.all(0.0),
                content: SingleChildScrollView(
                  child: Column(mainAxisSize: MainAxisSize.min, children: [
                    Padding(
                        padding:
                            EdgeInsetsDirectional.only(top: 19.0, bottom: 16.0),
                        child: Text(
                          'Sort By',
                          style: Theme.of(context).textTheme.headline6,
                        )),
                    Divider(),
                    TextButton(
                        child: Text('Top Rated',
                            style: Theme.of(context)
                                .textTheme
                                .subtitle1!
                                .copyWith(color: fontColor)),
                        onPressed: () {}),
                    Divider(),
                    TextButton(
                        child: Text('Newest First',
                            style: Theme.of(context)
                                .textTheme
                                .subtitle1!
                                .copyWith(color: fontColor)),
                        onPressed: () {
                          Navigator.pop(context, 'option 1');
                        }),
                    Divider(),
                    TextButton(
                        child: Text(
                          'Oldest First',
                          style: Theme.of(context)
                              .textTheme
                              .subtitle1!
                              .copyWith(color: fontColor),
                        ),
                        onPressed: () {
                          Navigator.pop(context, 'option 2');
                        }),
                    Divider(),
                    TextButton(
                        child: Text(
                          'Price - Low to High',
                          style: Theme.of(context)
                              .textTheme
                              .subtitle1!
                              .copyWith(color: fontColor),
                        ),
                        onPressed: () {
                          Navigator.pop(context, 'option 3');
                        }),
                    Divider(),
                    Padding(
                        padding: EdgeInsetsDirectional.only(bottom: 5.0),
                        child: TextButton(
                            child: Text(
                              'Price - High to Low',
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle1!
                                  .copyWith(color: fontColor),
                            ),
                            onPressed: () {
                              Navigator.pop(context, 'option 4');
                            })),
                  ]),
                )),
          );
        });
  }
}
