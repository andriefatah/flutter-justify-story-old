part of 'add_booking_bloc.dart';

@freezed
class AddBookingEvent with _$AddBookingEvent {
  const factory AddBookingEvent.started() = _Started;
  const factory AddBookingEvent.booking(CreateBookingRequestModel request) =
      _Booking;
}
