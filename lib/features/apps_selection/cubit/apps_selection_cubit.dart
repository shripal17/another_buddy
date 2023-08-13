import 'package:bloc/bloc.dart';
import 'package:dartx/dartx.dart';
import 'package:equatable/equatable.dart';
import 'package:device_apps/device_apps.dart';

part 'apps_selection_state.dart';

class AppsSelectionCubit extends Cubit<AppsSelectionState> {
  AppsSelectionCubit({required List<String> selectedApps})
      : super(AppsSelectionInitialState(selectedApps)) {
    initialSelection = selectedApps;
    currentSelection = List.from(initialSelection);
  }

  late final List<String> initialSelection;
  final List<Application> allApps = [];
  final List<Application> filteredApps = [];
  late final List<String> currentSelection;
  String searchTerm = "";
  bool isSearchActive = false;

  Future<void> loadAppsList() async {
    final apps =
        await DeviceApps.getInstalledApplications(includeAppIcons: true);
    allApps.addAll(apps.sortedBy((app) => app.appName));
    emit(AppsSelectionUpdateState(currentSelection));
  }

  void updateSearch(String newTerm) {
    searchTerm = newTerm.trim().toLowerCase();
    filteredApps.clear();
    filteredApps.addAll(
      allApps.filter(
        (element) =>
            element.packageName.contains(searchTerm) ||
            element.appName.toLowerCase().contains(searchTerm),
      ),
    );
    emit(AppsSelectionUpdateState(currentSelection));
  }

  List<Application> get appsToDisplay {
    if (searchTerm.isNotEmpty) {
      return filteredApps;
    }
    return allApps;
  }

  void updateSelection(Application app, bool isSelected) {
    if (isSelected) {
      currentSelection.add(app.packageName);
    } else {
      currentSelection.remove(app.packageName);
    }
    emit(AppsSelectionUpdateState(currentSelection));
  }

  bool isAppSelected(Application app) {
    return currentSelection
        .filter((packageName) => app.packageName == packageName)
        .isNotEmpty;
  }
}
