class Review {
  int? id;
  String? createdAt;
  String? updatedAt;
  double? rating;
  String? rateableType;
  int? rateableId;
  int? userId;
  String? username;
  int? orderId;
  String? comment;

  Review(
      {this.id,
      this.createdAt,
      this.updatedAt,
      this.rating,
      this.rateableType,
      this.rateableId,
      this.userId,
      this.orderId,
      this.username,
      this.comment});
}

List<Review> reviewlist = [
  Review(
      id: 1,
      createdAt: "2021-02-18T11:50:31.000000Z",
      updatedAt: "2021-02-26T12:17:24.000000Z",
      rating: 5,
      rateableType: "test",
      rateableId: 1,
      userId: 1,
      username: "Ankita",
      orderId: 1,
      comment: "its a good")
];
