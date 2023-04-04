import 'dart:ui';

class Product {
  final String name;
  final String price;
  final String size;
  final String company;
  final Color color;
  final String imageUrl;

  Product(
      {required this.color,
      required this.imageUrl,
      required this.company,
      required this.name,
      required this.price,
      required this.size});
}
