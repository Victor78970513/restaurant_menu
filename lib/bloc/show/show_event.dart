part of 'show_bloc.dart';

abstract class ShowEvent extends Equatable {
  const ShowEvent();

  @override
  List<Object> get props => [];
}

class OnGetShowsEvent extends ShowEvent {}
