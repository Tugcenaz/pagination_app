import 'dart:convert';
PostModel postModelFromJson(String str) => PostModel.fromJson(json.decode(str));
String postModelToJson(PostModel data) => json.encode(data.toJson());
class PostModel {
  PostModel({
      this.posts, 
      this.total, 
      this.skip, 
      this.limit,});

  PostModel.fromJson(dynamic json) {
    if (json['posts'] != null) {
      posts = [];
      json['posts'].forEach((v) {
        posts?.add(Posts.fromJson(v));
      });
    }
    total = json['total'];
    skip = json['skip'];
    limit = json['limit'];
  }
  List<Posts>? posts;
  int? total;
  int? skip;
  int? limit;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (posts != null) {
      map['posts'] = posts?.map((v) => v.toJson()).toList();
    }
    map['total'] = total;
    map['skip'] = skip;
    map['limit'] = limit;
    return map;
  }

}

Posts postsFromJson(String str) => Posts.fromJson(json.decode(str));
String postsToJson(Posts data) => json.encode(data.toJson());
class Posts {
  Posts({
      this.id, 
      this.title, 
      this.body, 
      this.tags, 
      this.reactions, 
      this.views, 
      this.userId,});

  Posts.fromJson(dynamic json) {
    id = json['id'];
    title = json['title'];
    body = json['body'];
    tags = json['tags'] != null ? json['tags'].cast<String>() : [];
    reactions = json['reactions'] != null ? Reactions.fromJson(json['reactions']) : null;
    views = json['views'];
    userId = json['userId'];
  }
  int? id;
  String? title;
  String? body;
  List<String>? tags;
  Reactions? reactions;
  int? views;
  int? userId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['title'] = title;
    map['body'] = body;
    map['tags'] = tags;
    if (reactions != null) {
      map['reactions'] = reactions?.toJson();
    }
    map['views'] = views;
    map['userId'] = userId;
    return map;
  }

}

Reactions reactionsFromJson(String str) => Reactions.fromJson(json.decode(str));
String reactionsToJson(Reactions data) => json.encode(data.toJson());
class Reactions {
  Reactions({
      this.likes, 
      this.dislikes,});

  Reactions.fromJson(dynamic json) {
    likes = json['likes'];
    dislikes = json['dislikes'];
  }
  int? likes;
  int? dislikes;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['likes'] = likes;
    map['dislikes'] = dislikes;
    return map;
  }

}