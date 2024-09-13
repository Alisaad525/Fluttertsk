import 'package:flutter/material.dart';
import '../viewmodels/item_viewmodel.dart';
import 'widgets/search_bar.dart' as custom; // Use 'custom' prefix here
import 'widgets/item_list.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ItemViewModel itemViewModel = ItemViewModel();
  String query = '';

  @override
  Widget build(BuildContext context) {
    final filteredItems = itemViewModel.searchItems(query);

    return Scaffold(
      body: Column(
        children: [
          // Add Padding widget to create space above the search bar
          Padding(
            padding: const EdgeInsets.only(top: 30.0), // Adjust top padding as needed
            child: custom.SearchBar(
              onSearch: (value) {
                setState(() {
                  query = value;
                });
              },
            ),
          ),
          Expanded(child: ItemList(items: filteredItems)),
        ],
      ),
    );
  }
}
