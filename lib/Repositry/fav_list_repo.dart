import 'package:blflutter/Model/fav_list_model.dart';

class FavouriteRepository {
  Future<List<FavouriteListModel>> fetchList() async {
    await Future.delayed(const Duration(seconds: 5));
    return List.of(_generateList(10));
  }

  List<FavouriteListModel> _generateList(int length) {
    return List.generate(length, (index) => FavouriteListModel(Id: index.toString(), value: 'Item $index'));
  }
}
