class Workout {
  final String id;
  final List<String> imageurl;
  final String image;
  final String title;
  final String duration;
  final String level;
  final bool bookmark;
  final String videourl;

  Workout(
      {required this.id,
      required this.imageurl,
      required this.title,
      required this.duration,
      required this.level,
      required this.bookmark,
      required this.videourl,
      required this.image});
}
