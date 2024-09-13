import 'package:flutter/material.dart';

class DiscountBanner extends StatelessWidget {
  final String discountText;

  const DiscountBanner({required this.discountText});

  @override
  Widget build(BuildContext context) {
    if (discountText.isEmpty) {
      return SizedBox.shrink(); // Return an empty widget if no discount text
    }
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      color: Colors.red,
      child: Text(
        discountText,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 14.0,
        ),
      ),
    );
  }
}
