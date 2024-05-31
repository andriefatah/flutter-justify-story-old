import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:flutter_reservasi_foto_justify_story_app/data/models/response/about_me_response_model.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_reservasi_foto_justify_story_app/core/constants/variables.dart';

class AboutMeRemoteDataSource {
  Future<Either<String, AboutMeResponseModel>> getAboutMe() async {
    final uri = Uri.parse('${Variables.baseUrl}/api/about-me');
    try {
      final response = await http.get(uri, headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      });

      if (response.statusCode == 200) {
        var aboutMeJson = json.decode(response.body);
        var aboutMe = AboutMeResponseModel.fromMap(aboutMeJson);
        return Right(aboutMe);
      } else {
        return Left('Failed to load About Me: ${response.statusCode}');
      }
    } on Exception catch (e) {
      return Left('Exception occurred: $e');
    }
  }
}
