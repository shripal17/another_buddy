import 'package:another_buddy/model/another_tunable.dart';

abstract class CpuBooleanTunable extends AnotherBooleanTunable {
  @override
  TunableClass get tunableClass => TunableClass.cpu;
}

abstract class CpuNumericTunable extends AnotherNumericTunable {
  @override
  TunableClass get tunableClass => TunableClass.cpu;
}