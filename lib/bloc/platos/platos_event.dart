part of 'platos_bloc.dart';

abstract class PlatosEvent extends Equatable {
  const PlatosEvent();

  @override
  List<Object> get props => [];
}

class OnGetAllPlatos extends PlatosEvent {}

class OnGetBreakFastEvent extends PlatosEvent {}

class OnGetLunchEvent extends PlatosEvent {}

class OnGetDinnerEvent extends PlatosEvent {}

class OnGetDrinksEvent extends PlatosEvent {}
