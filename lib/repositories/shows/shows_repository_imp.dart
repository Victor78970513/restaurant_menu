import 'package:dio/dio.dart';
import 'package:restaurant_menu/models/show_model.dart';
import 'package:restaurant_menu/repositories/repositories.dart';
import 'package:restaurant_menu/utils/constants.dart';

class ShowsRepositoryImp extends ShowsRepository {
  @override
  Future<List<ShowModel>> getShows() async {
    final response = await Dio().get('${Constants.apiUrl}/shows');
    if (response.statusCode != 200) {
      throw Exception(response.statusMessage);
    }
    return ((response.data) as List)
        .map((element) => ShowModel.fromJson(element))
        .toList();
  }
}
