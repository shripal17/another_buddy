import 'package:another_buddy/model/tunables/battery/battery_tunable.dart';

class CooldownTemperatureTunable extends BatteryTunable {
  @override
  double get defaultValue => max;

  @override
  double get divisions => max - min;

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

}