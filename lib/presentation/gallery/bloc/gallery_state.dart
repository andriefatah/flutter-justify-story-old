part of 'gallery_bloc.dart';

@freezed
class GalleryState with _$GalleryState {
  const factory GalleryState.initial() = Initial;
  const factory GalleryState.loadInProgress() = LoadInProgress;
  const factory GalleryState.loadSuccess(List<GalleryResponseModel> galleries) =
      LoadSuccess;
  const factory GalleryState.loadFailure(String error) = LoadFailure;

  const factory GalleryState.detailLoadSuccess(
      GalleryResponseModel galleryDetail) = DetailLoadSuccess;
  const factory GalleryState.detailLoadFailure(String error) =
      DetailLoadFailure;
}
