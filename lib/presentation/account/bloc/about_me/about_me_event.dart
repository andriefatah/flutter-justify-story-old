part of 'about_me_bloc.dart';

@freezed
class AboutMeEvent with _$AboutMeEvent {
  const factory AboutMeEvent.started() = _Started;
  const factory AboutMeEvent.getAboutMe() = _GetAboutMe;
}
