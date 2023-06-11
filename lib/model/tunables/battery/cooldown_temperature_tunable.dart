import 'package:another_buddy/model/tunables/another_tunable.dart';
import 'package:another_buddy/model/tunables/battery/battery_tunable.dart';

@tunable
class CooldownTemperatureTunable extends BatteryNumericTunable {
  @override
  double get defaultValue => max;

  @override
  int get divisions => (max - min).toInt();

  @override
  String get label => "Cooldown Temperature";

  @override
  double get max => 41;

  @override
  double get min => 25;

  @override
  String get path => "another_charging_control/cooldown_max_temperature_value";

  @override
  String get unit => "°C";

  @override
  List<String>? get valueLabels => null;

  @override
  int get index => 2;

  @override
  String? get helpText => "The temperature which denotes the battery has been cooled down and can resume charging.";
}