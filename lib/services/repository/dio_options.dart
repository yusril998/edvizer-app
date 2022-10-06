import 'package:dio/dio.dart';
import 'package:edvizer_app/constants/app_network.dart';

class DioOptions {
  static Options getOptionsWithUserId(String userId, int timeout) {
    return Options(
      headers: {
        'Content-Type': 'application/json',
        'Accept': '*/*',
        'userID': userId,
        'Authorization': 'Bearer ' + AppNetwork.token,
      },
      receiveDataWhenStatusError: true,
      sendTimeout: timeout * 1000, // 60 seconds
      receiveTimeout: timeout * 1000, // 60 seconds
    );
  }

  static Options getOptionsWithHeader(String userId, int timeout) {
    return Options(
      headers: {
        'Content-Type': 'application/json',
        'Accept': '*/*',
        'userID': userId,
        'Authorization': 'Bearer ' + AppNetwork.token,
      },
      receiveDataWhenStatusError: true,
      sendTimeout: timeout * 1000, // 60 seconds
      receiveTimeout: timeout * 1000, // 60 seconds
    );
  }

  static Options getOptions() {
    return Options(
      headers: {
        'Content-Type': 'application/json',
        'Accept': '*/*',
        'Authorization': 'Bearer ' + AppNetwork.token,
      },
      receiveDataWhenStatusError: true,
      sendTimeout: AppNetwork.timeout, // 60 seconds
      receiveTimeout: AppNetwork.timeout,
    );
  }
}
