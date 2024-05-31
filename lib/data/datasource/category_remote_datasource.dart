import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter_reservasi_foto_justify_story_app/core/constants/variables.dart';
import 'package:flutter_reservasi_foto_justify_story_app/data/models/response/category_response_model.dart';
import 'package:http/http.dart' as http;

class CategoryRemoteDatasource {
  Future<Either<String, List<CategoryResponseModel>>> getCategories() async {
    final uri = Uri.parse('${Variables.baseUrl}/api/categories');
    try {
      final response = await http.get(uri, headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      });

      if (response.statusCode == 200) {
        List<dynamic> categoriesJson = json.decode(response.body);
        List<CategoryResponseModel> categories = categoriesJson
            .take(5)
            .map((json) => CategoryResponseModel.fromMap(json))
            .toList();

        // print(categories);
        return Right(categories);
      } else {
        return Left('Failed to load categories: ${response.statusCode}');
      }
    } on Exception catch (e) {
      return Left('Exception occurred: $e');
    }
  }
}
