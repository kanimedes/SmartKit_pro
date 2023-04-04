class FavouriteModel {
  String? id;
  String? title;
  String? subTitle;
  String? image;
  String? blurUrl;
  String? localimg;

  FavouriteModel(
      {this.id,
      this.title,
      this.subTitle,
      this.image,
      this.blurUrl,
      this.localimg});
}

List<FavouriteModel> favouriteList = [
  FavouriteModel(
    id: "1",
    title: "Tower Bridge",
    subTitle: "London, United Kingdom",
    localimg: "assets/images/fullApps/worldTour/image/detail_image_c.jpg",
    image:
        "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/travelapp%2Fdetail_image_c.jpg?alt=media&token=4597cb2b-eb8b-4006-ab69-290ea7613dcb",
    blurUrl: "LhG_F[RjjZWC*JbHj[j@J.kCbHkC",
  ),
  FavouriteModel(
    id: "2",
    title: "The CN Tower",
    subTitle: "Toronto, ON, Canada",
    localimg: "assets/images/fullApps/worldTour/image/slide_image_d.jpg",
    image:
        "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/travelapp%2Fslide_image_d.jpg?alt=media&token=6d0343c8-0abb-49cf-838a-4d26fa865a6b",
    blurUrl: "LXJG{9o~ENs.~qo#WXay5roMxGR+",
  )
];
