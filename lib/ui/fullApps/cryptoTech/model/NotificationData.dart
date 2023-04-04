

class NotificationData {
  String? id, title, description, date_created;
  NotificationData({
    this.id,
    this.title,
    this.description,
    this.date_created,
  });

  factory NotificationData.fromJson(Map<String, dynamic> json) {
    return NotificationData(
      id: json["id"].toString(),
      title: json["title"],
      description: json["description"],
      date_created: json["date_created"],
    );
  }
}
