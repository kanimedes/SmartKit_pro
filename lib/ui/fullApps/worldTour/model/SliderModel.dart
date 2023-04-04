import 'package:smartkit_pro/ui/fullApps/worldTour/model/PreviewImageModel.dart';
import 'package:smartkit_pro/ui/fullApps/worldTour/model/ReviewModel.dart';

class SliderModel {
  String? id;
  String? location;
  String? name;
  String? price;
  String? left;
  String? like;
  String? description;
  String? image;
  String? localimg;
  String? smallImage;
  List<ReviewModel>? reviewList;
  List<PreviewImageModel>? previewImageList;
  String? blurUrl;
  String? blurUrlSmall;
  String? blurUrlDetail;

  SliderModel({
    this.id,
    this.name,
    this.location,
    this.left,
    this.price,
    this.like,
    this.image,
    this.smallImage,
    this.description,
    this.previewImageList,
    this.reviewList,
    this.blurUrl,
    this.blurUrlSmall,
    this.localimg,
  });
}

List<SliderModel> sliderList = [
  SliderModel(
    id: "1",
    name: "Tower Bridge",
    location: "London, United Kingdom",
    left: "ONLY 5 LEFT",
    price: "\$100",
    like: "0",
    localimg: "assets/images/fullApps/worldTour/image/slide_image_a.jpg",
    image:
        "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/travelapp%2Fslide_image_a.jpg?alt=media&token=74b47826-4f44-42e8-97b0-760ced606460",
    smallImage:
        "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/travelapp%2Fslide_image_a.jpg?alt=media&token=74b47826-4f44-42e8-97b0-760ced606460",
    description:
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
    previewImageList: [
      PreviewImageModel(
        id: "1",
        image:
            "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/travelapp%2Fdetail_image_a.jpg?alt=media&token=95c2b092-9969-413a-8990-0ee8ab77e3e6",
        blurUrl: "LlF70ZnNsmbv_Noze.RjkXxaogV@",
        localimg: "assets/images/fullApps/worldTour/image/detail_image_a.jpg",
      ),
      PreviewImageModel(
          id: "2",
          localimg: "assets/images/fullApps/worldTour/image/detail_image_b.jpg",
          image:
              "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/travelapp%2Fdetail_image_b.jpg?alt=media&token=1b82c38c-da7c-4e29-8948-be6ac0d5b3d1",
          blurUrl: "LRG9Hi9F%May~qRjxtxu-;fkaxt6"),
      PreviewImageModel(
          id: "3",
          localimg: "assets/images/fullApps/worldTour/image/detail_image_c.jpg",
          image:
              "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/travelapp%2Fdetail_image_c.jpg?alt=media&token=4597cb2b-eb8b-4006-ab69-290ea7613dcb",
          blurUrl: "LhG_F[RjjZWC*JbHj[j@J.kCbHkC"),
      PreviewImageModel(
          id: "4",
          localimg: "assets/images/fullApps/worldTour/image/detail_video_a.jpg",
          image:
              "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/travelapp%2Fdetail_video_a.jpg?alt=media&token=4f4aebf0-6f09-41bd-ac72-9f9cbe7b5a7b",
          blurUrl: "L4EMRZ-=V@-=00_4o#Mx0000oJj@"),
    ],
    reviewList: [
      ReviewModel(
        id: "1",
        name: "AHMET DUNCAN",
        rating: "9.2",
        description:
            "Praesent ac fringilla nisi, at gravidanisi, Phasellus eleifend at felis sit amet tincidunt.",
      ),
      ReviewModel(
        id: "2",
        name: "AHMET DUNCAN",
        rating: "9.2",
        description:
            "Praesent ac fringilla nisi, at gravidanisi, Phasellus eleifend at felis sit amet tincidunt.",
      ),
      ReviewModel(
        id: "3",
        name: "AHMET DUNCAN",
        rating: "9.2",
        description:
            "Praesent ac fringilla nisi, at gravidanisi, Phasellus eleifend at felis sit amet tincidunt.",
      ),
      ReviewModel(
        id: "4",
        name: "AHMET DUNCAN",
        rating: "9.2",
        description:
            "Praesent ac fringilla nisi, at gravidanisi, Phasellus eleifend at felis sit amet tincidunt.",
      ),
    ],
    blurUrl: "L-LEWpj[ofRk~pj[ofWBtQWBRjt7",
    blurUrlSmall: "L-LEWpj[ofRk~pj[ofWBtQWBRjt7",
  ),
  SliderModel(
    id: "2",
    name: "Burj Khalifa",
    location: "Downtown Dubai, United Arab Emirates",
    left: "ONLY 8 LEFT",
    price: "\$229",
    like: "0",
    localimg: "assets/images/fullApps/worldTour/image/slide_image_b.jpg",
    image:
        "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/travelapp%2Fslide_image_b.jpg?alt=media&token=029cbf42-1302-4b68-884c-ff93febd7b82",
    smallImage:
        "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/travelapp%2Fslide_image_b.jpg?alt=media&token=029cbf42-1302-4b68-884c-ff93febd7b82",
    description:
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
    previewImageList: [
      PreviewImageModel(
          id: "5",
          localimg: "assets/images/fullApps/worldTour/image/detail_image_a.jpg",
          image:
              "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/travelapp%2Fdetail_image_a.jpg?alt=media&token=95c2b092-9969-413a-8990-0ee8ab77e3e6",
          blurUrl: "LlF70ZnNsmbv_Noze.RjkXxaogV@"),
      PreviewImageModel(
          id: "6",
          localimg: "assets/images/fullApps/worldTour/image/detail_image_b.jpg",
          image:
              "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/travelapp%2Fdetail_image_b.jpg?alt=media&token=1b82c38c-da7c-4e29-8948-be6ac0d5b3d1",
          blurUrl: "LRG9Hi9F%May~qRjxtxu-;fkaxt6"),
      PreviewImageModel(
          id: "7",
          localimg: "assets/images/fullApps/worldTour/image/detail_image_c.jpg",
          image:
              "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/travelapp%2Fdetail_image_c.jpg?alt=media&token=4597cb2b-eb8b-4006-ab69-290ea7613dcb",
          blurUrl: "LhG_F[RjjZWC*JbHj[j@J.kCbHkC"),
      PreviewImageModel(
          id: "8",
          localimg: "assets/images/fullApps/worldTour/image/detail_video_a.jpg",
          image:
              "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/travelapp%2Fdetail_video_a.jpg?alt=media&token=4f4aebf0-6f09-41bd-ac72-9f9cbe7b5a7b",
          blurUrl: "L4EMRZ-=V@-=00_4o#Mx0000oJj@"),
    ],
    reviewList: [
      ReviewModel(
        id: "5",
        name: "AHMET DUNCAN",
        rating: "9.2",
        description:
            "Praesent ac fringilla nisi, at gravidanisi, Phasellus eleifend at felis sit amet tincidunt.",
      ),
      ReviewModel(
        id: "6",
        name: "AHMET DUNCAN",
        rating: "9.2",
        description:
            "Praesent ac fringilla nisi, at gravidanisi, Phasellus eleifend at felis sit amet tincidunt.",
      ),
      ReviewModel(
        id: "7",
        name: "AHMET DUNCAN",
        rating: "9.2",
        description:
            "Praesent ac fringilla nisi, at gravidanisi, Phasellus eleifend at felis sit amet tincidunt.",
      ),
      ReviewModel(
        id: "8",
        name: "AHMET DUNCAN",
        rating: "9.2",
        description:
            "Praesent ac fringilla nisi, at gravidanisi, Phasellus eleifend at felis sit amet tincidunt.",
      ),
    ],
    blurUrl: "LkB|]MM{kDR*?wRjWCWBkXaeRjoK",
    blurUrlSmall: "LkB|]MM{kDR*?wRjWCWBkXaeRjoK",
  ),
  SliderModel(
    id: "3",
    name: "The CN Tower",
    location: "Bremner Blvd, Toronto, ON, Canada",
    left: "ONLY 1 LEFT",
    price: "\$111",
    like: "0",
    localimg: "assets/images/fullApps/worldTour/image/slide_image_c.jpg",
    image:
        "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/travelapp%2Fslide_image_c.jpg?alt=media&token=837467fe-003a-4b74-ae4b-739259ab4ccf",
    smallImage:
        "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/travelapp%2Fslide_image_c.jpg?alt=media&token=837467fe-003a-4b74-ae4b-739259ab4ccf",
    description:
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
    previewImageList: [
      PreviewImageModel(
          id: "9",
          localimg: "assets/images/fullApps/worldTour/image/detail_image_a.jpg",
          image:
              "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/travelapp%2Fdetail_image_a.jpg?alt=media&token=95c2b092-9969-413a-8990-0ee8ab77e3e6",
          blurUrl: "LlF70ZnNsmbv_Noze.RjkXxaogV@"),
      PreviewImageModel(
          id: "10",
          localimg: "assets/images/fullApps/worldTour/image/detail_image_b.jpg",
          image:
              "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/travelapp%2Fdetail_image_b.jpg?alt=media&token=1b82c38c-da7c-4e29-8948-be6ac0d5b3d1",
          blurUrl: "LRG9Hi9F%May~qRjxtxu-;fkaxt6"),
      PreviewImageModel(
          id: "11",
          localimg: "assets/images/fullApps/worldTour/image/detail_image_c.jpg",
          image:
              "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/travelapp%2Fdetail_image_c.jpg?alt=media&token=4597cb2b-eb8b-4006-ab69-290ea7613dcb",
          blurUrl: "LhG_F[RjjZWC*JbHj[j@J.kCbHkC"),
      PreviewImageModel(
          id: "12",
          localimg: "assets/images/fullApps/worldTour/image/detail_video_a.jpg",
          image:
              "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/travelapp%2Fdetail_video_a.jpg?alt=media&token=4f4aebf0-6f09-41bd-ac72-9f9cbe7b5a7b",
          blurUrl: "L4EMRZ-=V@-=00_4o#Mx0000oJj@"),
    ],
    reviewList: [
      ReviewModel(
        id: "9",
        name: "AHMET DUNCAN",
        rating: "9.2",
        description:
            "Praesent ac fringilla nisi, at gravidanisi, Phasellus eleifend at felis sit amet tincidunt.",
      ),
      ReviewModel(
        id: "10",
        name: "AHMET DUNCAN",
        rating: "9.2",
        description:
            "Praesent ac fringilla nisi, at gravidanisi, Phasellus eleifend at felis sit amet tincidunt.",
      ),
      ReviewModel(
        id: "11",
        name: "AHMET DUNCAN",
        rating: "9.2",
        description:
            "Praesent ac fringilla nisi, at gravidanisi, Phasellus eleifend at felis sit amet tincidunt.",
      ),
      ReviewModel(
        id: "12",
        name: "AHMET DUNCAN",
        rating: "9.2",
        description:
            "Praesent ac fringilla nisi, at gravidanisi, Phasellus eleifend at felis sit amet tincidunt.",
      ),
    ],
    blurUrl: "LfE47TVYslg4_NSOadRjpIsmozRi",
    blurUrlSmall: "LfE47TVYslg4_NSOadRjpIsmozRi",
  ),
  SliderModel(
    id: "4",
    name: "British Columbia",
    location: "Vancouver, Canada",
    left: "ONLY 5 LEFT",
    price: "\$329",
    like: "0",
    localimg: "assets/images/fullApps/worldTour/image/slide_image_d.jpg",
    image:
        "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/travelapp%2Fslide_image_d.jpg?alt=media&token=6d0343c8-0abb-49cf-838a-4d26fa865a6b",
    smallImage:
        "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/travelapp%2Fslide_image_d.jpg?alt=media&token=6d0343c8-0abb-49cf-838a-4d26fa865a6b",
    description:
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
    previewImageList: [
      PreviewImageModel(
          id: "13",
          localimg: "assets/images/fullApps/worldTour/image/detail_image_a.jpg",
          image:
              "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/travelapp%2Fdetail_image_a.jpg?alt=media&token=95c2b092-9969-413a-8990-0ee8ab77e3e6",
          blurUrl: "LlF70ZnNsmbv_Noze.RjkXxaogV@"),
      PreviewImageModel(
          id: "14",
          localimg: "assets/images/fullApps/worldTour/image/detail_image_b.jpg",
          image:
              "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/travelapp%2Fdetail_image_b.jpg?alt=media&token=1b82c38c-da7c-4e29-8948-be6ac0d5b3d1",
          blurUrl: "LRG9Hi9F%May~qRjxtxu-;fkaxt6"),
      PreviewImageModel(
          id: "15",
          localimg: "assets/images/fullApps/worldTour/image/detail_image_c.jpg",
          image:
              "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/travelapp%2Fdetail_image_c.jpg?alt=media&token=4597cb2b-eb8b-4006-ab69-290ea7613dcb",
          blurUrl: "LhG_F[RjjZWC*JbHj[j@J.kCbHkC"),
      PreviewImageModel(
          id: "16",
          localimg: "assets/images/fullApps/worldTour/image/detail_video_a.jpg",
          image:
              "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/travelapp%2Fdetail_video_a.jpg?alt=media&token=4f4aebf0-6f09-41bd-ac72-9f9cbe7b5a7b",
          blurUrl: "L4EMRZ-=V@-=00_4o#Mx0000oJj@"),
    ],
    reviewList: [
      ReviewModel(
        id: "13",
        name: "AHMET DUNCAN",
        rating: "9.2",
        description:
            "Praesent ac fringilla nisi, at gravidanisi, Phasellus eleifend at felis sit amet tincidunt.",
      ),
      ReviewModel(
        id: "14",
        name: "AHMET DUNCAN",
        rating: "9.2",
        description:
            "Praesent ac fringilla nisi, at gravidanisi, Phasellus eleifend at felis sit amet tincidunt.",
      ),
      ReviewModel(
        id: "15",
        name: "AHMET DUNCAN",
        rating: "9.2",
        description:
            "Praesent ac fringilla nisi, at gravidanisi, Phasellus eleifend at felis sit amet tincidunt.",
      ),
      ReviewModel(
        id: "16",
        name: "AHMET DUNCAN",
        rating: "9.2",
        description:
            "Praesent ac fringilla nisi, at gravidanisi, Phasellus eleifend at felis sit amet tincidunt.",
      ),
    ],
    blurUrl: "LXJG{9o~ENs.~qo#WXay5roMxGR+",
    blurUrlSmall: "LXJG{9o~ENs.~qo#WXay5roMxGR+",
  ),
];
