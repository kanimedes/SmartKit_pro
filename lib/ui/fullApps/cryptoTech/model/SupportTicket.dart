class SupportTicket {
  String? id, userid, title, status, created_on, lastmessage;
  SupportTicket({
    this.id,
    this.userid,
    this.title,
    this.status,
    this.created_on,
    this.lastmessage,
  });

  factory SupportTicket.fromJson(Map<String, dynamic> json) {
    return SupportTicket(
      id: json["id"].toString(),
      userid: json["user_id"],
      title: json["title"],
      status: json["status"],
      created_on: json["created_on"],
      lastmessage: json["message"],
    );
  }
}
