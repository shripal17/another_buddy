import 'package:another_buddy/model/tunables/another_tunable.dart';

abstract class BatteryTunable extends AnotherNumericTunable {
  @override
  TunableCategory get category => TunableCategory.battery;
}
