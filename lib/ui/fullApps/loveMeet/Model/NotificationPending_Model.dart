// ignore_for_file: camel_case_types

class NotificationPending_Model {
  String? id;
  String? name;
  String? subTitle;
  String? profile;

  NotificationPending_Model({this.id, this.name, this.subTitle, this.profile});
}

List<NotificationPending_Model> notificationPendingList = [
  NotificationPending_Model(
    id: "1",
    name: "Judy Kuhn",
    subTitle: "Send you request",
    profile: "assets/images/fullApps/loveMeet/profile_w.jpg",
  ),
  NotificationPending_Model(
    id: "2",
    name: "Amber Ross",
    subTitle: "Send you request",
    profile: "assets/images/fullApps/loveMeet/profile_h.jpg",
  ),
  NotificationPending_Model(
    id: "3",
    name: "Samuel Parker",
    subTitle: "Send you request",
    profile: "assets/images/fullApps/loveMeet/profile_v.jpg",
  ),
  NotificationPending_Model(
    id: "4",
    name: "Byron Kuhn",
    subTitle: "Send you request",
    profile: "assets/images/fullApps/loveMeet/profile_y.jpg",
  ),
];
