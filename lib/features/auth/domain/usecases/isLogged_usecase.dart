import 'package:dartz/dartz.dart';
import 'package:notey/features/auth/domain/repositories/auth_repository.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecases.dart';
import '../../data/models/login_payload.dart';

class IsLoggedUsecaseImpl extends UseCase<bool, NoParams>{
  late final AuthRepository authRepository;
  IsLoggedUsecaseImpl(this.authRepository);

  @override
  Future<Either<Failure, bool>> call(NoParams noParams) async{
    return await this.authRepository.isLogged();
  }

  Future<Either<Failure, bool>> logout(NoParams noParams) async{
    return await this.authRepository.logout();
  }
}