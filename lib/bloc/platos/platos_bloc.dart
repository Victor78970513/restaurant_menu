import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:restaurant_menu/models/plato.dart';
import 'package:restaurant_menu/repositories/platos/platos_repositories.dart';
import 'package:restaurant_menu/repositories/platos/platos_repository_imp.dart';

part 'platos_event.dart';
part 'platos_state.dart';

class PlatosBloc extends Bloc<PlatosEvent, PlatosState> {
  late PlatosRepository _platosRepository;
  late PlatosRepository _breakfast;
  late PlatosRepository _lunch;
  late PlatosRepository _dinner;
  late PlatosRepository _drink;
  late PlatosRepository _dessert;

  PlatosBloc() : super(const PlatosState()) {
    _platosRepository = PlatosRepositoryImp();
    _breakfast = PlatosRepositoryImp();
    _lunch = PlatosRepositoryImp();
    _dinner = PlatosRepositoryImp();
    _drink = PlatosRepositoryImp();
    _dessert = PlatosRepositoryImp();

    on<OnGetAllPlatos>((event, emit) async {
      try {
        emit(state.copyWith(loading: true));
        final resp = await _platosRepository.getAllPlatos();
        emit(state.copyWith(loading: false, platos: resp));
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
    on<OnGetBreakFastEvent>((event, emit) async {
      try {
        emit(state.copyWith(loading: true));
        final resp = await _breakfast.getBreakFast();
        emit(state.copyWith(loading: false, breakfast: resp));
      } catch (error) {
        print(' EL ERROR ES BREAKFAST: $error');
        try {
          emit(state.copyWith(
              loading: false, error: (error as dynamic)['message']));
        } catch (err) {
          emit(state.copyWith(loading: false, error: 'Ocurrio un error'));
        }
      }
    });

    on<OnGetLunchEvent>((event, emit) async {
      try {
        emit(state.copyWith(loading: true));
        final resp = await _lunch.getLunch();
        emit(state.copyWith(loading: false, lunch: resp));
      } catch (error) {
        print(' EL ERROR ES LUNCH: $error');
        try {
          emit(state.copyWith(
              loading: false, error: (error as dynamic)['message']));
        } catch (err) {
          emit(state.copyWith(loading: false, error: 'Ocurrio un error'));
        }
      }
    });
    on<OnGetDinnerEvent>((event, emit) async {
      try {
        emit(state.copyWith(loading: true));
        final resp = await _dinner.getDinner();
        emit(state.copyWith(loading: false, dinner: resp));
      } catch (error) {
        print(' EL ERROR ES LUNCH: $error');
        try {
          emit(state.copyWith(
              loading: false, error: (error as dynamic)['message']));
        } catch (err) {
          emit(state.copyWith(loading: false, error: 'Ocurrio un error'));
        }
      }
    });
    on<OnGetDrinkEvent>((event, emit) async {
      try {
        emit(state.copyWith(loading: true));
        final resp = await _drink.getDrink();
        emit(state.copyWith(loading: false, drinks: resp));
      } catch (error) {
        print(' EL ERROR ES LUNCH: $error');
        try {
          emit(state.copyWith(
              loading: false, error: (error as dynamic)['message']));
        } catch (err) {
          emit(state.copyWith(loading: false, error: 'Ocurrio un error'));
        }
      }
    });
    on<OnGetDessertEvent>((event, emit) async {
      try {
        emit(state.copyWith(loading: true));
        final resp = await _dessert.getDessert();
        emit(state.copyWith(loading: false, dessert: resp));
      } catch (error) {
        print(' EL ERROR ES LUNCH: $error');
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
