import 'package:another_buddy/model/loading_stage.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:root/root.dart';

part 'home_event.dart';
part 'home_state.dart';

typedef HomeEmitter = Emitter<HomeState>;

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitialState()) {
    on<CheckRootAvailabilityEvent>(
        (event, emit) => _checkRootAvailability(emit));
    on<CheckRootAccessEvent>((event, emit) => _checkRootAccess(emit));
  }

  void _checkRootAvailability(HomeEmitter emit) async {
    emit(const HomeLoadingState(LoadingStage.rootAvailability));
    emit(HomeRootCheckedState(await Root.isRooted() ?? false));
  }

  void _checkRootAccess(HomeEmitter emit) async {
    emit(const HomeLoadingState(LoadingStage.rootAccess));
    emit(HomeRootAccessCheckedState(await Root.isRootAvailable() ?? false));
  }
}
