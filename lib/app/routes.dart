import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smartkit_pro/ui/animatedScreens/fitnessAnimation/fitnessHomeScreen.dart';
import 'package:smartkit_pro/ui/animatedScreens/movieAnimation/movieCharactersScreen.dart';
import 'package:smartkit_pro/ui/animatedScreens/musicAnimation/musicPlayerUxScreen.dart';
import 'package:smartkit_pro/ui/animatedScreens/pizzOrderAnimation/pizzaHomeScreen.dart';
import 'package:smartkit_pro/ui/animatedScreens/recipeAnimation/recipeAnimationScreen.dart';
import 'package:smartkit_pro/ui/animatedScreens/shoppingAnimation/shoppingHomeScreen.dart';
import 'package:smartkit_pro/ui/animatedScreens/signInFormAnimation/signInFormScreen.dart';
import 'package:smartkit_pro/ui/animatedScreens/toyStoreAnimation/ToyStoreHome.dart';
import 'package:smartkit_pro/ui/animatedScreens/travelAnimation/travelHomeScreen.dart';
import 'package:smartkit_pro/ui/fullApps/fitness/fitnessmain.dart';
import 'package:smartkit_pro/ui/fullApps/furnitureHub/screens/FurnitureAppSplash.dart';
import 'package:smartkit_pro/ui/fullApps/hotelBooking/hotelBookingApp.dart';
import 'package:smartkit_pro/ui/fullApps/jobseekApp/main.dart';
import 'package:smartkit_pro/ui/fullApps/meditationApp/Screens/meditationIntroductionActivity.dart';
import 'package:smartkit_pro/ui/fullApps/modernNewsApp/NewsAppNewMain.dart';
import 'package:smartkit_pro/ui/fullApps/music/screen/splash.dart';
import 'package:smartkit_pro/ui/fullApps/nftApp/nftApp.dart';
import 'package:smartkit_pro/ui/fullApps/quizApp/main_quiz.dart';

import 'package:smartkit_pro/ui/games/brickBreaker/brickBreakerScreen.dart';
import 'package:smartkit_pro/ui/games/card/cardGameScreen.dart';
import 'package:smartkit_pro/ui/games/flappyBall/flappyBallScreen.dart';
import 'package:smartkit_pro/ui/games/snack/snackGameScreen.dart';
import 'package:smartkit_pro/ui/screens/home/homeScreen.dart';
import 'package:smartkit_pro/ui/snippets/botomNavsScreen.dart';
import 'package:smartkit_pro/ui/snippets/buttonsScreen-1.dart';
import 'package:smartkit_pro/ui/snippets/buttonsScreen-2.dart';
import 'package:smartkit_pro/ui/snippets/dialogs/dialogsScreen.dart';
import 'package:smartkit_pro/ui/snippets/menuBarsScreen.dart';
import 'package:smartkit_pro/ui/snippets/pagination/paginationScreen.dart';
import 'package:smartkit_pro/ui/snippets/searchBarsScreen.dart';

import '../ui/animatedScreens/addToCartAnimation/ui/addToCartAnimationHome.dart';
import '../ui/fullApps/DoctorApp/doctor_splashScreen.dart';
import '../ui/fullApps/cryptoTech/activity/SplashScreen.dart';
import '../ui/fullApps/dreamHome/screens/dHomeSplashScreen.dart';
import '../ui/fullApps/eStudy/activity/SplashScreenMobile.dart';
import '../ui/fullApps/foodMaster/activity/SplashScreen.dart';
import '../ui/fullApps/goRide/GoRideApp/Screens/GoRideSplashScreen.dart';
import '../ui/fullApps/grobag/Screen/GrobagSplash.dart';
import '../ui/fullApps/happyShop/Screen/HappyShopSplash.dart';
import '../ui/fullApps/loveMeet/Screens/DatingAppSplash.dart';
import '../ui/fullApps/newsApp/main.dart';
import '../ui/fullApps/playMedia/Screens/MovieAppSplash.dart';
import '../ui/fullApps/pureBeauty/Screens/SalonSplashScreen.dart';
import '../ui/fullApps/worldTour/Screens/TravelAppSplash.dart';

class Routes {
  static const String home = "/";

  //Animated screen routes
  static const String addToCartAnimation = "/animation/addToCartAnimation";
  static const String musicAnimation = "/animations/musicAnimation";
  static const String shoppingAnimation = "/animations/shoppingAnimation";
  static const String fitnessAnimation = "/animations/fitnessAnimation";
  static const String pizzaOrderAnimation = "/animations/pizzaOrderAnimation";
  static const String travelAnimation = "/animations/travelAnimation";
  static const String recipeAnimation = "/animations/recipeAnimation";
  static const String movieAnimation = "/animations/movieAnimation";
  static const String toyStoreAnimation = "/animations/toyStoreAnimation";

  static const String signInFormAnimation = "/animations/signInForm";

  //Games routes
  static const String flappyBallGame = "/games/flappyGame";
  static const String cardGame = "/games/cardGame";
  static const String brickBreakerGame = "/games/brickBreaker";
  static const String snackGame = "/games/snack";

  //Full Apps route
  static const String doctorLive = "/fullApps/doctorLive";
  static const String dreamHome = "/fullApps/dreamHome";
  static const String furnitureHub = "/fullApps/furnitureHub";
  static const String goRide = "/fullApps/goRide";
  static const String meditationApp = "/fullApps/meditationApp";
  static const String pureBeauty = "/fullApps/pureBeauty";
  static const String worldTour = "/fullApps/worldTour";
  static const String loveMeet = "/fullApps/loveMeet";
  static const String playMedia = "/fullApps/playMedia";
  static const String grobag = "/fullApps/grobag";
  static const String foodMaster = "/fullApps/foodMaster";
  static const String cryptoTech = "/fullApps/cryptoTech";
  static const String happyShop = "/fullApps/happyShop";
  static const String eStudy = "/fullApps/eStudy";
  static const String newsApp = "/fullApps/newsApp";
  static const String quizApp = "/fullApps/quizApp";
  static const String jobseekApp = "/fullApps/jobseekApp";

  static const String musicApp = "/fullApps/musicApp";
  static const String modernNewsApp = "/fullApps/modernNews";
  static const String hotelBookingApp = "/fullApps/hotelBooking";

  //Snippets
  static const String bottomNavs = "/fullApps/bottomNavs";
  static const String searchBars = "/fullApps/searchBars";
  static const String menuBars = "/fullApps/menuBars";
  static const String buttons_1 = "/fullApps/buttons_1";
  static const String buttons_2 = "/fullApps/buttons_2";
  static const String dialogs = "/fullApps/dialogs";
  static const String pagination = "/fullApps/pagination";

  static const String fitnessApp = "/fullApps/fitnessApp";
  static const String nftApp = "fullApps/nftApp";

  static Route<dynamic> onGenerateRoute(RouteSettings routeSettings) {
    if (routeSettings.name! == home) {
      return CupertinoPageRoute(builder: (_) => const HomeScreen());
    } else if (routeSettings.name! == addToCartAnimation) {
      return CupertinoPageRoute(builder: (_) => const AddToCartAnimationHome());
    } else if (routeSettings.name! == musicAnimation) {
      return CupertinoPageRoute(builder: (_) => const MusicPlayerUxScreen());
    } else if (routeSettings.name! == shoppingAnimation) {
      return CupertinoPageRoute(builder: (_) => const ShoppingHomeScreen());
    } else if (routeSettings.name! == flappyBallGame) {
      return CupertinoPageRoute(builder: (_) => const FlappyBallScreen());
    } else if (routeSettings.name! == cardGame) {
      return CupertinoPageRoute(builder: (_) => const CardGameScreen());
    } else if (routeSettings.name! == brickBreakerGame) {
      return CupertinoPageRoute(builder: (_) => const BrickBreakerScreen());
    } else if (routeSettings.name! == snackGame) {
      return CupertinoPageRoute(builder: (_) => const SnackGameScreen());
    } else if (routeSettings.name! == fitnessAnimation) {
      return CupertinoPageRoute(builder: (_) => const FitnessHomeScreen());
    } else if (routeSettings.name! == pizzaOrderAnimation) {
      return CupertinoPageRoute(builder: (_) => const PizzaHomeScreen());
    } else if (routeSettings.name! == travelAnimation) {
      return CupertinoPageRoute(builder: (_) => const TravelHomeScreen());
    } else if (routeSettings.name! == recipeAnimation) {
      return RecipeAnimationScreen.route(routeSettings);
    } else if (routeSettings.name! == movieAnimation) {
      return CupertinoPageRoute(builder: (_) => const MovieCharactersScreen());
    }
    //full apps routes
    else if (routeSettings.name! == doctorLive) {
      /*DoctorSplashScreen*/
      return CupertinoPageRoute(builder: (_) => DoctorSplashScreen());
    } else if (routeSettings.name! == dreamHome) {
      return CupertinoPageRoute(builder: (_) => DHomeSplashScreen());
    } else if (routeSettings.name! == furnitureHub) {
      return CupertinoPageRoute(builder: (_) => FurnitureAppSplash());
    } else if (routeSettings.name! == goRide) {
      return CupertinoPageRoute(builder: (_) => GoRideSplashScreen());
    } else if (routeSettings.name! == meditationApp) {
      return CupertinoPageRoute(
          builder: (_) => MeditationIntroductionActivity());
    } else if (routeSettings.name! == pureBeauty) {
      return CupertinoPageRoute(builder: (_) => SalonSplashScreen());
    } else if (routeSettings.name! == worldTour) {
      return CupertinoPageRoute(builder: (_) => TravelAppSplash());
    } else if (routeSettings.name! == loveMeet) {
      return CupertinoPageRoute(builder: (_) => DatingAppSplash());
    } else if (routeSettings.name! == playMedia) {
      return CupertinoPageRoute(builder: (_) => MovieAppSplash());
    } else if (routeSettings.name! == grobag) {
      return CupertinoPageRoute(builder: (_) => GrobagSplash());
    } else if (routeSettings.name! == foodMaster) {
      return CupertinoPageRoute(builder: (_) => FoodMasterSplashScreen());
    } else if (routeSettings.name! == cryptoTech) {
      return CupertinoPageRoute(builder: (_) => CryptoSplashScreen());
    } else if (routeSettings.name! == happyShop) {
      return CupertinoPageRoute(builder: (_) => HappyShopSplash());
    } else if (routeSettings.name! == eStudy) {
      return CupertinoPageRoute(builder: (_) => EstudySplashScreen());
    } else if (routeSettings.name! == newsApp) {
      return CupertinoPageRoute(builder: (_) => NewsApp());
    } else if (routeSettings.name! == musicApp) {
      return CupertinoPageRoute(builder: (_) => MusicSplashScreen());
    } else if (routeSettings.name! == bottomNavs) {
      return CupertinoPageRoute(builder: (_) => BottomNavsScreen());
    } else if (routeSettings.name! == searchBars) {
      return CupertinoPageRoute(builder: (_) => SearchBarScreen());
    } else if (routeSettings.name! == menuBars) {
      return CupertinoPageRoute(builder: (_) => MenuBarsScreen());
    } else if (routeSettings.name! == buttons_1) {
      return CupertinoPageRoute(builder: (_) => ButtonsScreen_1());
    } else if (routeSettings.name! == buttons_2) {
      return CupertinoPageRoute(builder: (_) => ButtonsScreen_2());
    } else if (routeSettings.name! == dialogs) {
      return CupertinoPageRoute(builder: (_) => DialogsScreen());
    } else if (routeSettings.name! == pagination) {
      return CupertinoPageRoute(builder: (_) => PaginationScreen());
    } else if (routeSettings.name! == toyStoreAnimation) {
      return CupertinoPageRoute(builder: (_) => ToyStoreHome());
    } else if (routeSettings.name! == fitnessApp) {
      return CupertinoPageRoute(builder: (_) => Fitnessmain());
    } else if (routeSettings.name! == quizApp) {
      return CupertinoPageRoute(builder: (_) => mainQuiz());
    } else if (routeSettings.name! == jobseekApp) {
      return CupertinoPageRoute(builder: (_) => MyApp());
    } else if (routeSettings.name! == signInFormAnimation) {
      return CupertinoPageRoute(builder: (_) => SignInFormScreen());
    } else if (routeSettings.name! == modernNewsApp) {
      return CupertinoPageRoute(builder: (_) => NewsAppNewMain());
    } else if (routeSettings.name! == nftApp) {
      return CupertinoPageRoute(builder: (_) => NFTApp());
    } else if (routeSettings.name! == hotelBookingApp) {
      return CupertinoPageRoute(builder: (_) => HotelBookingApp());
    } else {
      return CupertinoPageRoute(builder: (_) => const Scaffold());
    }
  }
}
