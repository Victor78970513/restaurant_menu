import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
import 'package:restaurant_menu/models/plato.dart';

part 'food_event.dart';
part 'food_state.dart';

class FoodBloc extends Bloc<FoodEvent, FoodState> {
  final String baseUrl = "http://172.30.160.1:3000/platos";
  FoodBloc() : super(FoodState()) {
    _onPlatos();
  }
  Future<void> _onPlatos() async {
    final url = Uri.parse(baseUrl);
    final response = await http.get(url);
    final List<dynamic> data = json.decode(response.body);
    final List<PlatoResponse> platos =
        data.map((item) => PlatoResponse.fromMap(item)).toList();
  }
}
