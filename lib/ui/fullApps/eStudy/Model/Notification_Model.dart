class Notification_Model{
  String? id;
  String? date;
  String? discount;
  String? message;

  Notification_Model({this.id, this.date, this.discount, this.message});
}

List<Notification_Model> NotificationList = [
  Notification_Model(
    id: "1",
    date: "Mar 08, 2021",
    discount: "50% off on your saved course",
    message: "Lorem ipsum donec quis mi a mauris condimentum elementum. Suspendisse suscipit arcu et mattis tincidunt.",
  ),
  Notification_Model(
    id: "2",
    date: "Mar 05, 2021",
    discount: "Couse purchased success",
    message: "Design with adobe illustrator cc 2021 - Masterclass course purchase successfully join best of luck for this course.",
  ),
  Notification_Model(
    id: "3",
    date: "Mar 02, 2021",
    discount: "Claim Your 20% Discount on new Course",
    message: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididun.",
  ),
  Notification_Model(
    id: "4",
    date: "Feb 28, 2021",
    discount: "Claim Your 20% Discount on new Course",
    message: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
  ),
  Notification_Model(
    id: "5",
    date: "Feb 28, 2021",
    discount: "Claim Your 20% Discount on new Course",
    message: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
  ),
];


