import 'package:another_buddy/model/loading_stage.dart';
import 'package:another_buddy/util/pref_constants.dart';
import 'package:another_buddy/util/shared_prefs.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:kiwi/kiwi.dart';
import 'package:meta/meta.dart';
import 'package:root/root.dart';

part 'initialise_event.dart';

part 'initialise_state.dart';

typedef InitEmitter = Emitter<InitialiseState>;

class InitialiseBloc extends Bloc<InitialiseEvent, InitialiseState> {
  InitialiseBloc() : super(InitialState()) {
    on<CheckRootAvailabilityEvent>(
        (event, emit) => _checkRootAvailability(emit));
    on<CheckRootAccessEvent>((event, emit) => _checkRootAccess(emit));
    on<RequestNotificationPermissionEvent>(
        (event, emit) => _requestNotificationPermission(emit));
  }

  final _prefs = KiwiContainer().resolve<SharedPrefs>();

  bool isFirstSetupDone() =>
      _prefs.getBool(PrefConstants.KEY_FIRST_SETUP_DONE, false);

  void _checkRootAvailability(InitEmitter emit) async {
    emit(const LoadingState(LoadingStage.rootAvailability));
    emit(RootCheckedState(await Root.isRooted() ?? false));
  }

  void _checkRootAccess(InitEmitter emit) async {
    emit(const LoadingState(LoadingStage.rootAccess));
    final rootAvailable = await Root.isRootAvailable() ?? false;
    emit(RootAccessCheckedState(rootAvailable));
  }

  void _requestNotificationPermission(InitEmitter emit) async {
    final granted = await FlutterLocalNotificationsPlugin()
            .resolvePlatformSpecificImplementation<
                AndroidFlutterLocalNotificationsPlugin>()
            ?.requestPermission() ??
        false;
    emit(NotificationPermissionResultState(granted));
    _prefs.setBool(PrefConstants.KEY_FIRST_SETUP_DONE, true);
  }
}
