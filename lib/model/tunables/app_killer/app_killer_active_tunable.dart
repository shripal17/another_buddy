import 'package:another_buddy/model/tunables/another_tunable.dart';
import 'package:another_buddy/model/tunables/app_killer/app_killer_tunable.dart';

@tunable
class AppKillerActiveTunable extends AppKillerBooleanTunable {
  @override
  bool get defaultValue => false;

  @override
  String? get helpText => "The selected apps will be killed in the background after each duration as specified in [Interval]";

  @override
  int get index => 0;

  @override
  String get label => "Active";

  @override
  String get path => "another_app_killer/active";

}