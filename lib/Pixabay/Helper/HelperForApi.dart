import 'dart:convert';

import 'package:http/http.dart';
import 'package:http/http.dart' as http;
class ApiHelper
{

  Future<Map> fetchApiData(String search)
  async {
    String api = "https://pixabay.com/api/?key=45138698-8a65ae4d5f3f50f1c159a45fb&q=$search&image_type=photo";
    Uri url = Uri.parse(api);
    Response response = await http.get(url);
    if(response.statusCode == 200)
    {
      final json = response.body;
      Map data = jsonDecode(json);
      return data;
    }
    else {
      return {};
    }
  }
}