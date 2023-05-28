import 'package:another_buddy/model/tunables/another_tunable.dart';
import 'package:another_buddy/model/tunables/cpu/cpu_tunable.dart';

@tunable
class BoostFrequencyTunable extends CpuNumericTunable {
  @override
  double get defaultValue => min;

  @override
  int get divisions => (max - min).toInt();

  @override
  String get label => "Boost Frequency";

  @override
  double get max => 4;

  @override
  double get min => 1;

  @override
  String get path => "another_settings/cpu_boost_freq";

  @override
  String get unit => "GHz";

  @override
  List<String>? get valueLabels => ["1GHz", "1.2GHz", "1.3GHz", "1.5GHz"];
}
