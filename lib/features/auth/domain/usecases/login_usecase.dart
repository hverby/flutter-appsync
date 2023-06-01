import 'package:dartz/dartz.dart';
import 'package:notey/features/auth/domain/repositories/auth_repository.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecases.dart';
import '../../data/models/login_payload.dart';

class LoginUsecaseImpl extends UseCase<Map, LoginPayload>{
  late final AuthRepository authRepository;
  LoginUsecaseImpl(this.authRepository);

  @override
  Future<Either<Failure, Map>> call(LoginPayload loginPayload) async{
    return await this.authRepository.login(loginPayload);
  }
}