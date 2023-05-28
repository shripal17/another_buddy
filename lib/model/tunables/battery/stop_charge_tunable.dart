import 'package:another_buddy/model/tunables/another_tunable.dart';
import 'package:another_buddy/model/tunables/battery/battery_tunable.dart';

@tunable
class StopChargeTunable extends BatteryTunable {
  @override
  double get defaultValue => 100;

  @override
  int get divisions => (max - min).toInt();

  @override
  double get max => 100;

  @override
  double get min => 20;

  @override
  String get path => "another_charging_control/stop_charge_percent";

  @override
  String get unit => "%";

  @override
  List<String>? get valueLabels => null;

  @override
  String get label => "Stop Charge Percent";
}
