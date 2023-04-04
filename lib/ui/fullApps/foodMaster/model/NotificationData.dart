class NotificationData {
  String? id;
  String? type;
  String? notifiableType;
  String? notifiableId;
  Data? data;
  String? readAt;
  String? createdAt;
  String? updatedAt;

  NotificationData(
      {this.id,
      this.type,
      this.notifiableType,
      this.notifiableId,
      this.data,
      this.readAt,
      this.createdAt,
      this.updatedAt});
}

class Data {
  String? title;
  String? body;

  Data({this.title, this.body});

  Data.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    body = json['body'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['body'] = body;
    return data;
  }
}

List<NotificationData> notificationlist = [
  NotificationData(
      id: "1",
      type: "1",
      createdAt: "2021-02-18T11:50:31.000000Z",
      data: Data(
          title: "New Restaurant Arrived",
          body: "New Restaurant Arrived in FoodMaster"),
      notifiableId: "1",
      notifiableType: "data",
      readAt: "2021-02-18T11:50:31.000000Z",
      updatedAt: "2021-02-18T11:50:31.000000Z"),
  NotificationData(
      id: "2",
      type: "2",
      createdAt: "2021-02-18T11:50:31.000000Z",
      data: Data(title: "Top Restaurant", body: "Top Restaurant of this week."),
      notifiableId: "1",
      notifiableType: "data",
      readAt: "2021-02-18T11:50:31.000000Z",
      updatedAt: "2021-02-18T11:50:31.000000Z"),
  NotificationData(
      id: "3",
      type: "3",
      createdAt: "2021-02-18T11:50:31.000000Z",
      data: Data(
          title: "Most Order Item",
          body: "Most Order Item People Frequently Order."),
      notifiableId: "1",
      notifiableType: "data",
      readAt: "2021-02-18T11:50:31.000000Z",
      updatedAt: "2021-02-18T11:50:31.000000Z")
];
