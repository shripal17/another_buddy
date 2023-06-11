import 'package:another_buddy/model/tunables/another_tunable.dart';

abstract class BatteryNumericTunable extends AnotherNumericTunable {
  @override
  TunableCategory get category => TunableCategory.battery;
}

abstract class BatteryBooleanTunable extends AnotherBooleanTunable {
  @override
  TunableCategory get category => TunableCategory.battery;
}
