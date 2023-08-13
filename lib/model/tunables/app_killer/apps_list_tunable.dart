import 'package:another_buddy/model/tunables/another_tunable.dart';
import 'package:another_buddy/model/tunables/app_killer/app_killer_tunable.dart';

@tunable
class AppsListTunable extends AppKillerStringListTunable {
  @override
  String get defaultValue => "";

  @override
  String? get helpText => "Select apps which you want to be killed in background";

  @override
  int get index => 1;

  @override
  String get label => "Apps to kill";

  @override
  String get listSeparator => ";";

  @override
  String get path => "another_app_killer/list_processes";

  @override
  String? get itemsType => "apps";
}