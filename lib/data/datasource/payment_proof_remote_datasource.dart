// payment_proof_remote_datasource.dart
import 'dart:convert';
// import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:flutter_reservasi_foto_justify_story_app/core/constants/variables.dart';
import 'package:flutter_reservasi_foto_justify_story_app/data/datasource/auth_local_datasource.dart';
import 'package:flutter_reservasi_foto_justify_story_app/data/models/request/payment_proof_request_model.dart';
import 'package:http/http.dart' as http;

class PaymentProofRemoteDataSource {
  Future<Either<String, String>> uploadPaymentProof(
      PaymentProofRequestModel requestModel) async {
    final authData = await AuthLocalDataSource().getAuthData();
    final uri =
        Uri.parse('${Variables.baseUrl}/api/bookings/upload-payment-proof');
    final request = http.MultipartRequest('POST', uri);

    request.headers['Authorization'] = 'Bearer ${authData?.token}';

    request.fields['user_id'] = requestModel.userId.toString();
    request.fields['transaction_id'] = requestModel.transactionId.toString();
    request.fields['nominal'] = requestModel.nominal.toString();
    request.fields['metode_pembayaran'] = requestModel.metodePembayaran;
    if (requestModel.catatan != null) {
      request.fields['catatan'] = requestModel.catatan!;
    }

    final file = await http.MultipartFile.fromPath(
        'file_bukti', requestModel.fileBukti.path);
    request.files.add(file);

    try {
      final response = await request.send();

      if (response.statusCode == 201) {
        final responseBody = await response.stream.bytesToString();
        final data = json.decode(responseBody);
        return Right(data['message']);
      } else {
        return Left('Failed to upload payment proof: ${response.statusCode}');
      }
    } catch (e) {
      return Left('Exception occurred: $e');
    }
  }
}
