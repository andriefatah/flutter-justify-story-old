part of 'check_schedule_bloc.dart';

@freezed
class CheckScheduleState with _$CheckScheduleState {
  const factory CheckScheduleState.initial() = _Initial;
  const factory CheckScheduleState.loading() = _Loading;
  const factory CheckScheduleState.success(String message) = _Success;
  const factory CheckScheduleState.failure(String errorMessage) = _Failure;
}
