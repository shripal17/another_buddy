import 'package:another_buddy/model/tunables/another_tunable.dart';
import 'package:another_buddy/model/tunables/battery/battery_tunable.dart';

@tunable
class HotSlowChargeTunable extends BatteryBooleanTunable {
  @override
  bool get defaultValue => false;

  @override
  String? get helpText => "Charging will continue at reduced rate even if temperature goes over [Maximum Temperature].\nEnabling this will override [Maximum Temperature] setting.";

  @override
  int get index => 3;

  @override
  String get label => "Slow Charge when hot";

  @override
  String get path => "another_charging_control/slow_charge_when_hot";

}