import 'package:smartkit_pro/ui/fullApps/fitness/model/detailscreevideo.dart';
import 'package:smartkit_pro/ui/fullApps/fitness/model/usergoal.dart';
import 'package:smartkit_pro/ui/fullApps/fitness/model/workout.dart';

class fitnessUiUtils {
  static String getImagePath(String imageName) {
    return "assets/images/fullApps/fitness/$imageName";
  }

  static List<usergoal> goalList = [
    usergoal(id: "1", goalname: "Get Fitter"),
    usergoal(id: "2", goalname: "Gain Weight"),
    usergoal(id: "3", goalname: "Lose  Weight"),
    usergoal(id: "4", goalname: "Building Muscles"),
    usergoal(id: "5", goalname: "improving Endurance"),
    usergoal(id: "6", goalname: "other"),
  ];
  static List levelList = [
    "Beginner",
    "Intermediate",
    "Advanced",
  ];
  static List<Workout> workout = [
    Workout(
      videourl:
          "https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4",
      image: fitnessUiUtils.getImagePath("featured_1.jpg"),
      id: "0",
      imageurl: [
        fitnessUiUtils.getImagePath("featured_1.jpg"),
        fitnessUiUtils.getImagePath("featured_2.jpg"),
        fitnessUiUtils.getImagePath("featured_3.jpg"),
      ],
      title: "Extended Side Angle",
      duration: "15 min",
      level: "Intermediat",
      bookmark: false,
    ),
    Workout(
      videourl:
          "https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4",
      image: fitnessUiUtils.getImagePath("featured_2.jpg"),
      id: "1",
      imageurl: [
        fitnessUiUtils.getImagePath("featured_2.jpg"),
        fitnessUiUtils.getImagePath("featured_1.jpg"),
        fitnessUiUtils.getImagePath("featured_3.jpg"),
      ],
      title: "Warrior",
      duration: "20 min",
      level: "Intermediat",
      bookmark: false,
    ),
    Workout(
      videourl:
          "https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4",
      image: fitnessUiUtils.getImagePath("featured_1.jpg"),
      id: "2",
      imageurl: [
        fitnessUiUtils.getImagePath("featured_1.jpg"),
        fitnessUiUtils.getImagePath("featured_2.jpg"),
        fitnessUiUtils.getImagePath("featured_3.jpg"),
      ],
      title: "Triangle Pose",
      duration: "10 min",
      level: "Intermediat",
      bookmark: false,
    ),
    Workout(
      videourl:
          "https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4",
      image: fitnessUiUtils.getImagePath("featured_4.jpg"),
      id: "3",
      imageurl: [
        fitnessUiUtils.getImagePath("featured_4.jpg"),
        fitnessUiUtils.getImagePath("featured_3.jpg"),
        fitnessUiUtils.getImagePath("featured_2.jpg"),
      ],
      title: "Mountain Pose",
      duration: "5 min",
      level: "Intermediat",
      bookmark: true,
    ),
  ];

  static List<Workout> beginnerworkout = [
    Workout(
      videourl: fitnessUiUtils.getImagePath("video.mp4"),
      image: fitnessUiUtils.getImagePath("beginner_1.jpg"),
      id: "1",
      imageurl: [
        fitnessUiUtils.getImagePath("beginner_1.jpg"),
        fitnessUiUtils.getImagePath("beginner_2.jpg"),
        fitnessUiUtils.getImagePath("beginner_3.jpg"),
      ],
      title: "Downward Facing Dog",
      duration: "8 min",
      level: "Beginner",
      bookmark: false,
    ),
    Workout(
      videourl:
          "https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4",
      image: fitnessUiUtils.getImagePath("beginner_2.jpg"),
      id: "1",
      imageurl: [
        fitnessUiUtils.getImagePath("beginner_2.jpg"),
        fitnessUiUtils.getImagePath("beginner_1.jpg"),
        fitnessUiUtils.getImagePath("beginner_3.jpg"),
      ],
      title: "Mountain Pose",
      duration: "15 min",
      level: "Beginner",
      bookmark: false,
    ),
    Workout(
      videourl:
          "https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4",
      image: fitnessUiUtils.getImagePath("beginner_3.jpg"),
      id: "1",
      imageurl: [
        fitnessUiUtils.getImagePath("beginner_3.jpg"),
        fitnessUiUtils.getImagePath("beginner_2.jpg"),
        fitnessUiUtils.getImagePath("beginner_1.jpg"),
      ],
      title: "Warrior",
      duration: "12 min",
      level: "Beginner",
      bookmark: false,
    ),
    Workout(
      videourl:
          "https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4",
      image: fitnessUiUtils.getImagePath("beginner_4.jpg"),
      id: "1",
      imageurl: [
        fitnessUiUtils.getImagePath("beginner_4.jpg"),
        fitnessUiUtils.getImagePath("beginner_3.jpg"),
        fitnessUiUtils.getImagePath("beginner_2.jpg"),
      ],
      title: "Extended Side Angle",
      duration: "10 min",
      level: "Beginner",
      bookmark: true,
    ),
    Workout(
      videourl:
          "https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4",
      image: fitnessUiUtils.getImagePath("beginner_5.jpg"),
      id: "1",
      imageurl: [
        fitnessUiUtils.getImagePath("beginner_5.jpg"),
        fitnessUiUtils.getImagePath("beginner_4.jpg"),
        fitnessUiUtils.getImagePath("beginner_3.jpg"),
      ],
      title: "Triangle Pose ",
      duration: "10 min",
      level: "Beginner",
      bookmark: false,
    ),
    Workout(
      videourl:
          "https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4",
      image: fitnessUiUtils.getImagePath("beginner_1.jpg"),
      id: "1",
      imageurl: [
        fitnessUiUtils.getImagePath("beginner_1.jpg"),
        fitnessUiUtils.getImagePath("beginner_2.jpg"),
        fitnessUiUtils.getImagePath("beginner_3.jpg"),
      ],
      title: "Standing Forward Bend",
      duration: "10 min",
      level: "Beginner",
      bookmark: true,
    ),
  ];
  static List<Workout> intermemediateworkout = [
    Workout(
      videourl:
          "https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4",
      image: fitnessUiUtils.getImagePath("Intermediate_4.jpg"),
      id: "1",
      imageurl: [
        fitnessUiUtils.getImagePath("Intermediate_4.jpg"),
        fitnessUiUtils.getImagePath("Intermediate_3.jpg"),
        fitnessUiUtils.getImagePath("Intermediate_2.jpg"),
      ],
      title: "Mountain Pose",
      duration: "20 min",
      level: "Intermediat",
      bookmark: false,
    ),
    Workout(
      videourl:
          "https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4",
      image: fitnessUiUtils.getImagePath("Intermediate_3.jpg"),
      id: "1",
      imageurl: [
        fitnessUiUtils.getImagePath("Intermediate_3.jpg"),
        fitnessUiUtils.getImagePath("Intermediate_2.jpg"),
        fitnessUiUtils.getImagePath("Intermediate_1.jpg"),
        fitnessUiUtils.getImagePath("Intermediate_4.jpg"),
      ],
      title: "Chair Pose",
      duration: "10 min",
      level: "Intermediat",
      bookmark: false,
    ),
    Workout(
      videourl:
          "https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4",
      image: fitnessUiUtils.getImagePath("Intermediate_2.jpg"),
      id: "1",
      imageurl: [
        fitnessUiUtils.getImagePath("Intermediate_2.jpg"),
        fitnessUiUtils.getImagePath("Intermediate_1.jpg"),
        fitnessUiUtils.getImagePath("Intermediate_3.jpg"),
        fitnessUiUtils.getImagePath("Intermediate_4.jpg"),
      ],
      title: "Down Dog on a chair",
      duration: "10 min",
      level: "Intermediat",
      bookmark: false,
    ),
    Workout(
      videourl:
          "https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4",
      image: fitnessUiUtils.getImagePath("Intermediate_1.jpg"),
      id: "1",
      imageurl: [
        fitnessUiUtils.getImagePath("Intermediate_1.jpg"),
        fitnessUiUtils.getImagePath("Intermediate_2.jpg"),
        fitnessUiUtils.getImagePath("Intermediate_3.jpg"),
        fitnessUiUtils.getImagePath("Intermediate_4.jpg"),
      ],
      title: "Downward-Facing Dog",
      duration: "10 min",
      level: "Intermediat",
      bookmark: true,
    ),
  ];

  static List<Workout> advanworkout = [
    Workout(
      videourl:
          "https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4",
      image: fitnessUiUtils.getImagePath("Advanced_7.jpg"),
      id: "1",
      imageurl: [
        fitnessUiUtils.getImagePath("Advanced_7.jpg"),
        fitnessUiUtils.getImagePath("Advanced_6.jpg"),
        fitnessUiUtils.getImagePath("Advanced_5.jpg"),
      ],
      title: "Triangle Pose",
      duration: "15 min",
      level: "advanced",
      bookmark: false,
    ),
    Workout(
      videourl:
          "https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4",
      image: fitnessUiUtils.getImagePath("Advanced_6.jpg"),
      id: "1",
      imageurl: [
        fitnessUiUtils.getImagePath("Advanced_6.jpg"),
        fitnessUiUtils.getImagePath("Advanced_5.jpg"),
        fitnessUiUtils.getImagePath("Advanced_4.jpg"),
      ],
      title: "Tree Pose",
      duration: "20 min",
      level: "advanced",
      bookmark: false,
    ),
    Workout(
      videourl:
          "https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4",
      image: fitnessUiUtils.getImagePath("Advanced_5.jpg"),
      id: "1",
      imageurl: [
        fitnessUiUtils.getImagePath("Advanced_5.jpg"),
        fitnessUiUtils.getImagePath("Advanced_4.jpg"),
        fitnessUiUtils.getImagePath("Advanced_3.jpg"),
      ],
      title: "Bridge Pose",
      duration: "25 min",
      level: "advanced",
      bookmark: false,
    ),
    Workout(
      videourl:
          "https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4",
      image: fitnessUiUtils.getImagePath("Advanced_4.jpg"),
      id: "1",
      imageurl: [
        fitnessUiUtils.getImagePath("Advanced_4.jpg"),
        fitnessUiUtils.getImagePath("Advanced_3.jpg"),
        fitnessUiUtils.getImagePath("Advanced_2.jpg"),
      ],
      title: "Bound Ankle Pose",
      duration: "30 min",
      level: "advanced",
      bookmark: true,
    ),
    Workout(
      videourl:
          "https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4",
      image: fitnessUiUtils.getImagePath("Advanced_3.jpg"),
      id: "1",
      imageurl: [
        fitnessUiUtils.getImagePath("Advanced_3.jpg"),
        fitnessUiUtils.getImagePath("Advanced_2.jpg"),
        fitnessUiUtils.getImagePath("Advanced_1.jpg"),
      ],
      title: "Seated Forward Fold",
      duration: "5 min",
      level: "advanced",
      bookmark: false,
    ),
    Workout(
      videourl:
          "https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4",
      image: fitnessUiUtils.getImagePath("Advanced_2.jpg"),
      id: "1",
      imageurl: [
        fitnessUiUtils.getImagePath("Advanced_2.jpg"),
        fitnessUiUtils.getImagePath("Advanced_1.jpg"),
        fitnessUiUtils.getImagePath("Advanced_8.jpg"),
      ],
      title: "Corpse Pose",
      duration: "15 min",
      level: "advanced",
      bookmark: false,
    ),
    Workout(
      videourl:
          "https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4",
      image: fitnessUiUtils.getImagePath("Advanced_1.jpg"),
      id: "1",
      imageurl: [
        fitnessUiUtils.getImagePath("Advanced_1.jpg"),
        fitnessUiUtils.getImagePath("Advanced_5.jpg"),
        fitnessUiUtils.getImagePath("Advanced_8.jpg"),
      ],
      title: "Four-Limbed Staff Pose",
      duration: "3 min",
      level: "advanced",
      bookmark: false,
    ),
  ];

  static List<Videodata> workoutvideo = [
    Videodata(
      id: "0",
      title: "warrior 1",
      imageurl: fitnessUiUtils.getImagePath("Advanced_1.jpg"),
      videourl:
          "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4",
    ),
    Videodata(
      id: "1",
      title: "slide Plank",
      imageurl: fitnessUiUtils.getImagePath("Advanced_2.jpg"),
      videourl:
          "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4",
    ),
    Videodata(
      id: "2",
      title: "TWISTED POSE",
      imageurl: fitnessUiUtils.getImagePath("Advanced_2.jpg"),
      videourl:
          "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4",
    ),
    Videodata(
      id: "0",
      title: "CRANE POSE",
      imageurl: fitnessUiUtils.getImagePath("Advanced_3.jpg"),
      videourl:
          "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4",
    ),
    Videodata(
      id: "1",
      title: "SPLIT POSE",
      imageurl: fitnessUiUtils.getImagePath("Advanced_4.jpg"),
      videourl:
          "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4",
    ),
    Videodata(
      id: "2",
      title: "SCORPION POSE",
      imageurl: fitnessUiUtils.getImagePath("Advanced_6.jpg"),
      videourl:
          "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4",
    )
  ];
  static List<Workout> finishlist = [
    Workout(
      videourl:
          "https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4",
      image: fitnessUiUtils.getImagePath("beginner_2.jpg"),
      id: "1",
      imageurl: [
        fitnessUiUtils.getImagePath("beginner_2.jpg"),
        fitnessUiUtils.getImagePath("beginner_1.jpg"),
        fitnessUiUtils.getImagePath("beginner_3.jpg"),
      ],
      title: "Camel Pose",
      duration: "10 min",
      level: "Intermediat",
      bookmark: true,
    ),
    Workout(
      videourl:
          "https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4",
      image: fitnessUiUtils.getImagePath("beginner_1.jpg"),
      id: "1",
      imageurl: [
        fitnessUiUtils.getImagePath("beginner_1.jpg"),
        fitnessUiUtils.getImagePath("beginner_2.jpg"),
        fitnessUiUtils.getImagePath("beginner_3.jpg"),
      ],
      title: "Side plank",
      duration: "10 min",
      level: "Intermediat",
      bookmark: true,
    ),
    Workout(
      videourl:
          "https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4",
      image: fitnessUiUtils.getImagePath("beginner_3.jpg"),
      id: "1",
      imageurl: [
        fitnessUiUtils.getImagePath("beginner_3.jpg"),
        fitnessUiUtils.getImagePath("beginner_2.jpg"),
        fitnessUiUtils.getImagePath("beginner_1.jpg"),
      ],
      title: "Revolved Triangle Pose",
      duration: "10 min",
      level: "Intermediat",
      bookmark: true,
    ),
    Workout(
      videourl:
          "https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4",
      image: fitnessUiUtils.getImagePath("beginner_4.jpg"),
      id: "1",
      imageurl: [
        fitnessUiUtils.getImagePath("beginner_4.jpg"),
        fitnessUiUtils.getImagePath("beginner_3.jpg"),
        fitnessUiUtils.getImagePath("beginner_2.jpg"),
      ],
      title: " Boat Pose",
      duration: "10 min",
      level: "Intermediat",
      bookmark: true,
    ),
  ];

  static List<Workout> BOOKMARKlIST = [
    Workout(
      videourl:
          "https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4",
      image: fitnessUiUtils.getImagePath("beginner_5.jpg"),
      id: "1",
      imageurl: [
        fitnessUiUtils.getImagePath("beginner_5.jpg"),
        fitnessUiUtils.getImagePath("beginner_4.jpg"),
        fitnessUiUtils.getImagePath("beginner_3.jpg"),
      ],
      title: "Camel Pose",
      duration: "10 min",
      level: "Intermediat",
      bookmark: true,
    ),
  ];
}
