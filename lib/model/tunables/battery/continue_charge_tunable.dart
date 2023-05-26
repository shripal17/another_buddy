import 'package:another_buddy/model/tunables/battery/battery_tunable.dart';

class ContinueChargeTunable extends BatteryTunable {
  @override
  double get defaultValue => 100;

  @override
  double get divisions => max - min;

  @override
  double get max => 100;

  @override
  double get min => 20;

  @override
  String get path => "another_charging_control/continue_charge_percent";

  @override
  String get unit => "%";

  @override
  List<String>? get valueLabels => null;

  @override
  String get label => "Continue Charge Percent";
}
