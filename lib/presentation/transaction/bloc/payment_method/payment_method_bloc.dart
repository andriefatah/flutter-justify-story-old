// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:flutter_reservasi_foto_justify_story_app/data/datasource/payment_method_remote_datasource.dart';
import 'package:flutter_reservasi_foto_justify_story_app/data/models/response/payment_method_response_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'payment_method_event.dart';
part 'payment_method_state.dart';
part 'payment_method_bloc.freezed.dart';

class PaymentMethodBloc extends Bloc<PaymentMethodEvent, PaymentMethodState> {
  final PaymentMethodRemoteDatasource _paymentMethodRemoteDatasource;

  PaymentMethodBloc(this._paymentMethodRemoteDatasource)
      : super(const PaymentMethodState.initial()) {
    on<PaymentMethodEvent>((event, emit) async {
      // Cek jika event adalah GetPaymentMethods, maka emit state loading
      if (event is _GetPaymentMethods) {
        emit(const PaymentMethodState.loading());
        try {
          final result =
              await _paymentMethodRemoteDatasource.getPaymentMethods();
          result.fold(
            (l) => emit(PaymentMethodState.error(l)),
            (r) => emit(PaymentMethodState.success(r)),
          );
        } catch (e) {
          emit(PaymentMethodState.error(e.toString()));
        }
      }
    });
  }
}
