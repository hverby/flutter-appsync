part of 'event_cubit.dart';

@immutable
abstract class EventState {}

class EventInitial extends EventState {}

class EventSubscriptionSuccess extends EventState {}

class EventSubscriptionInProgress extends EventState {}

class EventSubscriptionFailure extends EventState {}

class EventSubscriptionReceiveData extends EventState {
  final String eventName;
  final String resourceId;
  EventSubscriptionReceiveData({required this.eventName, required this.resourceId});
}
