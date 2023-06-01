import 'dart:convert';

class RegisterPayload{
  RegisterPayload({
    required this.email,
    required this.password,
    required this.firstname,
    required this.lastname,
  });

  final String email;
  final String password;
  final String firstname;
  final String lastname;

  factory RegisterPayload.fromMap(Map<String, dynamic> json) {
    return RegisterPayload(
        email: json['email'],
        password: json['password'],
        firstname: json['firstname'],
        lastname: json['lastname']
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'password': password,
      'firstname': firstname,
      'lastname': lastname
    };
  }

  String toJson() => json.encode(toMap());

  factory RegisterPayload.fromJson(String source) => RegisterPayload.fromMap(json.decode(source));
}