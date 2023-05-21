part of 'platos_bloc.dart';

class PlatosState extends Equatable {
  final bool loading;
  final List<PlatosModel> platos;
  final List<PlatosModel> breakfast;
  final List<PlatosModel> lunch;
  final List<PlatosModel> dinner;
  final List<PlatosModel> drinks;
  final List<PlatosModel> dessert;
  final String error;
  const PlatosState({
    this.dessert = const [],
    this.lunch = const [],
    this.dinner = const [],
    this.drinks = const [],
    this.loading = false,
    this.error = '',
    this.platos = const [],
    this.breakfast = const [],
  });

  PlatosState copyWith({
    List<PlatosModel>? dessert,
    List<PlatosModel>? platos,
    List<PlatosModel>? breakfast,
    List<PlatosModel>? lunch,
    List<PlatosModel>? dinner,
    List<PlatosModel>? drinks,
    bool? loading,
    String? error,
  }) =>
      PlatosState(
        dessert: dessert ?? this.dessert,
        lunch: lunch ?? this.lunch,
        dinner: dinner ?? this.dinner,
        drinks: drinks ?? this.drinks,
        breakfast: breakfast ?? this.breakfast,
        loading: loading ?? this.loading,
        platos: platos ?? this.platos,
        error: error ?? this.error,
      );

  @override
  List<Object> get props =>
      [loading, platos, error, breakfast, lunch, dinner, drinks, dessert];
}
