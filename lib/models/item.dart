class Item {
  final String imageUrl;
  final String title;
  final double price;
  final double rating;
  final double discount;

  Item({
    required this.imageUrl,
    required this.title,
    required this.price,
    required this.rating,
    this.discount = 0.0,
  });

  // Method to calculate the discounted price
  double get discountedPrice {
    return price - (price * (discount / 100));
  }
}
