abstract class NetworkConstants {
  static const String baseURL = 'https://accept.paymob.com/api';
  static const String getAuthToken = '/auth/tokens';
  static const String getorderID = '/ecommerce/orders';
  static const String getPayementKeyID = '/acceptance/payment_keys';
  static const String getRefCode = '/acceptance/payments/pay';

  static const String paymentAPIKey =
      'ZXlKaGJHY2lPaUpJVXpVeE1pSXNJblI1Y0NJNklrcFhWQ0o5LmV5SmpiR0Z6Y3lJNklrMWxjbU5vWVc1MElpd2ljSEp2Wm1sc1pWOXdheUk2T0RJNE5EQTJMQ0p1WVcxbElqb2lhVzVwZEdsaGJDSjkuOXJpRnhGd1pqbXFLSWloSGhNVGxjbEFyVnE0RjZUa1Mzb3J6ZmxNREpHOEZtSm5wemxWbmgxMlRlN1I3bml5SHA3bF9Ra28tckJhcjl3UjZHM2FxM0E=';

  static String paymentFirstToken = '';
  static String paymentOrderID = '';

  static String finalToken = '';
  static String refCode = '';

  static const String integrationIDKiosk = '3945865';
  static const String integrationIDCard = '3937390';

  static String viseURl =
      '$baseURL/acceptance/iframes/768109?payment_token=$finalToken';
}

class AppImages {
  static const String refCodeImage =
      "https://cdn-icons-png.flaticon.com/128/4090/4090458.png";
  static const String visaImage =
      "https://cdn-icons-png.flaticon.com/128/349/349221.png";
}
