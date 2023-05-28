import 'package:another_buddy/model/tunables/another_tunable.dart';
import 'package:another_buddy/model/tunables/cpu/cpu_tunable.dart';

@tunable
class InputBoostTunable extends CpuBooleanTunable {
  @override
  bool get defaultValue => false;

  @override
  String get label => "Input Boost";

  @override
  String get path => "another_settings/active_input_cpu_boost";
}
