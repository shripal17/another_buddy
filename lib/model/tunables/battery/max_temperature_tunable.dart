import 'package:another_buddy/model/tunables/another_tunable.dart';
import 'package:another_buddy/model/tunables/battery/battery_tunable.dart';

@tunable
class MaxTemperatureTunable extends BatteryTunable {
  @override
  double get defaultValue => max;

  @override
  int get divisions => (max - min).toInt();

  @override
  String get label => "Maximum Temperature";

  @override
  double get max => 45;

  @override
  double get min => 39;

  @override
  String get path => "another_charging_control/max_temperature_value";

  @override
  String get unit => "°C";

  @override
  List<String>? get valueLabels => null;

}