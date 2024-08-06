import 'package:flutter/foundation.dart';
import '../Helper/RecipeHelper.dart';
import '../Modal/RecipeModal.dart';

class RecipeProvider extends ChangeNotifier {
  RecipeHelper recipeHelper = RecipeHelper();
  RecipeModal? recipeModal;
  String searchImg = '';

  Future<RecipeModal?> fromMap() async {
      final data = await recipeHelper.fetchApiData();
      if (data.isNotEmpty) {
        recipeModal = RecipeModal.fromJson(data);
        notifyListeners();
        return recipeModal;
      } else {}
  }
}