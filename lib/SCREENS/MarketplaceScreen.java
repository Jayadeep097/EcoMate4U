import 'package:flutter/material.dart';
import '../models/product.dart';
import '../services/db_service.dart';
import '../widgets/product_card.dart';

class MarketplaceScreen extends StatelessWidget {
  final DbService dbService = DbService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Marketplace')),
      body: FutureBuilder<List<Product>>(
        future: dbService.getProducts(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          final products = snapshot.data!;
          return GridView.builder(
            itemCount: products.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            itemBuilder: (context, index) {
              return ProductCard(product: products[index]);
            },
          );
        },
      ),
    );
  }
}