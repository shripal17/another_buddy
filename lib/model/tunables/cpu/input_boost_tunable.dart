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

  @override
  int get index => 0;

  @override
  String? get helpText =>
      "The kernel will temporarily boost CPU frequency by [Boost Frequency]GHz (for [Boost Timeout] duration) to satisfy with the needed performance while still keeping the phone optimised for longer battery life.";
}
