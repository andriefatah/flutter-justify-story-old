import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:flutter_reservasi_foto_justify_story_app/core/constants/variables.dart';
import 'package:flutter_reservasi_foto_justify_story_app/data/models/response/payment_method_response_model.dart';
import 'package:http/http.dart' as http;

class PaymentMethodRemoteDatasource {
  Future<Either<String, List<PaymentMethodResponseModel>>>
      getPaymentMethods() async {
    final uri = Uri.parse('${Variables.baseUrl}/api/payment-method');
    try {
      final response = await http.get(uri, headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      });

      if (response.statusCode == 200) {
        List<dynamic> paymentMethodJson = json.decode(response.body);
        List<PaymentMethodResponseModel> paymentMethod = paymentMethodJson
            .map((json) => PaymentMethodResponseModel.fromMap(json))
            .toList();

        // print(paymentMethod);
        return Right(paymentMethod);
      } else {
        return Left('Failed to load paymentMethod: ${response.statusCode}');
      }
    } on Exception catch (e) {
      return Left('Exception occurred: $e');
    }
  }
}
