import 'package:equatable/equatable.dart';

class Meteo extends Equatable{
  Meteo({
    required this.ville,
    required this.message,
    required this.temp,
  });

  final String ville;
  final String message;
  final String temp;

  @override
  List<Object> get props => [temp, message, ville];
}