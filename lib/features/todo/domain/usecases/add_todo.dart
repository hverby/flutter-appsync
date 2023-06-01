import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecases.dart';
import '../../data/models/todo_payload.dart';
import '../repositories/todo_repository.dart';

class AddTodoUsecaseImpl extends UseCase<Map, TodoPayload>{
  late final TodoRepository todoRepository;
  AddTodoUsecaseImpl(this.todoRepository);

  @override
  Future<Either<Failure, Map>> call(TodoPayload todoPayload) async{
    return await this.todoRepository.addTodo(todoPayload);
  }
}