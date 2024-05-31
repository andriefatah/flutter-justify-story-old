// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:flutter_reservasi_foto_justify_story_app/data/datasource/feedback_remote_datasource.dart';
import 'package:flutter_reservasi_foto_justify_story_app/data/models/request/feedback_request_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'feedback_event.dart';
part 'feedback_state.dart';
part 'feedback_bloc.freezed.dart';

class FeedbackBloc extends Bloc<FeedbackEvent, FeedbackState> {
  final FeedbackRemoteDatasource _feedbackRemoteDatasource;

  FeedbackBloc(this._feedbackRemoteDatasource)
      : super(const FeedbackState.initial()) {
    on<_SubmitFeedback>((event, emit) async {
      emit(const FeedbackState.loading());
      try {
        // Membuat instance dari FeedbackRequestModel
        final feedbackRequest = FeedbackRequestModel(
          judul: event.judul,
          pesan: event.pesan,
          userId: event.userId,
        );
        // Memanggil fungsi addFeedback dengan instance FeedbackRequestModel
        final result =
            await _feedbackRemoteDatasource.addFeedback(feedbackRequest);
        result.fold(
          (failure) => emit(FeedbackState.failure(failure)),
          (message) => emit(FeedbackState.success(message)),
        );
      } catch (e) {
        emit(FeedbackState.failure(e.toString()));
      }
    });
  }
}
