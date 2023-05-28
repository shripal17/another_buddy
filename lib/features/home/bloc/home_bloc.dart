import 'package:another_buddy/model/loading_stage.dart';
import 'package:another_buddy/model/tunables/another_tunable.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:root/root.dart';

part 'home_event.dart';
part 'home_state.dart';

typedef HomeEmitter = Emitter<HomeState>;

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final allTunables = tunable.annotatedClasses;
  Map<String, AnotherTunable>? currentValues;

  HomeBloc() : super(HomeInitialState()) {
    on<FetchCurrentValuesEvent>((event, emit) => _fetchCurrentValues(emit));
  }

  void _fetchCurrentValues(Emitter<HomeState> emit) async {
    if (currentValues == null) {
      emit(const HomeLoadingState(LoadingStage.initialLoad));
      currentValues = {};
    }
    for (final tunableMirror in allTunables) {
      final tunable = tunableMirror.newInstance('', []) as AnotherTunable;
      final readValue = Root.exec(cmd: "cat /sys/class/misc/${tunable.path}");
      if (tunable is AnotherNumericTunable) {
        tunable.value = double.tryParse(await readValue ?? "") ?? 0;
        currentValues![tunableMirror.simpleName] = tunable;
      } else if (tunable is AnotherBooleanTunable) {
        tunable.value =
            (double.tryParse(await readValue ?? "") ?? 0) == 1 ? true : false;
        currentValues![tunableMirror.simpleName] = tunable;
      }
    }
    emit(ValuesLoadedState(currentValues!));
  }
}
