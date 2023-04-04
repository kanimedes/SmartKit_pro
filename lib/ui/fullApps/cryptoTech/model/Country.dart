

class Country {
  String? isoName,
      name,
      currencyCode,
      currencyName,
      currencySymbol,
      flag,
      callingCodes;
  Country({
    this.isoName,
    this.name,
    this.currencyCode,
    this.currencyName,
    this.currencySymbol,
    this.flag,
    this.callingCodes,
  });

  factory Country.fromJson(Map<String, dynamic> json) {
    return Country(
      isoName: json["isoName"] ?? '',
      name: json["name"] ?? '',
      currencyCode: json["currencyCode"].toString(),
      currencyName: json["currencyName"],
      currencySymbol: json["currencySymbol"],
      flag: json["flag"],
      callingCodes: json["callingCodes"],
    );
  }

  @override
  String toString() {
    return '$name';
  }
}
