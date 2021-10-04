class Recipe {
  final String title;
  final String image;
  final int totalTime;
  final int servings;

  Recipe({required this.image, required this.title, required this.totalTime, required this.servings});

  factory Recipe.fromJson(dynamic json) {
    return Recipe(
        title: json['title'].toString(),
        image: json['image'].toString(),
        servings: json['servings'] as int ,
        totalTime: json['readyInMinutes'] as int);
  }

  static List<Recipe> recipesFromSnapshot(List snapshot) {
    return snapshot.map((data) {
      return Recipe.fromJson(data);
    }).toList();
  }

  @override
  String toString() {
    return 'Recipe {title: $title, image: $image, totalTime: $totalTime,servings :$servings}';
  }
}
