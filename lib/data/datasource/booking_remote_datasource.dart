import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter_reservasi_foto_justify_story_app/core/constants/variables.dart';
import 'package:flutter_reservasi_foto_justify_story_app/data/datasource/auth_local_datasource.dart';
import 'package:flutter_reservasi_foto_justify_story_app/data/models/request/create_booking_reqeust_model.dart';
import 'package:flutter_reservasi_foto_justify_story_app/data/models/response/history_bookings_response_model.dart';
import 'package:http/http.dart' as http;

class BookingRemoteDataSource {
  Future<Either<String, String>> booking(
      CreateBookingRequestModel request) async {
    final authData = await AuthLocalDataSource().getAuthData();
    final uri = Uri.parse('${Variables.baseUrl}/api/bookings');
    try {
      final response = await http.post(
        uri,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer ${authData?.token}',
        },
        body: request.toJson(),
      );

      if (response.statusCode == 201) {
        final responseData = json.decode(response.body);
        return Right(responseData['message']);
      } else {
        return const Left('Gagal Membuat Booking');
      }
    } on Exception catch (e) {
      return Left('Exception occurred: $e');
    }
  }

  Future<Either<String, HistoryBookingResponseModel>>
      getHistoryBookings() async {
    final authData = await AuthLocalDataSource().getAuthData();
    final uri = Uri.parse(
        '${Variables.baseUrl}/api/history-bookings/${authData?.user?.id}');
    try {
      final response = await http.get(uri, headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${authData?.token}',
      });

      if (response.statusCode == 200) {
        try {
          Map<String, dynamic> jsonResponse = json.decode(response.body);
          HistoryBookingResponseModel bookingResponse =
              HistoryBookingResponseModel.fromMap(jsonResponse);
          return Right(bookingResponse);
        } catch (e) {
          return Left('Failed to decode response: $e');
        }
      } else {
        return Left('Failed to load bookings: ${response.statusCode}');
      }
    } catch (e) {
      return Left('Exception occurred: $e');
    }
  }
}
