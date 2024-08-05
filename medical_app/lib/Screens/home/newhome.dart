import 'package:flutter/material.dart';

class ProductGridView extends StatelessWidget {
  final List<Product> products = List.generate(
    100,
    (index) => Product(
      name: 'ACC-U check active test stripe',
      price: 1200,
      imageUrl: 'assets/product1.png', // Path to your product image
    ),
  );

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // Number of columns in the grid
        crossAxisSpacing: 0.7, // Spacing between columns
        mainAxisSpacing: 0.7,
        childAspectRatio: 0.7, // Spacing between rows
      ),
      itemCount: products.length,
      itemBuilder: (context, index) {
        return ProductTile(product: products[index]);
      },
    );
  }
}

class Product {
  final String name;
  final double price;
  final String imageUrl;

  Product({
    required this.name,
    required this.price,
    required this.imageUrl,
  });
}

class ProductTile extends StatelessWidget {
  final Product product;

  ProductTile({required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            product.imageUrl,
            height: 50,
            width: 50,
            fit: BoxFit.cover,
          ),
          SizedBox(height: 50),
          Text(
            product.name,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 4),
          Text(
            '\$${product.price.toStringAsFixed(2)}',
            style: TextStyle(fontSize: 14, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
