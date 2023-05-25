part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class CheckRootAvailabilityEvent extends HomeEvent {}

class CheckRootAccessEvent extends HomeEvent {}

class ValueUpdatedEvent extends HomeEvent {

}