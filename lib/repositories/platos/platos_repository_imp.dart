import 'package:dio/dio.dart' show Dio;

import 'package:restaurant_menu/models/plato.dart';
import 'package:restaurant_menu/repositories/platos/platos_repositories.dart';
import 'package:restaurant_menu/utils/constants.dart';

class PlatosRepositoryImp extends PlatosRepository {
  Future<List<PlatosModel>> getResponse(String endPoint) async {
    final response = await Dio().get('${Constants.apiUrl}/$endPoint');
    if (response.statusCode != 200) {
      throw Exception(response.statusMessage);
    }
    return ((response.data) as List)
        .map((element) => PlatosModel.fromJson(element))
        .toList();
  }

  @override
  Future<List<PlatosModel>> getAllPlatos() => getResponse('platos');

  @override
  Future<List<PlatosModel>> getBreakFast() => getResponse('breakfast');

  @override
  Future<List<PlatosModel>> getLunch() => getResponse('lunch');

  @override
  Future<List<PlatosModel>> getDinner() => getResponse('dinner');

  @override
  Future<List<PlatosModel>> getDessert() => getResponse('dessert');

  @override
  Future<List<PlatosModel>> getDrink() => getResponse('drink');
}
