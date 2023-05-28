import 'package:another_buddy/model/tunables/another_tunable.dart';

abstract class CpuBooleanTunable extends AnotherBooleanTunable {
  @override
  TunableCategory get category => TunableCategory.cpu;
}

abstract class CpuNumericTunable extends AnotherNumericTunable {
  @override
  TunableCategory get category => TunableCategory.cpu;
}