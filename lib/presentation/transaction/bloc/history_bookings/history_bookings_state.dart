part of 'history_bookings_bloc.dart';

@freezed
class HistoryBookingsState with _$HistoryBookingsState {
  const factory HistoryBookingsState.initial() = _Initial;
  const factory HistoryBookingsState.loading() = _Loading;
  const factory HistoryBookingsState.success(
      List<HistoryTransaction> historyTransactions) = _Success;
  const factory HistoryBookingsState.error(String message) = _Error;
}
