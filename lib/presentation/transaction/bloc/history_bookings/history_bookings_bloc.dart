// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:flutter_reservasi_foto_justify_story_app/data/datasource/booking_remote_datasource.dart';
import 'package:flutter_reservasi_foto_justify_story_app/data/models/response/history_bookings_response_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'history_bookings_event.dart';
part 'history_bookings_state.dart';
part 'history_bookings_bloc.freezed.dart';

class HistoryBookingsBloc
    extends Bloc<HistoryBookingsEvent, HistoryBookingsState> {
  final BookingRemoteDataSource _bookingRemoteDataSource;

  HistoryBookingsBloc(this._bookingRemoteDataSource)
      : super(const HistoryBookingsState.initial()) {
    on<HistoryBookingsEvent>((event, emit) async {
      if (event is _GetHistoryBookings) {
        emit(const HistoryBookingsState.loading());

        try {
          // await Future.delayed((const Duration(seconds: 7)));
          final result = await _bookingRemoteDataSource.getHistoryBookings();
          result.fold(
            (l) => emit(HistoryBookingsState.error(l)),
            (r) =>
                emit(HistoryBookingsState.success(r.historyTransactions ?? [])),
          );
        } catch (e) {
          emit(HistoryBookingsState.error(e.toString()));
        }
      }
    });
  }
}
