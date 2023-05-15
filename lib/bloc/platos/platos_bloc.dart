import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:restaurant_menu/models/plato.dart';

part 'platos_event.dart';
part 'platos_state.dart';

class PlatosBloc extends Bloc<PlatosEvent, PlatosState> {
  PlatosBloc() : super(PlatosState()) {
    on<OnGetAllPlatos>((event, emit) async {
      try {
        emit(state.copyWith(loading: true));
        // TODO: final resp = // LLAMADO DE LA API
        emit(state.copyWith(loading: false));
      } catch (error) {
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
