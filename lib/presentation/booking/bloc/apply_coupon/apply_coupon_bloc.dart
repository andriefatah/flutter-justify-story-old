// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:flutter_reservasi_foto_justify_story_app/data/datasource/coupon_remote_datasource.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'apply_coupon_event.dart';
part 'apply_coupon_state.dart';
part 'apply_coupon_bloc.freezed.dart';

class ApplyCouponBloc extends Bloc<ApplyCouponEvent, ApplyCouponState> {
  final CouponRemoteDatasource _couponRemoteDatasource;

  ApplyCouponBloc(this._couponRemoteDatasource)
      : super(const ApplyCouponState.initial()) {
    on<_ApplyCoupon>((event, emit) async {
      emit(const ApplyCouponState.loading());
      final result = await _couponRemoteDatasource.applyCoupon(
          event.kodeKupon, event.totalPembayaran);

      result.fold(
        (l) => emit(ApplyCouponState.error(l)),
        (r) => emit(ApplyCouponState.success(
            r.message ?? 'Kupon berhasil diterapkan', r.totalPembayaranBaru)),
      );
    });
  }
}
