import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter_reservasi_foto_justify_story_app/core/constants/variables.dart';
import 'package:flutter_reservasi_foto_justify_story_app/data/datasource/auth_local_datasource.dart';
import 'package:flutter_reservasi_foto_justify_story_app/data/models/request/user_detail_update_request_model.dart';
import 'package:flutter_reservasi_foto_justify_story_app/data/models/response/user_detail_response_model.dart';
import 'package:http/http.dart' as http;

class UserDetailRemoteDatasource {
  Future<Either<String, UserDetailResponseModel>> getUserDetail() async {
    final authData = await AuthLocalDataSource().getAuthData();
    if (authData?.user?.id == null) {
      return const Left('User ID tidak ditemukan');
    }
    final url = Uri.parse(
        '${Variables.baseUrl}/api/users/${authData?.user?.id}/account-details');

    final response = await http.get(
      url,
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer ${authData?.token}',
      },
    );

    if (response.statusCode == 200) {
      return Right(UserDetailResponseModel.fromMap(json.decode(response.body)));
    } else {
      return Left(response.body.isNotEmpty
          ? json.decode(response.body).toString()
          : 'Gagal mendapatkan data detail user');
    }
  }

  Future<Either<String, String>> updateUserDetail(
      UserDetailUpdateRequestModel data) async {
    final authData = await AuthLocalDataSource().getAuthData();
    if (authData?.user?.id == null) {
      return const Left('User ID tidak ditemukan');
    }

    final url = Uri.parse(
        '${Variables.baseUrl}/api/users/${authData?.user?.id}/account-details');

    final response = await http.patch(
      url,
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${authData?.token}',
      },
      body: jsonEncode(data.toMap()),
    );

    if (response.statusCode == 200) {
      return const Right('Berhasil mengupdate data detail pengguna');
    } else {
      return Left(response.body.isNotEmpty
          ? json.decode(response.body).toString()
          : 'Gagal mengupdate data detail pengguna');
    }
  }
}
