part of 'about_me_bloc.dart';

@freezed
class AboutMeState with _$AboutMeState {
  const factory AboutMeState.initial() = _Initial;
  const factory AboutMeState.loadInProgress() = _LoadInProgress;
  const factory AboutMeState.loadSuccess(AboutMeResponseModel aboutMe) =
      _LoadSuccess;
  const factory AboutMeState.loadFailure(String errorMessage) = _LoadFailure;
}
