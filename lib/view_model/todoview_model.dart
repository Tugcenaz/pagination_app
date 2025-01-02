import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import '../models/todo_model.dart';

class TodoViewModel extends ChangeNotifier {
  final Dio dio = Dio();
  final String _url = 'https://dummyjson.com/todos';

   TodoModel? todoData;

  Future<TodoModel?> fetchData({required int skip, required int limit}) async {
    try {
      final args = {"skip": skip, "limit": limit};
      final Response response = await dio.request(_url, queryParameters: args);
      if (response.statusCode != 200) {
        return Future.error("Hata: ${response.statusMessage}");
      }
      final TodoModel todoModel = TodoModel.fromJson(response.data);
      todoData = todoModel;

      notifyListeners();
      return todoData;
    } catch (e) {
      return Future.error("Network error: $e");
    }
  }
}
