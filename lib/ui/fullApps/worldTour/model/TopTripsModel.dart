import 'package:smartkit_pro/ui/fullApps/worldTour/model/PreviewImageModel.dart';
import 'package:smartkit_pro/ui/fullApps/worldTour/model/ReviewModel.dart';

class TopTripsModel {
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

  TopTripsModel(
      {this.id,
      this.name,
      this.location,
      this.left,
      this.price,
      this.like,
      this.image,
      this.localimg,
      this.smallImage,
      this.description,
      this.previewImageList,
      this.reviewList,
      this.blurUrl,
      this.blurUrlSmall});
}

List<TopTripsModel> topTripsList = [
  TopTripsModel(
      id: "1",
      name: "Colosseum,",
      location: "Rome",
      left: "ONLY 2 LEFT",
      price: "\$229",
      like: "0",
      localimg: "assets/images/fullApps/worldTour/image/toptrip_a.jpg",
      image:
          "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/travelapp%2Ftoptrip_a.jpg?alt=media&token=8789c5b6-728e-4154-a9ce-fdd9dd5fce0b",
      smallImage:
          "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/travelapp%2Ftoptrip_a.jpg?alt=media&token=8789c5b6-728e-4154-a9ce-fdd9dd5fce0b",
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
            localimg:
                "assets/images/fullApps/worldTour/image/detail_image_b.jpg",
            image:
                "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/travelapp%2Fdetail_image_b.jpg?alt=media&token=1b82c38c-da7c-4e29-8948-be6ac0d5b3d1",
            blurUrl: "LRG9Hi9F%May~qRjxtxu-;fkaxt6"),
        PreviewImageModel(
            id: "3",
            localimg:
                "assets/images/fullApps/worldTour/image/detail_image_c.jpg",
            image:
                "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/travelapp%2Fdetail_image_c.jpg?alt=media&token=4597cb2b-eb8b-4006-ab69-290ea7613dcb",
            blurUrl: "LhG_F[RjjZWC*JbHj[j@J.kCbHkC"),
        PreviewImageModel(
            id: "4",
            localimg:
                "assets/images/fullApps/worldTour/image/detail_video_a.jpg",
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
      blurUrl: "L38NLd=cvz?^00WBV@mlDN%Ml9Io",
      blurUrlSmall: "L38NLd=cvz?^00WBV@mlDN%Ml9Io"),
  TopTripsModel(
      id: "2",
      name: "Milford Sound,",
      location: "New Zealand",
      left: "ONLY 2 LEFT",
      price: "\$100",
      like: "1",
      localimg: "assets/images/fullApps/worldTour/image/toptrip_b.jpg",
      image:
          "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/travelapp%2Ftoptrip_b.jpg?alt=media&token=cd01d6b2-2892-4da7-bfee-4069e2e4f7e8",
      smallImage:
          "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/travelapp%2Ftoptrip_b.jpg?alt=media&token=cd01d6b2-2892-4da7-bfee-4069e2e4f7e8",
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
      blurUrl: "L5Juca009FDi00oJ-oRj00~VMwM{",
      blurUrlSmall: "L5Juca009FDi00oJ-oRj00~VMwM{"),
  TopTripsModel(
      id: "3",
      name: "Fairy Pools,",
      location: "Scotland",
      left: "ONLY 15 LEFT",
      price: "\$199",
      like: "0",
      localimg: "assets/images/fullApps/worldTour/image/toptrip_c.jpg",
      image:
          "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/travelapp%2Ftoptrip_c.jpg?alt=media&token=529bd6fa-7772-4f43-9480-2013a3ab2aeb",
      smallImage:
          "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/travelapp%2Ftoptrip_c.jpg?alt=media&token=529bd6fa-7772-4f43-9480-2013a3ab2aeb",
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
      blurUrl: "LB9k~KrqHXtSD4bbRjg3uiIUM_xu",
      blurUrlSmall: "LB9k~KrqHXtSD4bbRjg3uiIUM_xu"),
  TopTripsModel(
      id: "4",
      name: "Rainbow mountaine,",
      location: "China",
      left: "ONLY 5 LEFT",
      price: "\$109",
      like: "1",
      localimg: "assets/images/fullApps/worldTour/image/toptrip_d.jpg",
      image:
          "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/travelapp%2Ftoptrip_d.jpg?alt=media&token=4102fc3c-c6fb-442d-8fee-1202ae2238f6",
      smallImage:
          "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/travelapp%2Ftoptrip_d.jpg?alt=media&token=4102fc3c-c6fb-442d-8fee-1202ae2238f6",
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
      blurUrl: "LKGb^;bwxvM{6ExVV@t700W=Rkt7",
      blurUrlSmall: "LKGb^;bwxvM{6ExVV@t700W=Rkt7"),
  TopTripsModel(
      id: "5",
      name: "Railay Beach,",
      location: "Thailand",
      left: "ONLY 10 LEFT",
      price: "\$159",
      like: "0",
      localimg: "assets/images/fullApps/worldTour/image/toptrip_e.jpg",
      image:
          "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/travelapp%2Ftoptrip_e.jpg?alt=media&token=62e805e1-82c1-4ad0-931f-d3a5e839069b",
      smallImage:
          "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/travelapp%2Ftoptrip_e.jpg?alt=media&token=62e805e1-82c1-4ad0-931f-d3a5e839069b",
      description:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
      previewImageList: [
        PreviewImageModel(
            id: "17",
            localimg:
                "assets/images/fullApps/worldTour/image/detail_image_a.jpg",
            image:
                "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/travelapp%2Fdetail_image_a.jpg?alt=media&token=95c2b092-9969-413a-8990-0ee8ab77e3e6",
            blurUrl: "LlF70ZnNsmbv_Noze.RjkXxaogV@"),
        PreviewImageModel(
            id: "18",
            localimg:
                "assets/images/fullApps/worldTour/image/detail_image_b.jpg",
            image:
                "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/travelapp%2Fdetail_image_b.jpg?alt=media&token=1b82c38c-da7c-4e29-8948-be6ac0d5b3d1",
            blurUrl: "LRG9Hi9F%May~qRjxtxu-;fkaxt6"),
        PreviewImageModel(
            id: "19",
            localimg:
                "assets/images/fullApps/worldTour/image/detail_image_c.jpg",
            image:
                "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/travelapp%2Fdetail_image_c.jpg?alt=media&token=4597cb2b-eb8b-4006-ab69-290ea7613dcb",
            blurUrl: "LhG_F[RjjZWC*JbHj[j@J.kCbHkC"),
        PreviewImageModel(
            id: "20",
            localimg:
                "assets/images/fullApps/worldTour/image/detail_video_a.jpg",
            image:
                "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/travelapp%2Fdetail_video_a.jpg?alt=media&token=4f4aebf0-6f09-41bd-ac72-9f9cbe7b5a7b",
            blurUrl: "L4EMRZ-=V@-=00_4o#Mx0000oJj@"),
      ],
      reviewList: [
        ReviewModel(
          id: "17",
          name: "AHMET DUNCAN",
          rating: "9.2",
          description:
              "Praesent ac fringilla nisi, at gravidanisi, Phasellus eleifend at felis sit amet tincidunt.",
        ),
        ReviewModel(
          id: "18",
          name: "AHMET DUNCAN",
          rating: "9.2",
          description:
              "Praesent ac fringilla nisi, at gravidanisi, Phasellus eleifend at felis sit amet tincidunt.",
        ),
        ReviewModel(
          id: "19",
          name: "AHMET DUNCAN",
          rating: "9.2",
          description:
              "Praesent ac fringilla nisi, at gravidanisi, Phasellus eleifend at felis sit amet tincidunt.",
        ),
        ReviewModel(
          id: "20",
          name: "AHMET DUNCAN",
          rating: "9.2",
          description:
              "Praesent ac fringilla nisi, at gravidanisi, Phasellus eleifend at felis sit amet tincidunt.",
        ),
      ],
      blurUrl: "L*Br.kt7adfQu6ofaeayXTjEfkj[",
      blurUrlSmall: "L*Br.kt7adfQu6ofaeayXTjEfkj["),
];
