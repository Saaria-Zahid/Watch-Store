

import 'package:Saz/common/widgets/image_text_vertical_slide/image_text_verticle_slide.dart';
import 'package:Saz/common/widgets/products/card/product_card_verticle.dart';
import 'package:Saz/controllers/product_controller.dart';
import 'package:Saz/screens/user/home_screen.dart';
import 'package:Saz/utils/constants/image_strings.dart';
import 'package:Saz/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductSearchDelegate extends SearchDelegate {
  final List<Map<String, dynamic>> watches;
  ProductSearchDelegate({required this.watches});

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = ''; // Clear the search query
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // Filter the results based on query
    final List<Map<String, dynamic>> filteredWatches = watches
        .where((product) =>
            product['brand'].toLowerCase().contains(query.toLowerCase()) ||
            product['name'].toLowerCase().contains(query.toLowerCase()))
        .toList();

    if (filteredWatches.isEmpty) {
      return Center(child: Text('No results found.'));
    }

    return ListView.builder(
      itemCount: filteredWatches.length,
      itemBuilder: (context, index) {
        final product = filteredWatches[index];
        return ListTile(
          title: Text(product['name']),
          subtitle: Text(product['brand']),
          leading: Image.asset(product['image'], width: 40, height: 40),
          onTap: () {
            // Perform any action when an item is tapped, e.g., show product details
          },
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // Filter suggestions while typing
    final List<Map<String, dynamic>> filteredWatches = watches
        .where((product) =>
            product['brand'].toLowerCase().contains(query.toLowerCase()) ||
            product['name'].toLowerCase().contains(query.toLowerCase()))
        .toList();

    return ListView.builder(
      itemCount: filteredWatches.length,
      itemBuilder: (context, index) {
        final product = filteredWatches[index];
        return ListTile(
          title: Text(product['name']),
          subtitle: Text(product['brand']),
          leading: Image.asset(product['image'], width: 40, height: 40),
          onTap: () {
            // Perform any action when an item is tapped
          },
        );
      },
    );
  }
}


class Brand {
  final String name;
  final String image;

  Brand({required this.name, required this.image});
}

