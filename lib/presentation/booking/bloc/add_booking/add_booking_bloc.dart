// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:flutter_reservasi_foto_justify_story_app/data/datasource/booking_remote_datasource.dart';
import 'package:flutter_reservasi_foto_justify_story_app/data/models/request/create_booking_reqeust_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'add_booking_event.dart';
part 'add_booking_state.dart';
part 'add_booking_bloc.freezed.dart';

class AddBookingBloc extends Bloc<AddBookingEvent, AddBookingState> {
  final BookingRemoteDataSource _bookingRemoteDataSource;

  AddBookingBloc(this._bookingRemoteDataSource)
      : super(const AddBookingState.initial()) {
    on<_Booking>((event, emit) async {
      emit(const AddBookingState.loading());
      await Future.delayed((const Duration(seconds: 2)));
      final result = await _bookingRemoteDataSource.booking(event.request);

      result.fold(
        (l) => emit(AddBookingState.error(l)),
        (r) => emit(AddBookingState.success(r)),
      );
    });
  }
}
