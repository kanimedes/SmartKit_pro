import 'package:smartkit_pro/ui/fullApps/eStudy/Model/Comment_Model.dart';
import 'package:smartkit_pro/ui/fullApps/eStudy/Model/Image_Model.dart';

class Saved_Course_Model {
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

  Saved_Course_Model(
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

List<Saved_Course_Model> SavedCourseList = [
  Saved_Course_Model(
      id: "1",
      imageList: [
        Image_Model(
          id: "1",
          localimg: "assets/images/fullApps/eStudy/course_6.jpg",
          image:
              "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/estuddy%2Fcourse_6.jpg?alt=media&token=daf0337c-4642-4439-8c16-702fe3a7faee",
          blurUrl: "L370Gpja0cj[xHayNYj[0dj[}^ay",
        ),
        Image_Model(
          id: "2",
          localimg: "assets/images/fullApps/eStudy/course_6.jpg",
          image:
              "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/estuddy%2Fcourse_6.jpg?alt=media&token=daf0337c-4642-4439-8c16-702fe3a7faee",
          blurUrl: "L370Gpja0cj[xHayNYj[0dj[}^ay",
        ),
        Image_Model(
          id: "3",
          localimg: "assets/images/fullApps/eStudy/course_6.jpg",
          image:
              "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/estuddy%2Fcourse_6.jpg?alt=media&token=daf0337c-4642-4439-8c16-702fe3a7faee",
          blurUrl: "L370Gpja0cj[xHayNYj[0dj[}^ay",
        ),
        Image_Model(
          id: "4",
          localimg: "assets/images/fullApps/eStudy/course_6.jpg",
          image:
              "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/estuddy%2Fcourse_6.jpg?alt=media&token=daf0337c-4642-4439-8c16-702fe3a7faee",
          blurUrl: "L370Gpja0cj[xHayNYj[0dj[}^ay",
        ),
      ],
      CourseName: "Adobe XD cc 2021 - MasterClass",
      CourseSpeker: "Mahenk Vyas",
      CoursePrice: "999.00",
      CourseDiscount: "7999.00",
      CourseDescription:
          "Lorem ipsum volutpat non in dolor quisque quis, blandit ultrices vitae erat in tortor, quis eu est. Leo feugiat sodales dignissim nulla ipsum dolor sit amet, eu rutrum Leo feugiat sodales dignissim nulla sodales dignissim.",
      CourseType: "save",
      CourseRating: "4.7",
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
  Saved_Course_Model(
      id: "2",
      imageList: [
        Image_Model(
          id: "1",
          localimg: "assets/images/fullApps/eStudy/course_7.jpg",
          image:
              "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/estuddy%2Fcourse_7.jpg?alt=media&token=394e173a-aa28-43c9-96a3-6a67f3eb68af",
          blurUrl: "L267AsoL0LWBw{j[Naay0fay}[of",
        ),
        Image_Model(
          id: "2",
          localimg: "assets/images/fullApps/eStudy/course_7.jpg",
          image:
              "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/estuddy%2Fcourse_7.jpg?alt=media&token=394e173a-aa28-43c9-96a3-6a67f3eb68af",
          blurUrl: "L267AsoL0LWBw{j[Naay0fay}[of",
        ),
        Image_Model(
          id: "3",
          localimg: "assets/images/fullApps/eStudy/course_7.jpg",
          image:
              "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/estuddy%2Fcourse_7.jpg?alt=media&token=394e173a-aa28-43c9-96a3-6a67f3eb68af",
          blurUrl: "L267AsoL0LWBw{j[Naay0fay}[of",
        ),
        Image_Model(
          id: "4",
          localimg: "assets/images/fullApps/eStudy/course_7.jpg",
          image:
              "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/estuddy%2Fcourse_7.jpg?alt=media&token=394e173a-aa28-43c9-96a3-6a67f3eb68af",
          blurUrl: "L267AsoL0LWBw{j[Naay0fay}[of",
        ),
      ],
      CourseName: "Adobe Flash cc 2021 - MasterClass",
      CourseSpeker: "Sumit Mayani",
      CoursePrice: "999.00",
      CourseDiscount: "7999.00",
      CourseDescription:
          "Lorem ipsum volutpat non in dolor quisque quis, blandit ultrices vitae erat in tortor, quis eu est. Leo feugiat sodales dignissim nulla ipsum dolor sit amet, eu rutrum Leo feugiat sodales dignissim nulla sodales dignissim.",
      CourseType: "save",
      CourseRating: "4.7",
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
  Saved_Course_Model(
      id: "3",
      imageList: [
        Image_Model(
          id: "1",
          localimg: "assets/images/fullApps/eStudy/course_8.jpg",
          image:
              "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/estuddy%2Fcourse_8.jpg?alt=media&token=70d02a60-d12e-4bc8-ac8a-6a377a20e2d2",
          blurUrl: "L26Qn?oL02ayr?f7NHay0Lay~Bj[",
        ),
        Image_Model(
          id: "2",
          localimg: "assets/images/fullApps/eStudy/course_8.jpg",
          image:
              "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/estuddy%2Fcourse_8.jpg?alt=media&token=70d02a60-d12e-4bc8-ac8a-6a377a20e2d2",
          blurUrl: "L26Qn?oL02ayr?f7NHay0Lay~Bj[",
        ),
        Image_Model(
          id: "3",
          localimg: "assets/images/fullApps/eStudy/course_8.jpg",
          image:
              "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/estuddy%2Fcourse_8.jpg?alt=media&token=70d02a60-d12e-4bc8-ac8a-6a377a20e2d2",
          blurUrl: "L26Qn?oL02ayr?f7NHay0Lay~Bj[",
        ),
        Image_Model(
          id: "4",
          localimg: "assets/images/fullApps/eStudy/course_8.jpg",
          image:
              "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/estuddy%2Fcourse_8.jpg?alt=media&token=70d02a60-d12e-4bc8-ac8a-6a377a20e2d2",
          blurUrl: "L26Qn?oL02ayr?f7NHay0Lay~Bj[",
        ),
      ],
      CourseName: "Adobe Illustrator cc 2021 - MasterClass",
      CourseSpeker: "Mahenk Vyas",
      CoursePrice: "999.00",
      CourseDiscount: "7999.00",
      CourseDescription:
          "Lorem ipsum volutpat non in dolor quisque quis, blandit ultrices vitae erat in tortor, quis eu est. Leo feugiat sodales dignissim nulla ipsum dolor sit amet, eu rutrum Leo feugiat sodales dignissim nulla sodales dignissim.",
      CourseType: "save",
      CourseRating: "4.7",
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
  Saved_Course_Model(
      id: "4",
      imageList: [
        Image_Model(
          id: "1",
          localimg: "assets/images/fullApps/eStudy/course_9.jpg",
          image:
              "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/estuddy%2Fcourse_9.jpg?alt=media&token=0e10750d-5e37-48cb-9420-1c05eefa0369",
          blurUrl: "L26?y0ja0Jj[r@j[NGay0cay~Djt",
        ),
        Image_Model(
          id: "2",
          localimg: "assets/images/fullApps/eStudy/course_9.jpg",
          image:
              "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/estuddy%2Fcourse_9.jpg?alt=media&token=0e10750d-5e37-48cb-9420-1c05eefa0369",
          blurUrl: "L26?y0ja0Jj[r@j[NGay0cay~Djt",
        ),
        Image_Model(
          id: "3",
          localimg: "assets/images/fullApps/eStudy/course_9.jpg",
          image:
              "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/estuddy%2Fcourse_9.jpg?alt=media&token=0e10750d-5e37-48cb-9420-1c05eefa0369",
          blurUrl: "L26?y0ja0Jj[r@j[NGay0cay~Djt",
        ),
        Image_Model(
          id: "4",
          localimg: "assets/images/fullApps/eStudy/course_9.jpg",
          image:
              "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/estuddy%2Fcourse_9.jpg?alt=media&token=0e10750d-5e37-48cb-9420-1c05eefa0369",
          blurUrl: "L26?y0ja0Jj[r@j[NGay0cay~Djt",
        ),
      ],
      CourseName: "Adobe InDesign cc 2021 - MasterClass",
      CourseSpeker: "Sumit Mayani",
      CoursePrice: "999.00",
      CourseDiscount: "7999.00",
      CourseDescription:
          "Lorem ipsum volutpat non in dolor quisque quis, blandit ultrices vitae erat in tortor, quis eu est. Leo feugiat sodales dignissim nulla ipsum dolor sit amet, eu rutrum Leo feugiat sodales dignissim nulla sodales dignissim.",
      CourseType: "save",
      CourseRating: "4.7",
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
  Saved_Course_Model(
      id: "5",
      imageList: [
        Image_Model(
          id: "1",
          localimg: "assets/images/fullApps/eStudy/course_10.jpg",
          image:
              "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/estuddy%2Fcourse_10.jpg?alt=media&token=2fb64689-4105-49c4-bb53-c60cd7ae4581",
          blurUrl: "L36QPIj[0eaysofQNGay0faz}[j@",
        ),
        Image_Model(
          id: "2",
          localimg: "assets/images/fullApps/eStudy/course_10.jpg",
          image:
              "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/estuddy%2Fcourse_10.jpg?alt=media&token=2fb64689-4105-49c4-bb53-c60cd7ae4581",
          blurUrl: "L36QPIj[0eaysofQNGay0faz}[j@",
        ),
        Image_Model(
          id: "3",
          localimg: "assets/images/fullApps/eStudy/course_10.jpg",
          image:
              "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/estuddy%2Fcourse_10.jpg?alt=media&token=2fb64689-4105-49c4-bb53-c60cd7ae4581",
          blurUrl: "L36QPIj[0eaysofQNGay0faz}[j@",
        ),
        Image_Model(
          id: "4",
          localimg: "assets/images/fullApps/eStudy/course_10.jpg",
          image:
              "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/estuddy%2Fcourse_10.jpg?alt=media&token=2fb64689-4105-49c4-bb53-c60cd7ae4581",
          blurUrl: "L36QPIj[0eaysofQNGay0faz}[j@",
        ),
      ],
      CourseName: "Adobe Animate cc 2021 - MasterClass",
      CourseSpeker: "Mahenk Vyas",
      CoursePrice: "999.00",
      CourseDiscount: "7999.00",
      CourseDescription:
          "Lorem ipsum volutpat non in dolor quisque quis, blandit ultrices vitae erat in tortor, quis eu est. Leo feugiat sodales dignissim nulla ipsum dolor sit amet, eu rutrum Leo feugiat sodales dignissim nulla sodales dignissim.",
      CourseType: "save",
      CourseRating: "4.7",
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
];
