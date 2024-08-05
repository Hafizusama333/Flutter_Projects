import 'package:flutter/material.dart';
import 'package:medical_app/Screens/home/newhome.dart';
import 'package:medical_app/Screens/navigator/navigation.dart';
import 'package:medical_app/constants/colors.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                // Blue Colored Box
                Container(
                  height: 250, // Adjust height to match the blue box size
                  decoration: BoxDecoration(
                    color: primaryclr, // Use Colors.blue for the blue color
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                    ),
                  ),
                ),
                Positioned(
                  top: 50,
                  left: 20,
                  child: CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.person,
                      size: 30,
                      color: Colors.blue,
                    ),
                  ),
                ),
                Positioned(
                  top: 50,
                  right: 70,
                  child: Stack(
                    alignment: Alignment.topRight,
                    children: [
                      Icon(
                        Icons.notifications,
                        size: 30,
                        color: Colors.white,
                      ),
                      Positioned(
                        right: 0,
                        top: 0,
                        child: Container(
                          width: 10,
                          height: 10,
                          decoration: BoxDecoration(
                            color: Colors.red,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: 50,
                  right: 20,
                  child: Icon(
                    Icons.shopping_cart,
                    size: 30,
                    color: Colors.white,
                  ),
                ),
                Positioned(
                  top: 120,
                  left: 20,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hi, Rahul',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Welcome to Nilkanth Medical Store',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                        ),
                      ),
                    ],
                  ),
                ),

                Positioned(
                  bottom: -0.5,
                  left: 20,
                  right: 20,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 10,
                          offset: Offset(0, 4),
                        ),
                      ],
                    ),
                    child: TextField(
                      onChanged: (value) {
                        // Implement search functionality here
                        print('Search query: $value');
                      },
                      decoration: InputDecoration(
                        hintText: 'Search Medicine & Healthcare products',
                        border: InputBorder.none,
                        icon: Icon(Icons.search),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Top Categories',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 16),
            Container(
              height: 400,
              child: Center(
                child: Container(
                  height: 200,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    children: [
                      SizedBox(width: 100),
                      CategoryCard(
                        color: Colors.pink,
                        label: 'Dental',
                      ),
                      SizedBox(width: 150),
                      CategoryCard(
                        color: Colors.green,
                        label: 'Wellness',
                      ),
                      SizedBox(width: 150),
                      CategoryCard(
                        color: Colors.orange,
                        label: 'Homeo',
                      ),
                      SizedBox(width: 150),
                      CategoryCard(
                        color: Colors.blue,
                        label: 'Eye care',
                      ),
                      SizedBox(width: 150),
                      CategoryCard(
                        color: Colors.purpleAccent,
                        label: 'Eye care',
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Center(
                child: Container(
                  width: 527, // Adjust the width as needed
                  height: 146, // Adjust the height as needed
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    image: DecorationImage(
                      image: AssetImage('assets/pills.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                        left: 20.0,
                        top: 20.0,
                        child: Text(
                          'Save extra on every order',
                          style: TextStyle(
                            color: textcolor,
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Positioned(
                        left: 20.0,
                        top: 20.0,
                        child: Text(
                          'Etiam mollis metus non faucibus .',
                          style: TextStyle(
                            color: newtext,
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 300,
              child: ProductGridView(),
            ),
          ],
        ),
        // Add more widgets here if needed
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  final Color color;
  final String label;

  CategoryCard({required this.color, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Container(
        height: 100,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 70,
              height: 70,
              decoration: BoxDecoration(
                color: color,
                shape: BoxShape.circle,
              ),
            ),
            SizedBox(height: 8),
            Text(
              label,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
