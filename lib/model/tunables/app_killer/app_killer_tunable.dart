import '../another_tunable.dart';

abstract class AppKillerStringListTunable extends AnotherStringTunable {
  @override
  bool get listMode => true;

  @override
  TunableCategory get category => TunableCategory.appKiller;
}

abstract class AppKillerNumericTunable extends AnotherNumericTunable {
  @override
  TunableCategory get category => TunableCategory.appKiller;
}

abstract class AppKillerBooleanTunable extends AnotherBooleanTunable {
  @override
  TunableCategory get category => TunableCategory.appKiller;
}

