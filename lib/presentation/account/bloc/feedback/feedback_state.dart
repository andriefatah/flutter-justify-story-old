part of 'feedback_bloc.dart';

@freezed
class FeedbackState with _$FeedbackState {
  const factory FeedbackState.initial() = _Initial;
  const factory FeedbackState.loading() = _Loading;
  const factory FeedbackState.success(String message) = _Success;
  const factory FeedbackState.failure(String errorMessage) = _Failure;
}
