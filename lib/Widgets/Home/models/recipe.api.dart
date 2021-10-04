import 'dart:convert';
import 'package:app/Widgets/Home/models/recipe.dart';
import 'package:http/http.dart' as http;

class RecipeApi {
  static Future<List<Recipe>> getRecipe() async {

        

    var url = Uri.parse('https://api.spoonacular.com/recipes/random?number=50&apiKey=4beace74e6e04f70a4daee75900ae792&');

    final response = await http.get(url);

    Map data = jsonDecode(response.body);
    List _temp = [];

    for (var i in data['recipes']) {
      _temp.add(i);
    }

    return Recipe.recipesFromSnapshot(_temp);
  }
}
