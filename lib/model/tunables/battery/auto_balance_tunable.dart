import 'package:another_buddy/model/tunables/another_tunable.dart';
import 'package:another_buddy/model/tunables/battery/battery_tunable.dart';

@tunable
class AutoBalanceTunable extends BatteryTunable {
  @override
  double get defaultValue => 6;

  @override
  int get divisions => (max - min).toInt();

  @override
  String get label => "Auto Balance";

  @override
  double get max => 7;

  @override
  double get min => 0;

  @override
  String get path => "another_buddy/battperf";

  @override
  String get unit => "";

  @override
  List<String>? get valueLabels => [
        "Extreme Battery Backup",
        "Best Battery Backup",
        "Better Battery Backup",
        "Good Battery Backup",
        "Good Performance",
        "Better Performance",
        "Best Performance",
        "Extreme Performance",
      ];
}
