part of 'package_bloc.dart';

@freezed
class PackageEvent with _$PackageEvent {
  const factory PackageEvent.started() = _Started;
  const factory PackageEvent.getPackage() = _GetPackage;
  const factory PackageEvent.getPackageByCategoryName(String categoryName) =
      _GetPackageByCategoryName;
}
