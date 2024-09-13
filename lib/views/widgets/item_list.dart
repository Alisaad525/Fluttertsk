import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../../models/item.dart'; // Adjust import if necessary
import 'discount_banner.dart';

class ItemList extends StatelessWidget {
  final List<Item> items;

  const ItemList({required this.items});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8.0,
        mainAxisSpacing: 8.0,
        childAspectRatio: 0.7,
      ),
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        final discountText = item.discount > 0
            ? '${item.discount.toStringAsFixed(0)}% OFF'
            : '';

        return Card(
          elevation: 4.0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: 150.0,
                    child: Image.asset(
                      item.imageUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                  if (discountText.isNotEmpty)
                    Positioned(
                      top: 8,
                      left: 8,
                      child: DiscountBanner(discountText: discountText),
                    ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  item.title,
                  style: Theme.of(context).textTheme.subtitle1!.copyWith(
                    fontSize: 16.0,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RatingBar.builder(
                      initialRating: item.rating.toDouble(),
                      minRating: 1,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      itemSize: 24.0,
                      itemBuilder: (context, _) => Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      onRatingUpdate: (rating) {
                        print('New rating: $rating');
                      },
                    ),
                    SizedBox(height: 4),
                    if (item.discount > 0)
                      Row(
                        children: [
                          Text(
                            '\$${item.price.toStringAsFixed(2)}',
                            style: TextStyle(
                              fontSize: 16.0,
                              color: Colors.grey,
                              decoration: TextDecoration.lineThrough,
                            ),
                          ),
                          SizedBox(width: 8),
                          Text(
                            '\$${item.discountedPrice.toStringAsFixed(2)}',
                            style: Theme.of(context).textTheme.subtitle2!.copyWith(
                              fontSize: 16.0,
                              color: Colors.red, // Color for discounted price
                            ),
                          ),
                        ],
                      )
                    else
                      Text(
                        '\$${item.price.toStringAsFixed(2)}',
                        style: Theme.of(context).textTheme.subtitle2!.copyWith(
                          fontSize: 16.0,
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
