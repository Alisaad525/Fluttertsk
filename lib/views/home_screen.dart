import 'package:flutter/material.dart';
import '../models/item.dart';
import '../viewmodels/item_viewmodel.dart';
import 'widgets/search_bar.dart' as custom;
import 'widgets/item_list.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ItemViewModel itemViewModel = ItemViewModel();
  String query = '';
  List<Item> filteredItems = [];

  @override
  void initState() {
    super.initState();
    // Load initial items
    filteredItems = itemViewModel.getNextItems();
  }

  void loadMoreItems() {
    itemViewModel.loadMoreItems(() {
      setState(() {
        filteredItems.addAll(itemViewModel.getNextItems());
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final searchedItems = itemViewModel.searchItems(query);

    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 30.0),
            child: custom.SearchBar(
              onSearch: (value) {
                setState(() {
                  query = value;
                  filteredItems = searchedItems; // Update filtered items based on search
                });
              },
            ),
          ),
          Expanded(
            child: ItemList(
              items: filteredItems,
              loadMore: loadMoreItems,
              isLoadingMore: itemViewModel.isLoadingMore,
            ),
          ),
        ],
      ),
    );
  }
}
