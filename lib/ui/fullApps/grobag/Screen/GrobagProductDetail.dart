import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:octo_image/octo_image.dart';
import 'package:smartkit_pro/ui/fullApps/grobag/Helper/GrobagAppbar.dart';
import 'package:smartkit_pro/ui/fullApps/grobag/Helper/GrobagColor.dart';

import 'GrobagCart.dart';

class GrobagProductDetail extends StatefulWidget {
  final int? pos;
  final List? imglist;

  const GrobagProductDetail({Key? key, this.pos, this.imglist})
      : super(key: key);

  @override
  _GrobagProductDetailState createState() => _GrobagProductDetailState();
}

class _GrobagProductDetailState extends State<GrobagProductDetail> {
  int _curSlider = 0;
  List<Widget> pages = [];
  List itemList = [
    {
      'tag': "4",
      'localimg': "assets/images/fullApps/grobag/product_8.jpg",
      'img':
          "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/grobag%2Fproduct_8.jpg?alt=media&token=4bd2a674-dc5e-4dcf-859d-1a3b9a9f24c7",
      'blurUrl': "LADb}@%J9OM|~VIaR--m04IW-+%1",
      'name': "Starwberries",
      'descprice': "1700",
      'price': "2000",
      'qty': '250 gm',
      'isFav': true,
      'desc':
          'Nullam rhoncus felis a sollicitudin rutrum. Duis rutrum nisi id gravida porta. Duis vel ipsum ut eros lobortis elementum. Suspendisse sollicitudin ullamcorper vehicula. Ut sagittis a augue at fermentum. Mauris viverra imperdiet neque, at aliquam nisi. Curabitur semper tellus vel metus ullamcorper, quis '
    },
    {
      'tag': "5",
      'localimg': "assets/images/fullApps/grobag/product_9.jpg",
      'img':
          "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/grobag%2Fproduct_9.jpg?alt=media&token=2bee53f6-153e-4937-876a-f3b61a24fd08",
      'blurUrl': "LGRJ*2%a?Tt4HzjaRmag~fRmD;e;",
      'name': "Fresh Kiwi",
      'descprice': "250",
      'price': "2200",
      'qty': '250 gm',
      'isFav': true,
      'desc':
          'Curabitur mattis sit amet est non consequat. Mauris vitae dolor sollicitudin, venenatis nisl a, interdum mauris. Duis posuere magna nibh, a venenatis tortor semper non. Nulla luctus malesuada nulla, quis feugiat enim volutpat eu. Vestibulum elit sapien, cursus vel iaculis tempor, rhoncus sit '
    },
    {
      'tag': "1",
      'localimg': "assets/images/fullApps/grobag/product_11.jpg",
      'img':
          "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/grobag%2Fproduct_11.jpg?alt=media&token=69d788a9-768e-4c74-b02d-2742c4167032",
      'blurUrl': "LABr0D03x[%b.ObZRlt6.j%wRQRn",
      'name': "Banana",
      'descprice': "25",
      'price': "50",
      'qty': "1 kg",
      'isFav': true,
      'desc':
          'Integer quis porta ante. Sed placerat enim est, in maximus dolor fermentum sit amet. In cursus vestibulum sapien vitae dignissim. Maecenas pharetra eu nisl eu malesuada. Sed vehicula dui a risus ultricies, nec mattis felis tincidunt. Fusce molestie, quam id volutpat rhoncus, leo'
    },
    {
      'tag': "2",
      'localimg': "assets/images/fullApps/grobag/product_7.jpg",
      'img':
          "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/grobag%2Fproduct_7.jpg?alt=media&token=53603a0a-e39d-4858-994b-254d63561f51",
      'blurUrl': "LHR8e+}=:-B7]-RnODS}{ONIOp,@",
      'name': "Shimla Apple",
      'descprice': "1000",
      'price': "1200",
      'qty': '500 gm',
      'isFav': true,
      'desc':
          'ctus malesuada nulla, quis feugiat enim volutpat eu. Vestibulum elit sapien, cursus vel iaculis tempor, rhoncus sit amet leo. Cras tempus elementum lectus a euismod. Curabitur ullamcorper rhoncus est, efficitur aliquet quam vehicula vitae. Sed nunc mi, pretium id nunc q'
    },
    {
      'tag': "3",
      'localimg': "assets/images/fullApps/grobag/product_5.jpg",
      'img':
          "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/grobag%2Fproduct_5.jpg?alt=media&token=05c0d79e-c784-4e41-8634-429a88b6ebc5",
      'blurUrl': "LOPEaz_J},ENOpM}\$yoe-iR*EPs.",
      'name': "Yummy Watermelon",
      'descprice': "1300",
      'price': "1400",
      'qty': '2 kg',
      'isFav': true,
      'desc':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse iaculis lobortis urna a maximus. Integer non orci eu leo interdum eleifend a dictum tellus. Nulla accumsan venenatis turpis, at gravida ante. Pellentesque habitant morbi tristique senectus et netus et malesuada f'
    },
  ];
  List sliderList = [
    {
      'localimg': "assets/images/fullApps/grobag/product_1a.jpg",
      'img':
          "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/grobag%2Fproduct_1a.jpg?alt=media&token=4476a8fe-10b1-4362-a5a7-73bc4770ff37",
      'blurUrl': "LWM~|Z?aUaOslTInv~xFYkNGrCr=",
    },
    {
      'localimg': "assets/images/fullApps/grobag/product_1b.jpg",
      'img':
          "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/grobag%2Fproduct_1b.jpg?alt=media&token=abb8c343-dd54-4ce9-b018-07b2c33382cb",
      'blurUrl': "LBHU5i9F:a4q?@KJ9vVb03n\$Op=_",
    },
    {
      'localimg': "assets/images/fullApps/grobag/product_1c.jpg",
      'img':
          "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/grobag%2Fproduct_1c.jpg?alt=media&token=504b0495-aa49-42f3-8d41-75e9f569e48b",
      'blurUrl': "L9LJZj1y]-}qKPo0,qR+IqEhniI@",
    },
    {
      'localimg': "assets/images/fullApps/grobag/product_1d.jpg",
      'img':
          "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/grobag%2Fproduct_1d.jpg?alt=media&token=c13fc1d2-52a5-4c99-abf4-275e3f61bb17",
      'blurUrl': "LCH1SUn6??~A7Kt70L9aBigMQ;X5",
    }
  ];
  final _controller = PageController();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    initializeSlider();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GrobagAppbar(
        title: itemList[widget.pos!]["name"],
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _slider(),
                  _offRow(),
                  _title(),
                  _price(),
                  _proDesc(),
                  Divider(),
                  _heading(),
                  _similarItems()
                ],
              ),
            ),
          ),
          Row(
            children: [
              Container(
                margin: EdgeInsets.only(left: 20, bottom: 30, top: 20),
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: primary.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: InkWell(
                  child: SvgPicture.asset(
                    'assets/images/fullApps/grobag/cart.svg',
                    color: primary,
                  ),
                  onTap: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => GrobagCart()));
                  },
                ),
              ),
              Expanded(
                child: CupertinoButton(
                  padding: EdgeInsets.zero,
                  child: Container(
                    margin: EdgeInsets.only(
                        right: 20, left: 10, top: 20, bottom: 30),
                    height: 48,
                    decoration: BoxDecoration(
                      color: primary,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Center(
                      child:
                          Text("BUY \$ ${itemList[widget.pos!]["descprice"]}",
                              style: TextStyle(
                                color: white,
                              )),
                    ),
                  ),
                  onPressed: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => GrobagCart()));
                  },
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget _slider() {
    double height = MediaQuery.of(context).size.height * 0.4;

    return pages.isNotEmpty
        ? Stack(
            alignment: Alignment.bottomLeft,
            children: [
              SizedBox(
                height: height,
                width: double.infinity,
                child: PageView.builder(
                  itemCount: widget.imglist!.length,
                  scrollDirection: Axis.horizontal,
                  controller: _controller,
                  physics: AlwaysScrollableScrollPhysics(),
                  onPageChanged: (index) {
                    if (mounted) {
                      setState(() {
                        _curSlider = index;
                      });
                    }
                  },
                  itemBuilder: (BuildContext context, int index) {
                    return pages[index];
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 30, bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: _buildIndicator(),
                ),
              ),
            ],
          )
        : Container(
            height: height,
            width: double.infinity,
            color: lightBack,
          );
  }

  void initializeSlider() {
    setState(() {
      pages = widget.imglist!.map((slider) {
        return _buildImagePageItem(widget.imglist![widget.pos!]['img'],
            widget.imglist![widget.pos!]['blurUrl']);
      }).toList();
    });
  }

  Widget _buildImagePageItem(String? slider, String? blurUrl) {
    double height = MediaQuery.of(context).size.height * .4;

    return GestureDetector(
      child: OctoImage(
        image: CachedNetworkImageProvider(
          slider!,
        ),
        placeholderBuilder: OctoPlaceholder.blurHash(
          blurUrl!,
        ),
        height: height,
        width: double.maxFinite,
        errorBuilder: OctoError.icon(color: black),
        fit: BoxFit.fill,
      ),
      onTap: () {},
    );
  }

  List<Widget> _buildIndicator() {
    List<Widget> indicators = [];
    for (int i = 0; i < pages.length; i++) {
      if (_curSlider == i) {
        indicators.add(_indicator(true));
      } else {
        indicators.add(_indicator(false));
      }
    }

    return indicators;
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
        duration: Duration(milliseconds: 300),
        height: 6,
        width: isActive ? 20 : 7,
        margin: EdgeInsets.only(right: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: isActive ? primary : fontLight,
        ));
  }

  _offRow() {
    double per = (double.parse(itemList[widget.pos!]["price"]) -
            double.parse(itemList[widget.pos!]['descprice'])) *
        100 /
        double.parse(itemList[widget.pos!]["price"]);
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20, top: 20),
      child: Row(
        children: [
          Container(
              decoration: BoxDecoration(
                  color: secondary.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(5)),
              padding: EdgeInsets.symmetric(vertical: 2, horizontal: 10),
              child: Text(
                per.toStringAsFixed(2) + "% off",
                style: TextStyle(color: secondary),
              )),
          Text("  " + itemList[widget.pos!]["qty"]),
          Spacer(),
          InkWell(
            child: Container(
              width: 25,
              height: 25,
              decoration: BoxDecoration(
                color: secondary.withOpacity(0.2),
                borderRadius: BorderRadius.circular(4),
              ),
              child: Icon(
                itemList[widget.pos!]['isFav']
                    ? Icons.favorite
                    : Icons.favorite_border,
                size: 20,
                color: secondary,
              ),
            ),
            onTap: () {
              setState(() {
                itemList[widget.pos!]['isFav'] =
                    !itemList[widget.pos!]['isFav'];
              });
            },
          ),
        ],
      ),
    );
  }

  _title() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5),
      child: Text(
        itemList[widget.pos!]["name"],
        style: Theme.of(context)
            .textTheme
            .headline6!
            .copyWith(color: fontLight, fontWeight: FontWeight.bold),
      ),
    );
  }

  _price() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        children: [
          Text(
            "\$" + itemList[widget.pos!]["descprice"] + "  ",
            style:
                Theme.of(context).textTheme.subtitle1!.copyWith(color: primary),
          ),
          Text(
            "\$" + itemList[widget.pos!]["price"],
            style: Theme.of(context).textTheme.subtitle2!.copyWith(
                color: lightBack, decoration: TextDecoration.lineThrough),
          )
        ],
      ),
    );
  }

  _proDesc() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Text(itemList[widget.pos!]["desc"]),
    );
  }

  _heading() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
      child: Text(
        'Similar Items',
        style: Theme.of(context).textTheme.subtitle1,
      ),
    );
  }

  _similarItems() {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.25,
      child: ListView.builder(
        itemCount: itemList.length,
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        padding: EdgeInsets.symmetric(horizontal: 20),
        itemBuilder: (context, index) {
          if (index == widget.pos) return Container();
          return Container(
            width: MediaQuery.of(context).size.width * 0.4,
            padding: const EdgeInsetsDirectional.only(end: 10),
            child: GestureDetector(
              onTap: () {},
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsetsDirectional.only(bottom: 5.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: OctoImage(
                          image: CachedNetworkImageProvider(
                            itemList[index]['img'],
                          ),
                          placeholderBuilder: OctoPlaceholder.blurHash(
                            itemList[index]['blurUrl'],
                          ),
                          errorBuilder: OctoError.icon(color: black),
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                  Text(
                    itemList[index]['qty'],
                    style: Theme.of(context).textTheme.caption!.copyWith(
                          color: secondary,
                        ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                  Text(
                    itemList[index]['name'],
                    style: Theme.of(context).textTheme.subtitle2!.copyWith(
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
      ),
    );
  }
}
