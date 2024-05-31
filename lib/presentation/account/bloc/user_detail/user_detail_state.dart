part of 'user_detail_bloc.dart';

@freezed
class UserDetailState with _$UserDetailState {
  const factory UserDetailState.initial() = _Initial;
  const factory UserDetailState.loading() = _Loading;
  const factory UserDetailState.success(UserDetailResponseModel userDetail) =
      _GetUserDetailSuccess;
  const factory UserDetailState.error(String message) = _Error;
  const factory UserDetailState.updateSuccess(String message) = _UpdateSuccess;
}
