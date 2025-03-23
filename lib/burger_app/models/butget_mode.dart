class Burger {
  final String name;
  final String image;
  final String distance;
  final double price;
  final double rating;
  final String description;
  bool isFavorited;

  Burger(
      {required this.name,
      required this.image,
      required this.distance,
      required this.price,
      required this.rating,
      required this.description,
      this.isFavorited = false});
}

List<String> categoryList = ['beef', 'cheese', 'shrimp', 'Pizza'];

final List<Burger> burgers = [
  Burger(
      name: "Extra beef Burger",
      image:
          "https://img.freepik.com/free-photo/double-cheeseburger_23-2151950841.jpg?t=st=1742480435~exp=1742484035~hmac=79ecc05b151c2b0b481dfd896dfce84dbb85bc114849d5a106eedf3994868f32&w=740",
      distance: "5.3 km",
      price: 990,
      rating: 4.8,
      description: "A Burger, short for hamBurger"),
  Burger(
      name: "Smoked Beef Burger",
      image:
          "https://img.freepik.com/free-photo/double-cheeseburger_23-2151950841.jpg?t=st=1742480435~exp=1742484035~hmac=79ecc05b151c2b0b481dfd896dfce84dbb85bc114849d5a106eedf3994868f32&w=740",
      distance: "990 km",
      price: 990,
      rating: 4.8,
      description: "A Burger, short for hamBurger"),
];
