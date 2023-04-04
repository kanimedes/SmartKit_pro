import 'package:smartkit_pro/ui/fullApps/worldTour/model/PreviewImageModel.dart';
import 'package:smartkit_pro/ui/fullApps/worldTour/model/ReviewModel.dart';

class CategoryModel {
  String? id;
  String? location;
  String? name;
  String? price;
  String? left;
  String? like;
  String? description;
  String? image;
  String? smallImage;
  List<ReviewModel>? reviewList;
  List<PreviewImageModel>? previewImageList;
  String? blurUrl;
  String? blurUrlSmall;
  String? localimg;
  String? smalllocalimg;

  CategoryModel(
      {this.id,
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
      this.smalllocalimg,
      this.localimg,
      this.blurUrl,
      this.blurUrlSmall});
}

List<CategoryModel> categoryList = [
  CategoryModel(
    id: "1",
    name: "Mountains",
    location: "London, United Kingdom",
    left: "ONLY 4 LEFT",
    price: "\$111",
    like: "0",
    localimg: "assets/images/fullApps/worldTour/image/category_a.jpg",
    smalllocalimg:
        "assets/images/fullApps/worldTour/image/category_small_a.jpg",
    image:
        "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/travelapp%2Fcategory_a.jpg?alt=media&token=2670761c-4285-4557-970c-2f3510ed662c",
    smallImage:
        "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/travelapp%2Fcategory_small_a.jpg?alt=media&token=78bd8c82-a055-4b44-97ae-f1fb29d0549b",
    description:
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
    previewImageList: [
      PreviewImageModel(
        id: "1",
        localimg: "assets/images/fullApps/worldTour/image/detail_image_a.jpg",
        image:
            "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/travelapp%2Fdetail_image_a.jpg?alt=media&token=95c2b092-9969-413a-8990-0ee8ab77e3e6",
        blurUrl: "LlF70ZnNsmbv_Noze.RjkXxaogV@",
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
    blurUrl: "LA6ueU9aoL\$\$.TI;jExZ9v\$*oJNH",
    blurUrlSmall: "LSCQ70Ip~qxZx]R+ads.?bof?bWC",
  ),
  CategoryModel(
      id: "2",
      name: "Forest",
      location: "Downtown Dubai, United Arab Emirates",
      left: "ONLY 1 LEFT",
      price: "\$229",
      like: "0",
      localimg: "assets/images/fullApps/worldTour/image/category_b.jpg",
      smalllocalimg:
          "assets/images/fullApps/worldTour/image/category_small_b.jpg",
      image:
          "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/travelapp%2Fcategory_b.jpg?alt=media&token=3b1b8811-8de9-4283-8233-3f84360426d3",
      smallImage:
          "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/travelapp%2Fcategory_small_b.jpg?alt=media&token=1af79b2b-1d33-4791-b41f-aea3e04522b8",
      description:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
      previewImageList: [
        PreviewImageModel(
            id: "5",
            localimg:
                "assets/images/fullApps/worldTour/image/detail_image_a.jpg",
            image:
                "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/travelapp%2Fdetail_image_a.jpg?alt=media&token=95c2b092-9969-413a-8990-0ee8ab77e3e6",
            blurUrl: "LlF70ZnNsmbv_Noze.RjkXxaogV@"),
        PreviewImageModel(
            id: "6",
            localimg:
                "assets/images/fullApps/worldTour/image/detail_image_b.jpg",
            image:
                "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/travelapp%2Fdetail_image_b.jpg?alt=media&token=1b82c38c-da7c-4e29-8948-be6ac0d5b3d1",
            blurUrl: "LRG9Hi9F%May~qRjxtxu-;fkaxt6"),
        PreviewImageModel(
            id: "7",
            localimg:
                "assets/images/fullApps/worldTour/image/detail_image_c.jpg",
            image:
                "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/travelapp%2Fdetail_image_c.jpg?alt=media&token=4597cb2b-eb8b-4006-ab69-290ea7613dcb",
            blurUrl: "LhG_F[RjjZWC*JbHj[j@J.kCbHkC"),
        PreviewImageModel(
            id: "8",
            localimg:
                "assets/images/fullApps/worldTour/image/detail_video_a.jpg",
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
      blurUrl: "L7A0j?\$grq.Tt,M{Q-xGm6ogRkRj",
      blurUrlSmall: "LRCsdTae~ptRMxkCkCae?vay?vay"),
  CategoryModel(
      id: "3",
      name: "Beach",
      location: "Bremner Blvd, Toronto, ON, Canada",
      left: "ONLY 8 LEFT",
      price: "\$529",
      like: "0",
      localimg: "assets/images/fullApps/worldTour/image/category_c.jpg",
      smalllocalimg:
          "assets/images/fullApps/worldTour/image/category_small_c.jpg",
      image:
          "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/travelapp%2Fcategory_c.jpg?alt=media&token=6a75b68e-cbe4-41a1-a82f-bc77463d19a9",
      smallImage:
          "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/travelapp%2Fcategory_small_c.jpg?alt=media&token=146b6261-cf9e-4e03-9443-aeaa184fe709",
      description:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
      previewImageList: [
        PreviewImageModel(
            id: "9",
            localimg:
                "assets/images/fullApps/worldTour/image/detail_image_a.jpg",
            image:
                "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/travelapp%2Fdetail_image_a.jpg?alt=media&token=95c2b092-9969-413a-8990-0ee8ab77e3e6",
            blurUrl: "LlF70ZnNsmbv_Noze.RjkXxaogV@"),
        PreviewImageModel(
            id: "10",
            localimg:
                "assets/images/fullApps/worldTour/image/detail_image_b.jpg",
            image:
                "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/travelapp%2Fdetail_image_b.jpg?alt=media&token=1b82c38c-da7c-4e29-8948-be6ac0d5b3d1",
            blurUrl: "LRG9Hi9F%May~qRjxtxu-;fkaxt6"),
        PreviewImageModel(
            id: "11",
            localimg:
                "assets/images/fullApps/worldTour/image/detail_image_c.jpg",
            image:
                "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/travelapp%2Fdetail_image_c.jpg?alt=media&token=4597cb2b-eb8b-4006-ab69-290ea7613dcb",
            blurUrl: "LhG_F[RjjZWC*JbHj[j@J.kCbHkC"),
        PreviewImageModel(
            id: "12",
            localimg:
                "assets/images/fullApps/worldTour/image/detail_video_a.jpg",
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
      blurUrl: "LCC*RcL#00xt01o}}@S~Q-pI?bMd",
      blurUrlSmall: "LMCtRsRQ~CMxIWa0xutR^kx]_3V@"),
  CategoryModel(
      id: "4",
      name: "Adventure",
      location: "Vancouver, Canada",
      left: "ONLY 8 LEFT",
      price: "\$219",
      like: "0",
      localimg: "assets/images/fullApps/worldTour/image/category_d.jpg",
      smalllocalimg:
          "assets/images/fullApps/worldTour/image/category_small_d.jpg",
      image:
          "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/travelapp%2Fcategory_d.jpg?alt=media&token=a6883c34-f36c-4a79-8cb6-81af4bc06112",
      smallImage:
          "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/travelapp%2Fcategory_small_d.jpg?alt=media&token=de0f27e9-7f5e-472d-93ef-ea4aa0438e83",
      description:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
      previewImageList: [
        PreviewImageModel(
            id: "13",
            localimg:
                "assets/images/fullApps/worldTour/image/detail_image_a.jpg",
            image:
                "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/travelapp%2Fdetail_image_a.jpg?alt=media&token=95c2b092-9969-413a-8990-0ee8ab77e3e6",
            blurUrl: "LlF70ZnNsmbv_Noze.RjkXxaogV@"),
        PreviewImageModel(
            id: "14",
            localimg:
                "assets/images/fullApps/worldTour/image/detail_image_b.jpg",
            image:
                "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/travelapp%2Fdetail_image_b.jpg?alt=media&token=1b82c38c-da7c-4e29-8948-be6ac0d5b3d1",
            blurUrl: "LRG9Hi9F%May~qRjxtxu-;fkaxt6"),
        PreviewImageModel(
            id: "15",
            localimg:
                "assets/images/fullApps/worldTour/image/detail_image_c.jpg",
            image:
                "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/travelapp%2Fdetail_image_c.jpg?alt=media&token=4597cb2b-eb8b-4006-ab69-290ea7613dcb",
            blurUrl: "LhG_F[RjjZWC*JbHj[j@J.kCbHkC"),
        PreviewImageModel(
            id: "16",
            localimg:
                "assets/images/fullApps/worldTour/image/detail_video_a.jpg",
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
      blurUrl: "LlL;a5xt9Ft7_Nxus:t7IAoftRt7",
      blurUrlSmall: "L9HwiI0L-i?G~BM{0gt7=wxaXSWA"),
];
