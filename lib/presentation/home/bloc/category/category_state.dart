part of 'category_bloc.dart';

@freezed
class CategoryState with _$CategoryState {
  const factory CategoryState.initial() = _Initial;
  const factory CategoryState.loadInProgress() = _LoadInProgress;
  const factory CategoryState.loadSuccess(
      List<CategoryResponseModel> categories) = _LoadSuccess;
  const factory CategoryState.loadFailure(String errorMessage) = _LoadFailure;
}
