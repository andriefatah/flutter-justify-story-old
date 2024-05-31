part of 'feedback_bloc.dart';

@freezed
class FeedbackEvent with _$FeedbackEvent {
  const factory FeedbackEvent.started() = _Started;
  const factory FeedbackEvent.submitFeedback({
    required String judul,
    required String pesan,
    required int userId,
  }) = _SubmitFeedback;
}
