import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:flutter_reservasi_foto_justify_story_app/core/constants/variables.dart';
import 'package:flutter_reservasi_foto_justify_story_app/data/models/response/package_response_model.dart';
import 'package:http/http.dart' as http;

class PackageRemoteDatasource {
  Future<Either<String, List<PackageResponseModel>>> getPackages() async {
    final uri = Uri.parse('${Variables.baseUrl}/api/packages');
    try {
      final response = await http.get(uri, headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      });

      if (response.statusCode == 200) {
        List<dynamic> packagesJson = json.decode(response.body);
        List<PackageResponseModel> packages = packagesJson
            .take(5)
            .map((json) => PackageResponseModel.fromMap(json))
            .toList();

        // print(packages);
        return Right(packages);
      } else {
        return Left('Failed to load packages: ${response.statusCode}');
      }
    } on Exception catch (e) {
      return Left('Exception occurred: $e');
    }
  }

  Future<Either<String, List<PackageResponseModel>>> getPackagesByCategoryName(
      String categoryName) async {
    final uri = Uri.parse(
        '${Variables.baseUrl}/api/packages?category_name=$categoryName');
    try {
      final response = await http.get(uri, headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      });

      if (response.statusCode == 200) {
        List<dynamic> packagesJson = json.decode(response.body);
        List<PackageResponseModel> packages = packagesJson
            .map((json) => PackageResponseModel.fromMap(json))
            .toList();

        return Right(packages);
      } else {
        return Left('Failed to load packages: ${response.statusCode}');
      }
    } on Exception catch (e) {
      return Left('Exception occurred: $e');
    }
  }
}
