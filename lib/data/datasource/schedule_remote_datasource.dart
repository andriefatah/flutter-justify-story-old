import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:flutter_reservasi_foto_justify_story_app/core/constants/variables.dart';
import 'package:flutter_reservasi_foto_justify_story_app/data/datasource/auth_local_datasource.dart';
import 'package:http/http.dart' as http;

class ScheduleRemoteDatasource {
  Future<Either<String, String>> checkSchedule(String tanggalJam) async {
    final authData = await AuthLocalDataSource().getAuthData();
    final response = await http.post(
      Uri.parse('${Variables.baseUrl}/api/check-schedule'),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${authData?.token}',
      },
      body: json.encode({
        'tanggal_jam_foto': tanggalJam,
      }),
    );

    if (response.statusCode == 200) {
      final responseData = json.decode(response.body);
      return Right(responseData['message']);
    } else if (response.statusCode == 400) {
      final responseData = json.decode(response.body);
      return Left(responseData['message']);
    } else {
      return const Left('Gagal memeriksa jadwal!');
    }
  }
}
