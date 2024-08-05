import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class TodoProvider with ChangeNotifier {
  List<dynamic> _todos = [];

  List<dynamic> get todos => _todos;

  Future<void> fetchTodos() async {
    try {
      var request =
          http.Request('GET', Uri.parse('https://reqres.in/api/users?page=2'));

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        String responseBody = await response.stream.bytesToString();
        Map<String, dynamic> data = jsonDecode(responseBody);
        _todos = data['data'];
        notifyListeners();
      } else {
        print(response.reasonPhrase);
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
