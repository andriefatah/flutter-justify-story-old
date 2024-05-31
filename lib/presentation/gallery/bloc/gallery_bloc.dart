// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:flutter_reservasi_foto_justify_story_app/data/datasource/gallery_remote_datasource.dart';
import 'package:flutter_reservasi_foto_justify_story_app/data/models/response/gallery_response_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'gallery_event.dart';
part 'gallery_state.dart';
part 'gallery_bloc.freezed.dart';

class GalleryBloc extends Bloc<GalleryEvent, GalleryState> {
  final GalleryRemoteDatasource _galleryRemoteDatasource;

  GalleryBloc(this._galleryRemoteDatasource)
      : super(const GalleryState.initial()) {
    on<GalleryEvent>((event, emit) async {
      // Handle _Started event
      if (event is _Started) {
        emit(const GalleryState.loadInProgress());
        try {
          final result = await _galleryRemoteDatasource.getGalleries();
          result.fold(
            (l) => emit(GalleryState.loadFailure(l)),
            (r) => emit(GalleryState.loadSuccess(r)),
          );
        } catch (e) {
          emit(GalleryState.loadFailure(e.toString()));
        }
      }
      // Handle _GetGalleryDetail event
      else if (event is _GetGalleryDetail) {
        emit(const GalleryState.loadInProgress());
        try {
          final galleryDetail =
              await _galleryRemoteDatasource.getGalleryDetail(event.id);
          emit(GalleryState.detailLoadSuccess(galleryDetail));
        } catch (e) {
          emit(GalleryState.detailLoadFailure(e.toString()));
        }
      }
      // Handle _RefreshGalleries event
      else if (event is _RefreshGalleries) {
        emit(const GalleryState.loadInProgress());
        try {
          final result = await _galleryRemoteDatasource.getGalleries();
          result.fold(
            (l) => emit(GalleryState.loadFailure(l)),
            (r) => emit(GalleryState.loadSuccess(r)),
          );
        } catch (e) {
          emit(GalleryState.loadFailure(e.toString()));
        }
      }
    });
  }
}
