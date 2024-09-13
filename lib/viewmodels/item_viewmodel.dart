import '../models/item.dart';

class ItemViewModel {
  final List<Item> items = [
    Item(imageUrl: 'assets/1.jpg', title: 'Item 1', price: 29.99, rating: 4.5, discount: 5.0),
    Item(imageUrl: 'assets/2.jpg', title: 'Item 2', price: 49.99, rating: 4.0, discount: 20.0),
    Item(imageUrl: 'assets/3.jpg', title: 'Item 3', price: 19.99, rating: 3.5, discount: 10.0),
    Item(imageUrl: 'assets/4.jpg', title: 'Item 4', price: 59.99, rating: 5.0, discount: 15.0),
  ];

  List<Item> searchItems(String query) {
    return items.where((item) => item.title.toLowerCase().contains(query.toLowerCase())).toList();
  }
}
