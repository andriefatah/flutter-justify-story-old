part of 'apply_coupon_bloc.dart';

@freezed
class ApplyCouponEvent with _$ApplyCouponEvent {
  const factory ApplyCouponEvent.started() = _Started;
  const factory ApplyCouponEvent.applyCoupon(
      String kodeKupon, int totalPembayaran) = _ApplyCoupon;
}
