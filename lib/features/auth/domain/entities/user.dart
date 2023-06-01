
import 'package:equatable/equatable.dart';

class User extends Equatable{
  User({
    required this.firstname,
    required this.lastname,
    required this.password,
    required this.email,
    required this.id
  });

  final String firstname;
  final String lastname;
  final String password;
  final String email;
  final String id;

  @override
  List<Object> get props => [id, firstname, lastname, password, email];
}