class RecommendedModel {
  String? id;
  String? name;
  String? subTitle;
  String? like;
  String? profile;
  String? imgurl;
  String? hash;

  RecommendedModel({
    this.id,
    this.name,
    this.subTitle,
    this.like,
    this.profile,
    this.imgurl,
    this.hash,
  });
}

List<RecommendedModel> recommendedList = [
  RecommendedModel(
    id: "1",
    name: "Light Morning Practice",
    subTitle: "LeBron James",
    like: "1",
    profile: "assets/images/fullApps/meditationApp/sleep_j.jpg",
    imgurl:
        "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/meditation%2Fsleep_j.jpg?alt=media&token=bcca72f0-cd08-44d7-85e3-64523f003fe9",
    hash: "LI84uekCxZWBV@f6ogj[xZay_Nof",
  ),
  RecommendedModel(
    id: "2",
    name: "Beachside Visualization",
    subTitle: "Jeff Warren",
    like: "0",
    profile: "assets/images/fullApps/meditationApp/sleep_k.jpg",
    imgurl:
        "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/meditation%2Fsleep_k.jpg?alt=media&token=c222ff6a-d744-4d7d-b3da-6dfc9354ddb2",
    hash: "LBAx444T?H_NN@%NV[IU%M%M~qIU",
  ),
  RecommendedModel(
    id: "3",
    name: "Method for Sleep",
    subTitle: "LeBron James",
    like: "0",
    profile: "assets/images/fullApps/meditationApp/sleep_l.jpg",
    imgurl:
        "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/meditation%2Fsleep_l.jpg?alt=media&token=c25e9566-5c27-4217-922e-6dba7aa7a16a",
    hash: "LIMtQ[R5yZbciaX9cFoJTfbc-njE",
  ),
];
