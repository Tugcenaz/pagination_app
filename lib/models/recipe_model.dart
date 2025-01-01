import 'dart:convert';
RecipeModel recipeModelFromJson(String str) => RecipeModel.fromJson(json.decode(str));
String recipeModelToJson(RecipeModel data) => json.encode(data.toJson());
class RecipeModel {
  RecipeModel({
      this.recipes, 
      this.total, 
      this.skip, 
      this.limit,});

  RecipeModel.fromJson(dynamic json) {
    if (json['recipes'] != null) {
      recipes = [];
      json['recipes'].forEach((v) {
        recipes?.add(Recipes.fromJson(v));
      });
    }
    total = json['total'];
    skip = json['skip'];
    limit = json['limit'];
  }
  List<Recipes>? recipes;
  int? total;
  int? skip;
  int? limit;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (recipes != null) {
      map['recipes'] = recipes?.map((v) => v.toJson()).toList();
    }
    map['total'] = total;
    map['skip'] = skip;
    map['limit'] = limit;
    return map;
  }

}

Recipes recipesFromJson(String str) => Recipes.fromJson(json.decode(str));
String recipesToJson(Recipes data) => json.encode(data.toJson());
class Recipes {
  Recipes({
      this.id, 
      this.name, 
      this.ingredients, 
      this.instructions, 
      this.prepTimeMinutes, 
      this.cookTimeMinutes, 
      this.servings, 
      this.difficulty, 
      this.cuisine, 
      this.caloriesPerServing, 
      this.tags, 
      this.userId, 
      this.image, 
      this.rating, 
      this.reviewCount, 
      this.mealType,});

  Recipes.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    ingredients = json['ingredients'] != null ? json['ingredients'].cast<String>() : [];
    instructions = json['instructions'] != null ? json['instructions'].cast<String>() : [];
    prepTimeMinutes = json['prepTimeMinutes'];
    cookTimeMinutes = json['cookTimeMinutes'];
    servings = json['servings'];
    difficulty = json['difficulty'];
    cuisine = json['cuisine'];
    caloriesPerServing = json['caloriesPerServing'];
    tags = json['tags'] != null ? json['tags'].cast<String>() : [];
    userId = json['userId'];
    image = json['image'];
    rating = json['rating'];
    reviewCount = json['reviewCount'];
    mealType = json['mealType'] != null ? json['mealType'].cast<String>() : [];
  }
  int? id;
  String? name;
  List<String>? ingredients;
  List<String>? instructions;
  int? prepTimeMinutes;
  int? cookTimeMinutes;
  int? servings;
  String? difficulty;
  String? cuisine;
  int? caloriesPerServing;
  List<String>? tags;
  int? userId;
  String? image;
  double? rating;
  int? reviewCount;
  List<String>? mealType;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['ingredients'] = ingredients;
    map['instructions'] = instructions;
    map['prepTimeMinutes'] = prepTimeMinutes;
    map['cookTimeMinutes'] = cookTimeMinutes;
    map['servings'] = servings;
    map['difficulty'] = difficulty;
    map['cuisine'] = cuisine;
    map['caloriesPerServing'] = caloriesPerServing;
    map['tags'] = tags;
    map['userId'] = userId;
    map['image'] = image;
    map['rating'] = rating;
    map['reviewCount'] = reviewCount;
    map['mealType'] = mealType;
    return map;
  }

}