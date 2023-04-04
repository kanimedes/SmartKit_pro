import 'package:smartkit_pro/ui/fullApps/eStudy/Model/Comment_Model.dart';
import 'package:smartkit_pro/ui/fullApps/eStudy/Model/Image_Model.dart';

class My_Course_Model {
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

  My_Course_Model(
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

List<My_Course_Model> MyCourseList = [
  My_Course_Model(
      id: "1",
      imageList: [
        Image_Model(
          id: "1",
          localimg: "assets/images/fullApps/eStudy/course_1.jpg",
          image:
              "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/estuddy%2Fcourse_1.jpg?alt=media&token=8f827196-301e-4e70-b097-d01cd284b071",
          blurUrl: "L22%5,kC8wWBW?j[ROae8way.TkC",
        ),
        Image_Model(
          id: "2",
          localimg: "assets/images/fullApps/eStudy/course_1.jpg",
          image:
              "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/estuddy%2Fcourse_1.jpg?alt=media&token=8f827196-301e-4e70-b097-d01cd284b071",
          blurUrl: "L22%5,kC8wWBW?j[ROae8way.TkC",
        ),
        Image_Model(
          id: "3",
          localimg: "assets/images/fullApps/eStudy/course_1.jpg",
          image:
              "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/estuddy%2Fcourse_1.jpg?alt=media&token=8f827196-301e-4e70-b097-d01cd284b071",
          blurUrl: "L22%5,kC8wWBW?j[ROae8way.TkC",
        ),
        Image_Model(
          id: "4",
          localimg: "assets/images/fullApps/eStudy/course_1.jpg",
          image:
              "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/estuddy%2Fcourse_1.jpg?alt=media&token=8f827196-301e-4e70-b097-d01cd284b071",
          blurUrl: "L22%5,kC8wWBW?j[ROae8way.TkC",
        ),
      ],
      CourseName: "Design with adobe illustrator cc 2021 - MasterClass",
      CourseSpeker: "Rupesh Gondaliya",
      CoursePrice: "899.00",
      CourseDiscount: "8999.00",
      CourseDescription:
          "Lorem ipsum volutpat non in dolor quisque quis, blandit ultrices vitae erat in tortor, quis eu est. Leo feugiat sodales dignissim nulla ipsum dolor sit amet, eu rutrum Leo feugiat sodales dignissim nulla sodales dignissim.",
      CourseType: "mycourse",
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
  My_Course_Model(
      id: "2",
      imageList: [
        Image_Model(
          id: "1",
          localimg: "assets/images/fullApps/eStudy/course_2.jpg",
          image:
              "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/estuddy%2Fcourse_2.jpg?alt=media&token=7664d3ab-16ce-4162-a125-59785e6e1668",
          blurUrl: "L35z@Jj]0JayjwfQNFay0Jay^-j[",
        ),
        Image_Model(
          id: "2",
          localimg: "assets/images/fullApps/eStudy/course_2.jpg",
          image:
              "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/estuddy%2Fcourse_2.jpg?alt=media&token=7664d3ab-16ce-4162-a125-59785e6e1668",
          blurUrl: "L35z@Jj]0JayjwfQNFay0Jay^-j[",
        ),
        Image_Model(
          id: "3",
          localimg: "assets/images/fullApps/eStudy/course_2.jpg",
          image:
              "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/estuddy%2Fcourse_2.jpg?alt=media&token=7664d3ab-16ce-4162-a125-59785e6e1668",
          blurUrl: "L35z@Jj]0JayjwfQNFay0Jay^-j[",
        ),
        Image_Model(
          id: "4",
          localimg: "assets/images/fullApps/eStudy/course_2.jpg",
          image:
              "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/estuddy%2Fcourse_2.jpg?alt=media&token=7664d3ab-16ce-4162-a125-59785e6e1668",
          blurUrl: "L35z@Jj]0JayjwfQNFay0Jay^-j[",
        ),
      ],
      CourseName: "Learn Autodesk Maya 2021 with Experts",
      CourseSpeker: "Vimal Gondariya",
      CoursePrice: "899.00",
      CourseDiscount: "999.00",
      CourseDescription:
          "Lorem ipsum volutpat non in dolor quisque quis, blandit ultrices vitae erat in tortor, quis eu est. Leo feugiat sodales dignissim nulla ipsum dolor sit amet, eu rutrum Leo feugiat sodales dignissim nulla sodales dignissim.",
      CourseType: "mycourse",
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
  My_Course_Model(
      id: "3",
      imageList: [
        Image_Model(
          id: "1",
          localimg: "assets/images/fullApps/eStudy/course_3.jpg",
          image:
              "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/estuddy%2Fcourse_3.jpg?alt=media&token=50859c76-e940-49cb-ac0f-c4379c9c368d",
          blurUrl: "L36H7^of0JWBaifQM_ay0Jay^,of",
        ),
        Image_Model(
          id: "2",
          localimg: "assets/images/fullApps/eStudy/course_3.jpg",
          image:
              "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/estuddy%2Fcourse_3.jpg?alt=media&token=50859c76-e940-49cb-ac0f-c4379c9c368d",
          blurUrl: "L36H7^of0JWBaifQM_ay0Jay^,of",
        ),
        Image_Model(
          id: "3",
          localimg: "assets/images/fullApps/eStudy/course_3.jpg",
          image:
              "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/estuddy%2Fcourse_3.jpg?alt=media&token=50859c76-e940-49cb-ac0f-c4379c9c368d",
          blurUrl: "L36H7^of0JWBaifQM_ay0Jay^,of",
        ),
        Image_Model(
          id: "4",
          localimg: "assets/images/fullApps/eStudy/course_3.jpg",
          image:
              "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/estuddy%2Fcourse_3.jpg?alt=media&token=50859c76-e940-49cb-ac0f-c4379c9c368d",
          blurUrl: "L36H7^of0JWBaifQM_ay0Jay^,of",
        ),
      ],
      CourseName: "Autodesk Revit - beginner to an intermediate level",
      CourseSpeker: "Mahenk Vyas",
      CoursePrice: "395.00",
      CourseDiscount: "999.00",
      CourseDescription:
          "Lorem ipsum volutpat non in dolor quisque quis, blandit ultrices vitae erat in tortor, quis eu est. Leo feugiat sodales dignissim nulla ipsum dolor sit amet, eu rutrum Leo feugiat sodales dignissim nulla sodales dignissim.",
      CourseType: "mycourse",
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
  My_Course_Model(
      id: "4",
      imageList: [
        Image_Model(
          id: "1",
          localimg: "assets/images/fullApps/eStudy/course_4.jpg",
          image:
              "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/estuddy%2Fcourse_4.jpg?alt=media&token=7f3b2712-62e8-4539-b741-eab1f0f5d6e1",
          blurUrl: "L25|+^og0JRjn-ayInWU0JWB~Eog",
        ),
        Image_Model(
          id: "2",
          localimg: "assets/images/fullApps/eStudy/course_4.jpg",
          image:
              "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/estuddy%2Fcourse_4.jpg?alt=media&token=7f3b2712-62e8-4539-b741-eab1f0f5d6e1",
          blurUrl: "L25|+^og0JRjn-ayInWU0JWB~Eog",
        ),
        Image_Model(
          id: "3",
          localimg: "assets/images/fullApps/eStudy/course_4.jpg",
          image:
              "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/estuddy%2Fcourse_4.jpg?alt=media&token=7f3b2712-62e8-4539-b741-eab1f0f5d6e1",
          blurUrl: "L25|+^og0JRjn-ayInWU0JWB~Eog",
        ),
        Image_Model(
          id: "4",
          localimg: "assets/images/fullApps/eStudy/course_4.jpg",
          image:
              "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/estuddy%2Fcourse_4.jpg?alt=media&token=7f3b2712-62e8-4539-b741-eab1f0f5d6e1",
          blurUrl: "L25|+^og0JRjn-ayInWU0JWB~Eog",
        ),
      ],
      CourseName: "Learn Adobe XD 2021 with Experts Masterclass",
      CourseSpeker: "Vimal Gondariya",
      CoursePrice: "659.00",
      CourseDiscount: "6999.00",
      CourseDescription:
          "Lorem ipsum volutpat non in dolor quisque quis, blandit ultrices vitae erat in tortor, quis eu est. Leo feugiat sodales dignissim nulla ipsum dolor sit amet, eu rutrum Leo feugiat sodales dignissim nulla sodales dignissim.",
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
  My_Course_Model(
      id: "5",
      imageList: [
        Image_Model(
          id: "1",
          localimg: "assets/images/fullApps/eStudy/course_5.jpg",
          image:
              "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/estuddy%2Fcourse_5.jpg?alt=media&token=8ba93db9-4670-43d4-b693-0355beb64d59",
          blurUrl: "L26jCSoM0JR%r_j[NYay0cWU}_of",
        ),
        Image_Model(
          id: "2",
          localimg: "assets/images/fullApps/eStudy/course_5.jpg",
          image:
              "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/estuddy%2Fcourse_5.jpg?alt=media&token=8ba93db9-4670-43d4-b693-0355beb64d59",
          blurUrl: "L26jCSoM0JR%r_j[NYay0cWU}_of",
        ),
        Image_Model(
          id: "3",
          localimg: "assets/images/fullApps/eStudy/course_5.jpg",
          image:
              "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/estuddy%2Fcourse_5.jpg?alt=media&token=8ba93db9-4670-43d4-b693-0355beb64d59",
          blurUrl: "L26jCSoM0JR%r_j[NYay0cWU}_of",
        ),
        Image_Model(
          id: "4",
          localimg: "assets/images/fullApps/eStudy/course_5.jpg",
          image:
              "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/estuddy%2Fcourse_5.jpg?alt=media&token=8ba93db9-4670-43d4-b693-0355beb64d59",
          blurUrl: "L26jCSoM0JR%r_j[NYay0cWU}_of",
        ),
      ],
      CourseName: "Learn Adobe InCopy 2021 with Experts Masterclass",
      CourseSpeker: "Vimal Gondariya",
      CoursePrice: "659.00",
      CourseDiscount: "6999.00",
      CourseDescription:
          "Lorem ipsum volutpat non in dolor quisque quis, blandit ultrices vitae erat in tortor, quis eu est. Leo feugiat sodales dignissim nulla ipsum dolor sit amet, eu rutrum Leo feugiat sodales dignissim nulla sodales dignissim.",
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
