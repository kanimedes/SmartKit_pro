import 'package:smartkit_pro/ui/fullApps/cryptoTech/model/Country.dart';

class Operator {
  String? id;
  String? operatorId;
  String? name;
  bool? bundle;
  bool? data;
  bool? pin;
  bool? supportsLocalAmounts;
  String? denominationType;
  String? senderCurrencyCode;
  String? senderCurrencySymbol;
  String? destinationCurrencyCode;
  String? destinationCurrencySymbol;
  String? commission;
  String? internationalDiscount;
  String? localDiscount;
  String? mostPopularAmount;
  String? mostPopularLocalAmount;
  String? minAmount;
  String? maxAmount;
  String? localMinAmount;
  String? localMaxAmount;
  Country? country;
  Fx? fx;
  String? logoUrls;
  List<String>? fixedAmounts;
  String? fixedAmountsDescriptions;
  List<String>? localFixedAmounts;
  List<String>? localFixedAmountsDescriptions;

  List<String>? suggestedAmounts;
  List<String>? suggestedAmountsMap;
  List<String>? promotions;

  Operator(
      {this.id,
      this.operatorId,
      this.name,
      this.bundle,
      this.data,
      this.pin,
      this.supportsLocalAmounts,
      this.denominationType,
      this.senderCurrencyCode,
      this.senderCurrencySymbol,
      this.destinationCurrencyCode,
      this.destinationCurrencySymbol,
      this.commission,
      this.internationalDiscount,
      this.localDiscount,
      this.mostPopularAmount,
      this.mostPopularLocalAmount,
      this.minAmount,
      this.maxAmount,
      this.localMinAmount,
      this.localMaxAmount,
      this.country,
      this.fx,
      this.logoUrls,
      this.fixedAmounts,
      this.fixedAmountsDescriptions,
      this.localFixedAmounts,
      this.localFixedAmountsDescriptions,
      this.suggestedAmounts,
      this.suggestedAmountsMap,
      this.promotions});

  Operator.fromJson(Map<String, dynamic> json) {
    id = json['id'].toString();
    operatorId = json['operatorId'].toString();
    name = json['name'];
    bundle = json['bundle'];
    data = json['data'];
    pin = json['pin'];
    supportsLocalAmounts = json['supportsLocalAmounts'];
    denominationType = json['denominationType'];
    senderCurrencyCode = json['senderCurrencyCode'];
    senderCurrencySymbol = json['senderCurrencySymbol'];
    destinationCurrencyCode = json['destinationCurrencyCode'];
    destinationCurrencySymbol = json['destinationCurrencySymbol'];
    commission = json['commission'].toString();
    internationalDiscount = json['internationalDiscount'].toString();
    localDiscount = json['localDiscount'].toString();
    mostPopularAmount = json['mostPopularAmount'].toString();
    mostPopularLocalAmount = json['mostPopularLocalAmount'].toString();
    minAmount = json['minAmount'].toString();
    maxAmount = json['maxAmount'].toString();
    localMinAmount = json['localMinAmount'].toString();
    localMaxAmount = json['localMaxAmount'].toString();
    country =
        json['country'] != null ? new Country.fromJson(json['country']) : null;
    fx = json['fx'] != null ? new Fx.fromJson(json['fx']) : null;

    fixedAmountsDescriptions = json['fixedAmountsDescriptions'].toString();
    suggestedAmounts = CreateStringList(json['suggestedAmounts']);
    suggestedAmountsMap = CreateStringList(json['suggestedAmountsMap']);
    promotions = CreateStringList(json['promotions']);
    localFixedAmounts = CreateStringList(json['localFixedAmounts']);
    localFixedAmountsDescriptions =
        CreateStringList(json['localFixedAmountsDescriptions']);
    logoUrls = json['logoUrls'];
    fixedAmounts = CreateStringList(json['fixedAmounts']);
  }

  static List<String> CreateStringList(List? json) {
    if (json == null || json.isEmpty) return [];
    return json.map((code) => code.toString()).toList();
  }
}

class Fx {
  double? rate;
  String? currencyCode;

  Fx({this.rate, this.currencyCode});

  Fx.fromJson(Map<String, dynamic> json) {
    rate = json['rate'];
    currencyCode = json['currencyCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['rate'] = this.rate;
    data['currencyCode'] = this.currencyCode;
    return data;
  }
}
