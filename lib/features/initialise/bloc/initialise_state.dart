part of 'initialise_bloc.dart';

int get time => DateTime.now().millisecondsSinceEpoch;

@immutable
abstract class InitialiseState extends Equatable {
  const InitialiseState();
}

class InitialState extends InitialiseState {
  @override
  List<Object?> get props => [time];
}

class LoadingState extends InitialiseState {
  final LoadingStage stage;

  const LoadingState(this.stage);

  @override
  List<Object?> get props => [time, stage];
}

class RootCheckedState extends InitialiseState {
  final bool available;

  const RootCheckedState(this.available);

  @override
  List<Object?> get props => [time, available];
}

class RootAccessCheckedState extends InitialiseState {
  final bool granted;

  const RootAccessCheckedState(this.granted);

  @override
  List<Object?> get props => [time, granted];
}
