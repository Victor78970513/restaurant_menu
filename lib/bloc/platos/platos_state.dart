part of 'platos_bloc.dart';

class PlatosState extends Equatable {
  final bool loading;
  final List<PlatosModel> platos;
  final String error;
  const PlatosState({
    this.loading = false,
    this.error = '',
    this.platos = const [],
  });

  PlatosState copyWith({
    bool? loading,
    List<PlatosModel>? platos,
    String? error,
  }) =>
      PlatosState(
        loading: loading ?? this.loading,
        platos: platos ?? this.platos,
        error: error ?? this.error,
      );

  @override
  List<Object> get props => [loading, platos, error];
}
