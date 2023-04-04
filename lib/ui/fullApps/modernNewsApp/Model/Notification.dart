//category model fetch category data from server side
class NotificationModel {
  String? id, image, message, date_sent, title, newsId, type, date;

  NotificationModel(
      {this.id,
      this.image,
      this.message,
      this.title,
      this.date_sent,
      this.newsId,
      this.type,
      this.date});
}

List<NotificationModel> notificationList = [
  NotificationModel(
      id: "1",
      image: "assets/images/fullApps/modernNews/entertainmentNotification1.jpg",
      message:
          "We Will Get Married This Year’! Eijaz Khan-Pavitra Punia All Set To The Tie Knot This Year",
      date_sent: "01-May-2021 03:12 PM",
      newsId: "1",
      title:
          "We Will Get Married This Year’! Eijaz Khan-Pavitra Punia All Set To The Tie Knot This Year",
      type: "category",
      date: "01-May-2021 03:12 PM"),
  NotificationModel(
      id: "2",
      image: "assets/images/fullApps/modernNews/worldNotification2.jpg",
      message:
          "Coronavirus live updates: Over 1 crore Indians vaccinated for Covid-19",
      date_sent: "01-May-2021 01:59 PM",
      newsId: "2",
      title:
          "Coronavirus live updates: Over 1 crore Indians vaccinated for Covid-19",
      type: "category",
      date: "01-May-2021 01:59 PM"),
  NotificationModel(
      id: "3",
      image: "assets/images/fullApps/modernNews/topNewsNotification1.jpg",
      message:
          "Petrol, Diesel Prices Cut For First Time In Over A Year. Here's Why",
      date_sent: "01-May-2021 01:59 PM",
      newsId: "3",
      title:
          "Petrol, Diesel Prices Cut For First Time In Over A Year. Here's Why",
      type: "category",
      date: "01-May-2021 01:59 PM"),
  NotificationModel(
      id: "4",
      image: "assets/images/fullApps/modernNews/entertainmentNotification2.jpg",
      message:
          "We Will Get Married This Year’! Eijaz Khan-Pavitra Punia All Set To The Tie Knot This Year",
      date_sent: "01-May-2021 01:59 PM",
      newsId: "4",
      title:
          "We Will Get Married This Year’! Eijaz Khan-Pavitra Punia All Set To The Tie Knot This Year",
      type: "category",
      date: "01-May-2021 01:59 PM"),
];

List<NotificationModel> userNotificationList = [
  NotificationModel(
      id: "1",
      image: "assets/images/fullApps/modernNews/worldNotification1.jpg",
      message:
          "Aung San Suu Kyi, other leaders detained as military declares one year emergency in Myanmar",
      date_sent: "01-May-2021 03:47 PM",
      newsId: "",
      title:
          "Aung San Suu Kyi, other leaders detained as military declares one year emergency in Myanmar",
      type: "comment",
      date: "01-May-2021 03:47 PM"),
  NotificationModel(
      id: "2",
      image: "assets/images/fullApps/modernNews/entertainmentNotification1.jpg",
      message:
          "We Will Get Married This Year’! Eijaz Khan-Pavitra Punia All Set To The Tie Knot This Year",
      date_sent: "01-May-2021 03:12 PM",
      newsId: "",
      title:
          "We Will Get Married This Year’! Eijaz Khan-Pavitra Punia All Set To The Tie Knot This Year",
      type: "comment",
      date: "01-May-2021 03:12 PM"),
  NotificationModel(
      id: "3",
      image: "assets/images/fullApps/modernNews/worldNotification2.jpg",
      message:
          "Coronavirus live updates: Over 1 crore Indians vaccinated for Covid-19",
      date_sent: "01-May-2021 01:59 PM",
      newsId: "",
      title:
          "Coronavirus live updates: Over 1 crore Indians vaccinated for Covid-19",
      type: "like",
      date: "01-May-2021 01:59 PM"),
  NotificationModel(
      id: "4",
      image: "assets/images/fullApps/modernNews/topNewsNotification1.jpg",
      message:
          "Petrol, Diesel Prices Cut For First Time In Over A Year. Here's Why",
      date_sent: "01-May-2021 01:59 PM",
      newsId: "",
      title:
          "Petrol, Diesel Prices Cut For First Time In Over A Year. Here's Why",
      type: "like",
      date: "01-May-2021 01:59 PM"),
  NotificationModel(
      id: "5",
      image: "assets/images/fullApps/modernNews/entertainmentNotification2.jpg",
      message:
          "We Will Get Married This Year’! Eijaz Khan-Pavitra Punia All Set To The Tie Knot This Year",
      date_sent: "01-May-2021 01:59 PM",
      newsId: "",
      title:
          "We Will Get Married This Year’! Eijaz Khan-Pavitra Punia All Set To The Tie Knot This Year",
      type: "comment",
      date: "01-May-2021 01:59 PM"),
];
