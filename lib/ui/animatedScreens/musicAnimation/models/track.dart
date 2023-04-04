class Track {
  final String name;
  final String albumName;
  final int ratings;
  final String imageUrl;
  final String duration;

  Track(
      {required this.albumName,
      required this.duration,
      required this.imageUrl,
      required this.name,
      required this.ratings});
}
