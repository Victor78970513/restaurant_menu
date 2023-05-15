part of 'food_bloc.dart';

@immutable
abstract class FoodEvent {}

class OnPLatosEvent extends FoodEvent {
  final List platos;

  OnPLatosEvent(this.platos);
}
