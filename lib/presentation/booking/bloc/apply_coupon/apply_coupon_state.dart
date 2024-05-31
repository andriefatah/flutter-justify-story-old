// ignore_for_file: non_constant_identifier_names

part of 'apply_coupon_bloc.dart';

@freezed
class ApplyCouponState with _$ApplyCouponState {
  const factory ApplyCouponState.initial() = _Initial;
  const factory ApplyCouponState.loading() = _Loading;
  const factory ApplyCouponState.success(
      String message, int? totalPembayaranBaru) = _Success;
  const factory ApplyCouponState.error(String Message) = _Error;
}
