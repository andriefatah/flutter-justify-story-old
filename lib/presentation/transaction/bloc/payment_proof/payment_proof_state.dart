// payment_proof_state.dart
part of 'payment_proof_bloc.dart';

@freezed
class PaymentProofState with _$PaymentProofState {
  const factory PaymentProofState.initial() = _Initial;
  const factory PaymentProofState.loading() = _Loading;
  const factory PaymentProofState.success(String message) = _Success;
  const factory PaymentProofState.failure(String errorMessage) = _Failure;
}
