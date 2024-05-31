// payment_proof_event.dart
part of 'payment_proof_bloc.dart';

@freezed
class PaymentProofEvent with _$PaymentProofEvent {
  const factory PaymentProofEvent.started() = _Started;
  const factory PaymentProofEvent.uploadPaymentProof({
    required int userId,
    required int transactionId,
    required File fileBukti,
    required double nominal,
    required String metodePembayaran,
    String? catatan,
  }) = _UploadPaymentProof;
}
