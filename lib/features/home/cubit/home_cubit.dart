import 'dart:convert';

import 'package:another_buddy/model/loading_stage.dart';
import 'package:another_buddy/model/tunables/another_tunable.dart';
import 'package:another_buddy/util/pref_constants.dart';
import 'package:another_buddy/util/shared_prefs.dart';
import 'package:dartx/dartx.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kiwi/kiwi.dart';
import 'package:root/root.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitialState()) {
    for (final tunableMirror in allTunables) {
      final tunable = tunableMirror.newInstance('', []) as AnotherTunable;
      tunable.name = tunableMirror.simpleName;
      tunableInstances[tunableMirror.simpleName] = tunable;
    }
  }

  late final prefs = KiwiContainer().resolve<SharedPrefs>();

  final allTunables = tunable.annotatedClasses;
  final tunableInstances = <String, AnotherTunable>{};
  final _originalValues = <String, Object>{};

  bool _initialLoadDone = false;

  void _emitValuesState() {
    emit(ValuesLoadedState(_groupedTunables));
  }

  Map<TunableCategory, List<AnotherTunable>> get _groupedTunables {
    final grouped =
        tunableInstances.values.groupBy((tunable) => tunable.category);
    grouped.forEach((key, value) {
      grouped[key] = value.sortedBy((element) => element.index);
    });
    return grouped;
  }

  Future<void> fetchCurrentValues() async {
    if (!_initialLoadDone) {
      emit(const HomeLoadingState(LoadingStage.initialLoad));
    }
    await Future.wait(tunableInstances.keys.map((tunableName) =>
        _loadValue(tunableName, tunableInstances[tunableName]!)));
    _initialLoadDone = true;
    _emitValuesState();
  }

  Future<void> _loadValue(String tunableName, AnotherTunable tunable) async {
    final readValue = Root.exec(cmd: "cat /sys/class/misc/${tunable.path}");
    if (tunable is AnotherStringTunable) {
      String value = await readValue ?? "";
      if (value == "nul\n") {
        value = "";
      }
      tunable.value = value.trim();
    } else {
      tunable.value = num.tryParse(await readValue ?? "") ?? 0.0;
    }
    _originalValues[tunableName] = tunable.value!;
  }

  Future<void> updateTunableFile(String tunableKey, Object newValue) async {
    print("Updating $tunableKey with new value: $newValue");
    final oldValue = tunableInstances[tunableKey]?.value;
    final tunable = tunableInstances[tunableKey]!;
    final filePath = "/sys/class/misc/${tunable.path}";
    final updatedValue =
        await Root.exec(cmd: "echo \"$newValue\" > $filePath && cat $filePath");
    _updatePrefs(filePath, newValue);
    if (updatedValue?.trim() == newValue.toString().trim()) {
      tunableInstances[tunableKey]?.value = newValue;
      _originalValues[tunableKey] = newValue;
      print("Value update for $tunableKey successful");
    } else {
      tunableInstances[tunableKey]?.value = oldValue;
      emit(ValueUpdateFailedState(_groupedTunables, tunableKey));
      print("output: $updatedValue");
    }
  }

  void updateUIValue(String tunableKey, Object newValue) {
    tunableInstances[tunableKey]?.value = newValue;
    _emitValuesState();
  }

  void _updatePrefs(String tunableFile, Object value) {
    final currentPref = prefs.getString(PrefConstants.KEY_TUNABLE_SETTINGS, "");
    Map<String, Object> newPref;
    if (currentPref.isEmpty) {
      newPref = {};
    } else {
      newPref = Map.from(jsonDecode(currentPref));
    }
    newPref[tunableFile] = value;
    prefs.setString(PrefConstants.KEY_TUNABLE_SETTINGS, jsonEncode(newPref));
  }
}
