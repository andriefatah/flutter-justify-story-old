// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:flutter_reservasi_foto_justify_story_app/data/datasource/banner_remote_datasource.dart';
import 'package:flutter_reservasi_foto_justify_story_app/data/models/response/banner_response_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'banner_event.dart';
part 'banner_state.dart';
part 'banner_bloc.freezed.dart';

class BannerBloc extends Bloc<BannerEvent, BannerState> {
  final BannerRemoteDatasource _bannerRemoteDatasource;

  BannerBloc(this._bannerRemoteDatasource)
      : super(const BannerState.initial()) {
    on<BannerEvent>((event, emit) async {
      // Cek jika event adalah Started, maka emit state loading
      if (event is _Started) {
        // Perhatikan tidak ada underscore
        emit(const BannerState.loading());
        await Future.delayed(const Duration(seconds: 3));
        try {
          final result = await _bannerRemoteDatasource.getBanners();
          result.fold(
            (l) => emit(BannerState.error(l)),
            (r) => emit(BannerState.loaded(r)),
          );
        } catch (e) {
          emit(BannerState.error(e.toString()));
        }
      }
    });
  }
}
