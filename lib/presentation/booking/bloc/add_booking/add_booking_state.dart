// ignore_for_file: non_constant_identifier_names

part of 'add_booking_bloc.dart';

@freezed
class AddBookingState with _$AddBookingState {
  const factory AddBookingState.initial() = _Initial;
  const factory AddBookingState.loading() = _Loading;
  const factory AddBookingState.success(String Message) = _Success;
  const factory AddBookingState.error(String Message) = _Error;
}
