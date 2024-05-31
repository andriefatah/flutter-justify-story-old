import 'dart:convert';

import 'package:dartz/dartz.dart';

import 'package:flutter_reservasi_foto_justify_story_app/data/models/response/register_response_model.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_reservasi_foto_justify_story_app/core/constants/variables.dart';
import 'package:flutter_reservasi_foto_justify_story_app/data/datasource/auth_local_datasource.dart';
import 'package:flutter_reservasi_foto_justify_story_app/data/models/request/register_request_model.dart';
import 'package:flutter_reservasi_foto_justify_story_app/data/models/response/auth_response_model.dart';

class AuthRemoteDatasource {
  Future<Either<Map<String, dynamic>, RegisterResponseModel>> register(
      RegisterRequestModel requestModel) async {
    final response = await http.post(
      Uri.parse('${Variables.baseUrl}/api/register'),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
      body: requestModel.toJson(),
    );

    if (response.statusCode == 201) {
      return Right(RegisterResponseModel.fromJson(response.body));
    } else {
      final decodedBody = json.decode(response.body);
      if (decodedBody is Map<String, dynamic>) {
        if (response.statusCode == 422 && decodedBody.containsKey('errors')) {
          final errors = decodedBody['errors'];

          if (errors is Map<String, dynamic>) {
            return Left(errors);
          }
        } else {
          return Left({
            'general': [decodedBody['message'] ?? 'Register Gagal']
          });
        }
      } else {
        return const Left({
          'general': ['Response tidak valid']
        });
      }
    }
    throw Exception('Terjadi kesalahan yang tidak terduga.');
  }

  Future<Either<String, AuthResponseModel>> login(
      String email, String password) async {
    final response = await http.post(
      Uri.parse('${Variables.baseUrl}/api/login'),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
      body: json.encode({
        'email': email,
        'password': password,
      }),
    );

    if (response.statusCode == 200) {
      await AuthLocalDataSource()
          .saveAuthData(AuthResponseModel.fromJson(response.body));
      return Right(AuthResponseModel.fromJson(response.body));
    } else if (response.statusCode == 401) {
      final decodedBody = json.decode(response.body);
      final errorMessage = decodedBody['message'];

      return Left(errorMessage ?? 'Unauthorized');
    } else {
      return const Left('Login Gagal!');
    }
  }

  Future<Either<String, String>> logout() async {
    final authDataModel = await AuthLocalDataSource().getAuthData();
    final url = Uri.parse('${Variables.baseUrl}/api/logout');
    final response = await http.post(
      url,
      headers: {
        'Authorization': 'Bearer ${authDataModel?.token}',
      },
    );

    if (response.statusCode == 200) {
      await AuthLocalDataSource().removeAuthData();
      return const Right('Logout berhasil');
    } else {
      return const Left('Logout gagal');
    }
  }
}
