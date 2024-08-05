import 'package:flutter/material.dart';
import 'categories.dart';

class ProductDetailScreen extends StatelessWidget {
  final Product product;

  ProductDetailScreen({required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Product Name: ${product.title}',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
              ),
              Image.asset(
                product.imagepath,
                width: double.infinity,
                height: 200,
              ),
              SizedBox(height: 16),
              Center(
                child: Text(
                  'Price: Rs. ${product.price}',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 8),
              if (product.rating != null)
                Center(
                  child: Row(
                    children: [
                      Center(
                          child:
                              Icon(Icons.star, color: Colors.yellow, size: 20)),
                      SizedBox(width: 4),
                      Center(
                          child: Text('${product.rating}',
                              style: TextStyle(fontSize: 18))),
                    ],
                  ),
                ),
              SizedBox(height: 16),
              Center(
                child: Text(
                  'Description: ${product.description ?? "No description available."}',
                  style: TextStyle(fontSize: 16),
                ),
              ),
              Spacer(),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    // Add to cart functionality here
                  },
                  child: Text('Add to Cart'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
