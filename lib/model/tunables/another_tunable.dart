import 'package:dartx/dartx.dart';
import 'package:reflectable/reflectable.dart';

// ignore: unused_import
import 'package:another_buddy/model/tunables/battery/auto_balance_tunable.dart';

// ignore: unused_import
import 'package:another_buddy/model/tunables/battery/continue_charge_tunable.dart';

// ignore: unused_import
import 'package:another_buddy/model/tunables/battery/cooldown_temperature_tunable.dart';

// ignore: unused_import
import 'package:another_buddy/model/tunables/battery/max_temperature_tunable.dart';

// ignore: unused_import
import 'package:another_buddy/model/tunables/battery/hot_slow_charge.dart';

// ignore: unused_import
import 'package:another_buddy/model/tunables/battery/stop_charge_tunable.dart';

// ignore: unused_import
import 'package:another_buddy/model/tunables/cpu/boost_frequency_tunable.dart';

// ignore: unused_import
import 'package:another_buddy/model/tunables/cpu/boost_timeout_tunable.dart';

// ignore: unused_import
import 'package:another_buddy/model/tunables/cpu/input_boost_tunable.dart';

// ignore: unused_import
import 'package:another_buddy/model/tunables/app_killer/app_killer_active_tunable.dart';

// ignore: unused_import
import 'package:another_buddy/model/tunables/app_killer/apps_list_tunable.dart';

// ignore: unused_import
import 'package:another_buddy/model/tunables/app_killer/interval_tunable.dart';

class Tunable extends Reflectable {
  const Tunable()
      : super(
          metadataCapability,
          newInstanceCapability,
          instanceInvokeCapability,
        );
}

const tunable = Tunable();

abstract class AnotherTunable<T> {
  AnotherTunable();

  String get path;

  TunableCategory get category;

  T get defaultValue;

  String get label;

  String? get helpText;

  Object? value;

  String? name;

  int get index;
}

abstract class AnotherBooleanTunable extends AnotherTunable<bool> {
  String valueLabel(bool value) {
    if (value) {
      return "On";
    } else {
      return "Off";
    }
  }
}

abstract class AnotherNumericTunable extends AnotherTunable<double> {
  double get min;

  double get max;

  int get divisions;

  List<String>? get valueLabels;

  String get unit;

  String minLabel() => valueLabels?.first ?? "$min$unit";

  String maxLabel() => valueLabels?.last ?? "$max$unit";

  String valueLabel(num value) {
    if (valueLabels != null) {
      final index = value - min;
      return valueLabels![index.toInt()];
    } else {
      return "$value$unit";
    }
  }
}

abstract class AnotherStringTunable extends AnotherTunable<String> {
  bool get listMode;

  String get listSeparator;

  String? get itemsType;

  List<String> values() {
    if (listMode) {
      final strValue = value as String;
      if (strValue.isNullOrEmpty) {
        return [];
      }
      return strValue.split(listSeparator);
    } else {
      return [value as String];
    }
  }

  String valueLabel() {
    if (listMode) {
      return "${values().length} ${itemsType ?? "items"}";
    } else {
      return value as String;
    }
  }
}

enum TunableCategory {
  appKiller,
  battery,
  cpu;
}
