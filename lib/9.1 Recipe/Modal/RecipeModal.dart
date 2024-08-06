class RecipeModal {
  late List recipes;
  late int total, skip, limit;

  RecipeModal({
    required this.recipes,
    required this.total,
    required this.skip,
    required this.limit,
  });

  factory RecipeModal.fromJson(Map m1) {
    return RecipeModal(
      recipes: (m1['recipes'] as List)
          .map(
            (e) => Recipe.fromJson(e),
          )
          .toList(),
      total: m1['total'],
      skip: m1['skip'],
      limit: m1['limit'],
    );
  }
}

class Recipe {
  late String name, difficulty, cuisine, image;
  late List ingredients, instructions, mealType, tags;
  late int id,
      prepTimeMinutes,
      cookTimeMinutes,
      servings,
      caloriesPerServing,
      userId,
      reviewCount;

  Recipe({
    required this.name,
    required this.difficulty,
    required this.cuisine,
    required this.image,
    required this.id,
    required this.prepTimeMinutes,
    required this.cookTimeMinutes,
    required this.servings,
    required this.caloriesPerServing,
    required this.userId,
    required this.reviewCount,
    required this.ingredients,
    required this.instructions,
    required this.tags,
    required this.mealType,
  });

  factory Recipe.fromJson(Map m1) {
    return Recipe(
      name: m1['name'],
      difficulty: m1['difficulty'],
      cuisine: m1['cuisine'],
      image: m1['image'],
      id: m1['id'],
      prepTimeMinutes: m1['prepTimeMinutes'],
      cookTimeMinutes: m1['cookTimeMinutes'],
      servings: m1['servings'],
      caloriesPerServing: m1['caloriesPerServing'],
      userId: m1['userId'],
      reviewCount: m1['reviewCount'],
      ingredients: m1['ingredients'],
      instructions: m1['instructions'],
      tags: m1['tags'],
      mealType: m1['mealType'],
    );
  }
}
