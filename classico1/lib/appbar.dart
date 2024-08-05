import 'package:classico1/ContactsScreen.dart';
import 'package:classico1/Homescreen.dart';
import 'package:classico1/form.dart';
import 'package:flutter/material.dart';

class CustomScaffold extends StatelessWidget {
  final String title;
  final Widget body;

  CustomScaffold({required this.title, required this.body});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(title),
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {
              
            },
          ),
        ],
      ),
      body: body,
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.green,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/logo.jpg',
                    width: 100, 
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Welcome',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              title: Text('Home'),
              onTap: () {
                Navigator.pop(context); // Close the drawer
                // Navigate to HomeScreen
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomeScreen()),
                );
              },
            ),
            ListTile(
              title: Text('Contacts'),
              onTap: () {
                Navigator.pop(context); // Close the drawer
                // Navigate to ContactsScreen
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ContactsScreen()),
                );
              },
            ),
            ListTile(
              title: Text('Login'),
              onTap: () {
                Navigator.pop(context); // Close the drawer
                // Navigate to LoginScreen
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                );
              },
            ),
            Divider(),
            ListTile(
              title: Text('  CONTACT ME:\n Ussamajamil@gmail.com  '),
              
              onTap: () {
                
              },
            ),
          ],
        ),
      ),
    );
  }
}
