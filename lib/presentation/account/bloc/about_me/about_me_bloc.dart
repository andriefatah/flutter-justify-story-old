// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:flutter_reservasi_foto_justify_story_app/data/datasource/about_me_remote_datasource.dart';
import 'package:flutter_reservasi_foto_justify_story_app/data/models/response/about_me_response_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'about_me_event.dart';
part 'about_me_state.dart';
part 'about_me_bloc.freezed.dart';

class AboutMeBloc extends Bloc<AboutMeEvent, AboutMeState> {
  final AboutMeRemoteDataSource _aboutMeRemoteDataSource;
  AboutMeBloc(this._aboutMeRemoteDataSource)
      : super(const AboutMeState.initial()) {
    on<AboutMeEvent>((event, emit) async {
      if (event is _Started) {
        emit(const AboutMeState.loadInProgress());
        // await Future.delayed((Duration(seconds: 3)));
        try {
          final result = await _aboutMeRemoteDataSource.getAboutMe();
          // print(result);
          result.fold(
            (l) => emit(AboutMeState.loadFailure(l)),
            (r) => emit(AboutMeState.loadSuccess(r)),
          );
        } catch (e) {
          emit(AboutMeState.loadFailure(e.toString()));
        }
      }
    });
  }
}
