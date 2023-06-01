import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/meteo.dart';
import '../repositories/weather_repository.dart';

abstract class GetWeatherByLocationUsecase<Type, NoParams> {
  Future<Either<Failure, Type>> call();
}

class GetAllTodosUsecaseImpl implements GetWeatherByLocationUsecase{
  late final WeatherRepository weatherRepository;
  GetAllTodosUsecaseImpl(this.weatherRepository);

  @override
  Future<Either<Failure, Meteo>> call() async{
    return await this.weatherRepository.getWeatherByLocation();
  }
}