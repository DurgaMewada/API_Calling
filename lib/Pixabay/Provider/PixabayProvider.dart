
import 'package:flutter/cupertino.dart';
import '../Helper/HelperForApi.dart';
import '../Modal/PixabayModal.dart';

class PixabayProvider extends ChangeNotifier {
  ApiHelper apiHelper = ApiHelper();
  PixaBayModal? pixaBayModal;
  String searchImg = '';

  void getImages(String image) {
    searchImg = image;
    notifyListeners();
  }

  Future<PixaBayModal?> fromMap(String img) async {
    final data = await apiHelper.fetchApiData(img);
    pixaBayModal = PixaBayModal.fromjson(data);
    return pixaBayModal;
  }
}