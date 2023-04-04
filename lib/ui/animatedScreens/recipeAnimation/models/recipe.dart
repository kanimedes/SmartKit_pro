class Recipe {
  final String name;
  final String imageUrl;
  final String views;
  final String likes;
  final String description;

  Recipe(
      {required this.description,
      required this.imageUrl,
      required this.name,
      required this.likes,
      required this.views});
}
