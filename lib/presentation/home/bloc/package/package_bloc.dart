// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:flutter_reservasi_foto_justify_story_app/data/datasource/package_remote_datasource.dart';
import 'package:flutter_reservasi_foto_justify_story_app/data/models/response/package_response_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'package_event.dart';
part 'package_state.dart';
part 'package_bloc.freezed.dart';

class PackageBloc extends Bloc<PackageEvent, PackageState> {
  final PackageRemoteDatasource _packageRemoteDatasource;

  PackageBloc(this._packageRemoteDatasource)
      : super(const PackageState.initial()) {
    on<PackageEvent>((event, emit) async {
      await event.when(
        started: () async {
          emit(const PackageState.loading());
          await Future.delayed((const Duration(seconds: 4)));
          try {
            final result = await _packageRemoteDatasource.getPackages();
            result.fold(
              (l) => emit(PackageState.error(l)),
              (r) => emit(PackageState.loaded(r)),
            );
          } catch (e) {
            emit(PackageState.error(e.toString()));
          }
        },
        // Tambahkan penanganan untuk event getPackage
        getPackage: () async {
          emit(const PackageState.loading());
          await Future.delayed((const Duration(seconds: 2)));
          try {
            final result = await _packageRemoteDatasource.getPackages();
            result.fold(
              (l) => emit(PackageState.error(l)),
              (r) => emit(PackageState.loaded(r)),
            );
          } catch (e) {
            emit(PackageState.error(e.toString()));
          }
        },
        // Penanganan untuk event getPackageByCategoryName
        getPackageByCategoryName: (e) async {
          emit(const PackageState.loading());
          try {
            final result =
                await _packageRemoteDatasource.getPackagesByCategoryName(e);
            result.fold(
              (l) => emit(PackageState.error(l)),
              (r) => emit(PackageState.loaded(r)),
            );
          } catch (e) {
            emit(PackageState.error(e.toString()));
          }
        },
      );
    });
  }
}
