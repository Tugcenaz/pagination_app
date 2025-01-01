import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:pagination_app/models/post_model.dart';

class PostViewModel extends ChangeNotifier {
  final Dio dio = Dio();
  final String _url = "https://dummyjson.com/posts";
  PostModel? postData;

  Future<PostModel?> fetchData({required int skip,required int limit}) async {
    final args = {
      "skip": skip,
      "limit":limit
    };
    final Response response = await dio.request(_url,queryParameters: args);
    if (response.statusCode != 200) {
      return Future.error("Hata: ${response.statusMessage}");
    }
    final PostModel postModel = PostModel.fromJson(response.data);
    postData = postModel;

    notifyListeners();
    return postData;
  }
}
