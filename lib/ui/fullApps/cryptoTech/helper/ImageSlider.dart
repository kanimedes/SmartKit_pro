import 'dart:async';
import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:octo_image/octo_image.dart';
import 'package:smartkit_pro/ui/fullApps/cryptoTech/model/SliderImage.dart';

import 'ColorsRes.dart';

class ImageSliderWidget extends StatefulWidget {
  final List<SliderImage>? imageUrls;
  final BorderRadius imageBorderRadius;
  final double imageHeight;
  final String from;
  final bool isfeatured;

  const ImageSliderWidget({
    Key? key,
    required this.imageUrls,
    required this.imageBorderRadius,
    required this.imageHeight,
    required this.from,
    required this.isfeatured,
  }) : super(key: key);

  @override
  ImageSliderWidgetState createState() {
    return new ImageSliderWidgetState();
  }
}

class ImageSliderWidgetState extends State<ImageSliderWidget> {
  List<Widget> _pages = [];
  int page = 0;
  bool ischange = false;
  Timer? slidertime;
  final _controller = PageController();

  @override
  void initState() {
    super.initState();
    _pages = widget.imageUrls!.map((slider) {
      return _buildImagePageItem(slider);
    }).toList();

    if (widget.from != "fullscreen") {
      new Future.delayed(Duration(seconds: 10), () {
        slidertime =
            Timer.periodic(Duration(seconds: 5), (Timer t) => Setpage());
      });
      //slidertime = Timer.periodic(Duration(seconds: 5),(Timer t) => Setpage());
    }
  }

  void Setpage() {
    if (page == _pages.length - 1) {
      page = 0;
    } else {
      page++;
    }
    if (_controller.hasClients) {
      _controller.animateToPage(
        page,
        duration: const Duration(milliseconds: 300),
        curve: Curves.ease,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return _buildingImageSlider();
  }

  Widget _buildingImageSlider() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Card(
          color: ColorsRes.homebgcolor,
          shape: RoundedRectangleBorder(
            borderRadius: widget.imageBorderRadius,
          ),
          child: SizedBox(
            height: widget.imageHeight,
            child: _buildPagerViewSlider(),
          ),
        ),
        _buildDotsIndicatorOverlay(),
      ],
    );
  }

  Widget _buildPagerViewSlider() {
    return PageView.builder(
      physics: AlwaysScrollableScrollPhysics(),
      controller: _controller,
      itemCount: _pages.length,
      itemBuilder: (BuildContext context, int index) {
        return _pages[index % _pages.length];
      },
      onPageChanged: (int p) {
        setState(() {
          page = p;
        });
      },
    );
  }

  Widget _buildDotsIndicatorOverlay() {
    return Container(
      margin: EdgeInsets.only(top: 10, bottom: 10),
      child: Wrap(
          direction: Axis.horizontal,
          alignment: WrapAlignment.center,
          spacing: 10,
          runSpacing: 4.0,
          children: List.generate(
              _pages.length,
              (index) => Icon(
                    page == index
                        ? Icons.brightness_1
                        : Icons.radio_button_unchecked,
                    color: ColorsRes.firstgradientcolor,
                    size: 11,
                  ))),
    );
  }

  Widget _buildImagePageItem(SliderImage sliderimage) {
    return ClipRRect(
      borderRadius: widget.imageBorderRadius,
      child: GestureDetector(
        onTap: () {},
        child: OctoImage(
          image: CachedNetworkImageProvider(sliderimage.image!),
          placeholderBuilder: OctoPlaceholder.blurHash(
            sliderimage.blurUrl!,
          ),
          errorBuilder: OctoError.icon(color: ColorsRes.black),
          fit: widget.from == "fullscreen" ? BoxFit.contain : BoxFit.fill,
        ),
      ),
    );
  }
}

class DotsIndicator extends AnimatedWidget {
  const DotsIndicator({
    required this.controller,
    this.itemCount,
    this.onPageSelected,
    this.color = ColorsRes.secondgradientcolor,
    //this.color: Colors.white,
  }) : super(listenable: controller);

  final PageController controller;
  final int? itemCount;
  final ValueChanged<int>? onPageSelected;
  final Color color;
  static const double _kDotSize = 4.0;
  static const double _kMaxZoom = 2.0;
  static const double _kDotSpacing = 15.0;

  Widget _buildDot(int index) {
    double selectedness = Curves.easeOut.transform(
      max(
        0.0,
//        1.0 -  (controller.hasClients ?  ( ((controller.page ?? controller.initialPage) - index).abs()) : 0),
        1.0 - ((controller.page ?? controller.initialPage) - index).abs(),
      ),
    );
    double zoom = 1.0 + (_kMaxZoom - 1.0) * selectedness;
    return new SizedBox(
      width: _kDotSpacing,
      child: new Center(
        child: new Material(
          color: color,
          type: MaterialType.circle,
          child: new SizedBox(
            width: _kDotSize * zoom,
            height: _kDotSize * zoom,
            child: new InkWell(
              onTap: () => onPageSelected!(index),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: new List<Widget>.generate(itemCount!, _buildDot),
    );
  }
}
