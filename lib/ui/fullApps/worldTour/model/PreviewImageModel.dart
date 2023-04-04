class PreviewImageModel {
  String? id;
  String? image;
  String? blurUrl;
  String? localimg;

  PreviewImageModel({this.id, this.image, this.localimg, this.blurUrl});
}

List<PreviewImageModel> gallaryList = [
  PreviewImageModel(
      id: "1",
      localimg: "assets/images/fullApps/worldTour/image/slide_image_a.jpg",
      image:
          "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/travelapp%2Fslide_image_a.jpg?alt=media&token=74b47826-4f44-42e8-97b0-760ced606460",
      blurUrl: "L-LEWpj[ofRk~pj[ofWBtQWBRjt7"),
  PreviewImageModel(
      id: "2",
      localimg: "assets/images/fullApps/worldTour/image/slide_image_b.jpg",
      image:
          "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/travelapp%2Fslide_image_b.jpg?alt=media&token=029cbf42-1302-4b68-884c-ff93febd7b82",
      blurUrl: "LkB|]MM{kDR*?wRjWCWBkXaeRjoK"),
  PreviewImageModel(
      id: "3",
      localimg: "assets/images/fullApps/worldTour/image/slide_image_c.jpg",
      image:
          "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/travelapp%2Fslide_image_c.jpg?alt=media&token=837467fe-003a-4b74-ae4b-739259ab4ccf",
      blurUrl: "LfE47TVYslg4_NSOadRjpIsmozRi"),
  PreviewImageModel(
      id: "4",
      localimg: "assets/images/fullApps/worldTour/image/slide_image_d.jpg",
      image:
          "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/travelapp%2Fslide_image_d.jpg?alt=media&token=6d0343c8-0abb-49cf-838a-4d26fa865a6b",
      blurUrl: "LXJG{9o~ENs.~qo#WXay5roMxGR+"),
];
