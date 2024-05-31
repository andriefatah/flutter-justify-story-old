import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter_reservasi_foto_justify_story_app/core/constants/variables.dart';
import 'package:flutter_reservasi_foto_justify_story_app/data/models/response/gallery_response_model.dart';
import 'package:http/http.dart' as http;

class GalleryRemoteDatasource {
  Future<Either<String, List<GalleryResponseModel>>> getGalleries() async {
    final uri = Uri.parse('${Variables.baseUrl}/api/galleries');
    try {
      final response = await http.get(uri, headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      });

      if (response.statusCode == 200) {
        List<dynamic> galleriesJson = json.decode(response.body);
        List<GalleryResponseModel> galleries = galleriesJson
            .map((json) => GalleryResponseModel.fromMap(json))
            .toList();

        // print(galleries);
        return Right(galleries);
      } else {
        return Left('Failed to load galleries: ${response.statusCode}');
      }
    } on Exception catch (e) {
      return Left('Exception occurred: $e');
    }
  }

  Future<GalleryResponseModel> getGalleryDetail(int id) async {
    final uri = Uri.parse('${Variables.baseUrl}/api/galleries/$id');
    final response = await http.get(uri, headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    });

    if (response.statusCode == 200) {
      return GalleryResponseModel.fromJson(response.body);
    } else {
      throw Exception('Failed to load gallery detail: ${response.statusCode}');
    }
  }
}
