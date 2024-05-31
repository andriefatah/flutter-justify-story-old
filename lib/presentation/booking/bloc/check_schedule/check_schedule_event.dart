part of 'check_schedule_bloc.dart';

@freezed
class CheckScheduleEvent with _$CheckScheduleEvent {
  const factory CheckScheduleEvent.started() = _Started;
  const factory CheckScheduleEvent.checkSchedule(String tanggalJam) =
      _CheckSchedule;
}
