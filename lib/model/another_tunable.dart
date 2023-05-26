abstract class AnotherTunable<T> {
  String get path;

  TunableClass get tunableClass;

  T get defaultValue;

  String get label;
}

abstract class AnotherBooleanTunable extends AnotherTunable<bool> {

}

abstract class AnotherNumericTunable extends AnotherTunable<double> {
  double get min;

  double get max;

  double get divisions;

  List<String>? get valueLabels;

  String get unit;
}

enum TunableClass {
  battery,
  cpu;
}
