import 'package:smartkit_pro/ui/fullApps/playMedia/Model/NotificationList_Model.dart';

class Notification_Model {
  String? id;
  String? title;
  String? subtitle;
  List<NotificationList_Model>? notificationItemList;

  Notification_Model(
      {this.id, this.title, this.subtitle, this.notificationItemList});
}

List<Notification_Model> notificationList = [
  Notification_Model(
    id: "1",
    title: "Carmen Myers",
    subtitle: "Most Recommend Movie",
    notificationItemList: [
      NotificationList_Model(
        id: "1",
        title: "Like The Croods Movie",
        time: "Just now",
        status: "1",
      ),
      NotificationList_Model(
        id: "2",
        title: "Like The Smurfs Movie",
        time: "Yesterday 17:14",
        status: "0",
      ),
    ],
  ),
  Notification_Model(
    id: "2",
    title: "Enrique Perkins",
    subtitle: "This Month Top Movie",
    notificationItemList: [
      NotificationList_Model(
        id: "3",
        title: "Like Godzilla vs Kong Movie",
        time: "Yesterday 12:14",
        status: "1",
      ),
      NotificationList_Model(
        id: "4",
        title: "Like Pirates Of Caribbean Movie",
        time: "Yesterday 17:14",
        status: "0",
      ),
    ],
  ),
];
