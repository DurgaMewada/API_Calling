import 'dart:convert';
import 'package:http/http.dart' as http;

class RecipeHelper {
  Future fetchApiData() async {
    String api = "https://dummyjson.com/recipes";
    Uri url = Uri.parse(api);
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final json = response.body;
        return jsonDecode(json);
      } else {}
  }
}