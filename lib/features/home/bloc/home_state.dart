part of 'home_bloc.dart';

int get time => DateTime.now().millisecondsSinceEpoch;

@immutable
abstract class HomeState extends Equatable {
  const HomeState();
}

class HomeInitialState extends HomeState {
  @override
  List<Object?> get props => [time];
}

class HomeLoadingState extends HomeState {
  final LoadingStage stage;

  const HomeLoadingState(this.stage);

  @override
  List<Object?> get props => [time, stage];
}

class ValuesLoadedState extends HomeState {
  final Map<String, AnotherTunable> tunables;

  const ValuesLoadedState(this.tunables);

  @override
  List<Object?> get props => [time, tunables];
}
