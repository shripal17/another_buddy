import 'package:another_buddy/model/tunables/another_tunable.dart';
import 'package:another_buddy/model/tunables/battery/battery_tunable.dart';

@tunable
class MaxTemperatureTunable extends BatteryNumericTunable {
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

  @override
  int get index => 1;

  @override
  String? get helpText =>
      "Maximum temperature of the battery allowed during charging. The kernel will stop charging if the battery exceeds this temperature.\nIf [Slow Charge when hot] is enabled, device charging rate will reduce after this temperature.";
}
