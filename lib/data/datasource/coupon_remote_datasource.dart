import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:flutter_reservasi_foto_justify_story_app/core/constants/variables.dart';
import 'package:flutter_reservasi_foto_justify_story_app/data/datasource/auth_local_datasource.dart';
import 'package:flutter_reservasi_foto_justify_story_app/data/models/response/apply_coupon_response_model.dart';
import 'package:http/http.dart' as http;

class CouponRemoteDatasource {
  Future<Either<String, ApplyCouponResponseModel>> applyCoupon(
      String kodeKupon, int totalPembayaran) async {
    final authData = await AuthLocalDataSource().getAuthData();
    final uri = Uri.parse('${Variables.baseUrl}/api/apply-coupon');
    try {
      final response = await http.post(
        uri,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer ${authData?.token}',
        },
        body: json.encode({
          'kode_kupon': kodeKupon,
          'total_pembayaran': totalPembayaran,
        }),
      );

      if (response.statusCode == 200) {
        return Right(ApplyCouponResponseModel.fromJson(response.body));
      } else if (response.statusCode == 404) {
        final responseData = json.decode(response.body);
        return Left(responseData['message']);
      } else {
        return Left('Failed to apply coupon: ${response.statusCode}');
      }
    } on Exception catch (e) {
      return Left('Exception occurred: $e');
    }
  }
}
