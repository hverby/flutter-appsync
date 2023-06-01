import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecases.dart';
import '../entities/todo.dart';
import '../repositories/todo_repository.dart';

abstract class GetAllTodosUsecase<Type, NoParams> {
  Future<Either<Failure, Type>> call();
}

class GetAllTodosUsecaseImpl implements GetAllTodosUsecase{
  late final TodoRepository todoRepository;
  GetAllTodosUsecaseImpl(this.todoRepository);

  @override
  Future<Either<Failure, List<Todo>>> call() async{
    return await this.todoRepository.getAllTodos();
  }
}