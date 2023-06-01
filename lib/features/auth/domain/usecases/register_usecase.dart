import 'package:dartz/dartz.dart';
import 'package:notey/features/auth/data/models/register_payload.dart';
import 'package:notey/features/auth/domain/repositories/auth_repository.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecases.dart';
import '../../data/models/login_payload.dart';

class RegisterUsecaseImpl extends UseCase<Map, RegisterPayload>{
  late final AuthRepository authRepository;
  RegisterUsecaseImpl(this.authRepository);

  @override
  Future<Either<Failure, Map>> call(RegisterPayload registerPayload) async{
    return await this.authRepository.register(registerPayload);
  }
}