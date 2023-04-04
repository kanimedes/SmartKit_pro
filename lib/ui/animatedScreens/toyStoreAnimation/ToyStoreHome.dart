import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:lottie/lottie.dart';
import 'package:octo_image/octo_image.dart';
import 'package:smartkit_pro/ui/animatedScreens/toyStoreAnimation/DetailPage.dart';
import 'package:smartkit_pro/ui/animatedScreens/toyStoreAnimation/ToyController.dart';
import 'package:smartkit_pro/ui/animatedScreens/toyStoreAnimation/ToyModel.dart';

class ToyStoreHome extends StatefulWidget {
  const ToyStoreHome({Key? key}) : super(key: key);
  @override
  _ToyStoreHomeState createState() => _ToyStoreHomeState();
}

class _ToyStoreHomeState extends State<ToyStoreHome>
    with TickerProviderStateMixin {
  final controller = ToyController();
  Duration animationDuration = Duration(milliseconds: 500);
  double cartBarHeight = 80.0;
  double headerHeight = kToolbarHeight;
  int selectedIndex = 0;
  late AnimationController animationController =
      AnimationController(vsync: this, duration: Duration(milliseconds: 1000));
  List<String> mascotnamelist = [
    'Animals',
    'Dolls',
    'Puzzle',
    'Clay Toy',
    'Robots'
  ];
  @override
  void initState() {
    animation();
    super.initState();
  }

  Future<void> animation() async {
    await animationController.forward(from: 0.0);
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  void _onVerticalGesture(DragUpdateDetails details) {
    if (details.primaryDelta! < -0.7) {
      controller.changeHomeState(HomeState.cart);
    } else if (details.primaryDelta! > 12) {
      controller.changeHomeState(HomeState.normal);
    }
  }

  @override
  Widget build(BuildContext context) {
    cartBarHeight = 80.0;
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
          backgroundColor: Colors.white,
          bottom: PreferredSize(
              preferredSize: Size(MediaQuery.of(context).size.width,
                  MediaQuery.of(context).size.height * .01),
              child: topBarWidget())),
      body: AnimatedBuilder(
        animation: controller,
        builder: (context, builder) {
          return LayoutBuilder(builder: (context, BoxConstraints constraints) {
            return Stack(fit: StackFit.loose, children: [
              AnimatedPositioned(
                duration: animationDuration,
                top: /*MediaQuery.of(context).size.height*.005,*/ controller
                            .homeState ==
                        HomeState.normal
                    ? headerHeight - 45
                    : -(constraints.maxHeight -
                        cartBarHeight * 2 -
                        headerHeight -
                        30),
                left: 0,
                right: 0,
                height: constraints.maxHeight -
                    headerHeight -
                    cartBarHeight +
                    MediaQuery.of(context).size.height * .06,
                child: Container(
                  // padding:EdgeInsets.only(top: MediaQuery.of(context).size.height*.01,left: 10,right: 10,bottom: 0),
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                  margin: EdgeInsets.only(bottom: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10))),
                  child: PageView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: mascotnamelist.length,
                      onPageChanged: (int index) {
                        setState(() {
                          selectedIndex = index;
                        });
                      },
                      itemBuilder: (_, index) => GridView.builder(
                            itemCount: selectedIndex == 0
                                ? toylist.length
                                : selectedIndex == 1
                                    ? toylist1.length
                                    : selectedIndex == 2
                                        ? toylist2.length
                                        : selectedIndex == 3
                                            ? toylist3.length
                                            : toylist4.length,
                            shrinkWrap: true,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: 0.75,
                              mainAxisSpacing: 10,
                              crossAxisSpacing: 10,
                            ),
                            itemBuilder: (context, index) {
                              ToyModel toy = selectedIndex == 0
                                  ? toylist[index]
                                  : selectedIndex == 1
                                      ? toylist1[index]
                                      : selectedIndex == 2
                                          ? toylist2[index]
                                          : selectedIndex == 3
                                              ? toylist3[index]
                                              : toylist4[index];
                              return GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    PageRouteBuilder(
                                      transitionDuration:
                                          const Duration(milliseconds: 500),
                                      reverseTransitionDuration:
                                          const Duration(milliseconds: 500),
                                      pageBuilder: (context, animation,
                                              secondaryAnimation) =>
                                          FadeTransition(
                                        opacity: animation,
                                        child: DetailPage(
                                          toy: toy,
                                          onItemAdd: () {
                                            controller.addToyToCart(toy);
                                          },
                                        ),
                                      ),
                                    ),
                                  );
                                },
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 15, vertical: 15),
                                  decoration: BoxDecoration(
                                    color: Colors.grey[200],
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(10),
                                    ),
                                  ),
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          child: Center(
                                            child: Hero(
                                              tag: "${toy.id}",
                                              child: OctoImage(
                                                image:
                                                    CachedNetworkImageProvider(
                                                        toy.image!),
                                                placeholderBuilder:
                                                    OctoPlaceholder.blurHash(
                                                        toy.blurUrl!),
                                                height: 130,
                                                width: 130,
                                                errorBuilder: OctoError.icon(
                                                    color: Colors.black),
                                                fit: BoxFit.fill,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              toy.title!,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .subtitle1!
                                                  .copyWith(
                                                      fontWeight:
                                                          FontWeight.w600),
                                            ),
                                            Spacer(),
                                            Text(
                                              toy.type!,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .caption,
                                            ),
                                          ],
                                        ),
                                        Text(
                                          toy.price!,
                                        ),
                                      ]),
                                ),
                              );
                            },
                          )),
                ),
              ),
              // topBarWidget(),
              cartWidget(constraints),
            ]);
          });
        },
      ),
    );
  }

  Widget topBarWidget() {
    return Container(
      color: Colors.white,
      height: MediaQuery.of(context).size.height * .07,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: mascotnamelist.length,
        shrinkWrap: true,
        itemBuilder: (_, index) => GestureDetector(
          onTap: () {
            setState(() {
              selectedIndex = index;
            });
          },
          child: Container(
            margin: EdgeInsets.zero,
            padding: EdgeInsets.symmetric(
                horizontal: 16.0, vertical: headerHeight / 3),
            child: Text(
              mascotnamelist[index],
              style: TextStyle(
                fontWeight: FontWeight.w700,
                color: selectedIndex == index ? Colors.black : Colors.grey[400],
                fontSize: 17,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget cartWidget(BoxConstraints constraints) {
    const overlap = 28.0;
    return AnimatedPositioned(
      duration: animationDuration,
      //top: 0,
      bottom: 0,
      left: 0,
      right: 0,
      height: controller.homeState == HomeState.normal
          ? cartBarHeight
          : (constraints.maxHeight - cartBarHeight) -
              MediaQuery.of(context).size.height * .15,
      child: GestureDetector(
        onVerticalDragUpdate: _onVerticalGesture,
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              // color: Colors.white,
              color: Theme.of(context).scaffoldBackgroundColor,
              //  color: Color(0xFFEAEAEA),
              boxShadow: const [
                BoxShadow(
                    color: Colors.black45,
                    spreadRadius: 5,
                    blurRadius: 10,
                    offset: Offset(0, 1)),
              ]),
          alignment: Alignment.topLeft,
          child: AnimatedSwitcher(
            duration: animationDuration,
            child: controller.homeState == HomeState.normal
                ? Row(
                    children: [
                      CircleAvatar(
                          radius: 25,
                          backgroundColor: Colors.white,
                          child: Lottie.asset(
                              "assets/images/animatedScreens/toyStoreAnimation/cart.json",
                              height: MediaQuery.of(context).size.height * .09,
                              width: MediaQuery.of(context).size.width * .09,
                              controller: animationController,
                              onLoaded: (composition) {
                            animationController.duration = composition.duration;
                            controller.addListener(() {
                              animationController.forward(from: 0.0);
                            });
                          })),
                      const SizedBox(width: 2),
                      Stack(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(30)),
                            height: MediaQuery.of(context).size.height * .064,
                            width: MediaQuery.of(context).size.width * .8,
                            child: /*SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child:*/
                                Stack(
                                    children: List<Widget>.generate(
                                        controller.cartlist.length,
                                        (index) => Padding(
                                              padding: EdgeInsets.fromLTRB(
                                                  index.toDouble() * overlap,
                                                  0,
                                                  0,
                                                  0),
                                              child: Hero(
                                                tag: controller.cartlist[index]
                                                        .item!.id
                                                        .toString() +
                                                    "_cartTag",
                                                child: CircleAvatar(
                                                  radius: 25,
                                                  backgroundColor: Theme.of(
                                                          context)
                                                      .scaffoldBackgroundColor,
                                                  child: OctoImage(
                                                    image:
                                                        CachedNetworkImageProvider(
                                                      controller.cartlist[index]
                                                          .item!.image!,
                                                    ),
                                                    placeholderBuilder:
                                                        OctoPlaceholder
                                                            .blurHash(controller
                                                                .cartlist[index]
                                                                .item!
                                                                .blurUrl!),
                                                    errorBuilder:
                                                        OctoError.icon(
                                                            color:
                                                                Colors.black),
                                                    fit: BoxFit.fill,
                                                  ),

                                                  //backgroundColor: Colors.grey,
                                                ),
                                              ),
                                            ))),
                          ),
                          Positioned(
                            right: 0,
                            child: CircleAvatar(
                              radius: 25,
                              backgroundColor: Color(0xFF1A3365),
                              child: Text(
                                controller.totalCartItems().toString(),
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ),
                          )
                        ],
                      ),
                      /* CircleAvatar(
                        backgroundColor: Color(0xFF1A3365),
                        child: Text(
                          controller.totalCartItems().toString(),
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      )*/
                    ],
                  )
                : SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Cart",
                            style: Theme.of(context)
                                .textTheme
                                .headline6!
                                .merge(TextStyle(color: Colors.black))),
                        SizedBox(height: 8),
                        ...List.generate(
                          controller.cartlist.length,
                          (index) => ListTile(
                            contentPadding: EdgeInsets.only(bottom: 10),
                            leading: CircleAvatar(
                                radius: 25,
                                backgroundColor: Colors.white,
                                child: ClipOval(
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  child: OctoImage(
                                    image: CachedNetworkImageProvider(
                                      controller.cartlist[index].item!.image!,
                                    ),
                                    placeholderBuilder:
                                        OctoPlaceholder.blurHash(controller
                                            .cartlist[index].item!.blurUrl!),
                                    errorBuilder:
                                        OctoError.icon(color: Colors.black),
                                    fit: BoxFit.fill,
                                  ),
                                )),
                            title: Text(
                              controller.cartlist[index].item!.title!,
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle1!
                                  .copyWith(fontWeight: FontWeight.bold),
                            ),
                            trailing: FittedBox(
                              child: Row(
                                children: [
                                  Text(controller.cartlist[index].item!.price!),
                                  Text(
                                    "  x ${controller.cartlist[index].qty}",
                                    style: Theme.of(context)
                                        .textTheme
                                        .subtitle1!
                                        .copyWith(fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Color(0xFF1A3365),
                              onPrimary: Colors.white,
                              onSurface: Colors.grey,
                              textStyle: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            onPressed: () {},
                            child: Text("Checkout"),
                          ),
                        )
                      ],
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}
