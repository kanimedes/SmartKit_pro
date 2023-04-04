import 'package:flutter/material.dart';
import 'package:smartkit_pro/ui/fullApps/hotelBooking/model/hotel.dart';
import 'package:smartkit_pro/ui/fullApps/hotelBooking/ui/bookHotelBookingDescriptionScreen.dart';
import 'package:smartkit_pro/ui/fullApps/hotelBooking/ui/bookHotelNameReservationScreen.dart';
import 'package:smartkit_pro/ui/fullApps/hotelBooking/ui/bookHotelPaymentScreen.dart';
import 'package:smartkit_pro/ui/fullApps/hotelBooking/ui/bookHotelSelectDateScreen.dart';
import 'package:smartkit_pro/ui/fullApps/hotelBooking/ui/cancellationConfirmScreen.dart';
import 'package:smartkit_pro/ui/fullApps/hotelBooking/ui/forgotPassword.dart';
import 'package:smartkit_pro/ui/fullApps/hotelBooking/ui/galleryScreen.dart';
import 'package:smartkit_pro/ui/fullApps/hotelBooking/ui/homeScreen.dart';
import 'package:smartkit_pro/ui/fullApps/hotelBooking/ui/hotelDetailScreen.dart';
import 'package:smartkit_pro/ui/fullApps/hotelBooking/ui/hotelListingScreen.dart';
import 'package:smartkit_pro/ui/fullApps/hotelBooking/ui/introSliderScreen.dart';
import 'package:smartkit_pro/ui/fullApps/hotelBooking/ui/loginScreenWithPassword.dart';
import 'package:smartkit_pro/ui/fullApps/hotelBooking/ui/otpScreen.dart';
import 'package:smartkit_pro/ui/fullApps/hotelBooking/ui/profileEditScreen.dart';
import 'package:smartkit_pro/ui/fullApps/hotelBooking/ui/profileNotificationSettingsScreen.dart';
import 'package:smartkit_pro/ui/fullApps/hotelBooking/ui/profileNotificationsListScreen.dart';
import 'package:smartkit_pro/ui/fullApps/hotelBooking/ui/profilePaymentScreen.dart';
import 'package:smartkit_pro/ui/fullApps/hotelBooking/ui/profileSecurityScreen.dart';
import 'package:smartkit_pro/ui/fullApps/hotelBooking/ui/resetPasswordScreen.dart';
import 'package:smartkit_pro/ui/fullApps/hotelBooking/ui/signInScreen.dart';
import 'package:smartkit_pro/ui/fullApps/hotelBooking/ui/signUpManuallyScreen.dart';
import 'package:smartkit_pro/ui/fullApps/hotelBooking/ui/signUpScreen.dart';
import 'package:smartkit_pro/ui/fullApps/hotelBooking/ui/splashScreen.dart';
import 'package:smartkit_pro/ui/fullApps/hotelBooking/ui/viewTicket.dart';

// Route Names
const String splashScreen = '/splashScreen';
const String introSliderScreen = '/introSliderScreen';
const String signInScreen = '/signInScreen';
const String loginWithPasswordScreen = '/loginWithPasswordScreen';
const String signUpScreen = '/signupScreen';
const String signUpManuallyScreen = '/signUpManuallyScreen';
const String forgotPasswordScreen = '/forgotPasswordScreen';
const String otpScreen = '/otpScreen';
const String resetPasswordScreen = '/resetPasswordScreen';
const String homeScreen = '/homeScreen';
const String hotelListingScreen = '/hotelListingScreen';
const String viewTicket = '/viewTicket';
const String cancellationConfirmScreen = '/cancellationConfirmScreen';
const String hotelDetailScreen = '/hotelDetailScreen';
const String hotelGalleryScreen = '/hotelGalleryScreen';
const String bookHotelSelectDateScreen = '/bookHotelSelectDateScreen';
const String bookHotelNameReservationScreen = '/bookHotelNameReservationScreen';
const String bookHotelPaymentScreen = '/bookHotelPaymentScreen';
const String bookHotelBookingDescriptionScreen =
    'bookHotelBookingDescriptionScreen';
const String profileEditScreen = '/profileEditScreen';
const String profilePaymentScreen = '/profilePaymentScreen';
const String profileNotificationSettingsScreen =
    '/profileNotificationSettingsScreen';
const String profileSecurityScreen = '/profileSecurityScreen';
const String profileNotificationsListScreen = '/profileNotificationsListScreen';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splashScreen:
        return MaterialPageRoute(builder: (_) => SplashScreen());
      case introSliderScreen:
        return MaterialPageRoute(builder: (_) => IntroSliderScreen());
      case signInScreen:
        return MaterialPageRoute(builder: (_) => SignInScreen());
      case forgotPasswordScreen:
        return MaterialPageRoute(builder: (_) => ForgotPassword());
      case otpScreen:
        return MaterialPageRoute(builder: (_) => OtpScreen());
      case resetPasswordScreen:
        return MaterialPageRoute(builder: (_) => ResetPasswordScreen());
      case loginWithPasswordScreen:
        return MaterialPageRoute(builder: (_) => LoginWithPassword());
      case signUpScreen:
        return MaterialPageRoute(builder: (_) => SignUpScreen());
      case signUpManuallyScreen:
        return MaterialPageRoute(builder: (_) => SignUpManuallyScreen());
      case homeScreen:
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case hotelListingScreen:
        return MaterialPageRoute(
            builder: (_) => HotelListingScreen(
                  hotelList: settings.arguments as List<HotelModel>,
                ));
      case viewTicket:
        return MaterialPageRoute(builder: (_) => ViewTicket());
      case cancellationConfirmScreen:
        return MaterialPageRoute(builder: (_) => CancellationConfirmScreen());
      case hotelDetailScreen:
        return MaterialPageRoute(
            builder: (_) =>
                HotelDetailScreen(hotel: settings.arguments as HotelModel));
      case hotelGalleryScreen:
        return MaterialPageRoute(builder: (_) => HotelGalleryScreen());
      case bookHotelSelectDateScreen:
        return MaterialPageRoute(builder: (_) => BookHotelSelectDateScreen());
      case bookHotelNameReservationScreen:
        return MaterialPageRoute(
            builder: (_) => BookHotelNameReservationScreen());
      case bookHotelPaymentScreen:
        return MaterialPageRoute(builder: (_) => BookHotelPaymentScreen());
      case bookHotelBookingDescriptionScreen:
        return MaterialPageRoute(
            builder: (_) => BookHotelBookingDescriptionScreen());
      case profileEditScreen:
        return MaterialPageRoute(builder: (_) => ProfileEditScreen());
      case profilePaymentScreen:
        return MaterialPageRoute(builder: (_) => ProfilePaymentScreen());
      case profileNotificationSettingsScreen:
        return MaterialPageRoute(
            builder: (_) => ProfileNotificationSettingsScreen());
      case profileSecurityScreen:
        return MaterialPageRoute(builder: (_) => ProfileSecurityScreen());
      case profileNotificationsListScreen:
        return MaterialPageRoute(
            builder: (_) => ProfileNotificationsListScreen());
      default:
        // If there is no such named route in the switch statement, e.g. /third
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: const Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}
