

class TicketMessage {
  String? id,
      ticket_id,
      userid,
      message,
      status,
      created_on,
      first_name,
      last_name;
  TicketMessage({
    this.id,
    this.ticket_id,
    this.userid,
    this.message,
    this.status,
    this.created_on,
    this.first_name,
    this.last_name,
  });

  factory TicketMessage.fromJson(Map<String, dynamic> json) {
    return TicketMessage(
      id: json["id"].toString(),
      ticket_id: json["ticket_id"].toString(),
      userid: json["user_id"].toString(),
      message: json["message"] ?? '',
      status: json["status"] ?? '0',
      created_on: json["created_on"] ?? '',
      first_name: json["first_name"] ?? '',
      last_name: json["last_name"] ?? '',
    );
  }
}
