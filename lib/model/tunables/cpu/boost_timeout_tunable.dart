import 'package:another_buddy/model/tunables/cpu/cpu_tunable.dart';

class BoostTimeoutTunable extends CpuNumericTunable {
  @override
  double get defaultValue => 4000;

  @override
  double get divisions => max - min;

  @override
  String get label => "Boost Timeout";

  @override
  double get max => 9999;

  @override
  double get min => 50;

  @override
  String get path => "another_settings/cpu_boost_timeout";

  @override
  String get unit => "ms";

  @override
  List<String>? get valueLabels => null;
}
