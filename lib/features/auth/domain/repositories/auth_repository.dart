import 'package:dartz/dartz.dart';
import 'package:notey/features/auth/data/models/login_payload.dart';
import 'package:notey/features/auth/data/models/register_payload.dart';

import '../../../../core/error/failures.dart';

abstract class AuthRepository {
  Future<Either<Failure, Map>> login(LoginPayload loginPayload);
  Future<Either<Failure, Map>> register(RegisterPayload registerPayload);
  Future<Either<Failure, bool>> isLogged();
  Future<Either<Failure, bool>> logout();
}