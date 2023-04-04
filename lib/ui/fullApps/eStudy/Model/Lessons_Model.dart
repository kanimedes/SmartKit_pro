import 'package:smartkit_pro/ui/fullApps/eStudy/Model/LessonsContains_Model.dart';

class Lessons_Model {
  String? id;
  String? image;
  String? lessonsName;
  String? lessonsDate;
  String? lessonsTime;
  String? lessonsNumber;
  bool? select;
  List<LessonsContains_Model>? LessonsContaint;
  String? blurUrl;
  String? localimg;

  Lessons_Model(
      {this.id,
      this.image,
      this.lessonsName,
      this.lessonsDate,
      this.lessonsTime,
      this.lessonsNumber,
      this.LessonsContaint,
      this.localimg,
      this.blurUrl});
}

List<Lessons_Model> LessonsList = [
  Lessons_Model(
    id: "1",
    localimg: "assets/images/fullApps/eStudy/les_eco.jpg",
    image:
        "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/estuddy%2Fles_eco.jpg?alt=media&token=08e9b7c0-dda6-4473-9193-7c31e3cbdc9f",
    blurUrl: "L00dT{Sqa0jzUgm_Z~krL#pApaak",
    lessonsName: "Economics - 2",
    lessonsDate: "Mar 02, 2021",
    lessonsTime: "02:59pm",
    lessonsNumber: "5 Lessons",
    LessonsContaint: [
      LessonsContains_Model(
        id: "1",
        image: "assets/images/fullApps/eStudy/active_lesson.svg",
        lessonsContentName: "The Last Lesson.",
        lessonsContentDescription:
            "The Last Lesson is set in the days of the Franco-Prussian War (1870-1871) in which France was defeated by Prussia led by Bismarck. Prussia then consisted of what now are the nations  of Germany, Poland and parts of Austria. In this story the French districts of Alsace and Lorraine have passed into Prussian hands.",
        lessonsContanUrl:
            "https://www.sample-videos.com/video123/mp4/720/big_buck_bunny_720p_20mb.mp4",
        lessonsSubTitle: "Lorem ipsum dolor sit amet",
      ),
      LessonsContains_Model(
        id: "2",
        image: "assets/images/fullApps/eStudy/deactive_lesson.svg",
        lessonsContentName: "Lost Spring.",
        lessonsContentDescription:
            "The Last Lesson is set in the days of the Franco-Prussian War (1870-1871) in which France was defeated by Prussia led by Bismarck. Prussia then consisted of what now are the nations  of Germany, Poland and parts of Austria. In this story the French districts of Alsace and Lorraine have passed into Prussian hands.",
        lessonsContanUrl:
            "https://www.sample-videos.com/video123/mp4/720/big_buck_bunny_720p_20mb.mp4",
        lessonsSubTitle: "Lorem ipsum dolor sit amet",
      ),
      LessonsContains_Model(
        id: "3",
        image: "assets/images/fullApps/eStudy/deactive_lesson.svg",
        lessonsContentName: "Deep Water.",
        lessonsContentDescription:
            "The Last Lesson is set in the days of the Franco-Prussian War (1870-1871) in which France was defeated by Prussia led by Bismarck. Prussia then consisted of what now are the nations  of Germany, Poland and parts of Austria. In this story the French districts of Alsace and Lorraine have passed into Prussian hands.",
        lessonsContanUrl:
            "https://www.sample-videos.com/video123/mp4/720/big_buck_bunny_720p_20mb.mp4",
        lessonsSubTitle: "Lorem ipsum dolor sit amet",
      ),
      LessonsContains_Model(
        id: "4",
        image: "assets/images/fullApps/eStudy/deactive_lesson.svg",
        lessonsContentName: "The Rattrap.",
        lessonsContentDescription:
            "The Last Lesson is set in the days of the Franco-Prussian War (1870-1871) in which France was defeated by Prussia led by Bismarck. Prussia then consisted of what now are the nations  of Germany, Poland and parts of Austria. In this story the French districts of Alsace and Lorraine have passed into Prussian hands.",
        lessonsContanUrl:
            "https://www.sample-videos.com/video123/mp4/720/big_buck_bunny_720p_20mb.mp4",
        lessonsSubTitle: "Lorem ipsum dolor sit amet",
      ),
      LessonsContains_Model(
        id: "5",
        image: "assets/images/fullApps/eStudy/deactive_lesson.svg",
        lessonsContentName: "Indigo.",
        lessonsContentDescription:
            "The Last Lesson is set in the days of the Franco-Prussian War (1870-1871) in which France was defeated by Prussia led by Bismarck. Prussia then consisted of what now are the nations  of Germany, Poland and parts of Austria. In this story the French districts of Alsace and Lorraine have passed into Prussian hands.",
        lessonsContanUrl:
            "https://www.sample-videos.com/video123/mp4/720/big_buck_bunny_720p_20mb.mp4",
        lessonsSubTitle: "Lorem ipsum dolor sit amet",
      ),
      LessonsContains_Model(
        id: "6",
        image: "assets/images/fullApps/eStudy/deactive_lesson.svg",
        lessonsContentName: "Poets And Pancakes.",
        lessonsContentDescription:
            "The Last Lesson is set in the days of the Franco-Prussian War (1870-1871) in which France was defeated by Prussia led by Bismarck. Prussia then consisted of what now are the nations  of Germany, Poland and parts of Austria. In this story the French districts of Alsace and Lorraine have passed into Prussian hands.",
        lessonsContanUrl:
            "https://www.sample-videos.com/video123/mp4/720/big_buck_bunny_720p_20mb.mp4",
        lessonsSubTitle: "Lorem ipsum dolor sit amet",
      ),
      LessonsContains_Model(
        id: "7",
        image: "assets/images/fullApps/eStudy/deactive_lesson.svg",
        lessonsContentName: "The Interview.",
        lessonsContentDescription:
            "The Last Lesson is set in the days of the Franco-Prussian War (1870-1871) in which France was defeated by Prussia led by Bismarck. Prussia then consisted of what now are the nations  of Germany, Poland and parts of Austria. In this story the French districts of Alsace and Lorraine have passed into Prussian hands.",
        lessonsContanUrl:
            "https://www.sample-videos.com/video123/mp4/720/big_buck_bunny_720p_20mb.mp4",
        lessonsSubTitle: "Lorem ipsum dolor sit amet",
      )
    ],
  ),
  Lessons_Model(
    id: "2",
    localimg: "assets/images/fullApps/eStudy/les_business.jpg",
    image:
        "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/estuddy%2Fles_business.jpg?alt=media&token=7989f302-f688-4e5c-9803-24db44ddb364",
    blurUrl: "L@HVuM_NoeRjt7a|ayoLXTR*V@ae",
    lessonsName: "Business Studies",
    lessonsDate: "Mar 02, 2021",
    lessonsTime: "02:59pm",
    lessonsNumber: "10 Lessons",
    LessonsContaint: [
      LessonsContains_Model(
        id: "8",
        image: "assets/images/fullApps/eStudy/active_lesson.svg",
        lessonsContentName: "The Last Lesson.",
        lessonsContentDescription:
            "The Last Lesson is set in the days of the Franco-Prussian War (1870-1871) in which France was defeated by Prussia led by Bismarck. Prussia then consisted of what now are the nations  of Germany, Poland and parts of Austria. In this story the French districts of Alsace and Lorraine have passed into Prussian hands.",
        lessonsContanUrl:
            "https://www.sample-videos.com/video123/mp4/720/big_buck_bunny_720p_20mb.mp4",
        lessonsSubTitle: "Lorem ipsum dolor sit amet",
      ),
      LessonsContains_Model(
        id: "9",
        image: "assets/images/fullApps/eStudy/deactive_lesson.svg",
        lessonsContentName: "Lost Spring.",
        lessonsContentDescription:
            "The Last Lesson is set in the days of the Franco-Prussian War (1870-1871) in which France was defeated by Prussia led by Bismarck. Prussia then consisted of what now are the nations  of Germany, Poland and parts of Austria. In this story the French districts of Alsace and Lorraine have passed into Prussian hands.",
        lessonsContanUrl:
            "https://www.sample-videos.com/video123/mp4/720/big_buck_bunny_720p_20mb.mp4",
        lessonsSubTitle: "Lorem ipsum dolor sit amet",
      ),
      LessonsContains_Model(
        id: "10",
        image: "assets/images/fullApps/eStudy/deactive_lesson.svg",
        lessonsContentName: "Deep Water.",
        lessonsContentDescription:
            "The Last Lesson is set in the days of the Franco-Prussian War (1870-1871) in which France was defeated by Prussia led by Bismarck. Prussia then consisted of what now are the nations  of Germany, Poland and parts of Austria. In this story the French districts of Alsace and Lorraine have passed into Prussian hands.",
        lessonsContanUrl:
            "https://www.sample-videos.com/video123/mp4/720/big_buck_bunny_720p_20mb.mp4",
        lessonsSubTitle: "Lorem ipsum dolor sit amet",
      ),
      LessonsContains_Model(
        id: "11",
        image: "assets/images/fullApps/eStudy/deactive_lesson.svg",
        lessonsContentName: "The Rattrap.",
        lessonsContentDescription:
            "The Last Lesson is set in the days of the Franco-Prussian War (1870-1871) in which France was defeated by Prussia led by Bismarck. Prussia then consisted of what now are the nations  of Germany, Poland and parts of Austria. In this story the French districts of Alsace and Lorraine have passed into Prussian hands.",
        lessonsContanUrl:
            "https://www.sample-videos.com/video123/mp4/720/big_buck_bunny_720p_20mb.mp4",
        lessonsSubTitle: "Lorem ipsum dolor sit amet",
      ),
      LessonsContains_Model(
        id: "12",
        image: "assets/images/fullApps/eStudy/deactive_lesson.svg",
        lessonsContentName: "Indigo.",
        lessonsContentDescription:
            "The Last Lesson is set in the days of the Franco-Prussian War (1870-1871) in which France was defeated by Prussia led by Bismarck. Prussia then consisted of what now are the nations  of Germany, Poland and parts of Austria. In this story the French districts of Alsace and Lorraine have passed into Prussian hands.",
        lessonsContanUrl:
            "https://www.sample-videos.com/video123/mp4/720/big_buck_bunny_720p_20mb.mp4",
        lessonsSubTitle: "Lorem ipsum dolor sit amet",
      ),
      LessonsContains_Model(
        id: "13",
        image: "assets/images/fullApps/eStudy/deactive_lesson.svg",
        lessonsContentName: "Poets And Pancakes.",
        lessonsContentDescription:
            "The Last Lesson is set in the days of the Franco-Prussian War (1870-1871) in which France was defeated by Prussia led by Bismarck. Prussia then consisted of what now are the nations  of Germany, Poland and parts of Austria. In this story the French districts of Alsace and Lorraine have passed into Prussian hands.",
        lessonsContanUrl:
            "https://www.sample-videos.com/video123/mp4/720/big_buck_bunny_720p_20mb.mp4",
        lessonsSubTitle: "Lorem ipsum dolor sit amet",
      ),
      LessonsContains_Model(
        id: "14",
        image: "assets/images/fullApps/eStudy/deactive_lesson.svg",
        lessonsContentName: "The Interview.",
        lessonsContentDescription:
            "The Last Lesson is set in the days of the Franco-Prussian War (1870-1871) in which France was defeated by Prussia led by Bismarck. Prussia then consisted of what now are the nations  of Germany, Poland and parts of Austria. In this story the French districts of Alsace and Lorraine have passed into Prussian hands.",
        lessonsContanUrl:
            "https://www.sample-videos.com/video123/mp4/720/big_buck_bunny_720p_20mb.mp4",
        lessonsSubTitle: "Lorem ipsum dolor sit amet",
      )
    ],
  ),
  Lessons_Model(
    id: "3",
    localimg: "assets/images/fullApps/eStudy/les_acco.jpg",
    image:
        "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/estuddy%2Fles_acco.jpg?alt=media&token=095413be-9329-4d69-8e2d-c1a6a6bfa3c5",
    blurUrl: "LJJ8Ca9Z^+_N4T_3V?E19_?Go}e.",
    lessonsName: "Accountancy",
    lessonsDate: "Mar 02, 2021",
    lessonsTime: "02:59pm",
    lessonsNumber: "2 Lessons",
    LessonsContaint: [
      LessonsContains_Model(
        id: "15",
        image: "assets/images/fullApps/eStudy/active_lesson.svg",
        lessonsContentName: "The Last Lesson.",
        lessonsContentDescription:
            "The Last Lesson is set in the days of the Franco-Prussian War (1870-1871) in which France was defeated by Prussia led by Bismarck. Prussia then consisted of what now are the nations  of Germany, Poland and parts of Austria. In this story the French districts of Alsace and Lorraine have passed into Prussian hands.",
        lessonsContanUrl:
            "https://www.sample-videos.com/video123/mp4/720/big_buck_bunny_720p_20mb.mp4",
        lessonsSubTitle: "Lorem ipsum dolor sit amet",
      ),
      LessonsContains_Model(
        id: "16",
        image: "assets/images/fullApps/eStudy/deactive_lesson.svg",
        lessonsContentName: "Lost Spring.",
        lessonsContentDescription:
            "The Last Lesson is set in the days of the Franco-Prussian War (1870-1871) in which France was defeated by Prussia led by Bismarck. Prussia then consisted of what now are the nations  of Germany, Poland and parts of Austria. In this story the French districts of Alsace and Lorraine have passed into Prussian hands.",
        lessonsContanUrl:
            "https://www.sample-videos.com/video123/mp4/720/big_buck_bunny_720p_20mb.mp4",
        lessonsSubTitle: "Lorem ipsum dolor sit amet",
      ),
      LessonsContains_Model(
        id: "17",
        image: "assets/images/fullApps/eStudy/deactive_lesson.svg",
        lessonsContentName: "Deep Water.",
        lessonsContentDescription:
            "The Last Lesson is set in the days of the Franco-Prussian War (1870-1871) in which France was defeated by Prussia led by Bismarck. Prussia then consisted of what now are the nations  of Germany, Poland and parts of Austria. In this story the French districts of Alsace and Lorraine have passed into Prussian hands.",
        lessonsContanUrl:
            "https://www.sample-videos.com/video123/mp4/720/big_buck_bunny_720p_20mb.mp4",
        lessonsSubTitle: "Lorem ipsum dolor sit amet",
      ),
      LessonsContains_Model(
        id: "18",
        image: "assets/images/fullApps/eStudy/deactive_lesson.svg",
        lessonsContentName: "The Rattrap.",
        lessonsContentDescription:
            "The Last Lesson is set in the days of the Franco-Prussian War (1870-1871) in which France was defeated by Prussia led by Bismarck. Prussia then consisted of what now are the nations  of Germany, Poland and parts of Austria. In this story the French districts of Alsace and Lorraine have passed into Prussian hands.",
        lessonsContanUrl:
            "https://www.sample-videos.com/video123/mp4/720/big_buck_bunny_720p_20mb.mp4",
        lessonsSubTitle: "Lorem ipsum dolor sit amet",
      ),
      LessonsContains_Model(
        id: "19",
        image: "assets/images/fullApps/eStudy/deactive_lesson.svg",
        lessonsContentName: "Indigo.",
        lessonsContentDescription:
            "The Last Lesson is set in the days of the Franco-Prussian War (1870-1871) in which France was defeated by Prussia led by Bismarck. Prussia then consisted of what now are the nations  of Germany, Poland and parts of Austria. In this story the French districts of Alsace and Lorraine have passed into Prussian hands.",
        lessonsContanUrl:
            "https://www.sample-videos.com/video123/mp4/720/big_buck_bunny_720p_20mb.mp4",
        lessonsSubTitle: "Lorem ipsum dolor sit amet",
      ),
      LessonsContains_Model(
        id: "20",
        image: "assets/images/fullApps/eStudy/deactive_lesson.svg",
        lessonsContentName: "Poets And Pancakes.",
        lessonsContentDescription:
            "The Last Lesson is set in the days of the Franco-Prussian War (1870-1871) in which France was defeated by Prussia led by Bismarck. Prussia then consisted of what now are the nations  of Germany, Poland and parts of Austria. In this story the French districts of Alsace and Lorraine have passed into Prussian hands.",
        lessonsContanUrl:
            "https://www.sample-videos.com/video123/mp4/720/big_buck_bunny_720p_20mb.mp4",
        lessonsSubTitle: "Lorem ipsum dolor sit amet",
      ),
      LessonsContains_Model(
        id: "21",
        image: "assets/images/fullApps/eStudy/deactive_lesson.svg",
        lessonsContentName: "The Interview.",
        lessonsContentDescription:
            "The Last Lesson is set in the days of the Franco-Prussian War (1870-1871) in which France was defeated by Prussia led by Bismarck. Prussia then consisted of what now are the nations  of Germany, Poland and parts of Austria. In this story the French districts of Alsace and Lorraine have passed into Prussian hands.",
        lessonsContanUrl:
            "https://www.sample-videos.com/video123/mp4/720/big_buck_bunny_720p_20mb.mp4",
        lessonsSubTitle: "Lorem ipsum dolor sit amet",
      )
    ],
  ),
  Lessons_Model(
    id: "4",
    localimg: "assets/images/fullApps/eStudy/les_eco2.jpg",
    image:
        "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/estuddy%2Fles_eco2.jpg?alt=media&token=3c193444-756d-4da5-85d7-0f93d4b64071",
    blurUrl: "LO5QeycFt2aepftRt7j]betRodog",
    lessonsName: "Economics - 1",
    lessonsDate: "Mar 02, 2021",
    lessonsTime: "02:59pm",
    lessonsNumber: "6 Lessons",
    LessonsContaint: [
      LessonsContains_Model(
        id: "22",
        image: "assets/images/fullApps/eStudy/active_lesson.svg",
        lessonsContentName: "The Last Lesson.",
        lessonsContentDescription:
            "The Last Lesson is set in the days of the Franco-Prussian War (1870-1871) in which France was defeated by Prussia led by Bismarck. Prussia then consisted of what now are the nations  of Germany, Poland and parts of Austria. In this story the French districts of Alsace and Lorraine have passed into Prussian hands.",
        lessonsContanUrl:
            "https://www.sample-videos.com/video123/mp4/720/big_buck_bunny_720p_20mb.mp4",
        lessonsSubTitle: "Lorem ipsum dolor sit amet",
      ),
      LessonsContains_Model(
        id: "23",
        image: "assets/images/fullApps/eStudy/deactive_lesson.svg",
        lessonsContentName: "Lost Spring.",
        lessonsContentDescription:
            "The Last Lesson is set in the days of the Franco-Prussian War (1870-1871) in which France was defeated by Prussia led by Bismarck. Prussia then consisted of what now are the nations  of Germany, Poland and parts of Austria. In this story the French districts of Alsace and Lorraine have passed into Prussian hands.",
        lessonsContanUrl:
            "https://www.sample-videos.com/video123/mp4/720/big_buck_bunny_720p_20mb.mp4",
        lessonsSubTitle: "Lorem ipsum dolor sit amet",
      ),
      LessonsContains_Model(
        id: "24",
        image: "assets/images/fullApps/eStudy/deactive_lesson.svg",
        lessonsContentName: "Deep Water.",
        lessonsContentDescription:
            "The Last Lesson is set in the days of the Franco-Prussian War (1870-1871) in which France was defeated by Prussia led by Bismarck. Prussia then consisted of what now are the nations  of Germany, Poland and parts of Austria. In this story the French districts of Alsace and Lorraine have passed into Prussian hands.",
        lessonsContanUrl:
            "https://www.sample-videos.com/video123/mp4/720/big_buck_bunny_720p_20mb.mp4",
        lessonsSubTitle: "Lorem ipsum dolor sit amet",
      ),
      LessonsContains_Model(
        id: "25",
        image: "assets/images/fullApps/eStudy/deactive_lesson.svg",
        lessonsContentName: "The Rattrap.",
        lessonsContentDescription:
            "The Last Lesson is set in the days of the Franco-Prussian War (1870-1871) in which France was defeated by Prussia led by Bismarck. Prussia then consisted of what now are the nations  of Germany, Poland and parts of Austria. In this story the French districts of Alsace and Lorraine have passed into Prussian hands.",
        lessonsContanUrl:
            "https://www.sample-videos.com/video123/mp4/720/big_buck_bunny_720p_20mb.mp4",
        lessonsSubTitle: "Lorem ipsum dolor sit amet",
      ),
      LessonsContains_Model(
        id: "26",
        image: "assets/images/fullApps/eStudy/deactive_lesson.svg",
        lessonsContentName: "Indigo.",
        lessonsContentDescription:
            "The Last Lesson is set in the days of the Franco-Prussian War (1870-1871) in which France was defeated by Prussia led by Bismarck. Prussia then consisted of what now are the nations  of Germany, Poland and parts of Austria. In this story the French districts of Alsace and Lorraine have passed into Prussian hands.",
        lessonsContanUrl:
            "https://www.sample-videos.com/video123/mp4/720/big_buck_bunny_720p_20mb.mp4",
        lessonsSubTitle: "Lorem ipsum dolor sit amet",
      ),
      LessonsContains_Model(
        id: "27",
        image: "assets/images/fullApps/eStudy/deactive_lesson.svg",
        lessonsContentName: "Poets And Pancakes.",
        lessonsContentDescription:
            "The Last Lesson is set in the days of the Franco-Prussian War (1870-1871) in which France was defeated by Prussia led by Bismarck. Prussia then consisted of what now are the nations  of Germany, Poland and parts of Austria. In this story the French districts of Alsace and Lorraine have passed into Prussian hands.",
        lessonsContanUrl:
            "https://www.sample-videos.com/video123/mp4/720/big_buck_bunny_720p_20mb.mp4",
        lessonsSubTitle: "Lorem ipsum dolor sit amet",
      ),
      LessonsContains_Model(
        id: "28",
        image: "assets/images/fullApps/eStudy/deactive_lesson.svg",
        lessonsContentName: "The Interview.",
        lessonsContentDescription:
            "The Last Lesson is set in the days of the Franco-Prussian War (1870-1871) in which France was defeated by Prussia led by Bismarck. Prussia then consisted of what now are the nations  of Germany, Poland and parts of Austria. In this story the French districts of Alsace and Lorraine have passed into Prussian hands.",
        lessonsContanUrl:
            "https://www.sample-videos.com/video123/mp4/720/big_buck_bunny_720p_20mb.mp4",
        lessonsSubTitle: "Lorem ipsum dolor sit amet",
      )
    ],
  ),
  Lessons_Model(
    id: "5",
    localimg: "assets/images/fullApps/eStudy/les_math.jpg",
    image:
        "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/estuddy%2Fles_math.jpg?alt=media&token=4df370db-6886-41a5-a1c9-ee71c5cc1afa",
    blurUrl: "L7E:MOT##i00X:\$K9u%LEN?HbvkX",
    lessonsName: "Mathematicas",
    lessonsDate: "Mar 02, 2021",
    lessonsTime: "02:59pm",
    lessonsNumber: "10 Lessons",
    LessonsContaint: [
      LessonsContains_Model(
        id: "29",
        image: "assets/images/fullApps/eStudy/active_lesson.svg",
        lessonsContentName: "The Last Lesson.",
        lessonsContentDescription:
            "The Last Lesson is set in the days of the Franco-Prussian War (1870-1871) in which France was defeated by Prussia led by Bismarck. Prussia then consisted of what now are the nations  of Germany, Poland and parts of Austria. In this story the French districts of Alsace and Lorraine have passed into Prussian hands.",
        lessonsContanUrl:
            "https://www.sample-videos.com/video123/mp4/720/big_buck_bunny_720p_20mb.mp4",
        lessonsSubTitle: "Lorem ipsum dolor sit amet",
      ),
      LessonsContains_Model(
        id: "30",
        image: "assets/images/fullApps/eStudy/deactive_lesson.svg",
        lessonsContentName: "Lost Spring.",
        lessonsContentDescription:
            "The Last Lesson is set in the days of the Franco-Prussian War (1870-1871) in which France was defeated by Prussia led by Bismarck. Prussia then consisted of what now are the nations  of Germany, Poland and parts of Austria. In this story the French districts of Alsace and Lorraine have passed into Prussian hands.",
        lessonsContanUrl:
            "https://www.sample-videos.com/video123/mp4/720/big_buck_bunny_720p_20mb.mp4",
        lessonsSubTitle: "Lorem ipsum dolor sit amet",
      ),
      LessonsContains_Model(
        id: "31",
        image: "assets/images/fullApps/eStudy/deactive_lesson.svg",
        lessonsContentName: "Deep Water.",
        lessonsContentDescription:
            "The Last Lesson is set in the days of the Franco-Prussian War (1870-1871) in which France was defeated by Prussia led by Bismarck. Prussia then consisted of what now are the nations  of Germany, Poland and parts of Austria. In this story the French districts of Alsace and Lorraine have passed into Prussian hands.",
        lessonsContanUrl:
            "https://www.sample-videos.com/video123/mp4/720/big_buck_bunny_720p_20mb.mp4",
        lessonsSubTitle: "Lorem ipsum dolor sit amet",
      ),
      LessonsContains_Model(
        id: "32",
        image: "assets/images/fullApps/eStudy/deactive_lesson.svg",
        lessonsContentName: "The Rattrap.",
        lessonsContentDescription:
            "The Last Lesson is set in the days of the Franco-Prussian War (1870-1871) in which France was defeated by Prussia led by Bismarck. Prussia then consisted of what now are the nations  of Germany, Poland and parts of Austria. In this story the French districts of Alsace and Lorraine have passed into Prussian hands.",
        lessonsContanUrl:
            "https://www.sample-videos.com/video123/mp4/720/big_buck_bunny_720p_20mb.mp4",
        lessonsSubTitle: "Lorem ipsum dolor sit amet",
      ),
      LessonsContains_Model(
        id: "33",
        image: "assets/images/fullApps/eStudy/deactive_lesson.svg",
        lessonsContentName: "Indigo.",
        lessonsContentDescription:
            "The Last Lesson is set in the days of the Franco-Prussian War (1870-1871) in which France was defeated by Prussia led by Bismarck. Prussia then consisted of what now are the nations  of Germany, Poland and parts of Austria. In this story the French districts of Alsace and Lorraine have passed into Prussian hands.",
        lessonsContanUrl:
            "https://www.sample-videos.com/video123/mp4/720/big_buck_bunny_720p_20mb.mp4",
        lessonsSubTitle: "Lorem ipsum dolor sit amet",
      ),
      LessonsContains_Model(
        id: "34",
        image: "assets/images/fullApps/eStudy/deactive_lesson.svg",
        lessonsContentName: "Poets And Pancakes.",
        lessonsContentDescription:
            "The Last Lesson is set in the days of the Franco-Prussian War (1870-1871) in which France was defeated by Prussia led by Bismarck. Prussia then consisted of what now are the nations  of Germany, Poland and parts of Austria. In this story the French districts of Alsace and Lorraine have passed into Prussian hands.",
        lessonsContanUrl:
            "https://www.sample-videos.com/video123/mp4/720/big_buck_bunny_720p_20mb.mp4",
        lessonsSubTitle: "Lorem ipsum dolor sit amet",
      ),
      LessonsContains_Model(
        id: "35",
        image: "assets/images/fullApps/eStudy/deactive_lesson.svg",
        lessonsContentName: "The Interview.",
        lessonsContentDescription:
            "The Last Lesson is set in the days of the Franco-Prussian War (1870-1871) in which France was defeated by Prussia led by Bismarck. Prussia then consisted of what now are the nations  of Germany, Poland and parts of Austria. In this story the French districts of Alsace and Lorraine have passed into Prussian hands.",
        lessonsContanUrl:
            "https://www.sample-videos.com/video123/mp4/720/big_buck_bunny_720p_20mb.mp4",
        lessonsSubTitle: "Lorem ipsum dolor sit amet",
      )
    ],
  ),
  Lessons_Model(
    id: "6",
    localimg: "assets/images/fullApps/eStudy/les_english.jpg",
    image:
        "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/estuddy%2Fles_english.jpg?alt=media&token=4072be49-f9bf-46a7-ac53-4ac24dee1b85",
    blurUrl: "L4H1Vd000NEN~BIpE2NJ00%L^i\$\$",
    lessonsName: "English",
    lessonsDate: "Mar 02, 2021",
    lessonsTime: "02:59pm",
    lessonsNumber: "2 Lessons",
    LessonsContaint: [
      LessonsContains_Model(
        id: "36",
        image: "assets/images/fullApps/eStudy/active_lesson.svg",
        lessonsContentName: "The Last Lesson.",
        lessonsContentDescription:
            "The Last Lesson is set in the days of the Franco-Prussian War (1870-1871) in which France was defeated by Prussia led by Bismarck. Prussia then consisted of what now are the nations  of Germany, Poland and parts of Austria. In this story the French districts of Alsace and Lorraine have passed into Prussian hands.",
        lessonsContanUrl:
            "https://www.sample-videos.com/video123/mp4/720/big_buck_bunny_720p_20mb.mp4",
        lessonsSubTitle: "Lorem ipsum dolor sit amet",
      ),
      LessonsContains_Model(
        id: "37",
        image: "assets/images/fullApps/eStudy/deactive_lesson.svg",
        lessonsContentName: "Lost Spring.",
        lessonsContentDescription:
            "The Last Lesson is set in the days of the Franco-Prussian War (1870-1871) in which France was defeated by Prussia led by Bismarck. Prussia then consisted of what now are the nations  of Germany, Poland and parts of Austria. In this story the French districts of Alsace and Lorraine have passed into Prussian hands.",
        lessonsContanUrl:
            "https://www.sample-videos.com/video123/mp4/720/big_buck_bunny_720p_20mb.mp4",
        lessonsSubTitle: "Lorem ipsum dolor sit amet",
      ),
      LessonsContains_Model(
        id: "38",
        image: "assets/images/fullApps/eStudy/deactive_lesson.svg",
        lessonsContentName: "Deep Water.",
        lessonsContentDescription:
            "The Last Lesson is set in the days of the Franco-Prussian War (1870-1871) in which France was defeated by Prussia led by Bismarck. Prussia then consisted of what now are the nations  of Germany, Poland and parts of Austria. In this story the French districts of Alsace and Lorraine have passed into Prussian hands.",
        lessonsContanUrl:
            "https://www.sample-videos.com/video123/mp4/720/big_buck_bunny_720p_20mb.mp4",
        lessonsSubTitle: "Lorem ipsum dolor sit amet",
      ),
      LessonsContains_Model(
        id: "39",
        image: "assets/images/fullApps/eStudy/deactive_lesson.svg",
        lessonsContentName: "The Rattrap.",
        lessonsContentDescription:
            "The Last Lesson is set in the days of the Franco-Prussian War (1870-1871) in which France was defeated by Prussia led by Bismarck. Prussia then consisted of what now are the nations  of Germany, Poland and parts of Austria. In this story the French districts of Alsace and Lorraine have passed into Prussian hands.",
        lessonsContanUrl:
            "https://www.sample-videos.com/video123/mp4/720/big_buck_bunny_720p_20mb.mp4",
        lessonsSubTitle: "Lorem ipsum dolor sit amet",
      ),
      LessonsContains_Model(
        id: "40",
        image: "assets/images/fullApps/eStudy/deactive_lesson.svg",
        lessonsContentName: "Indigo.",
        lessonsContentDescription:
            "The Last Lesson is set in the days of the Franco-Prussian War (1870-1871) in which France was defeated by Prussia led by Bismarck. Prussia then consisted of what now are the nations  of Germany, Poland and parts of Austria. In this story the French districts of Alsace and Lorraine have passed into Prussian hands.",
        lessonsContanUrl:
            "https://www.sample-videos.com/video123/mp4/720/big_buck_bunny_720p_20mb.mp4",
        lessonsSubTitle: "Lorem ipsum dolor sit amet",
      ),
      LessonsContains_Model(
        id: "41",
        image: "assets/images/fullApps/eStudy/deactive_lesson.svg",
        lessonsContentName: "Poets And Pancakes.",
        lessonsContentDescription:
            "The Last Lesson is set in the days of the Franco-Prussian War (1870-1871) in which France was defeated by Prussia led by Bismarck. Prussia then consisted of what now are the nations  of Germany, Poland and parts of Austria. In this story the French districts of Alsace and Lorraine have passed into Prussian hands.",
        lessonsContanUrl:
            "https://www.sample-videos.com/video123/mp4/720/big_buck_bunny_720p_20mb.mp4",
        lessonsSubTitle: "Lorem ipsum dolor sit amet",
      ),
      LessonsContains_Model(
        id: "42",
        image: "assets/images/fullApps/eStudy/deactive_lesson.svg",
        lessonsContentName: "The Interview.",
        lessonsContentDescription:
            "The Last Lesson is set in the days of the Franco-Prussian War (1870-1871) in which France was defeated by Prussia led by Bismarck. Prussia then consisted of what now are the nations  of Germany, Poland and parts of Austria. In this story the French districts of Alsace and Lorraine have passed into Prussian hands.",
        lessonsContanUrl:
            "https://www.sample-videos.com/video123/mp4/720/big_buck_bunny_720p_20mb.mp4",
        lessonsSubTitle: "Lorem ipsum dolor sit amet",
      )
    ],
  ),
  Lessons_Model(
    id: "7",
    localimg: "assets/images/fullApps/eStudy/les_chemi.jpg",
    image:
        "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/estuddy%2Fles_chemi.jpg?alt=media&token=36070350-4753-429c-841b-b80289d43008",
    blurUrl: "LXL5z39F~W-X^R9GM|R-N2NIELWE",
    lessonsName: "Chemistry",
    lessonsDate: "Mar 02, 2021",
    lessonsTime: "02:59pm",
    lessonsNumber: "6 Lessons",
    LessonsContaint: [
      LessonsContains_Model(
        id: "43",
        image: "assets/images/fullApps/eStudy/active_lesson.svg",
        lessonsContentName: "The Last Lesson.",
        lessonsContentDescription:
            "The Last Lesson is set in the days of the Franco-Prussian War (1870-1871) in which France was defeated by Prussia led by Bismarck. Prussia then consisted of what now are the nations  of Germany, Poland and parts of Austria. In this story the French districts of Alsace and Lorraine have passed into Prussian hands.",
        lessonsContanUrl:
            "https://www.sample-videos.com/video123/mp4/720/big_buck_bunny_720p_20mb.mp4",
        lessonsSubTitle: "Lorem ipsum dolor sit amet",
      ),
      LessonsContains_Model(
        id: "44",
        image: "assets/images/fullApps/eStudy/deactive_lesson.svg",
        lessonsContentName: "Lost Spring.",
        lessonsContentDescription:
            "The Last Lesson is set in the days of the Franco-Prussian War (1870-1871) in which France was defeated by Prussia led by Bismarck. Prussia then consisted of what now are the nations  of Germany, Poland and parts of Austria. In this story the French districts of Alsace and Lorraine have passed into Prussian hands.",
        lessonsContanUrl:
            "https://www.sample-videos.com/video123/mp4/720/big_buck_bunny_720p_20mb.mp4",
        lessonsSubTitle: "Lorem ipsum dolor sit amet",
      ),
      LessonsContains_Model(
        id: "45",
        image: "assets/images/fullApps/eStudy/deactive_lesson.svg",
        lessonsContentName: "Deep Water.",
        lessonsContentDescription:
            "The Last Lesson is set in the days of the Franco-Prussian War (1870-1871) in which France was defeated by Prussia led by Bismarck. Prussia then consisted of what now are the nations  of Germany, Poland and parts of Austria. In this story the French districts of Alsace and Lorraine have passed into Prussian hands.",
        lessonsContanUrl:
            "https://www.sample-videos.com/video123/mp4/720/big_buck_bunny_720p_20mb.mp4",
      ),
      LessonsContains_Model(
        id: "46",
        image: "assets/images/fullApps/eStudy/deactive_lesson.svg",
        lessonsContentName: "The Rattrap.",
        lessonsContentDescription:
            "The Last Lesson is set in the days of the Franco-Prussian War (1870-1871) in which France was defeated by Prussia led by Bismarck. Prussia then consisted of what now are the nations  of Germany, Poland and parts of Austria. In this story the French districts of Alsace and Lorraine have passed into Prussian hands.",
        lessonsContanUrl:
            "https://www.sample-videos.com/video123/mp4/720/big_buck_bunny_720p_20mb.mp4",
        lessonsSubTitle: "Lorem ipsum dolor sit amet",
      ),
      LessonsContains_Model(
        id: "47",
        image: "assets/images/fullApps/eStudy/deactive_lesson.svg",
        lessonsContentName: "Indigo.",
        lessonsContentDescription:
            "The Last Lesson is set in the days of the Franco-Prussian War (1870-1871) in which France was defeated by Prussia led by Bismarck. Prussia then consisted of what now are the nations  of Germany, Poland and parts of Austria. In this story the French districts of Alsace and Lorraine have passed into Prussian hands.",
        lessonsContanUrl:
            "https://www.sample-videos.com/video123/mp4/720/big_buck_bunny_720p_20mb.mp4",
        lessonsSubTitle: "Lorem ipsum dolor sit amet",
      ),
      LessonsContains_Model(
        id: "48",
        image: "assets/images/fullApps/eStudy/deactive_lesson.svg",
        lessonsContentName: "Poets And Pancakes.",
        lessonsContentDescription:
            "The Last Lesson is set in the days of the Franco-Prussian War (1870-1871) in which France was defeated by Prussia led by Bismarck. Prussia then consisted of what now are the nations  of Germany, Poland and parts of Austria. In this story the French districts of Alsace and Lorraine have passed into Prussian hands.",
        lessonsContanUrl:
            "https://www.sample-videos.com/video123/mp4/720/big_buck_bunny_720p_20mb.mp4",
        lessonsSubTitle: "Lorem ipsum dolor sit amet",
      ),
      LessonsContains_Model(
        id: "49",
        image: "assets/images/fullApps/eStudy/deactive_lesson.svg",
        lessonsContentName: "The Interview.",
        lessonsContentDescription:
            "The Last Lesson is set in the days of the Franco-Prussian War (1870-1871) in which France was defeated by Prussia led by Bismarck. Prussia then consisted of what now are the nations  of Germany, Poland and parts of Austria. In this story the French districts of Alsace and Lorraine have passed into Prussian hands.",
        lessonsContanUrl:
            "https://www.sample-videos.com/video123/mp4/720/big_buck_bunny_720p_20mb.mp4",
        lessonsSubTitle: "Lorem ipsum dolor sit amet",
      )
    ],
  ),
];
