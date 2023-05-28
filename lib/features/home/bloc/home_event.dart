part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class FetchCurrentValuesEvent extends HomeEvent {}

class ValueUpdatedEvent extends HomeEvent {

}