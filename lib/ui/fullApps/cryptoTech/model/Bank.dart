

class Bank {
  String? id,
      name,
      slug,
      code,
      longcode,
      gateway,
      pay_with_bank,
      active,
      is_deleted,
      country,
      currency,
      type,
      createdAt,
      updatedAt;
  Bank({
    this.id,
    this.name,
    this.slug,
    this.code,
    this.longcode,
    this.gateway,
    this.pay_with_bank,
    this.active,
    this.is_deleted,
    this.country,
    this.currency,
    this.type,
    this.createdAt,
    this.updatedAt,
  });

  factory Bank.fromJson(Map<String, dynamic> json) {
    return Bank(
      id: json["id"].toString(),
      name: json["name"] ?? '',
      slug: json["slug"] ?? '',
      code: json["code"] ?? '',
      longcode: json["longcode"] ?? '',
      gateway: json["gateway"] ?? '',
      pay_with_bank: json["pay_with_bank"].toString(),
      active: json["active"].toString(),
      is_deleted:
          json["is_deleted"] == null ? '' : json["is_deleted"].toString(),
      country: json["country"] ?? '',
      currency: json["currency"] ?? '',
      type: json["type"] ?? '',
      createdAt: json["createdAt"] ?? '',
      updatedAt: json["updatedAt"] ?? '',
    );
  }

  @override
  String toString() {
    return name!;
  }
}
