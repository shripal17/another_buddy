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

class HomeRootCheckedState extends HomeState {
  final bool available;

  const HomeRootCheckedState(this.available);

  @override
  List<Object?> get props => [time, available];
}

class HomeRootAccessCheckedState extends HomeState {
  final bool granted;

  const HomeRootAccessCheckedState(this.granted);

  @override
  List<Object?> get props => [time, granted];
}
