import 'package:flutter/material.dart';
import 'appbar.dart'; // Import your CustomScaffold from the appbar.dart file

class ContactsScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => Listing();
}

class Listing extends State<ContactsScreen> {
  @override
  Widget build(BuildContext context) {
    var arrname = [
      'Usama',
      'Ahmed',
      'Burhan',
      'Jawwad',
      'Ali',
      'Asim',
      'Yasin'
    ];
    var arrnumber = [
      '1234567890',
      '0987654321',
      '1122334455',
      '5566778899',
      '14189461641',
      '18947184616',
      '12496916515',
    ];
    double screenWidth = MediaQuery.of(context).size.width;

    return CustomScaffold(
      title: 'List',
      body: ListView.separated(
        padding: const EdgeInsets.all(8.0),
        itemBuilder: (context, index) {
          return Container(
            padding: const EdgeInsets.all(16.0),
            margin: EdgeInsets.symmetric(
              horizontal: screenWidth * 0.05, // 5% of screen width
            ),
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.6),
              borderRadius: BorderRadius.circular(10.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: Row(
              children: [
                Icon(
                  Icons.person,
                  size: 40,
                  color: Colors.blue,
                ),
                SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        arrname[index],
                        style: TextStyle(
                            fontSize: 21, fontWeight: FontWeight.w500),
                      ),
                      SizedBox(height: 8),
                      Text(
                        arrnumber[index],
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w300),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
        itemCount: arrname.length,
        separatorBuilder: (BuildContext context, int index) {
          return Divider(height: 16);
        },
      ),
    );
  }
}
