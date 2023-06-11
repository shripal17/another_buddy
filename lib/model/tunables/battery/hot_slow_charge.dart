import 'package:another_buddy/model/tunables/another_tunable.dart';
import 'package:another_buddy/model/tunables/battery/battery_tunable.dart';

@tunable
class HotSlowChargeTunable extends BatteryBooleanTunable {
  @override
  bool get defaultValue => false;

  @override
  String? get helpText => "Charging will continue at reduced rate even if temperate goes over [Maximum Temperature]";

  @override
  int get index => 3;

  @override
  String get label => "Slow Charge when hot";

  @override
  String get path => "another_charging_control/slow_charge_when_hot";

}