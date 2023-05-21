part of 'show_bloc.dart';

class ShowState extends Equatable {
  final bool loading;
  final List<ShowModel> shows;
  final String error;
  const ShowState({
    this.loading = false,
    this.shows = const [],
    this.error = '',
  });

  ShowState copyWith({
    bool? loading,
    List<ShowModel>? shows,
    String? error,
  }) =>
      ShowState(
          loading: loading ?? this.loading,
          shows: shows ?? this.shows,
          error: error ?? this.error);

  @override
  List<Object> get props => [loading, shows, error];
}
