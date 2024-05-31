// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:flutter_reservasi_foto_justify_story_app/data/datasource/schedule_remote_datasource.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'check_schedule_event.dart';
part 'check_schedule_state.dart';
part 'check_schedule_bloc.freezed.dart';

class CheckScheduleBloc extends Bloc<CheckScheduleEvent, CheckScheduleState> {
  final ScheduleRemoteDatasource _scheduleRemoteDatasource;

  CheckScheduleBloc(this._scheduleRemoteDatasource)
      : super(const CheckScheduleState.initial()) {
    on<_CheckSchedule>((event, emit) async {
      emit(const CheckScheduleState.loading());
      final result =
          await _scheduleRemoteDatasource.checkSchedule(event.tanggalJam);
      result.fold(
        (failure) => emit(CheckScheduleState.failure(failure)),
        (message) => emit(CheckScheduleState.success(message)),
      );
    });
  }
}
