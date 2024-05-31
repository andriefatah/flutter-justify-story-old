// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_reservasi_foto_justify_story_app/data/datasource/auth_remote_datasource.dart';
import 'package:flutter_reservasi_foto_justify_story_app/data/models/request/register_request_model.dart';
// import 'package:flutter_reservasi_foto_justify_story_app/data/models/response/register_response_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'register_event.dart';
part 'register_state.dart';
part 'register_bloc.freezed.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final AuthRemoteDatasource _authRemoteDatasource;
  RegisterBloc(this._authRemoteDatasource) : super(const _Initial()) {
    on<_Register>((event, emit) async {
      emit(const _Loading());
      final result = await _authRemoteDatasource.register(event.requestModel);
      result.fold(
        (l) => emit(_Error(l)),
        (r) => emit(const _Success()),
      );
    });
  }
}
