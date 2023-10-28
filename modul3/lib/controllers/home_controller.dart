import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../data/models/todo.dart';

class HomeController extends GetxController {
  late Future<Todo> futureTodos;

  @override
  void onInit() {
    super.onInit();
    futureTodos = fetchTodos();
  }

  Future<Todo> fetchTodos() async {
    var response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/todos/5'));
    if (response.statusCode == 200) {
      return Todo.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load album');
    }
  }
}
