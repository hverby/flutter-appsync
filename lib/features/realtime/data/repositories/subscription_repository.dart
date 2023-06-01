class SubscriptionRepository {
  static String clientEvent(String clientId) {
    return '''
     subscription MySubscription {
      onClientEvent(clientId: "$clientId") {
        clientId
        eventName
        resourceId
      }
    }
    ''';
  }

  static String broadcastEvent() {
    return '''
     subscription MySubscription {
      onBroadcastEvent {
        eventName
      }
    }
    ''';
  }

  static String todoEvent() {
    return '''
      subscription MySubscription {
        onCreateTodo {
          id
          name
          description
          createdAt
          updatedAt
          color
        }
      }
    ''';
  }
}
