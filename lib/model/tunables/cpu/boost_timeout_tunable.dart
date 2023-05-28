import 'package:another_buddy/model/tunables/another_tunable.dart';
import 'package:another_buddy/model/tunables/cpu/cpu_tunable.dart';

@tunable
class BoostTimeoutTunable extends CpuNumericTunable {
  @override
  double get defaultValue => 4000;

  // TODO: Fix divisions to be of 50ms
  @override
  int get divisions => (max - min).toInt();

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
