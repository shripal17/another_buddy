part of 'home_cubit.dart';

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
  final Map<TunableCategory, List<AnotherTunable>> tunables;

  const ValuesLoadedState(this.tunables);

  @override
  List<Object?> get props => [time];
}

class ValueUpdateFailedState extends ValuesLoadedState {
  final String failedTunableName;

  const ValueUpdateFailedState(super.tunables, this.failedTunableName);

  @override
  List<Object?> get props => [time, failedTunableName];
}
