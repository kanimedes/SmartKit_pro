import 'package:smartkit_pro/ui/fullApps/eStudy/Model/Comment_Model.dart';
import 'package:smartkit_pro/ui/fullApps/eStudy/Model/Image_Model.dart';

class All_Course_Model {
  String? id;
  List<Image_Model>? imageList;
  String? CourseName;
  String? CourseSpeker;
  String? CoursePrice;
  String? CourseDiscount;
  String? CourseDescription;
  String? CourseType;
  String? CourseRating;
  List<Comment_Model>? commentList;

  All_Course_Model(
      {this.id,
      this.imageList,
      this.CourseName,
      this.CourseSpeker,
      this.CoursePrice,
      this.CourseDiscount,
      this.CourseDescription,
      this.CourseType,
      this.CourseRating,
      this.commentList});
}

List<All_Course_Model> AllCourseList = [
  All_Course_Model(
      id: "1",
      imageList: [
        Image_Model(
          id: "1",
          localimg: "assets/images/fullApps/eStudy/image_1.jpg",
          image:
              "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/estuddy%2Fimage_1.jpg?alt=media&token=f360dda9-ee92-4d75-a9ca-3e9c4b25446b",
          blurUrl: "LFO:Lnnh.S4m0gx^xCEL~qNeRP%2",
        ),
        Image_Model(
          id: "2",
          localimg: "assets/images/fullApps/eStudy/image_1.jpg",
          image:
              "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/estuddy%2Fimage_1.jpg?alt=media&token=f360dda9-ee92-4d75-a9ca-3e9c4b25446b",
          blurUrl: "LFO:Lnnh.S4m0gx^xCEL~qNeRP%2",
        ),
        Image_Model(
          id: "3",
          localimg: "assets/images/fullApps/eStudy/image_1.jpg",
          image:
              "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/estuddy%2Fimage_1.jpg?alt=media&token=f360dda9-ee92-4d75-a9ca-3e9c4b25446b",
          blurUrl: "LFO:Lnnh.S4m0gx^xCEL~qNeRP%2",
        ),
        Image_Model(
          id: "4",
          localimg: "assets/images/fullApps/eStudy/image_1.jpg",
          image:
              "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/estuddy%2Fimage_1.jpg?alt=media&token=f360dda9-ee92-4d75-a9ca-3e9c4b25446b",
          blurUrl: "LFO:Lnnh.S4m0gx^xCEL~qNeRP%2",
        ),
      ],
      CourseName: "Become a Super Learner - Learn speed reading Boost Memory",
      CourseSpeker: "Rupesh Gondaliya,",
      CoursePrice: "799.00",
      CourseDiscount: "5999.00",
      CourseDescription:
          "Lorem ipsum volutpat non in dolor quisque quis, blandit ultrices vitae erat in tortor, quis eu est. Leo feugiat sodales dignissim nulla ipsum dolor sit amet, eu rutrum Leo feugiat sodales dignissim nulla sodales dignissim.",
      CourseType: "all",
      CourseRating: "5.0",
      commentList: [
        Comment_Model(
          id: "1",
          UserName: "Mic_Laus",
          CommentDate: "20th Jun, 2020",
          CommentRateing: "5.0",
          Comment:
              "Best customer service I met, the team on skype are so helpful and friendly although I asked so much but they were by my side tell issues solved, recommended to buy from them, thank you great team.",
        ),
        Comment_Model(
          id: "2",
          UserName: "Modernr",
          CommentDate: "15th Jun, 2020",
          CommentRateing: "5.0",
          Comment:
              "This is a 5 stars for all features of this great Item, and for the great team work of eStudy. Thank you.",
        ),
        Comment_Model(
          id: "3",
          UserName: "MekaYazilim",
          CommentDate: "15th Jun, 2020",
          CommentRateing: "5.0",
          Comment:
              "Really great support. I must say one of the best support on codecanyon. Friendly and helpful, they actually want to help you to setup the app successfully. Thanks, team, and great work!",
        ),
        Comment_Model(
          id: "4",
          UserName: "Madhusudhankrishnan",
          CommentDate: "15th Jun, 2020",
          CommentRateing: "5.0",
          Comment: "You People are the best in eStudy... excellent",
        ),
      ]),
  All_Course_Model(
      id: "2",
      imageList: [
        Image_Model(
          id: "1",
          localimg: "assets/images/fullApps/eStudy/image_2.jpg",
          image:
              "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/estuddy%2Fimage_2.jpg?alt=media&token=c12de1c9-1a2e-4d7b-81ba-3ad3d24703bb",
          blurUrl: "L8FO:v%1EpEA_1bHjYjbh2RR\$uxs",
        ),
        Image_Model(
          id: "2",
          localimg: "assets/images/fullApps/eStudy/image_2.jpg",
          image:
              "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/estuddy%2Fimage_2.jpg?alt=media&token=c12de1c9-1a2e-4d7b-81ba-3ad3d24703bb",
          blurUrl: "L8FO:v%1EpEA_1bHjYjbh2RR\$uxs",
        ),
        Image_Model(
          id: "3",
          localimg: "assets/images/fullApps/eStudy/image_2.jpg",
          image:
              "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/estuddy%2Fimage_2.jpg?alt=media&token=c12de1c9-1a2e-4d7b-81ba-3ad3d24703bb",
          blurUrl: "L8FO:v%1EpEA_1bHjYjbh2RR\$uxs",
        ),
        Image_Model(
          id: "4",
          localimg: "assets/images/fullApps/eStudy/image_2.jpg",
          image:
              "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/estuddy%2Fimage_2.jpg?alt=media&token=c12de1c9-1a2e-4d7b-81ba-3ad3d24703bb",
          blurUrl: "L8FO:v%1EpEA_1bHjYjbh2RR\$uxs",
        ),
      ],
      CourseName: "Guitar for Beginners - Learn Guitar from Basic to Master",
      CourseSpeker: "Rupesh Gondaliya,",
      CoursePrice: "799.00",
      CourseDiscount: "5999.00",
      CourseDescription:
          "Lorem ipsum volutpat non in dolor quisque quis, blandit ultrices vitae erat in tortor, quis eu est. Leo feugiat sodales dignissim nulla ipsum dolor sit amet, eu rutrum Leo feugiat sodales dignissim nulla sodales dignissim.",
      CourseType: "all",
      CourseRating: "5.0",
      commentList: [
        Comment_Model(
          id: "5",
          UserName: "Mic_Laus",
          CommentDate: "20th Jun, 2020",
          CommentRateing: "5.0",
          Comment:
              "Best customer service I met, the team on skype are so helpful and friendly although I asked so much but they were by my side tell issues solved, recommended to buy from them, thank you great team.",
        ),
        Comment_Model(
          id: "6",
          UserName: "Modernr",
          CommentDate: "15th Jun, 2020",
          CommentRateing: "5.0",
          Comment:
              "This is a 5 stars for all features of this great Item, and for the great team work of eStudy. Thank you.",
        ),
        Comment_Model(
          id: "7",
          UserName: "MekaYazilim",
          CommentDate: "15th Jun, 2020",
          CommentRateing: "5.0",
          Comment:
              "Really great support. I must say one of the best support on codecanyon. Friendly and helpful, they actually want to help you to setup the app successfully. Thanks, team, and great work!",
        ),
        Comment_Model(
          id: "8",
          UserName: "Madhusudhankrishnan",
          CommentDate: "15th Jun, 2020",
          CommentRateing: "5.0",
          Comment: "You People are the best in eStudy... excellent",
        ),
      ]),
  All_Course_Model(
      id: "3",
      imageList: [
        Image_Model(
          id: "1",
          localimg: "assets/images/fullApps/eStudy/image_3.jpg",
          image:
              "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/estuddy%2Fimage_3.jpg?alt=media&token=bfdd861d-d482-48b9-9aea-3909598d78e3",
          blurUrl: "L57U3b-p000L~WjY9FR.4:IU-o?b",
        ),
        Image_Model(
          id: "2",
          localimg: "assets/images/fullApps/eStudy/image_3.jpg",
          image:
              "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/estuddy%2Fimage_3.jpg?alt=media&token=bfdd861d-d482-48b9-9aea-3909598d78e3",
          blurUrl: "L57U3b-p000L~WjY9FR.4:IU-o?b",
        ),
        Image_Model(
          id: "3",
          localimg: "assets/images/fullApps/eStudy/image_3.jpg",
          image:
              "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/estuddy%2Fimage_3.jpg?alt=media&token=bfdd861d-d482-48b9-9aea-3909598d78e3",
          blurUrl: "L57U3b-p000L~WjY9FR.4:IU-o?b",
        ),
        Image_Model(
          id: "4",
          localimg: "assets/images/fullApps/eStudy/image_3.jpg",
          image:
              "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/estuddy%2Fimage_3.jpg?alt=media&token=bfdd861d-d482-48b9-9aea-3909598d78e3",
          blurUrl: "L57U3b-p000L~WjY9FR.4:IU-o?b",
        ),
      ],
      CourseName: "Complete Blender Creator - Learn 3D Ch...",
      CourseSpeker: "Vimal Gondariya",
      CoursePrice: "999.00",
      CourseDiscount: "7999.00",
      CourseDescription:
          "Lorem ipsum volutpat non in dolor quisque quis, blandit ultrices vitae erat in tortor, quis eu est. Leo feugiat sodales dignissim nulla ipsum dolor sit amet, eu rutrum Leo feugiat sodales dignissim nulla sodales dignissim.",
      CourseType: "all",
      CourseRating: "5.0",
      commentList: [
        Comment_Model(
          id: "9",
          UserName: "Mic_Laus",
          CommentDate: "20th Jun, 2020",
          CommentRateing: "5.0",
          Comment:
              "Best customer service I met, the team on skype are so helpful and friendly although I asked so much but they were by my side tell issues solved, recommended to buy from them, thank you great team.",
        ),
        Comment_Model(
          id: "10",
          UserName: "Modernr",
          CommentDate: "15th Jun, 2020",
          CommentRateing: "5.0",
          Comment:
              "This is a 5 stars for all features of this great Item, and for the great team work of eStudy. Thank you.",
        ),
        Comment_Model(
          id: "11",
          UserName: "MekaYazilim",
          CommentDate: "15th Jun, 2020",
          CommentRateing: "5.0",
          Comment:
              "Really great support. I must say one of the best support on codecanyon. Friendly and helpful, they actually want to help you to setup the app successfully. Thanks, team, and great work!",
        ),
        Comment_Model(
          id: "12",
          UserName: "Madhusudhankrishnan",
          CommentDate: "15th Jun, 2020",
          CommentRateing: "5.0",
          Comment: "You People are the best in eStudy... excellent",
        ),
      ]),
  All_Course_Model(
      id: "4",
      imageList: [
        Image_Model(
          id: "1",
          localimg: "assets/images/fullApps/eStudy/image_4.jpg",
          image:
              "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/estuddy%2Fimage_4.jpg?alt=media&token=74806aa5-60cc-4232-b170-144c707b99ed",
          blurUrl: "LD8q]SbH8wadW9j]ROjY8wWB.Toz",
        ),
        Image_Model(
          id: "2",
          localimg: "assets/images/fullApps/eStudy/image_4.jpg",
          image:
              "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/estuddy%2Fimage_4.jpg?alt=media&token=74806aa5-60cc-4232-b170-144c707b99ed",
          blurUrl: "LD8q]SbH8wadW9j]ROjY8wWB.Toz",
        ),
        Image_Model(
          id: "3",
          localimg: "assets/images/fullApps/eStudy/image_4.jpg",
          image:
              "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/estuddy%2Fimage_4.jpg?alt=media&token=74806aa5-60cc-4232-b170-144c707b99ed",
          blurUrl: "LD8q]SbH8wadW9j]ROjY8wWB.Toz",
        ),
        Image_Model(
          id: "4",
          localimg: "assets/images/fullApps/eStudy/image_4.jpg",
          image:
              "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/estuddy%2Fimage_4.jpg?alt=media&token=74806aa5-60cc-4232-b170-144c707b99ed",
          blurUrl: "LD8q]SbH8wadW9j]ROjY8wWB.Toz",
        ),
      ],
      CourseName: "Dart and Flutter : The Complete Course",
      CourseSpeker: "Mahenk Vyas",
      CoursePrice: "499.00",
      CourseDiscount: "5000.00",
      CourseDescription:
          "Lorem ipsum volutpat non in dolor quisque quis, blandit ultrices vitae erat in tortor, quis eu est. Leo feugiat sodales dignissim nulla ipsum dolor sit amet, eu rutrum Leo feugiat sodales dignissim nulla sodales dignissim.",
      CourseType: "all",
      CourseRating: "5.0",
      commentList: [
        Comment_Model(
          id: "13",
          UserName: "Mic_Laus",
          CommentDate: "20th Jun, 2020",
          CommentRateing: "5.0",
          Comment:
              "Best customer service I met, the team on skype are so helpful and friendly although I asked so much but they were by my side tell issues solved, recommended to buy from them, thank you great team.",
        ),
        Comment_Model(
          id: "14",
          UserName: "Modernr",
          CommentDate: "15th Jun, 2020",
          CommentRateing: "5.0",
          Comment:
              "This is a 5 stars for all features of this great Item, and for the great team work of eStudy. Thank you.",
        ),
        Comment_Model(
          id: "15",
          UserName: "MekaYazilim",
          CommentDate: "15th Jun, 2020",
          CommentRateing: "5.0",
          Comment:
              "Really great support. I must say one of the best support on codecanyon. Friendly and helpful, they actually want to help you to setup the app successfully. Thanks, team, and great work!",
        ),
        Comment_Model(
          id: "16",
          UserName: "Madhusudhankrishnan",
          CommentDate: "15th Jun, 2020",
          CommentRateing: "5.0",
          Comment: "You People are the best in eStudy... excellent",
        ),
      ]),
  All_Course_Model(
      id: "5",
      imageList: [
        Image_Model(
          id: "1",
          localimg: "assets/images/fullApps/eStudy/image_5.jpg",
          image:
              "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/estuddy%2Fimage_5.jpg?alt=media&token=7292b0db-63c5-4da7-b02b-160c8300ee52",
          blurUrl: "LLH__ZXk00n\$_NR*Myt800RQ-=W=",
        ),
        Image_Model(
          id: "2",
          localimg: "assets/images/fullApps/eStudy/image_5.jpg",
          image:
              "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/estuddy%2Fimage_5.jpg?alt=media&token=7292b0db-63c5-4da7-b02b-160c8300ee52",
          blurUrl: "LLH__ZXk00n\$_NR*Myt800RQ-=W=",
        ),
        Image_Model(
          id: "3",
          localimg: "assets/images/fullApps/eStudy/image_5.jpg",
          image:
              "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/estuddy%2Fimage_5.jpg?alt=media&token=7292b0db-63c5-4da7-b02b-160c8300ee52",
          blurUrl: "LLH__ZXk00n\$_NR*Myt800RQ-=W=",
        ),
        Image_Model(
          id: "4",
          localimg: "assets/images/fullApps/eStudy/image_5.jpg",
          image:
              "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/estuddy%2Fimage_5.jpg?alt=media&token=7292b0db-63c5-4da7-b02b-160c8300ee52",
          blurUrl: "LLH__ZXk00n\$_NR*Myt800RQ-=W=",
        ),
      ],
      CourseName: "Ultimate Web Develope Course for 2021",
      CourseSpeker: "Sumit Mayani",
      CoursePrice: "799.00",
      CourseDiscount: "2599.00",
      CourseDescription:
          "Lorem ipsum volutpat non in dolor quisque quis, blandit ultrices vitae erat in tortor, quis eu est. Leo feugiat sodales dignissim nulla ipsum dolor sit amet, eu rutrum Leo feugiat sodales dignissim nulla sodales dignissim.",
      CourseType: "all",
      CourseRating: "5.0",
      commentList: [
        Comment_Model(
          id: "17",
          UserName: "Mic_Laus",
          CommentDate: "20th Jun, 2020",
          CommentRateing: "5.0",
          Comment:
              "Best customer service I met, the team on skype are so helpful and friendly although I asked so much but they were by my side tell issues solved, recommended to buy from them, thank you great team.",
        ),
        Comment_Model(
          id: "18",
          UserName: "Modernr",
          CommentDate: "15th Jun, 2020",
          CommentRateing: "5.0",
          Comment:
              "This is a 5 stars for all features of this great Item, and for the great team work of eStudy. Thank you.",
        ),
        Comment_Model(
          id: "19",
          UserName: "MekaYazilim",
          CommentDate: "15th Jun, 2020",
          CommentRateing: "5.0",
          Comment:
              "Really great support. I must say one of the best support on codecanyon. Friendly and helpful, they actually want to help you to setup the app successfully. Thanks, team, and great work!",
        ),
        Comment_Model(
          id: "20",
          UserName: "Madhusudhankrishnan",
          CommentDate: "15th Jun, 2020",
          CommentRateing: "5.0",
          Comment: "You People are the best in eStudy... excellent",
        ),
      ]),
  All_Course_Model(
      id: "6",
      imageList: [
        Image_Model(
          id: "1",
          localimg: "assets/images/fullApps/eStudy/image_6.jpg",
          image:
              "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/estuddy%2Fimage_6.jpg?alt=media&token=8e47f5c8-9f68-4c08-b7eb-5c1cdda5c397",
          blurUrl: "LFMat*9DM_IoNaxtxCNG~VR-Rjax",
        ),
        Image_Model(
          id: "2",
          localimg: "assets/images/fullApps/eStudy/image_6.jpg",
          image:
              "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/estuddy%2Fimage_6.jpg?alt=media&token=8e47f5c8-9f68-4c08-b7eb-5c1cdda5c397",
          blurUrl: "LFMat*9DM_IoNaxtxCNG~VR-Rjax",
        ),
        Image_Model(
          id: "3",
          localimg: "assets/images/fullApps/eStudy/image_6.jpg",
          image:
              "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/estuddy%2Fimage_6.jpg?alt=media&token=8e47f5c8-9f68-4c08-b7eb-5c1cdda5c397",
          blurUrl: "LFMat*9DM_IoNaxtxCNG~VR-Rjax",
        ),
        Image_Model(
          id: "4",
          localimg: "assets/images/fullApps/eStudy/image_6.jpg",
          image:
              "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/estuddy%2Fimage_6.jpg?alt=media&token=8e47f5c8-9f68-4c08-b7eb-5c1cdda5c397",
          blurUrl: "LFMat*9DM_IoNaxtxCNG~VR-Rjax",
        ),
      ],
      CourseName: "Web Programming Masterclass",
      CourseSpeker: "Rupesh Gondaliya",
      CoursePrice: "2599.00",
      CourseDiscount: "1000.00",
      CourseDescription:
          "Lorem ipsum volutpat non in dolor quisque quis, blandit ultrices vitae erat in tortor, quis eu est. Leo feugiat sodales dignissim nulla ipsum dolor sit amet, eu rutrum Leo feugiat sodales dignissim nulla sodales dignissim.",
      CourseType: "all",
      CourseRating: "5.0",
      commentList: [
        Comment_Model(
          id: "21",
          UserName: "Mic_Laus",
          CommentDate: "20th Jun, 2020",
          CommentRateing: "5.0",
          Comment:
              "Best customer service I met, the team on skype are so helpful and friendly although I asked so much but they were by my side tell issues solved, recommended to buy from them, thank you great team.",
        ),
        Comment_Model(
          id: "22",
          UserName: "Modernr",
          CommentDate: "15th Jun, 2020",
          CommentRateing: "5.0",
          Comment:
              "This is a 5 stars for all features of this great Item, and for the great team work of eStudy. Thank you.",
        ),
        Comment_Model(
          id: "23",
          UserName: "MekaYazilim",
          CommentDate: "15th Jun, 2020",
          CommentRateing: "5.0",
          Comment:
              "Really great support. I must say one of the best support on codecanyon. Friendly and helpful, they actually want to help you to setup the app successfully. Thanks, team, and great work!",
        ),
        Comment_Model(
          id: "24",
          UserName: "Madhusudhankrishnan",
          CommentDate: "15th Jun, 2020",
          CommentRateing: "5.0",
          Comment: "You People are the best in eStudy... excellent",
        ),
      ]),
  All_Course_Model(
      id: "7",
      imageList: [
        Image_Model(
          id: "1",
          localimg: "assets/images/fullApps/eStudy/image_7.jpg",
          image:
              "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/estuddy%2Fimage_7.jpg?alt=media&token=c8e91f4b-195d-40e0-8099-e0e37014b4b5",
          blurUrl: "LLO]C_1v+G{zicaJo}kq:Q-VSzEf",
        ),
        Image_Model(
          id: "2",
          localimg: "assets/images/fullApps/eStudy/image_7.jpg",
          image:
              "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/estuddy%2Fimage_7.jpg?alt=media&token=c8e91f4b-195d-40e0-8099-e0e37014b4b5",
          blurUrl: "LLO]C_1v+G{zicaJo}kq:Q-VSzEf",
        ),
        Image_Model(
          id: "3",
          localimg: "assets/images/fullApps/eStudy/image_7.jpg",
          image:
              "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/estuddy%2Fimage_7.jpg?alt=media&token=c8e91f4b-195d-40e0-8099-e0e37014b4b5",
          blurUrl: "LLO]C_1v+G{zicaJo}kq:Q-VSzEf",
        ),
        Image_Model(
          id: "4",
          localimg: "assets/images/fullApps/eStudy/image_7.jpg",
          image:
              "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/estuddy%2Fimage_7.jpg?alt=media&token=c8e91f4b-195d-40e0-8099-e0e37014b4b5",
          blurUrl: "LLO]C_1v+G{zicaJo}kq:Q-VSzEf",
        ),
      ],
      CourseName: "Digital Marketing Course 12 Courses in 1",
      CourseSpeker: "Vimal Gondariya",
      CoursePrice: "999.00",
      CourseDiscount: "7999.00",
      CourseDescription:
          "Lorem ipsum volutpat non in dolor quisque quis, blandit ultrices vitae erat in tortor, quis eu est. Leo feugiat sodales dignissim nulla ipsum dolor sit amet, eu rutrum Leo feugiat sodales dignissim nulla sodales dignissim.",
      CourseType: "all",
      CourseRating: "5.0",
      commentList: [
        Comment_Model(
          id: "25",
          UserName: "Mic_Laus",
          CommentDate: "20th Jun, 2020",
          CommentRateing: "5.0",
          Comment:
              "Best customer service I met, the team on skype are so helpful and friendly although I asked so much but they were by my side tell issues solved, recommended to buy from them, thank you great team.",
        ),
        Comment_Model(
          id: "26",
          UserName: "Modernr",
          CommentDate: "15th Jun, 2020",
          CommentRateing: "5.0",
          Comment:
              "This is a 5 stars for all features of this great Item, and for the great team work of eStudy. Thank you.",
        ),
        Comment_Model(
          id: "27",
          UserName: "MekaYazilim",
          CommentDate: "15th Jun, 2020",
          CommentRateing: "5.0",
          Comment:
              "Really great support. I must say one of the best support on codecanyon. Friendly and helpful, they actually want to help you to setup the app successfully. Thanks, team, and great work!",
        ),
        Comment_Model(
          id: "28",
          UserName: "Madhusudhankrishnan",
          CommentDate: "15th Jun, 2020",
          CommentRateing: "5.0",
          Comment: "You People are the best in eStudy... excellent",
        ),
      ]),
  All_Course_Model(
      id: "8",
      imageList: [
        Image_Model(
          id: "1",
          localimg: "assets/images/fullApps/eStudy/image_8.jpg",
          image:
              "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/estuddy%2Fimage_8.jpg?alt=media&token=d3c7e5e4-46a0-463a-ac75-4443ecca3755",
          blurUrl: "L58hLW0000=Z5RM_-T#.00~CuO5r",
        ),
        Image_Model(
          id: "2",
          localimg: "assets/images/fullApps/eStudy/image_8.jpg",
          image:
              "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/estuddy%2Fimage_8.jpg?alt=media&token=d3c7e5e4-46a0-463a-ac75-4443ecca3755",
          blurUrl: "L58hLW0000=Z5RM_-T#.00~CuO5r",
        ),
        Image_Model(
          id: "3",
          localimg: "assets/images/fullApps/eStudy/image_8.jpg",
          image:
              "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/estuddy%2Fimage_8.jpg?alt=media&token=d3c7e5e4-46a0-463a-ac75-4443ecca3755",
          blurUrl: "L58hLW0000=Z5RM_-T#.00~CuO5r",
        ),
        Image_Model(
          id: "4",
          localimg: "assets/images/fullApps/eStudy/image_8.jpg",
          image:
              "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/estuddy%2Fimage_8.jpg?alt=media&token=d3c7e5e4-46a0-463a-ac75-4443ecca3755",
          blurUrl: "L58hLW0000=Z5RM_-T#.00~CuO5r",
        ),
      ],
      CourseName: "Social Media Marketing Masterclass",
      CourseSpeker: "Mahenk Vyas",
      CoursePrice: "499.00",
      CourseDiscount: "5000.00",
      CourseDescription:
          "Lorem ipsum volutpat non in dolor quisque quis, blandit ultrices vitae erat in tortor, quis eu est. Leo feugiat sodales dignissim nulla ipsum dolor sit amet, eu rutrum Leo feugiat sodales dignissim nulla sodales dignissim.",
      CourseType: "all",
      CourseRating: "5.0",
      commentList: [
        Comment_Model(
          id: "29",
          UserName: "Mic_Laus",
          CommentDate: "20th Jun, 2020",
          CommentRateing: "5.0",
          Comment:
              "Best customer service I met, the team on skype are so helpful and friendly although I asked so much but they were by my side tell issues solved, recommended to buy from them, thank you great team.",
        ),
        Comment_Model(
          id: "30",
          UserName: "Modernr",
          CommentDate: "15th Jun, 2020",
          CommentRateing: "5.0",
          Comment:
              "This is a 5 stars for all features of this great Item, and for the great team work of eStudy. Thank you.",
        ),
        Comment_Model(
          id: "31",
          UserName: "MekaYazilim",
          CommentDate: "15th Jun, 2020",
          CommentRateing: "5.0",
          Comment:
              "Really great support. I must say one of the best support on codecanyon. Friendly and helpful, they actually want to help you to setup the app successfully. Thanks, team, and great work!",
        ),
        Comment_Model(
          id: "32",
          UserName: "Madhusudhankrishnan",
          CommentDate: "15th Jun, 2020",
          CommentRateing: "5.0",
          Comment: "You People are the best in eStudy... excellent",
        ),
      ]),
  All_Course_Model(
      id: "9",
      imageList: [
        Image_Model(
          id: "1",
          localimg: "assets/images/fullApps/eStudy/image_9.jpg",
          image:
              "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/estuddy%2Fimage_9.jpg?alt=media&token=fa6b0d1b-6318-4bf1-8567-b13b79206cb1",
          blurUrl: "LCE.FjrM5#-:PXTuf}Wu9^E*t*\$m",
        ),
        Image_Model(
          id: "2",
          localimg: "assets/images/fullApps/eStudy/image_9.jpg",
          image:
              "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/estuddy%2Fimage_9.jpg?alt=media&token=fa6b0d1b-6318-4bf1-8567-b13b79206cb1",
          blurUrl: "LCE.FjrM5#-:PXTuf}Wu9^E*t*\$m",
        ),
        Image_Model(
          id: "3",
          localimg: "assets/images/fullApps/eStudy/image_9.jpg",
          image:
              "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/estuddy%2Fimage_9.jpg?alt=media&token=fa6b0d1b-6318-4bf1-8567-b13b79206cb1",
          blurUrl: "LCE.FjrM5#-:PXTuf}Wu9^E*t*\$m",
        ),
        Image_Model(
          id: "4",
          localimg: "assets/images/fullApps/eStudy/image_9.jpg",
          image:
              "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/estuddy%2Fimage_9.jpg?alt=media&token=fa6b0d1b-6318-4bf1-8567-b13b79206cb1",
          blurUrl: "LCE.FjrM5#-:PXTuf}Wu9^E*t*\$m",
        ),
      ],
      CourseName: "Advanced Social Media Certification Training Course",
      CourseSpeker: "Mahenk Vyas",
      CoursePrice: "499.00",
      CourseDiscount: "5000.00",
      CourseDescription:
          "Lorem ipsum volutpat non in dolor quisque quis, blandit ultrices vitae erat in tortor, quis eu est. Leo feugiat sodales dignissim nulla ipsum dolor sit amet, eu rutrum Leo feugiat sodales dignissim nulla sodales dignissim.",
      CourseType: "all",
      CourseRating: "5.0",
      commentList: [
        Comment_Model(
          id: "33",
          UserName: "Mic_Laus",
          CommentDate: "20th Jun, 2020",
          CommentRateing: "5.0",
          Comment:
              "Best customer service I met, the team on skype are so helpful and friendly although I asked so much but they were by my side tell issues solved, recommended to buy from them, thank you great team.",
        ),
        Comment_Model(
          id: "34",
          UserName: "Modernr",
          CommentDate: "15th Jun, 2020",
          CommentRateing: "5.0",
          Comment:
              "This is a 5 stars for all features of this great Item, and for the great team work of eStudy. Thank you.",
        ),
        Comment_Model(
          id: "35",
          UserName: "MekaYazilim",
          CommentDate: "15th Jun, 2020",
          CommentRateing: "5.0",
          Comment:
              "Really great support. I must say one of the best support on codecanyon. Friendly and helpful, they actually want to help you to setup the app successfully. Thanks, team, and great work!",
        ),
        Comment_Model(
          id: "36",
          UserName: "Madhusudhankrishnan",
          CommentDate: "15th Jun, 2020",
          CommentRateing: "5.0",
          Comment: "You People are the best in eStudy... excellent",
        ),
      ]),
  All_Course_Model(
      id: "10",
      imageList: [
        Image_Model(
          id: "1",
          localimg: "assets/images/fullApps/eStudy/image_10.jpg",
          image:
              "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/estuddy%2Fimage_10.jpg?alt=media&token=24e6fbc0-8a05-46c7-95eb-3e653f45f7df",
          blurUrl: "LJO46jM{0Jxu.mt7DiRjD%ayZ%WB",
        ),
        Image_Model(
          id: "2",
          localimg: "assets/images/fullApps/eStudy/image_10.jpg",
          image:
              "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/estuddy%2Fimage_10.jpg?alt=media&token=24e6fbc0-8a05-46c7-95eb-3e653f45f7df",
          blurUrl: "LJO46jM{0Jxu.mt7DiRjD%ayZ%WB",
        ),
        Image_Model(
          id: "3",
          localimg: "assets/images/fullApps/eStudy/image_10.jpg",
          image:
              "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/estuddy%2Fimage_10.jpg?alt=media&token=24e6fbc0-8a05-46c7-95eb-3e653f45f7df",
          blurUrl: "LJO46jM{0Jxu.mt7DiRjD%ayZ%WB",
        ),
        Image_Model(
          id: "4",
          localimg: "assets/images/fullApps/eStudy/image_10.jpg",
          image:
              "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/estuddy%2Fimage_10.jpg?alt=media&token=24e6fbc0-8a05-46c7-95eb-3e653f45f7df",
          blurUrl: "LJO46jM{0Jxu.mt7DiRjD%ayZ%WB",
        ),
      ],
      CourseName: "Introduction into Facebook Marketing & Facebook Advertising",
      CourseSpeker: "Vimal Gondariya",
      CoursePrice: "999.00",
      CourseDiscount: "7999.00",
      CourseDescription:
          "Lorem ipsum volutpat non in dolor quisque quis, blandit ultrices vitae erat in tortor, quis eu est. Leo feugiat sodales dignissim nulla ipsum dolor sit amet, eu rutrum Leo feugiat sodales dignissim nulla sodales dignissim.",
      CourseType: "all",
      CourseRating: "5.0",
      commentList: [
        Comment_Model(
          id: "37",
          UserName: "Mic_Laus",
          CommentDate: "20th Jun, 2020",
          CommentRateing: "5.0",
          Comment:
              "Best customer service I met, the team on skype are so helpful and friendly although I asked so much but they were by my side tell issues solved, recommended to buy from them, thank you great team.",
        ),
        Comment_Model(
          id: "38",
          UserName: "Modernr",
          CommentDate: "15th Jun, 2020",
          CommentRateing: "5.0",
          Comment:
              "This is a 5 stars for all features of this great Item, and for the great team work of eStudy. Thank you.",
        ),
        Comment_Model(
          id: "39",
          UserName: "MekaYazilim",
          CommentDate: "15th Jun, 2020",
          CommentRateing: "5.0",
          Comment:
              "Really great support. I must say one of the best support on codecanyon. Friendly and helpful, they actually want to help you to setup the app successfully. Thanks, team, and great work!",
        ),
        Comment_Model(
          id: "40",
          UserName: "Madhusudhankrishnan",
          CommentDate: "15th Jun, 2020",
          CommentRateing: "5.0",
          Comment: "You People are the best in eStudy... excellent",
        ),
      ]),
];
