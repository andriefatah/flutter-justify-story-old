// payment_proof_bloc.dart
// ignore_for_file: depend_on_referenced_packages

import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter_reservasi_foto_justify_story_app/data/datasource/payment_proof_remote_datasource.dart';
import 'package:flutter_reservasi_foto_justify_story_app/data/models/request/payment_proof_request_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'payment_proof_event.dart';
part 'payment_proof_state.dart';
part 'payment_proof_bloc.freezed.dart';

class PaymentProofBloc extends Bloc<PaymentProofEvent, PaymentProofState> {
  final PaymentProofRemoteDataSource _remoteDataSource;

  PaymentProofBloc(this._remoteDataSource)
      : super(const PaymentProofState.initial()) {
    on<_UploadPaymentProof>((event, emit) async {
      emit(const PaymentProofState.loading());
      try {
        final requestModel = PaymentProofRequestModel(
          userId: event.userId,
          transactionId: event.transactionId,
          fileBukti: event.fileBukti,
          nominal: event.nominal,
          metodePembayaran: event.metodePembayaran,
          catatan: event.catatan,
        );

        final result = await _remoteDataSource.uploadPaymentProof(requestModel);
        result.fold(
          (failure) => emit(PaymentProofState.failure(failure)),
          (message) => emit(PaymentProofState.success(message)),
        );
      } catch (e) {
        emit(PaymentProofState.failure(e.toString()));
      }
    });
  }
}
