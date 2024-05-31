import 'dart:convert';

/// Model for handling the response from a registration API.
class RegisterResponseModel {
  final String? message;

  RegisterResponseModel({this.message});

  /// Creates an instance from a JSON string.
  factory RegisterResponseModel.fromJson(String str) =>
      RegisterResponseModel.fromMap(json.decode(str));

  /// Converts the model to a JSON string.
  String toJson() => json.encode(toMap());

  /// Creates an instance from a JSON map.
  factory RegisterResponseModel.fromMap(Map<String, dynamic> json) =>
      RegisterResponseModel(
        message: json["message"], // Assumes "message" is a key in the JSON
      );

  /// Converts the model to a JSON map.
  Map<String, dynamic> toMap() => {
        "message": message,
      };

  @override
  String toString() => 'RegisterResponseModel(message: $message)';
}
