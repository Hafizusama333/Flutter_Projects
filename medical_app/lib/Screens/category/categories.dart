import 'package:flutter/material.dart';
import 'productdetails.dart';

class Categories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {},
        ),
        title: Text('Diabetes Care'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Categories',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            Center(
              child: Container(
                height: 150,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    CategoryCard(
                      title: 'Sugar Substitute',
                      imagePath: 'assets/pp1.png',
                    ),
                    CategoryCard(
                      title: 'Juices & Vinegars',
                      imagePath: 'assets/pp2.png',
                    ),
                    CategoryCard(
                      title: 'Vitamins Medicines',
                      imagePath: 'assets/pp3.png',
                    ),
                    CategoryCard(
                      title: 'Sugar Substitute',
                      imagePath: 'assets/pp1.png',
                    ),
                    CategoryCard(
                      title: 'Sugar Substitute',
                      imagePath: 'assets/pp1.png',
                    ),
                    CategoryCard(
                      title: 'Sugar Substitute',
                      imagePath: 'assets/pp1.png',
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'All Products',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 2,
                crossAxisSpacing: 50,
                mainAxisSpacing: 20,
              ),
              itemCount: product.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProductDetailScreen(
                          product: product[index],
                        ),
                      ),
                    );
                  },
                  child: ProductCard(
                    title: product[index].title,
                    imagePath: product[index].imagepath,
                    price: product[index].price,
                    rating: product[index].rating,
                    discount: product[index].discount,
                    onSale: product[index].onSale,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  final String title;
  final String imagePath;

  CategoryCard({required this.title, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 200,
      margin: EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.grey[200],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            imagePath,
            height: 60,
            width: 60,
          ),
          SizedBox(height: 8),
          Text(
            title,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class Product {
  const Product({
    required this.imagepath,
    required this.title,
    required this.price,
    this.rating,
    this.discount,
    this.onSale = false,
    this.description,
  });

  final String imagepath;
  final String title;
  final int price;
  final double? rating;
  final int? discount;
  final bool onSale;
  final String? description;
}

const List<Product> product = <Product>[
  Product(
    imagepath: 'assets/p_i1.png',
    title: 'Blouse',
    price: 30,
    rating: 4.5,
    discount: 10,
    onSale: true,
  ),
  Product(
    imagepath: 'assets/p_i2.png',
    title: 'ACCU-CHECK ACTIVE',
    price: 112,
    rating: 4.0,
  ),
  Product(
    imagepath: 'assets/i_21.png',
    title: 'ACCU-CHECK ACTIVE',
    price: 112,
    discount: 15,
  ),
  Product(
    imagepath: 'assets/pp1.png',
    title: 'ACCU-CHECK ACTIVE',
    price: 112,
    onSale: true,
  ),
];

class ProductCard extends StatelessWidget {
  final String title;
  final String imagePath;
  final int price;
  final double? rating;
  final int? discount;
  final bool onSale;

  ProductCard({
    required this.title,
    required this.imagePath,
    required this.price,
    this.rating,
    this.discount,
    required this.onSale,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8),
                    topRight: Radius.circular(8),
                  ),
                  child: Image.asset(
                    imagePath,
                    width: double.infinity,
                    height: 100,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  title,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text('Rs. $price'),
              ),
              if (rating != null)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    children: [
                      Icon(Icons.star, color: Colors.yellow, size: 16),
                      SizedBox(width: 4),
                      Text('$rating'),
                    ],
                  ),
                ),
              if (discount != null)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    'Discount: $discount%',
                    style: TextStyle(color: Colors.green),
                  ),
                ),
            ],
          ),
          if (onSale)
            Positioned(
              top: 0,
              left: 0,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8),
                    bottomRight: Radius.circular(8),
                  ),
                ),
                child: Text(
                  'SALE',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          if (discount != null)
            Positioned(
              top: 0,
              right: 0,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(8),
                    bottomLeft: Radius.circular(8),
                  ),
                ),
                child: Text(
                  '$discount% OFF',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
