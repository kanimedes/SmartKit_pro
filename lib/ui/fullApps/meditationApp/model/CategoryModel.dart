class CategoryModel {
  String? id;
  String? name;
  String? like;
  String? profile;
  String? imgurl;
  String? hash;

  CategoryModel({
    this.id,
    this.name,
    this.like,
    this.profile,
    this.imgurl,
    this.hash,
  });
}

List<CategoryModel> categoryList = [
  CategoryModel(
    id: "1",
    name: "Sleep",
    like: "1",
    profile: "assets/images/fullApps/meditationApp/sleep_image.jpg",
    imgurl:
        "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/meditation%2Fsleep_image.jpg?alt=media&token=235a86d1-0ee1-4708-ba5a-b19466bc4dda",
    hash: "LCDvAsbc%Mof?wadaJWAt8ocxuWD",
  ),
  CategoryModel(
    id: "2",
    name: "Anxiety",
    like: "0",
    profile: "assets/images/fullApps/meditationApp/anxiety_image.jpg",
    imgurl:
        "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/meditation%2Fanxiety_image.jpg?alt=media&token=c51d621d-0ef1-4778-9bd1-0346e07c2d52",
    hash: "L4555-WC%#s:IUoLxuWB_Nj@~Waz",
  ),
  CategoryModel(
    id: "3",
    name: "Focus",
    like: "0",
    profile: "assets/images/fullApps/meditationApp/focus_image.jpg",
    imgurl:
        "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/meditation%2Ffocus_image.jpg?alt=media&token=611b332d-5847-4692-9393-640ca8aa27c9",
    hash: "L7C6#{tR~qRj-;j@Rjj]~qWBozt7",
  ),
  CategoryModel(
    id: "4",
    name: "Stress",
    like: "1",
    profile: "assets/images/fullApps/meditationApp/stress.jpg",
    imgurl:
        "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/meditation%2Fstress.jpg?alt=media&token=15d3650c-18fd-4c70-a205-089e5c828f43",
    hash: "L39aQ,X-~q^P^k^+xaM{%~#R~qF2",
  ),
  CategoryModel(
    id: "5",
    name: "Self-Care",
    like: "0",
    profile: "assets/images/fullApps/meditationApp/self_care_image.jpg",
    imgurl:
        "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/meditation%2Fself_care_image.jpg?alt=media&token=74fbb60f-97c9-48e6-8cb9-585c1cf2e5ec",
    hash: "LDCh[=ofx]ay}qWBnjj[%Mj[tSoL",
  ),
  CategoryModel(
    id: "6",
    name: "Emotions",
    like: "1",
    profile: "assets/images/fullApps/meditationApp/emotions_image.jpg",
    imgurl:
        "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/meditation%2Femotions_image.jpg?alt=media&token=88f9b7f4-b546-4382-9245-bf6af80a4e78",
    hash: "L6Cs29RlXB%f_N%LxtM{9~bu?baK",
  ),
  CategoryModel(
    id: "7",
    name: "Beginners",
    like: "0",
    profile: "assets/images/fullApps/meditationApp/beginners_image.jpg",
    imgurl:
        "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/meditation%2Fbeginners_image.jpg?alt=media&token=22efc15f-fcb1-4379-b8ab-6bd8fb98e616",
    hash: "L55;]qIo%g-pofj[jZay%gxa~WIo",
  ),
  CategoryModel(
    id: "8",
    name: "Inner Peace",
    like: "1",
    profile: "assets/images/fullApps/meditationApp/inner_peace_image.jpg",
    imgurl:
        "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/meditation%2Finner_peace_image.jpg?alt=media&token=bf88dabe-c8e1-4cd3-a1c0-1c4c9f64ac0d",
    hash: "L47-cw8|_2j]x?MyWBaz_Njs_3fl",
  ),
];
