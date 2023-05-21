import 'package:restaurant_menu/models/models.dart';

abstract class ShowsRepository {
  Future<List<ShowModel>> getShows();
}
