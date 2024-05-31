import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter_reservasi_foto_justify_story_app/core/constants/variables.dart';
import 'package:flutter_reservasi_foto_justify_story_app/data/models/request/feedback_request_model.dart';
import 'package:http/http.dart' as http;

class FeedbackRemoteDatasource {
  Future<Either<String, String>> addFeedback(
      FeedbackRequestModel feedback) async {
    final uri = Uri.parse('${Variables.baseUrl}/api/feedbacks');
    try {
      final response = await http.post(
        uri,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        body: feedback.toJson(),
      );

      if (response.statusCode == 201) {
        final responseData = json.decode(response.body);
        return Right(responseData['message']);
      } else {
        return Left('Failed to submit feedback: ${response.statusCode}');
      }
    } on Exception catch (e) {
      return Left('Exception occurred: $e');
    }
  }
}
