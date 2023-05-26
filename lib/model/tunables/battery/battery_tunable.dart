import 'package:another_buddy/model/another_tunable.dart';

abstract class BatteryTunable extends AnotherNumericTunable {
  @override
  TunableClass get tunableClass => TunableClass.battery;
}
