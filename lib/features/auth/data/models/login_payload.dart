import 'dart:convert';

class LoginPayload{
  LoginPayload({
    required this.email,
    required this.password,
  });

  final String email;
  final String password;

  factory LoginPayload.fromMap(Map<String, dynamic> json) {
    return LoginPayload(
        email: json['email'],
        password: json['password']
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'password': password
    };
  }

  String toJson() => json.encode(toMap());

  factory LoginPayload.fromJson(String source) => LoginPayload.fromMap(json.decode(source));
}