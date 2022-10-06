import 'dart:async';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:edvizer_app/constants/app_network.dart';
import 'package:edvizer_app/services/repository/dio_options.dart';
import 'package:edvizer_app/utils/storage_utils.dart';
import 'package:edvizer_app/utils/utility.dart';

class Repository {
  Future<Response?> get(String url) async {
    try {
      var urlRequest = AppNetwork.baseUrl + url;

      cprint(urlRequest, event: "api $urlRequest");
      String? userId = await StorageUtils.getUserId() ?? "";
      int timeout = AppNetwork.limit;
      Response json = await Dio()
          .get(urlRequest,
              options: DioOptions.getOptionsWithUserId(userId, timeout))
          .timeout(Duration(seconds: timeout));

      cprint(json, event: "Repsonse api $urlRequest");
      return json;
    } on DioError catch (e) {
      if (e.type == DioErrorType.connectTimeout) {
        throw Exception("Connection  Timeout Exception");
      } else if (e.response != null) {
        var rawData = e.response;
        cprint(rawData, errorIn: "erro");
        var response = rawData!.data['meta']['message'] ?? " terjadi kesalahan";
        throw response;
      } else {
        throw e.message;
      }
    } on TimeoutException catch (e) {
      throw "proses terlalu lama";
    } catch (e) {
      throw "terjadi kesalahan : ${e.toString()}";
    }
  }

  Future<Response?> post(String url, Map<String, dynamic> body) async {
    try {
      String? userId = await StorageUtils.getUserId();
      var urlRequest = AppNetwork.baseUrl + url;
      cprint(body, event: "Body api $urlRequest");
      log(urlRequest);
      int timeout = AppNetwork.limit;
      FormData formData = FormData.fromMap(body);

      Response json = await Dio()
          .post(urlRequest,
              options: DioOptions.getOptionsWithUserId(userId!, timeout),
              data: formData)
          .timeout(Duration(seconds: timeout));

      cprint(json, event: "Repsonse api $urlRequest");
      return json;
    } on DioError catch (e) {
      if (e.type == DioErrorType.connectTimeout) {
        throw Exception("Connection  Timeout Exception");
      } else if (e.response != null) {
        var rawData = e.response;
        cprint(rawData!.data, event: "Repsonse error");
        var response = rawData.data['meta']['message'] ?? " terjadi kesalahan";
        throw response;
      } else {
        throw e.message;
      }
    } on TimeoutException catch (e) {
      throw "proses terlalu lama";
    } catch (e) {
      throw "terjadi kesalahan : ${e.toString()}";
    }
  }

  Future<Response?> put(String url, Map<String, dynamic> body) async {
    try {
      int timeout = AppNetwork.limit;
      String? userId = await StorageUtils.getUserId();
      var urlRequest = AppNetwork.baseUrl + url;
      var formData = body;

      Response json = await Dio()
          .put(urlRequest,
              options: DioOptions.getOptionsWithUserId(userId!, timeout),
              data: formData)
          .timeout(Duration(seconds: timeout));
      cprint(body, event: "Body api $urlRequest");
      cprint(json, event: "Repsonse api $urlRequest");
      return json;
    } on DioError catch (e) {
      if (e.type == DioErrorType.connectTimeout) {
        throw Exception("Connection  Timeout Exception");
      } else if (e.response != null) {
        var rawData = e.response;
        var response = rawData!.data['meta']['message'] ?? " terjadi kesalahan";
        throw response;
      } else {
        throw e.message;
      }
    } on TimeoutException catch (e) {
      throw "proses terlalu lama";
    } catch (e) {
      throw "terjadi kesalahan : ${e.toString()}";
    }
  }

  Future<Response?> delete(String url, Map<String, dynamic> body) async {
    try {
      int timeout = AppNetwork.limit;
      String? userId = await StorageUtils.getUserId();
      var urlRequest = AppNetwork.baseUrl + url;
      FormData formData = FormData.fromMap(body);
      Response json = await Dio()
          .delete(urlRequest,
              options: DioOptions.getOptionsWithUserId(userId!, timeout),
              data: formData)
          .timeout(Duration(seconds: timeout));
      cprint(body, event: "Body api $urlRequest");
      cprint(json, event: "Repsonse api $urlRequest");
      // response = FeedModel.listDummyFeed();
      return json;
    } on DioError catch (e) {
      if (e.type == DioErrorType.connectTimeout) {
        throw Exception("Connection  Timeout Exception");
      } else if (e.response != null) {
        var rawData = e.response;
        var response =
            rawData!.data; //['meta']['message'] ?? " terjadi kesalahan";
        throw response;
      } else {
        throw e.message;
      }
    } on TimeoutException catch (e) {
      throw "proses terlalu lama";
    } catch (e) {
      throw "terjadi kesalahan : ${e.toString()}";
    }
  }

  /// provide hit api with user id

  Future<Response?> getWithHeader(
    String url, {
    required String idHeader,
  }) async {
    try {
      var urlRequest = AppNetwork.baseUrl + url;
      cprint(urlRequest, event: "api $urlRequest");
      log("usernyaaaa $idHeader");
      int timeout = AppNetwork.limit;
      Response json = await Dio()
          .get(urlRequest,
              options: DioOptions.getOptionsWithHeader(idHeader, timeout))
          .timeout(Duration(seconds: timeout));

      cprint(json, event: "Repsonse api $urlRequest");
      return json;
    } on DioError catch (e) {
      if (e.type == DioErrorType.connectTimeout) {
        throw Exception("Connection  Timeout Exception");
      } else if (e.response != null) {
        var rawData = e.response;
        cprint(rawData, errorIn: "erro");
        var response = rawData!.data['meta']['message'] ?? " terjadi kesalahan";
        throw response;
      } else {
        throw e.message;
      }
    } on TimeoutException catch (e) {
      throw "proses terlalu lama";
    } catch (e) {
      throw "terjadi kesalahan : ${e.toString()}";
    }
  }

  Future<Response?> posttWithHeader(
    String url,
    Map<String, dynamic> body, {
    required String idHeader,
  }) async {
    try {
      var urlRequest = AppNetwork.baseUrl + url;
      cprint(body, event: "Body api $urlRequest");

      int timeout = AppNetwork.limit;
      FormData formData = FormData.fromMap(body);

      Response json = await Dio()
          .post(urlRequest,
              options: DioOptions.getOptionsWithHeader(idHeader, timeout),
              data: formData)
          .timeout(Duration(seconds: timeout));

      cprint(json, event: "Repsonse api $urlRequest");
      return json;
    } on DioError catch (e) {
      if (e.type == DioErrorType.connectTimeout) {
        throw Exception("Connection  Timeout Exception");
      } else if (e.response != null) {
        var rawData = e.response;
        cprint(rawData!.data, event: "Repsonse error");
        var response = rawData.data['meta']['message'] ?? " terjadi kesalahan";
        throw response;
      } else {
        throw e.message;
      }
    } on TimeoutException catch (e) {
      throw "proses terlalu lama";
    } catch (e) {
      throw "terjadi kesalahan : ${e.toString()}";
    }
  }

  Future<Response?> puttWithHeader(
    String url,
    Map<String, dynamic> body, {
    required String idHeader,
  }) async {
    try {
      int timeout = AppNetwork.limit;
      var urlRequest = AppNetwork.baseUrl + url;
      var formData = body;

      Response json = await Dio()
          .put(urlRequest,
              options: DioOptions.getOptionsWithHeader(idHeader, timeout),
              data: formData)
          .timeout(Duration(seconds: timeout));
      cprint(body, event: "Body api $urlRequest");
      cprint(json, event: "Repsonse api $urlRequest");
      return json;
    } on DioError catch (e) {
      if (e.type == DioErrorType.connectTimeout) {
        throw Exception("Connection  Timeout Exception");
      } else if (e.response != null) {
        var rawData = e.response;
        var response = rawData!.data['meta']['message'] ?? " terjadi kesalahan";
        throw response;
      } else {
        throw e.message;
      }
    } on TimeoutException catch (e) {
      throw "proses terlalu lama";
    } catch (e) {
      throw "terjadi kesalahan : ${e.toString()}";
    }
  }

  Future<Response?> deletetWithHeader(
    String url,
    Map<String, dynamic> body, {
    required String idHeader,
  }) async {
    try {
      int timeout = AppNetwork.limit;
      var urlRequest = AppNetwork.baseUrl + url;
      FormData formData = FormData.fromMap(body);

      Response json = await Dio()
          .delete(urlRequest,
              options: DioOptions.getOptionsWithHeader(idHeader, timeout),
              data: formData)
          .timeout(Duration(seconds: timeout));
      cprint(body, event: "Body api $urlRequest");
      cprint(json, event: "Repsonse api $urlRequest");
      // response = FeedModel.listDummyFeed();
      return json;
    } on DioError catch (e) {
      if (e.type == DioErrorType.connectTimeout) {
        throw Exception("Connection  Timeout Exception");
      } else if (e.response != null) {
        var rawData = e.response;
        var response = rawData!.data['meta']['message'] ?? " terjadi kesalahan";
        throw response;
      } else {
        throw e.message;
      }
    } on TimeoutException catch (e) {
      throw "proses terlalu lama";
    } catch (e) {
      throw "terjadi kesalahan : ${e.toString()}";
    }
  }
}
