

class Refer {
  String? id, email,name, amount,refer_code,friend_code;
  Refer( {
    this.id,
    this.email,
    this.name,
    this.amount,
    this.refer_code,
    this.friend_code,
  });

  factory Refer.fromJson(Map<String,dynamic> json) {
    return Refer(
      id: json["id"].toString(),
      email: json["email"],
      name: json["name"],
      amount: json["amount"].toString(),
      refer_code: json["refer_code"],
      friend_code: json["friend_code"],
    );
  }



}