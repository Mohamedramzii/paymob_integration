part of 'payment_cubit.dart';

@immutable
abstract class PaymentState {}

class PaymentInitial extends PaymentState {}

class PaymentAuthTokenSuccessState extends PaymentState {}

class PaymentAuthTokenLoadingState extends PaymentState {}

class PaymentAuthTokenfailureState extends PaymentState {
  final String errMessage;
  PaymentAuthTokenfailureState({
    required this.errMessage,
  });
}

class PaymentGetOrderRegisterationIDSuccessState extends PaymentState {}

class PaymentGetOrderRegisterationIDLoadingState extends PaymentState {}

class PaymentGetOrderRegisterationIDfailureState extends PaymentState {
  final String errMessage;
  PaymentGetOrderRegisterationIDfailureState({
    required this.errMessage,
  });
}

class PaymentgetPaymentKeyRequestSuccessState extends PaymentState {}

class PaymentgetPaymentKeyRequestLoadingState extends PaymentState {}

class PaymentgetPaymentKeyRequestfailureState extends PaymentState {
  final String errMessage;
  PaymentgetPaymentKeyRequestfailureState({
    required this.errMessage,
  });
}

class PaymentgetGetRefCodeSuccessState extends PaymentState {}

class PaymentgetGetRefCodeLoadingState extends PaymentState {}

class PaymentgetGetRefCodefailureState extends PaymentState {
  final String errMessage;
  PaymentgetGetRefCodefailureState({
    required this.errMessage,
  });
}
