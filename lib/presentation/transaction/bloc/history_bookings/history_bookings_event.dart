part of 'history_bookings_bloc.dart';

@freezed
class HistoryBookingsEvent with _$HistoryBookingsEvent {
  const factory HistoryBookingsEvent.started() = _Started;
  const factory HistoryBookingsEvent.getHistoryBookings() = _GetHistoryBookings;
}
