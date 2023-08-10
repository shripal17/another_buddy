part of 'apps_selection_cubit.dart';

abstract class AppsSelectionState extends Equatable {
  const AppsSelectionState();
}

class AppsSelectionInitialState extends AppsSelectionState {
  final List<String> selectedApps;

  const AppsSelectionInitialState(this.selectedApps);

  @override
  List<Object> get props => [selectedApps];
}

class AppsSelectionUpdateState extends AppsSelectionState {
  final List<String> selectedApps;

  const AppsSelectionUpdateState(this.selectedApps);

  @override
  List<Object?> get props => [selectedApps, DateTime.now().millisecondsSinceEpoch];
}
