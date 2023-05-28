part of 'initialise_bloc.dart';

@immutable
abstract class InitialiseEvent {}

class CheckRootAvailabilityEvent extends InitialiseEvent {}

class CheckRootAccessEvent extends InitialiseEvent {}
