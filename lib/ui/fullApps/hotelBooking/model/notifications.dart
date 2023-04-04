import 'package:smartkit_pro/ui/fullApps/hotelBooking/model/hotel.dart';

class NotificationModel {
  String title, subTitle, imageFile, date;

  NotificationModel(
      {required this.title,
      required this.subTitle,
      required this.imageFile,
      required this.date});
}

List<NotificationModel> notificationModel = [
  NotificationModel(
      title: '2 step verification successful',
      subTitle: '${hotelList[0].name} booking was successful.',
      imageFile: 'status_verification.png',
      date: 'Today'),
  NotificationModel(
      title: 'E-Wallet Connected!',
      subTitle: 'E-Wallet successfully connected to application.',
      imageFile: 'status_wallet.png',
      date: 'Today'),
  NotificationModel(
      title: 'Payment Successful!',
      subTitle: '${hotelList[0].name} booking was successful.',
      imageFile: 'status_success.png',
      date: 'Today'),
  NotificationModel(
      title: 'Hotel Booking Cancelled!',
      subTitle: '${hotelList[1].name} booking was cancelled.',
      imageFile: 'status_cancel.png',
      date: 'Yesterday'),
  NotificationModel(
      title: 'Payment Successful!',
      subTitle: 'Hotel booking booking was successful.',
      imageFile: 'status_success.png',
      date: 'Yesterday'),
  NotificationModel(
      title: 'Payment Successful!',
      subTitle: 'Hotel booking booking was successful.',
      imageFile: 'status_success.png',
      date: '15 June, 2025'),
  NotificationModel(
      title: 'Hotel Booking Cancelled!',
      subTitle: '${hotelList[5].name} booking was cancelled.',
      imageFile: 'status_cancel.png',
      date: 'Yesterday'),
  NotificationModel(
      title: 'Payment Successful!',
      subTitle: 'Hotel booking booking was successful.',
      imageFile: 'status_success.png',
      date: '15 June, 2025'),
  NotificationModel(
      title: 'Payment Successful!',
      subTitle: 'Hotel booking booking was successful.',
      imageFile: 'status_success.png',
      date: '15 June, 2025'),
  NotificationModel(
      title: 'Payment Successful!',
      subTitle: '${hotelList[7].name} booking was successful.',
      imageFile: 'status_success.png',
      date: '10 June, 2025'),
  NotificationModel(
      title: 'Hotel Booking Cancelled!',
      subTitle: '${hotelList[3].name} booking was cancelled.',
      imageFile: 'status_cancel.png',
      date: '10 June, 2025'),
  NotificationModel(
      title: 'Payment Successful!',
      subTitle: 'Hotel booking booking was successful.',
      imageFile: 'status_success.png',
      date: '01 June, 2025'),
];
