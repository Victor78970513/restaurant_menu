part of 'food_bloc.dart';

@immutable
class FoodState {
  final List foods;

  FoodState({this.foods = const []});

  FoodState copyWith({
    List? foods,
  }) =>
      FoodState(
        foods: foods ?? this.foods,
      );
}
