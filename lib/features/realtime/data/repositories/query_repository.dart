class QueryRepository {
  static String getTodos() {
    return '''
      query MyQuery {
        todosByDate(type: "todo", sortDirection: ASC) {
          items {
            id
            name
            description
            color
            createdAt
            updatedAt
          }
        }
      }
    ''';
  }
}
