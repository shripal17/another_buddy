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
import 'package:another_buddy/model/tunables/battery/stop_charge_tunable.dart';

// ignore: unused_import
import 'package:another_buddy/model/tunables/cpu/boost_frequency_tunable.dart';

// ignore: unused_import
import 'package:another_buddy/model/tunables/cpu/boost_timeout_tunable.dart';

// ignore: unused_import
import 'package:another_buddy/model/tunables/cpu/input_boost_tunable.dart';

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

  Object? value;

  String? name;
}

abstract class AnotherBooleanTunable extends AnotherTunable<bool> {}

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

enum TunableCategory {
  battery,
  cpu;
}
