import 'package:dartz/dartz.dart';
import 'package:notey/core/error/failures.dart';
import 'package:notey/features/meteo/domain/entities/meteo.dart';

abstract class WeatherRepository {
  Future<Either<Failure, Meteo>> getWeatherByLocation();
  Future<Either<Failure, Meteo>> getWeatherByCity({cityName});
}