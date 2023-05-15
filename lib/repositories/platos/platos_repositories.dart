import 'package:dio/dio.dart';
import 'package:restaurant_menu/models/plato.dart';
import 'package:restaurant_menu/repositories/platos/platos_repository_impl.dart';

class PlatosRepositoryImp extends PlatosRepository {
  @override
  Future<List<PlatosModel>> getAllPlatos() async {
    var response = await Dio().get("http://172.30.160.1/platos");
    return [];
  }
}
