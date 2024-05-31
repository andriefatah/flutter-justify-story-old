part of 'gallery_bloc.dart';

@freezed
class GalleryEvent with _$GalleryEvent {
  const factory GalleryEvent.started() = _Started;
  const factory GalleryEvent.getGalleries() = GetGalleries;
  const factory GalleryEvent.getGalleryDetail(int id) = _GetGalleryDetail;
  const factory GalleryEvent.refreshGalleries() = _RefreshGalleries;
}
