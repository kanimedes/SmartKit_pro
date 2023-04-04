class Fame {
  String? user_id, total, name, image_url, followers;
  String? is_user_following;
  Fame({
    this.user_id,
    this.total,
    this.name,
    this.image_url,
    this.is_user_following,
    this.followers,
  });

  factory Fame.fromJson(Map<String, dynamic> json) {
    return Fame(
      user_id: json["user_id"].toString(),
      total: double.parse(json["total"] ?? '0').toStringAsFixed(2),
      name: "${json["first_name"]} ${json["last_name"]}",
      image_url: json["image"] ?? '',
      is_user_following: json["is_user_following"],
      followers: json["followers"],
    );
  }
}
