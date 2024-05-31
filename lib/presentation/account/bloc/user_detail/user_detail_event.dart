part of 'user_detail_bloc.dart';

@freezed
class UserDetailEvent with _$UserDetailEvent {
  const factory UserDetailEvent.started() = _Started;
  const factory UserDetailEvent.getUserDetail() = _GetUserDetail;
  const factory UserDetailEvent.updateUserDetail(
      UserDetailUpdateRequestModel data) = _UpdateUserDetail;
}
