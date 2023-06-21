import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:paymob_trial/core/network/dioHelper.dart';

import '../../core/network/constants.dart';

part 'payment_state.dart';

class PaymentCubit extends Cubit<PaymentState> {
  PaymentCubit() : super(PaymentInitial());

  getAuthToken() {
    emit(PaymentAuthTokenLoadingState());
    DioHelper.postData(
        url: NetworkConstants.getAuthToken,
        data: {"api_key": NetworkConstants.paymentAPIKey}).then((value) {
      NetworkConstants.paymentFirstToken = value.data['token'];
      debugPrint('Token: ${NetworkConstants.paymentFirstToken}');
      emit(PaymentAuthTokenSuccessState());
    }).catchError((e) {
      debugPrint('GetAuthTokenError: $e');
      emit(PaymentAuthTokenfailureState(errMessage: e.toString()));
    });
  }

  getOrderRegisterationID({
    required String firstName,
    required String lastname,
    required String price,
    required String email,
    required String phone,
  }) {
    emit(PaymentGetOrderRegisterationIDLoadingState());
    DioHelper.postData(url: NetworkConstants.getorderID, data: {
      "auth_token": NetworkConstants.paymentFirstToken,
      "delivery_needed": "false",
      "amount_cents": price,
      "currency": "EGP",
      // "merchant_order_id": ,
      "items": [
        {
        "name": "ASC1515",
        "amount_cents": "500",
        "description": "Smart Watch",
        "quantity": "1"
    },
    { 
        "name": "ERT6565",
        "amount_cents": "200",
        "description": "Power Bank",
        "quantity": "1"
    }
      ],
    }).then((value) {
      NetworkConstants.paymentOrderID = value.data['id'].toString();
      debugPrint('OrderID: ${NetworkConstants.paymentOrderID}');
      getPaymentKeyRequest(
          firstName: firstName,
          lastname: lastname,
          price: price,
          email: email,
          phone: phone);
      emit(PaymentGetOrderRegisterationIDSuccessState());
    }).catchError((e) {
      debugPrint('getOrderRegisterationIDError: $e');
      emit(
          PaymentGetOrderRegisterationIDfailureState(errMessage: e.toString()));
    });
  }

  getPaymentKeyRequest({
    required String firstName,
    required String lastname,
    required String price,
    required String email,
    required String phone,
  }) {
    emit(PaymentgetPaymentKeyRequestLoadingState());
    DioHelper.postData(url: NetworkConstants.getPayementKeyID, data: {
      "auth_token": NetworkConstants.paymentFirstToken,
      "amount_cents": price,
      "expiration": 3600,
      "order_id": NetworkConstants.paymentOrderID,
      "billing_data": {
        "apartment": "NA",
        "email": email,
        "floor": "NA",
        "first_name": firstName,
        "street": "NA",
        "building": "NA",
        "phone_number": phone,
        "shipping_method": "NA",
        "postal_code": "NA",
        "city": "NA",
        "country":"NA",
        "last_name": lastname,
        "state": "NA",
      },
      "currency": "EGP",
      //card
      "integration_id": NetworkConstants.integrationIDCard,
      "lock_order_when_paid": "false"
    }).then((value) {
      NetworkConstants.finalToken = value.data['token'];
      debugPrint('Final Token: ${NetworkConstants.finalToken}');
      emit(PaymentgetPaymentKeyRequestSuccessState());
    }).catchError((e) {
      debugPrint('getPaymentKeyRequestError: $e');
      emit(PaymentgetPaymentKeyRequestfailureState(errMessage: e.toString()));
    });
  }

  getRefCode() {
    emit(PaymentgetGetRefCodeLoadingState());

    DioHelper.postData(url: NetworkConstants.getRefCode, data: {
      "source": {
        "identifier": "AGGREGATOR",
        "subtype": "AGGREGATOR",
      },
      "payment_token": NetworkConstants.finalToken
    }).then((value) {
      NetworkConstants.refCode = value.data['id'].toString();
      debugPrint('Get Ref Code Successfully');
      emit(PaymentgetGetRefCodeSuccessState());
    }).catchError((e) {
      debugPrint('getRefCodeError: $e');
      emit(PaymentgetGetRefCodefailureState(errMessage: e.toString()));
    });
  }
}
