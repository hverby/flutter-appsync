
import 'package:dartz/dartz.dart';

import 'package:notey/core/error/failures.dart';

import 'package:notey/features/auth/data/models/login_payload.dart';

import 'package:notey/features/auth/data/models/register_payload.dart';

import '../../../../core/platform/network/network_info.dart';
import '../../../todo/data/datasources/todo_local_datasource.dart';
import '../../../todo/data/datasources/todo_remote_datasource.dart';
import '../../domain/repositories/auth_repository.dart';

class AuthRepositoryImpl extends AuthRepository{

  final TodoRemoteDataSource remoteDataSource;
  final TodoLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  AuthRepositoryImpl({required this.remoteDataSource, required this.localDataSource, required this.networkInfo});

  @override
  Future<Either<Failure, bool>> isLogged() {
    // TODO: implement isLogged
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Map>> login(LoginPayload loginPayload) {
    // TODO: implement login
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, bool>> logout() {
    // TODO: implement logout
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Map>> register(RegisterPayload registerPayload) {
    // TODO: implement register
    throw UnimplementedError();
  }
}