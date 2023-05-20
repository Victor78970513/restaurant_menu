import 'package:restaurant_menu/models/plato.dart';

abstract class PlatosRepository {
  Future<List<PlatosModel>> getAllPlatos();
  Future<List<PlatosModel>> getBreakFast();
  Future<List<PlatosModel>> getLunch();
}
