import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_reservasi_foto_justify_story_app/core/constants/variables.dart';
import 'package:flutter_reservasi_foto_justify_story_app/data/models/response/banner_response_model.dart';

class BannerRemoteDatasource {
  Future<Either<String, List<BannerResponseModel>>> getBanners() async {
    final uri = Uri.parse('${Variables.baseUrl}/api/banners');
    try {
      final response = await http.get(uri, headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      });

      if (response.statusCode == 200) {
        List<dynamic> bannersJson = json.decode(response.body);
        List<BannerResponseModel> banners = bannersJson
            .take(5)
            .map((json) => BannerResponseModel.fromMap(json))
            .toList();

        // print(banners);
        return Right(banners);
      } else {
        return Left('Failed to load banners: ${response.statusCode}');
      }
    } on Exception catch (e) {
      return Left('Exception occurred: $e');
    }
  }
}
