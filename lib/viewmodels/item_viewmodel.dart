import '../models/item.dart';

class ItemViewModel {
  final List<Item> items = [
    Item(imageUrl: 'assets/1.jpg', title: 'spatula', price: 29.99, rating: 0, discount: 5.0),
    Item(imageUrl: 'assets/2.jpg', title: 'Spatula', price: 49.99, rating: 0, discount: 20.0),
    Item(imageUrl: 'assets/3.jpg', title: 'Item 3', price: 19.99, rating: 0, discount: 10.0),
    Item(imageUrl: 'assets/4.jpg', title: 'Item 4', price: 59.99, rating: 0, discount: 15.0),
    Item(imageUrl: 'assets/4.jpg', title: 'Item 4', price: 59.99, rating: 0, discount: 15.0),
    Item(imageUrl: 'assets/4.jpg', title: 'Item 4', price: 59.99, rating: 0, discount: 15.0),
    Item(imageUrl: 'assets/4.jpg', title: 'Item 4', price: 59.99, rating: 0, discount: 15.0),
    Item(imageUrl: 'assets/4.jpg', title: 'Item 4', price: 59.99, rating: 5.0, discount: 15.0),


  ];

  List<Item> searchItems(String query) {
    String formattedQuery = query.toLowerCase().replaceAll(' ', '');
    return items.where((item) {
      String formattedTitle = item.title.toLowerCase().replaceAll(' ', '');
      return formattedTitle.contains(formattedQuery);
    }).toList();
  }

}
