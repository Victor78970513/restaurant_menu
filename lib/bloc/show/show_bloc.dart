import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:restaurant_menu/models/models.dart';
import 'package:restaurant_menu/repositories/repositories.dart';

part 'show_event.dart';
part 'show_state.dart';

class ShowBloc extends Bloc<ShowEvent, ShowState> {
  late ShowsRepository _shows;
  ShowBloc() : super(const ShowState()) {
    _shows = ShowsRepositoryImp();
    on<OnGetShowsEvent>((event, emit) async {
      try {
        emit(state.copyWith(loading: true));
        final resp = await _shows.getShows();
        emit(state.copyWith(loading: false, shows: resp));
      } catch (error) {
        print(' EL ERROR ES ALLPLATOS: $error');
        try {
          emit(state.copyWith(
              loading: false, error: (error as dynamic)['message']));
        } catch (err) {
          emit(state.copyWith(loading: false, error: 'Ocurrio un error'));
        }
      }
    });
  }
}
