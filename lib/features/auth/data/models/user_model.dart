
import 'dart:convert';

import '../../domain/entities/user.dart';

class UserModel extends User{
  UserModel({
    required this.firstname,
    required this.lastname,
    required this.password,
    required this.email,
    required this.id,
    this.isLogged = false
  }) : super(firstname: firstname, lastname: lastname, password: password, email: email, id: id);

  final String firstname;
  final String lastname;
  final String password;
  final String email;
  final String id;
  final bool isLogged;

  @override
  List<Object> get props => [id, firstname, lastname, password, email];

  factory UserModel.fromMap(Map<String, dynamic> json) {
    return UserModel(
      firstname: json['firstname'],
      lastname: json['lastname'],
      password: json['password'],
      email: json['email'],
      id: json['id'],
    );
  }
  factory UserModel.fromJson(String source) => UserModel.fromMap(json.decode(source));

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'email': email,
      'firstname': firstname,
      'lastname': lastname,
      'password': password,
    };
  }
  String toJson() => json.encode(toMap());

  factory UserModel.fromMapCache(Map<String, dynamic> json) {
    return UserModel(
      firstname: json['firstname'],
      lastname: json['lastname'],
      password: json['password'],
      email: json['email'],
      id: json['id'],
      isLogged: json['isLogged'],
    );
  }
  factory UserModel.fromJsonCache(String source) => UserModel.fromMap(json.decode(source));

  Map<String, dynamic> toMapCache() {
    return {
      'id': id,
      'email': email,
      'firstname': firstname,
      'lastname': lastname,
      'password': password,
      'isLogged': true
    };
  }
  String toJsonCache() => json.encode(toMapCache());
}