// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:flutter_reservasi_foto_justify_story_app/data/datasource/category_remote_datasource.dart';
import 'package:flutter_reservasi_foto_justify_story_app/data/models/response/category_response_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'category_event.dart';
part 'category_state.dart';
part 'category_bloc.freezed.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final CategoryRemoteDatasource _categoryRemoteDatasource;

  CategoryBloc(this._categoryRemoteDatasource)
      : super(const CategoryState.initial()) {
    on<CategoryEvent>((event, emit) async {
      if (event is _Started) {
        emit(const CategoryState.loadInProgress());
        // await Future.delayed((Duration(seconds: 3)));
        try {
          final result = await _categoryRemoteDatasource.getCategories();
          // print(result);
          result.fold(
            (l) => emit(CategoryState.loadFailure(l)),
            (r) => emit(CategoryState.loadSuccess(r)),
          );
        } catch (e) {
          emit(CategoryState.loadFailure(e.toString()));
        }
      }
    });
  }
}
