import 'package:another_buddy/model/tunables/another_tunable.dart';
import 'package:another_buddy/model/tunables/app_killer/app_killer_tunable.dart';

@tunable
class IntervalTunable extends AppKillerNumericTunable {
  @override
  double get defaultValue => 30;

  @override
  int get divisions => (max - min) ~/ 15;

  @override
  String? get helpText =>
      "The interval (in seconds) after which the selected apps will be killed";

  @override
  int get index => 2;

  @override
  String get label => "Interval";

  @override
  double get max => 600;

  @override
  double get min => 0;

  @override
  String get path => "another_app_killer/interval";

  @override
  String get unit => "s";

  @override
  List<String>? get valueLabels => null;
}
