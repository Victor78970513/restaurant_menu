part of 'platos_bloc.dart';

abstract class PlatosEvent extends Equatable {
  const PlatosEvent();

  @override
  List<Object> get props => [];
}

class OnGetAllPlatos extends PlatosEvent {}
