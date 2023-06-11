import 'package:another_buddy/model/tunables/another_tunable.dart';
import 'package:another_buddy/model/tunables/battery/battery_tunable.dart';

@tunable
class ContinueChargeTunable extends BatteryNumericTunable {
  @override
  double get defaultValue => 100;

  @override
  int get divisions => (max - min).toInt();

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

  @override
  int get index => 4;

  @override
  String? get helpText => "After the charging has been cut off by [Stop Charge Percent] and the battery discharges to the specified percentage, the kernel will resume charging if the device is already plugged in.\nThis setting does not affect fresh charge sessions.\nUsing this is recommended if you keep your device plugged in for longer durations.";
}
