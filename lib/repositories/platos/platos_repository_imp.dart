import 'package:dio/dio.dart' show Dio;

import 'package:restaurant_menu/models/plato.dart';
import 'package:restaurant_menu/repositories/platos/platos_repositories.dart';
import 'package:restaurant_menu/utils/constants.dart';

class PlatosRepositoryImp extends PlatosRepository {
  @override
  Future<List<PlatosModel>> getAllPlatos() async {
    final response = await Dio().get('${Constants.apiUrl}/platos');
    if (response.statusCode != 200) {
      throw Exception(response.statusMessage);
    }
    return ((response.data) as List)
        .map((element) => PlatosModel.fromJson(element))
        .toList();
  }

  @override
  Future<List<PlatosModel>> getBreakFast() async {
    final response = await Dio().get('${Constants.apiUrl}/breakfast');
    if (response.statusCode != 200) throw Exception(response.statusMessage);
    return ((response.data) as List)
        .map((element) => PlatosModel.fromJson(element))
        .toList();
  }

  @override
  Future<List<PlatosModel>> getLunch() async {
    final response = await Dio().get('${Constants.apiUrl}/lunch');
    if (response.statusCode != 200) throw Exception(response.statusMessage);
    return ((response.data) as List)
        .map((element) => PlatosModel.fromJson(element))
        .toList();
  }
}
