import 'package:dio/dio.dart';
import 'package:paymob_trial/core/network/constants.dart';

class DioHelper {
  static late Dio dio;

  static initDio() {
    dio = Dio(
      BaseOptions(
          baseUrl: NetworkConstants.baseURL,
          headers: {'Content-Type': 'application/json'},
          receiveDataWhenStatusError: true),
    );
  }

  static Future<Response> postData({
    required String url,
    required Map<String, dynamic>? data,
  }) async {
    return await dio.post(
      url,
      data: data,
    );
  }
}
