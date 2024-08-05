import 'package:flutter/material.dart';
import 'api_Service.dart';

class UserDataScreen extends StatefulWidget {
  @override
  _UserDataScreenState createState() => _UserDataScreenState();
}

class _UserDataScreenState extends State<UserDataScreen> {
  List<dynamic> users = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchUserData();
  }

  _fetchUserData() async {
    var response = await ApiService().getUsers();
    if (response['data'] != null) {
      setState(() {
        users = response['data'];
        isLoading = false;
      });
    } else {
      setState(() {
        isLoading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Failed to load user data'),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Data'),
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: users.length,
              itemBuilder: (context, index) {
                final user = users[index];
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(user['avatar']),
                  ),
                  title: Text(user['first_name'] + ' ' + user['last_name']),
                  subtitle: Text(user['email']),
                );
              },
            ),
    );
  }
}
