import 'dart:convert';
import 'package:amplify_api/amplify_api.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';

import '../../../todo/data/models/todo_model.dart';
import '../../../todo/domain/entities/todo.dart';

part 'event_state.dart';

class EventCubit extends Cubit<EventState> {
  EventCubit() : super(EventInitial());

  subscribe(String graphQLDocument) {
    try {
      emit(EventSubscriptionInProgress());
      AmplifyAPI.instance.subscribe(
          request: GraphQLRequest(document: graphQLDocument),
          onData: (event) {
            if (kDebugMode) {
              print('Subscription event data received: ${event.data}}');
            }
            final rowData = json.decode(event.data);
            Map<String, dynamic> mapData = rowData["onCreateTodo"];
            final Todo todo = TodoModel.fromMap2(mapData);
            print(todo.id);
            //final eventName = mapData["onBroadcastEvent"] != null ? mapData["onBroadcastEvent"]["eventName"] : mapData["onClientEvent"]["eventName"];
            //final resourceId = mapData["onClientEvent"] != null && mapData["onClientEvent"]["resourceId"] != null ? mapData["onClientEvent"]["resourceId"] : "";
           emit(EventSubscriptionInProgress());
            emit(
              EventSubscriptionReceiveData(
                eventName: "TooltipSaved!",
                resourceId: "",
              ),
            );
          },
          onEstablished: () {
            print("Subscription established");
            emit(EventSubscriptionSuccess());
          },
          onError: (e) {
            print('Subscription failed with error: $e');
            emit(EventSubscriptionFailure());
          },
          onDone: () {
            print('Subscription has been closed successfully');
          });
    } on ApiException catch (e) {
      print('Failed to establish subscription: $e');
      emit(EventSubscriptionFailure());
    }
  }

  refreshTodoList() {
    emit(EventSubscriptionInProgress());
    emit(
      EventSubscriptionReceiveData(
        eventName: "TodoListUpdated!",
        resourceId: "",
      ),
    );
  }
}
