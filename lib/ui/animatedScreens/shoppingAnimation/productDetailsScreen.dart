import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:smartkit_pro/ui/animatedScreens/shoppingAnimation/models/product.dart';
import 'package:smartkit_pro/ui/animatedScreens/shoppingAnimation/shoppingHomeScreen.dart';

class ProductDetailsScreen extends StatefulWidget {
  final Product product;
  const ProductDetailsScreen({Key? key, required this.product})
      : super(key: key);

  @override
  _ProductDetailsScreenState createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen>
    with TickerProviderStateMixin {
  //To animate the back and searh button
  late final AnimationController _backAndSearchButtonFadeAnimationController =
      AnimationController(
          vsync: this, duration: const Duration(milliseconds: 450));

  late final Animation<double> _backAndSearchButtonFadeAnimation =
      Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
          parent: _backAndSearchButtonFadeAnimationController,
          curve: Curves.easeInOut));

  //
  late final AnimationController _addToBagAndFavoriteButtonAnimaitonController =
      AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 400),
  );

  late final Animation<Offset> _addToBagButtonAnimation =
      Tween<Offset>(begin: const Offset(0.0, 1.0), end: Offset.zero).animate(
          CurvedAnimation(
              parent: _addToBagAndFavoriteButtonAnimaitonController,
              curve: Curves.easeInOut));

  late final Animation<Offset> _favoriteButtonAnimation =
      Tween<Offset>(begin: const Offset(0.0, 1.0), end: Offset.zero).animate(
          CurvedAnimation(
              parent: _addToBagAndFavoriteButtonAnimaitonController,
              curve: const Interval(0.4, 1.0, curve: Curves.easeInOut)));

  //Can be converted into staggered animaiton all color,size and price
  late final AnimationController _colorContainerAnimationController =
      AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 1000),
  );

  late final Animation<double> _colorContainerScaleAnimation =
      Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
          parent: _colorContainerAnimationController,
          curve: const Interval(0.0, 0.5, curve: Curves.easeInOut)));

  late final Animation<Offset> _colorContainerSlideUpAnimation =
      Tween<Offset>(begin: Offset.zero, end: const Offset(0, -0.5)).animate(
          CurvedAnimation(
              parent: _colorContainerAnimationController,
              curve: const Interval(0.4, 0.7, curve: Curves.easeInOut)));

  late final Animation<Offset> _colorContainerSlideDownAnimation =
      Tween<Offset>(begin: const Offset(0, -0.5), end: Offset.zero).animate(
          CurvedAnimation(
              parent: _colorContainerAnimationController,
              curve: const Interval(0.7, 1.0, curve: Curves.easeInOut)));

  late final AnimationController _priceContainerAnimationController =
      AnimationController(
          vsync: this, duration: const Duration(milliseconds: 1000));

  late final Animation<double> _priceContainerScaleAnimation =
      Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
          parent: _priceContainerAnimationController,
          curve: const Interval(0.0, 0.5, curve: Curves.easeInOut)));

  late final Animation<Offset> _priceContainerSlideUpAnimation =
      Tween<Offset>(begin: const Offset(0.0, 0.1), end: const Offset(0, -0.5))
          .animate(CurvedAnimation(
              parent: _priceContainerAnimationController,
              curve: const Interval(0.4, 0.7, curve: Curves.easeInOut)));

  late final Animation<Offset> _priceContainerSlideDownAnimation =
      Tween<Offset>(begin: const Offset(0, -0.5), end: Offset.zero).animate(
          CurvedAnimation(
              parent: _priceContainerAnimationController,
              curve: const Interval(0.7, 1.0, curve: Curves.easeInOut)));

  late final AnimationController _sizeContainerAnimationController =
      AnimationController(
          vsync: this, duration: const Duration(milliseconds: 1000));

  late final Animation<double> _sizeContainerScaleAnimation =
      Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
          parent: _sizeContainerAnimationController,
          curve: const Interval(0.0, 0.5, curve: Curves.easeInOut)));

  late final Animation<Offset> _sizeContainerSlideUpAnimation =
      Tween<Offset>(begin: const Offset(0.0, 0.2), end: const Offset(0, -0.5))
          .animate(CurvedAnimation(
              parent: _sizeContainerAnimationController,
              curve: const Interval(0.4, 0.7, curve: Curves.easeInOut)));

  late final Animation<Offset> _sizeContainerSlideDownAnimation =
      Tween<Offset>(begin: const Offset(0, -0.5), end: Offset.zero).animate(
          CurvedAnimation(
              parent: _sizeContainerAnimationController,
              curve: const Interval(0.7, 1.0, curve: Curves.easeInOut)));

  //Product details animations

  late final AnimationController _productDetailsAnimationController =
      AnimationController(
          vsync: this, duration: const Duration(milliseconds: 1000));

  @override
  void initState() {
    super.initState();
    startAnimations();
  }

  void startAnimations() async {
    await Future.delayed(
        const Duration(milliseconds: heroDurationInMilliSeconds));
    _backAndSearchButtonFadeAnimationController.forward();
    _addToBagAndFavoriteButtonAnimaitonController.forward();
    _productDetailsAnimationController.forward();
    _colorContainerAnimationController.forward();
    await Future.delayed(const Duration(milliseconds: 100));
    _priceContainerAnimationController.forward();
    await Future.delayed(const Duration(milliseconds: 100));
    _sizeContainerAnimationController.forward();
  }

  @override
  void dispose() {
    _backAndSearchButtonFadeAnimationController.dispose();
    _addToBagAndFavoriteButtonAnimaitonController.dispose();
    _colorContainerAnimationController.dispose();
    _priceContainerAnimationController.dispose();
    _sizeContainerAnimationController.dispose();
    _productDetailsAnimationController.dispose();

    super.dispose();
  }

  void onBackButtonPress() async {
    _backAndSearchButtonFadeAnimationController.reverse();
    _addToBagAndFavoriteButtonAnimaitonController.reverse();
    _productDetailsAnimationController.reverse();
    _sizeContainerAnimationController.reverse();
    await Future.delayed(const Duration(milliseconds: 100));
    _priceContainerAnimationController.reverse();
    await Future.delayed(const Duration(milliseconds: 100));
    await _colorContainerAnimationController.reverse();

    Navigator.of(context).pop();
  }

  Widget _buildBackAndSearchButtonContainer() {
    return Align(
      alignment: Alignment.topCenter,
      child: Padding(
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).size.height * (0.06),
          left: MediaQuery.of(context).size.width * (0.075),
          right: MediaQuery.of(context).size.width * (0.075),
        ),
        child: FadeTransition(
          opacity: _backAndSearchButtonFadeAnimation,
          child: Row(
            children: [
              IconButton(
                  color: Colors.white,
                  onPressed: () {
                    onBackButtonPress();
                  },
                  icon: const Icon(Icons.arrow_back_ios)),
              const Spacer(),
              IconButton(
                  color: Colors.white,
                  onPressed: () {},
                  icon: const Icon(Icons.search)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAddToBagAndFavoriteButtonContainer() {
    return Align(
      alignment: Alignment.bottomRight,
      child: Container(
        height: MediaQuery.of(context).size.height * (0.075),
        width: MediaQuery.of(context).size.width * (0.35),
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(20.0),
                topLeft: Radius.circular(20.0))),
        child: LayoutBuilder(builder: (context, constraints) {
          return Row(
            children: [
              SlideTransition(
                position: _favoriteButtonAnimation,
                child: Container(
                  alignment: Alignment.center,
                  child: const Icon(
                    Icons.favorite,
                    color: Colors.white,
                  ),
                  decoration: const BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20.0),
                      )),
                  width: constraints.maxWidth * (0.5),
                  height: constraints.maxHeight,
                ),
              ),
              SlideTransition(
                position: _addToBagButtonAnimation,
                child: Container(
                  alignment: Alignment.center,
                  child: const Icon(
                    Icons.badge,
                    color: Colors.white,
                  ),
                  decoration: const BoxDecoration(
                    color: Colors.black,
                  ),
                  width: constraints.maxWidth * (0.5),
                  height: constraints.maxHeight,
                ),
              ),
            ],
          );
        }),
      ),
    );
  }

  Widget _buildColorContainer() {
    return Align(
      alignment: Alignment.topLeft,
      child: Padding(
        padding: EdgeInsets.only(
            top: MediaQuery.of(context).size.height * (0.55),
            left: MediaQuery.of(context).size.width * (0.075)),
        child: SlideTransition(
          position: _colorContainerSlideDownAnimation,
          child: SlideTransition(
            position: _colorContainerSlideUpAnimation,
            child: ScaleTransition(
                scale: _colorContainerScaleAnimation,
                alignment: Alignment.bottomCenter,
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white38,
                      borderRadius: BorderRadius.circular(25.0)),
                  height: 100,
                  width: 100,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(25.0),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "COLOR",
                            style: TextStyle(
                                color: Color(0xff727272),
                                fontSize: 15.0,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          Container(
                            width: 20.0,
                            height: 20.0,
                            decoration: BoxDecoration(
                                color: widget.product.color,
                                borderRadius: BorderRadius.circular(5)),
                          ),
                        ],
                      ),
                    ),
                  ),
                )),
          ),
        ),
      ),
    );
  }

  Widget _buildPriceContainer() {
    return Align(
      alignment: Alignment.topCenter,
      child: Padding(
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).size.height * (0.55),
          //left: MediaQuery.of(context).size.width * (0.075)
        ),
        child: SlideTransition(
          position: _priceContainerSlideDownAnimation,
          child: SlideTransition(
            position: _priceContainerSlideUpAnimation,
            child: ScaleTransition(
                scale: _priceContainerScaleAnimation,
                alignment: Alignment.bottomCenter,
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white38,
                      borderRadius: BorderRadius.circular(25.0)),
                  height: 100,
                  width: 100,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(25.0),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "PRICE",
                            style: TextStyle(
                                color: Color(0xff727272),
                                fontSize: 15.0,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          SizedBox(
                            height: 20,
                            child: Text(
                              "\$ ${widget.product.price}",
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                )),
          ),
        ),
      ),
    );
  }

  Widget _buildSizeContainer() {
    return Align(
      alignment: Alignment.topRight,
      child: Padding(
        padding: EdgeInsets.only(
            top: MediaQuery.of(context).size.height * (0.55),
            right: MediaQuery.of(context).size.width * (0.075)),
        child: SlideTransition(
          position: _sizeContainerSlideDownAnimation,
          child: SlideTransition(
            position: _sizeContainerSlideUpAnimation,
            child: ScaleTransition(
                scale: _sizeContainerScaleAnimation,
                alignment: Alignment.bottomCenter,
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white38,
                      borderRadius: BorderRadius.circular(25.0)),
                  height: 100,
                  width: 100,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(25.0),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "PRICE",
                            style: TextStyle(
                                color: Color(0xff727272),
                                fontSize: 15.0,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          SizedBox(
                            height: 20,
                            child: Text(
                              widget.product.size,
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                )),
          ),
        ),
      ),
    );
  }

  Widget _buildProductDetailsContainer() {
    return Padding(
      padding: EdgeInsets.only(
        left: MediaQuery.of(context).size.width * (0.075),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //
          Container(
            alignment: Alignment.centerLeft,
            child: SlideTransition(
              child: Text(
                widget.product.name,
                style: const TextStyle(
                  fontSize: 26.0,
                ),
              ),
              position:
                  Tween<Offset>(begin: const Offset(-1.75, 0), end: Offset.zero)
                      .animate(
                CurvedAnimation(
                  parent: _productDetailsAnimationController,
                  curve: const Interval(0.0, 1.0, curve: Curves.easeInOut),
                ),
              ),
            ),
          ),

          const SizedBox(
            height: 10.0,
          ),

          Container(
            alignment: Alignment.centerLeft,
            child: SlideTransition(
              child: Text(
                widget.product.company,
                style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16.0,
                    color: Color(0xff727272)),
              ),
              position:
                  Tween<Offset>(begin: const Offset(-1.75, 0), end: Offset.zero)
                      .animate(
                CurvedAnimation(
                  parent: _productDetailsAnimationController,
                  curve: const Interval(0.2, 1.0, curve: Curves.easeInOut),
                ),
              ),
            ),
          ),

          const SizedBox(
            height: 30.0,
          ),
          SlideTransition(
            position: Tween<Offset>(
                    begin: const Offset(0.0, -0.25), end: const Offset(0, 0.25))
                .animate(CurvedAnimation(
                    parent: _productDetailsAnimationController,
                    curve: const Interval(0.8, 1.0, curve: Curves.easeInOut))),
            child: SlideTransition(
              position: Tween<Offset>(
                      begin: const Offset(0, 0.25),
                      end: const Offset(0.0, -0.25))
                  .animate(CurvedAnimation(
                      parent: _productDetailsAnimationController,
                      curve:
                          const Interval(0.6, 0.8, curve: Curves.easeInOut))),
              child: ScaleTransition(
                alignment: Alignment.bottomCenter,
                scale: Tween<double>(begin: 0, end: 1.0).animate(
                    CurvedAnimation(
                        parent: _productDetailsAnimationController,
                        curve:
                            const Interval(0.4, 0.6, curve: Curves.easeInOut))),
                child: Container(
                    alignment: Alignment.center,
                    width: 118,
                    height: 36,
                    child: const Text("Buy Now",
                        style: TextStyle(
                            color: Color(0xffff9801),
                            fontWeight: FontWeight.w600,
                            fontSize: 18.0),
                        textAlign: TextAlign.left),
                    decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(21)),
                        border: Border.all(
                            color: const Color(0xffff9801), width: 1))),
              ),
            ),
          ),

          const SizedBox(
            height: 20.0,
          ),

          SlideTransition(
            child: FadeTransition(
              opacity:
                  Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
                parent: _productDetailsAnimationController,
                curve: const Interval(0.5, 1.0, curve: Curves.easeInOut),
              )),
              child: const Text("""
In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before the final copy is available. """),
            ),
            position: Tween<Offset>(
                    begin: const Offset(0, 0.25), end: const Offset(0.0, 0))
                .animate(
              CurvedAnimation(
                parent: _productDetailsAnimationController,
                curve: const Interval(0.5, 1.0, curve: Curves.easeInOut),
              ),
            ),
          ),
          const SizedBox(
            height: 50.0,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        onBackButtonPress();
        return Future.value(false);
      },
      child: Scaffold(
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  Stack(
                    children: [
                      Align(
                        alignment: AlignmentDirectional.topCenter,
                        child: Hero(
                          tag: widget.product.imageUrl,
                          child: Container(
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(widget.product.imageUrl),
                                  fit: BoxFit.cover,
                                ),
                                borderRadius: const BorderRadius.only(
                                    bottomRight: Radius.circular(40.0))),
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height * (0.65),
                          ),
                        ),
                      ),
                      _buildColorContainer(),
                      _buildPriceContainer(),
                      _buildSizeContainer(),
                    ],
                  ),
                  //
                  _buildProductDetailsContainer(),
                ],
              ),
            ),
            _buildBackAndSearchButtonContainer(),
            _buildAddToBagAndFavoriteButtonContainer(),
          ],
        ),
      ),
    );
  }
}
