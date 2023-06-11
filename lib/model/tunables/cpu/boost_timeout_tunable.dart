import 'package:another_buddy/model/tunables/another_tunable.dart';
import 'package:another_buddy/model/tunables/cpu/cpu_tunable.dart';

@tunable
class BoostTimeoutTunable extends CpuNumericTunable {
  @override
  double get defaultValue => 4000;

  @override
  int get divisions => (max - min) ~/ 250;

  @override
  String get label => "Boost Timeout";

  @override
  double get max => 9050;

  @override
  double get min => 50;

  @override
  String get path => "another_settings/cpu_boost_timeout";

  @override
  String get unit => "ms";

  @override
  List<String>? get valueLabels => null;

  @override
  int get index => 2;

  @override
  String? get helpText => "The CPU [Boost Frequency] will be applied for the specified duration.";
}
