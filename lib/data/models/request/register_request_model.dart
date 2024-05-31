import 'dart:convert';

class RegisterRequestModel {
  final String name;
  final String email;
  final String password;
  final String alamat;
  final String noTelp;

  RegisterRequestModel({
    required this.name,
    required this.email,
    required this.password,
    required this.alamat,
    required this.noTelp,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'password': password,
      'alamat': alamat,
      'no_telp': noTelp, // Perbaikan di sini
    };
  }

  factory RegisterRequestModel.fromMap(Map<String, dynamic> map) {
    return RegisterRequestModel(
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      password: map['password'] ?? '',
      alamat: map['alamat'] ?? '',
      noTelp: map['no_telp'] ?? '', // Pastikan ini sesuai dengan kunci JSON
    );
  }

  String toJson() => json.encode(toMap());

  factory RegisterRequestModel.fromJson(String source) =>
      RegisterRequestModel.fromMap(json.decode(source));
}
