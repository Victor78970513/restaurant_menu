import 'package:restaurant_menu/models/plato.dart';

abstract class PlatosRepository {
  Future<List<PlatosModel>> getAllPlatos();
  Future<List<PlatosModel>> getBreakFast();
  Future<List<PlatosModel>> getLunch();
  Future<List<PlatosModel>> getDinner();
  Future<List<PlatosModel>> getDessert();
  Future<List<PlatosModel>> getDrink();
}
