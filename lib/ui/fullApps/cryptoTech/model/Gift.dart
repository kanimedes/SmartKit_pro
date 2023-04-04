

class Gift {
  String? id,
      title,
      min_sell_trade_amount,
      image,
      localimg,
      status,
      created_on,
      gift_id,
      user_id,
      username,
      phone,
      email,
      address,
      first_name,
      last_name,
      blurUrl;

  Gift({
    this.id,
    this.title,
    this.min_sell_trade_amount,
    this.image,
    this.status,
    this.created_on,
    this.gift_id,
    this.user_id,
    this.username,
    this.phone,
    this.email,
    this.address,
    this.first_name,
    this.localimg,
    this.last_name,
    this.blurUrl,
  });

  factory Gift.fromJson(Map<String, dynamic> json) {
    return Gift(
      id: json["id"],
      title: json["title"] ?? '',
      min_sell_trade_amount: json["min_sell_trade_amount"].toString(),
      image: json["image"],
      status: json["status"],
      created_on: json["created_on"],
      localimg: json["localimg"],
      blurUrl: json["blurUrl"],
    );
  }
  factory Gift.fromOrderJson(Map<String, dynamic> json) {
    return Gift(
      id: json["id"].toString(),
      gift_id: json["gift_id"].toString(),
      user_id: json["user_id"].toString(),
      title: json["title"] ?? '',
      username: json["username"] ?? '',
      phone: json["phone"] ?? '',
      email: json["email"] ?? '',
      address: json["address"] ?? '',
      status: json["status"],
      created_on: json["created_on"],
      first_name: json["first_name"],
      last_name: json["last_name"],
    );
  }
}
