import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:pagination_app/models/recipe_model.dart';

class RecipeViewModel extends ChangeNotifier {
  final Dio dio = Dio();
  final String _url = "https://dummyjson.com/recipes";
  RecipeModel? recipeData;

  Future<void> fetchData() async {
    final args = {"skip": 0,};
    final Response response = await dio.request(_url);
    if (response.statusCode != 200) {
      return Future.error("Hata: ${response.statusMessage}");
    }
    final RecipeModel recipeModel = RecipeModel.fromJson(response.data);
    print("service recipemodel : $recipeModel");
    recipeData = recipeModel;
    notifyListeners();

  }
}
