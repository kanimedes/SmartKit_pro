// ignore_for_file: camel_case_types

class Notification_Model {
  String? id;
  String? title;
  String? time;
  String? image;

  Notification_Model({
    this.id,
    this.title,
    this.time,
    this.image,
  });
}

List<Notification_Model> notificationList = [
  Notification_Model(
    id: "1",
    title: "Your order 2 Accent Chairs has been shipped!",
    time: "15 mins ago",
    image: "assets/images/fullApps/furnitureHub/noti_cart.svg",
  ),
  Notification_Model(
    id: "2",
    title: "Special Big Sale up to 50% Off all product today?",
    time: "24 mins ago",
    image: "assets/images/fullApps/furnitureHub/noti_discount.svg",
  ),
  Notification_Model(
    id: "3",
    title: "Your order 6 Alvarado Lounge Chair has been shipped!",
    time: "Yesterday",
    image: "assets/images/fullApps/furnitureHub/noti_cart.svg",
  ),
  Notification_Model(
    id: "4",
    title: "Your order 20 Alvarado Lounge Chair has been shipped!",
    time: "15 jan, 2019",
    image: "assets/images/fullApps/furnitureHub/noti_cart.svg",
  ),
  Notification_Model(
    id: "5",
    title:
        "Kitchen Island Pros and Coins/10 Inspiring Empty - Nest Makeovers/ where to Save Money on a Land...",
    time: "16 jan,2019",
    image: "assets/images/fullApps/furnitureHub/noti_doc.svg",
  ),

//
];
