class SleepModel {
  String? id;
  String? name;
  String? subTitle;
  String? like;
  String? profile;
  String? imgurl;
  String? hash;

  SleepModel({
    this.id,
    this.name,
    this.subTitle,
    this.like,
    this.profile,
    this.imgurl,
    this.hash,
  });
}

List<SleepModel> sleepList = [
  SleepModel(
    id: "1",
    name: "King of the Sleeping City (Instrumental)",
    subTitle: "Curated by Disnep",
    like: "1",
    profile: "assets/images/fullApps/meditationApp/sleep_a_1.jpg",
    imgurl:
        "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/meditation%2Fsleep_a_1.jpg?alt=media&token=ba4544e5-4bb0-416e-ba98-1003ecf0deab",
    hash: "LPOBs9E1~WxGWXofWBR*t7oeS2fl",
  ),
  SleepModel(
    id: "2",
    name: "Piano for Sleep",
    subTitle: "Peace of Piano",
    like: "0",
    profile: "assets/images/fullApps/meditationApp/sleep_a_2.jpg",
    imgurl:
        "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/meditation%2Fsleep_a_2.jpg?alt=media&token=a9409789-ca3a-4cc3-908d-3d6179e66c46",
    hash: "L34_@0RQIBa#?uRQMyt7xHM{.7xu",
  ),
  SleepModel(
    id: "3",
    name: "Sweet Dream",
    subTitle: "Alessia Cara",
    like: "0",
    profile: "assets/images/fullApps/meditationApp/sleep_a_3.jpg",
    imgurl:
        "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/meditation%2Fsleep_a_3.jpg?alt=media&token=9e4843c6-ed7f-4c47-adf0-37cd81f16711",
    hash: "L99R5x%gMfob_No\$VvR~S7akxwR\$",
  ),
];
