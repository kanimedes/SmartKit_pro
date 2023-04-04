class Pizza {
  final String name;
  final String image;
  final String subTitle;
  final int minutes;
  final int sizeInInch;
  final int ratings;
  final int price;

  Pizza(
      {required this.price,
      required this.name,
      required this.subTitle,
      required this.image,
      required this.minutes,
      required this.ratings,
      required this.sizeInInch});
}

final pizzas = [
  Pizza(
      name: "Veg Pizza",
      subTitle: "Onions and garlic",
      image:
          "assets/images/animatedScreens/pizzOrderAnimation/images/pizza_a.png",
      minutes: 25,
      ratings: 4,
      sizeInInch: 7,
      price: 25),
  Pizza(
      name: "Italian",
      subTitle: "Tomato",
      image:
          "assets/images/animatedScreens/pizzOrderAnimation/images/pizza_b.png",
      minutes: 25,
      ratings: 5,
      sizeInInch: 8,
      price: 20),
  Pizza(
      name: "UK Pizza",
      subTitle: "Cord",
      image:
          "assets/images/animatedScreens/pizzOrderAnimation/images/pizza_c.png",
      minutes: 25,
      ratings: 4,
      sizeInInch: 9,
      price: 26),
  Pizza(
      name: "Hot And Sauce",
      subTitle: "Chilli",
      image:
          "assets/images/animatedScreens/pizzOrderAnimation/images/pizza_d.png",
      minutes: 25,
      ratings: 5,
      sizeInInch: 10,
      price: 22),
  Pizza(
      name: "Nonveg Pizza",
      subTitle: "Garlic",
      image:
          "assets/images/animatedScreens/pizzOrderAnimation/images/pizza_e.png",
      minutes: 25,
      ratings: 2,
      sizeInInch: 6,
      price: 30),
  Pizza(
      name: "Paneer Pizza",
      subTitle: "Paneer",
      image:
          "assets/images/animatedScreens/pizzOrderAnimation/images/pizza_f.png",
      minutes: 25,
      ratings: 5,
      sizeInInch: 7,
      price: 25),
];

class Topping {
  final String name;
  final String image;
  final String lottieAnimationPath;

  Topping(
      {required this.name,
      required this.lottieAnimationPath,
      required this.image});
}

final toppings = [
  Topping(
      name: "Corn",
      image:
          "assets/images/animatedScreens/pizzOrderAnimation/images/toppings/corn.png",
      lottieAnimationPath: "assets/lottieAnimations/corn.json"),
  Topping(
      name: "Mushroom",
      image:
          "assets/images/animatedScreens/pizzOrderAnimation/images/toppings/mushroom.png",
      lottieAnimationPath:
          "assets/images/animatedScreens/pizzOrderAnimation/lottieAnimations/mushroom.json"),
  Topping(
      name: "Olive",
      image:
          "assets/images/animatedScreens/pizzOrderAnimation/images/toppings/olive.png",
      lottieAnimationPath:
          "assets/images/animatedScreens/pizzOrderAnimation/lottieAnimations/olives.json"),
  Topping(
      name: "Chilli",
      image:
          "assets/images/animatedScreens/pizzOrderAnimation/images/toppings/chilli.png",
      lottieAnimationPath:
          "assets/images/animatedScreens/pizzOrderAnimation/lottieAnimations/chilli.json"),
  Topping(
      name: "Garlic",
      image:
          "assets/images/animatedScreens/pizzOrderAnimation/images/toppings/garlic.png",
      lottieAnimationPath:
          "assets/images/animatedScreens/pizzOrderAnimation/lottieAnimations/garlic.json"),
  Topping(
      name: "Onion",
      image:
          "assets/images/animatedScreens/pizzOrderAnimation/images/toppings/onion.png",
      lottieAnimationPath:
          "assets/images/animatedScreens/pizzOrderAnimation/lottieAnimations/onions.json"),
  Topping(
      name: "Tomato",
      image:
          "assets/images/animatedScreens/pizzOrderAnimation/images/toppings/tomato.png",
      lottieAnimationPath:
          "assets/images/animatedScreens/pizzOrderAnimation/lottieAnimations/tomato.json"),
];
