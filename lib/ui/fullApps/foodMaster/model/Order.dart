import 'package:smartkit_pro/ui/fullApps/foodMaster/model/Address.dart';
import 'package:smartkit_pro/ui/fullApps/foodMaster/model/Item.dart';
import 'package:smartkit_pro/ui/fullApps/foodMaster/model/Restaurant.dart';

class Order {
  int? id;
  String? createdAt;
  String? updatedAt;
  int? addressId;
  int? clientId;
  int? restorantId;
  int? driverId;
  double? deliveryPrice;
  double? orderPrice;
  String? paymentMethod;
  String? paymentStatus;
  String? comment;
  String? lat;
  String? lng;
  String? srtipePaymentId;
  int? fee;
  int? feeValue;
  int? staticFee;
  int? deliveryMethod;
  String? deliveryPickupInterval;
  double? vatvalue;
  int? paymentProcessorFee;
  String? timeToPrepare;
  String? tableId;
  String? phone;
  String? whatsappAddress;
  String? paymentLink;
  Restaurant? restorant;
  List<Status>? status;
  Item? items;
  Address? address;
  Driver? driver;
  bool? isreviewed;

  Order({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.addressId,
    this.clientId,
    this.restorantId,
    this.driverId,
    this.deliveryPrice,
    this.orderPrice,
    this.paymentMethod,
    this.paymentStatus,
    this.comment,
    this.lat,
    this.lng,
    this.srtipePaymentId,
    this.fee,
    this.feeValue,
    this.staticFee,
    this.deliveryMethod,
    this.deliveryPickupInterval,
    this.vatvalue,
    this.paymentProcessorFee,
    this.timeToPrepare,
    this.tableId,
    this.phone,
    this.whatsappAddress,
    this.paymentLink,
    this.restorant,
    this.status,
    this.items,
    this.address,
    this.driver,
    this.isreviewed,
  });
}

class Status {
  int? id;
  String? name;
  String? alias;
  Pivot1? pivot;

  Status({this.id, this.name, this.alias, this.pivot});
}

List<Status> statuslist = [
  Status(
      id: 1,
      name: "Pendding",
      pivot: Pivot1(
          createdAt: "2021-02-18T11:50:31.000000Z",
          userId: 1,
          statusId: 1,
          comment: "Its good",
          orderId: 1)),
  Status(
      id: 2,
      name: "Done",
      pivot: Pivot1(
          createdAt: "2021-02-18T11:50:31.000000Z",
          userId: 2,
          statusId: 2,
          comment: "good",
          orderId: 2))
];

class Pivot1 {
  int? orderId;
  int? statusId;
  int? userId;
  String? createdAt;
  String? comment;

  Pivot1(
      {this.orderId, this.statusId, this.userId, this.createdAt, this.comment});
}

class Driver {
  int? id;
  String? googleId;
  String? fbId;
  String? appleId;
  String? name;
  String? email;
  String? emailVerifiedAt;
  String? phone;
  String? createdAt;
  String? updatedAt;
  int? active;
  String? stripeId;
  String? cardBrand;
  String? cardLastFour;
  String? trialEndsAt;
  String? verificationCode;
  String? phoneVerifiedAt;
  String? planId;
  String? planStatus;
  String? cancelUrl;
  String? updateUrl;
  String? checkoutId;
  String? subscriptionPlanId;
  String? stripeAccount;
  String? birthDate;
  String? lat;
  String? lng;
  int? working;
  String? onorder;
  int? numorders;
  int? rejectedorders;
  String? paypalSubscribtionId;
  String? mollieCustomerId;
  String? mollieMandateId;
  String? taxPercentage;
  String? extraBillingInformation;
  String? mollieSubscribtionId;
  String? paystackSubscribtionId;
  String? paystackTransId;

  Driver(
      {this.id,
      this.googleId,
      this.fbId,
      this.appleId,
      this.name,
      this.email,
      this.emailVerifiedAt,
      this.phone,
      this.createdAt,
      this.updatedAt,
      this.active,
      this.stripeId,
      this.cardBrand,
      this.cardLastFour,
      this.trialEndsAt,
      this.verificationCode,
      this.phoneVerifiedAt,
      this.planId,
      this.planStatus,
      this.cancelUrl,
      this.updateUrl,
      this.checkoutId,
      this.subscriptionPlanId,
      this.stripeAccount,
      this.birthDate,
      this.lat,
      this.lng,
      this.working,
      this.onorder,
      this.numorders,
      this.rejectedorders,
      this.paypalSubscribtionId,
      this.mollieCustomerId,
      this.mollieMandateId,
      this.taxPercentage,
      this.extraBillingInformation,
      this.mollieSubscribtionId,
      this.paystackSubscribtionId,
      this.paystackTransId});
}

List<Order> orderlist = [
  Order(
      id: 1,
      createdAt: "2021-02-18T11:50:31.000000Z",
      updatedAt: "2021-02-26T12:17:24.000000Z",
      addressId: 1,
      clientId: 1,
      restorantId: 1,
      driverId: 1,
      deliveryPrice: 50,
      orderPrice: 100,
      paymentMethod: "cash on delivery",
      paymentStatus: "",
      comment: "",
      lat: "1.2222",
      lng: "2.56885",
      srtipePaymentId: "1359584555",
      fee: 20,
      feeValue: 10,
      staticFee: 2,
      deliveryMethod: 2,
      deliveryPickupInterval: "",
      vatvalue: 3,
      paymentProcessorFee: 1,
      timeToPrepare: "8:00AM",
      tableId: "1",
      phone: "123654789955",
      whatsappAddress: "12345687",
      paymentLink: "",
      restorant: Restaurant(
          logom: "assets/images/fullApps/foodMaster/Detail_1.jpg",
          name: "Bronx VanNest Restorant",
          address: "6 Yukon Drive Raeford, NC 28376",
          phone: "1241548784524125"),
      items: Item(
          id: 1,
          price: 20,
          name: "Pizza",
          orderPivot: OrderPivot(
              qty: 2,
              extras: "1",
              itemId: 1,
              orderId: 1,
              variantName: "test",
              variantPrice: 20,
              vat: 5,
              vatvalue: 40)),
      status: [
        Status(
            name: "done",
            id: 1,
            alias: " ",
            pivot: Pivot1(
                createdAt: "2021-02-18T11:50:31.000000Z",
                orderId: 1,
                comment: "its good ",
                statusId: 1,
                userId: 1))
      ],
      address: Address(address: "6 Yukon Drive Raeford, NC 28376"),
      driver: Driver(name: "anish", phone: "1232468578"))
];
