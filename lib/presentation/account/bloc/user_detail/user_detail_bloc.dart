// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:flutter_reservasi_foto_justify_story_app/data/datasource/user_detail_remote_datasource.dart';
import 'package:flutter_reservasi_foto_justify_story_app/data/models/request/user_detail_update_request_model.dart';
import 'package:flutter_reservasi_foto_justify_story_app/data/models/response/user_detail_response_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_detail_event.dart';
part 'user_detail_state.dart';
part 'user_detail_bloc.freezed.dart';

class UserDetailBloc extends Bloc<UserDetailEvent, UserDetailState> {
  final UserDetailRemoteDatasource _userDetailRemoteDatasource;

  UserDetailBloc(this._userDetailRemoteDatasource)
      : super(const UserDetailState.initial()) {
    on<_GetUserDetail>((event, emit) async {
      emit(const UserDetailState.loading());

      try {
        final result = await _userDetailRemoteDatasource.getUserDetail();

        result.fold(
          (l) => emit(UserDetailState.error(l)),
          (r) => emit(UserDetailState.success(r)),
        );
      } catch (e) {
        emit(UserDetailState.error(e.toString()));
      }
    });

    on<_UpdateUserDetail>((event, emit) async {
      emit(const UserDetailState.loading());
      try {
        final result =
            await _userDetailRemoteDatasource.updateUserDetail(event.data);
        result.fold(
          (l) => emit(UserDetailState.error(l)),
          (r) => emit(UserDetailState.updateSuccess(r)),
        );
      } catch (e) {
        emit(UserDetailState.error(e.toString()));
      }
    });
  }
}
