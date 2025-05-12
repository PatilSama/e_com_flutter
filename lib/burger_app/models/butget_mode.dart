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
          "https://as2.ftcdn.net/v2/jpg/05/85/29/13/1000_F_585291338_0J8Q8vYbKDCu8yqqwAO8PsQZ4ESP2zd8.webp",
      distance: "5.3 km",
      price: 990,
      rating: 4.8,
      description: "A Burger, short for hamBurger"),
  Burger(
      name: "Smoked Beef Burger",
      image:
          "https://as2.ftcdn.net/v2/jpg/05/85/29/13/1000_F_585291338_0J8Q8vYbKDCu8yqqwAO8PsQZ4ESP2zd8.webp",
      distance: "990 km",
      price: 990,
      rating: 4.8,
      description: "A Burger, short for hamBurger"),
];
