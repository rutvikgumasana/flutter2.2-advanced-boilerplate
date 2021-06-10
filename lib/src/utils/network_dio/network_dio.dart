import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:flutter/material.dart';
import 'package:pvr_customer_app/src/modules/login/login.dart';
import 'package:pvr_customer_app/src/utils/internet_error.dart';
import 'package:pvr_customer_app/src/utils/process_indicator.dart';
import 'package:connectivity/connectivity.dart';

import 'package:pvr_customer_app/src/widgets/common_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NetworkDioHttp {
  static Dio? _dio;
  static String? endPointUrl;
  static DioCacheManager? _dioCacheManager;
  static Options _cacheOptions =
      buildCacheOptions(Duration(seconds: 1), forceRefresh: true);
  static Circle processIndicator = Circle();
  NetworkCheck networkCheck = new NetworkCheck();
  static InternetError internetError = new InternetError();

  static Future<Map<String, String>> _getHeaders() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString('token');

    if (token != null) {
      return {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      };
    } else {
      return {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      };
    }
  }

  static setDynamicHeader({required String endPoint}) async {
    endPointUrl = endPoint;
    BaseOptions options =
        BaseOptions(receiveTimeout: 50000, connectTimeout: 50000);
    _dioCacheManager = DioCacheManager(CacheConfig());
    final token = await _getHeaders();
    options.headers.addAll(token);
    _dio = Dio(options);
    _dio?.interceptors.add(_dioCacheManager?.interceptor);
  }

  // Get Method
  static Future<Map<String, dynamic>> getDioHttpMethod(
      {required BuildContext context, required String url}) async {
    var internet = await check();
    if (internet != null && internet) {
      if (context != null) processIndicator.show(context);
      try {
        Response response = await _dio!.get("$url", options: _cacheOptions);
        var responseBody;
        if (response.statusCode == 200) {
          try {
            responseBody = json.decode(response.data);
          } catch (e) {
            responseBody = response.data;
          }
          Map<String, dynamic> data = {
            'body': responseBody,
            'headers': response.headers,
            'error_description': null,
          };
          if (context != null) processIndicator.hide(context);
          return data;
        } else {
          if (context != null) processIndicator.hide(context);
          return {
            'body': null,
            'headers': null,
            'error_description': "Something Went Wrong",
          };
        }
      } catch (e) {
        print('actionName: $url');
        return await handleErrorRefreshToken(e, context, url, null, 'get');
      }
    } else {
      Map<String, dynamic> responseData = {
        'body': null,
        'headers': null,
        'error_description': "Internet Error",
      };
      internetError.addOverlayEntry(context);
      return responseData;
      // func(false);
    }
  }

  //Put Method
  static Future<Map<String, dynamic>> putDioHttpMethod(
      {required BuildContext context,
      required String url,
      required data}) async {
    var internet = await check();
    if (internet != null && internet) {
      if (context != null) processIndicator.show(context);
      try {
        Response response = await _dio!.put(
          "$url",
          data: data,
          options: _cacheOptions,
        );
        var responseBody;

        if (response.statusCode == 200) {
          if (context != null) processIndicator.hide(context);
          try {
            responseBody = json.decode(json.encode(response.data));
          } catch (e) {
            responseBody = response.data;
          }

          return {
            'body': responseBody,
            'headers': response.headers,
            'error_description': null,
          };
        } else {
          if (context != null) processIndicator.hide(context);
          return {
            'body': null,
            'headers': null,
            'error_description': "Something Went Wrong",
          };
        }
      } catch (e) {
        print('actionName: $url');
        return await handleErrorRefreshToken(e, context, url, data, 'put');
      }
    } else {
      Map<String, dynamic> responseData = {
        'body': null,
        'headers': null,
        'error_description': "Internet Error",
      };
      internetError.addOverlayEntry(context);
      return responseData;
      // func(false);
    }

    // final result = await InternetAddress.lookup('google.com');
    // if (result.isNotEmpty && result[0].rawAddress.isNotEmpty)
  }

  static Future<bool> check() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      return true;
    } else if (connectivityResult == ConnectivityResult.wifi) {
      return true;
    }
    return false;
  }

  //Post Method
  static Future<Map<String, dynamic>> postDioHttpMethod(
      {required BuildContext context,
      required String url,
      required data}) async {
    var internet = await check();
    if (internet != null && internet) {
      if (context != null) processIndicator.show(context);
      try {
        Response response = await _dio!.post(
          "$url",
          data: data,
          options: _cacheOptions,
        );
        var responseBody;

        if (context != null) processIndicator.hide(context);

        if (response.statusCode == 200) {
          try {
            responseBody = json.decode(json.encode(response.data));
          } catch (e) {
            responseBody = response.data;
          }
          return {
            'body': responseBody,
            'headers': response.headers,
            'error_description': null,
          };
        } else {
          return {
            'body': null,
            'headers': null,
            'error_description': "Something Went Wrong",
          };
        }
      } catch (e) {
        print('actionName: $url');
        return await handleErrorRefreshToken(e, context, url, data, 'post');
      }
    } else {
      Map<String, dynamic> responseData = {
        'body': null,
        'headers': null,
        'error_description': "Internet Error",
      };
      internetError.addOverlayEntry(context);
      return responseData;
    }
  }

  static Future<Map<String, dynamic>> handleErrorRefreshToken(dynamic error,
      BuildContext context, String url, data, String? type) async {
    Map<String, dynamic> responseData;
    DioError dioError = error as DioError;
    if (dioError.response?.statusCode == 401) {
      dynamic statusCode = dioError.response?.statusCode;
      if (statusCode == 409 || statusCode == 123) {
        responseData = {
          'body': null,
          'headers': null,
          'error_description': null,
        };
      } else if (statusCode != 410 && statusCode != "410") {
        if (type == "post") {
          return await postDioHttpMethod(
              context: context, url: url, data: data);
        } else if (type == "get") {
          return await getDioHttpMethod(context: context, url: url);
        } else if (type == "put") {
          return await putDioHttpMethod(context: context, url: url, data: data);
        } else if (type == "delete") {
          return await deleteDioHttpMethod(
              context: context, url: url, data: data);
        } else {
          throw ('Not implemented handler for the type = $type');
        }
      } else {
        responseData = {
          'body': null,
          'headers': null,
          'error_description': null,
        };
      }
    } else {
      responseData = {
        'body': null,
        'headers': null,
        'error_description': await _handleError(error, context),
      };
    }

    if (context != null) processIndicator.hide(context);
    return responseData;
  }

  //Delete Method
  static Future<Map<String, dynamic>> deleteDioHttpMethod(
      {required BuildContext context, required String url, data}) async {
    var internet = await check();
    if (internet != null && internet) {
      if (context != null) processIndicator.show(context);
      try {
        Response response = await _dio!.delete(
          "$url",
          data: data,
          options: _cacheOptions,
        );
        var responseBody;

        if (response.statusCode == 200) {
          if (context != null) processIndicator.hide(context);
          try {
            responseBody = json.decode(json.encode(response.data));
          } catch (e) {
            responseBody = response.data;
          }
          return {
            'body': responseBody,
            'headers': response.headers,
            'error_description': null,
          };
        } else {
          if (context != null) processIndicator.hide(context);
          return {
            'body': null,
            'headers': null,
            'error_description': "Something Went Wrong",
          };
        }
      } catch (e) {
        print('actionName: $url');
        return await handleErrorRefreshToken(e, context, url, null, 'delete');
      }
    } else {
      Map<String, dynamic> responseData = {
        'body': null,
        'headers': null,
        'error_description': "Internet Error",
      };
      internetError.addOverlayEntry(context);
      return responseData;
      // func(false);
    }
    // final result = await InternetAddress.lookup('google.com');
    // if (result.isNotEmpty && result[0].rawAddress.isNotEmpty)
  }

  // //Multiple Concurrent
  static Future<Map<String, dynamic>> multipleConcurrentDioHttpMethod(
      {BuildContext? context,
      required String getUrl,
      required String postUrl,
      required Map<String, dynamic> postData}) async {
    try {
      if (context != null) processIndicator.show(context);
      List<Response> response = await Future.wait([
        _dio!.post("$endPointUrl/$postUrl",
            data: postData, options: _cacheOptions),
        _dio!.get("$endPointUrl/$getUrl", options: _cacheOptions)
      ]);
      if (response[0].statusCode == 200 || response[0].statusCode == 200) {
        if (response[0].statusCode == 200 && response[1].statusCode != 200) {
          if (context != null) processIndicator.hide(context);
          return {
            'getBody': null,
            'postBody': json.decode(response[0].data),
            'headers': response[0].headers,
            'error_description': null,
          };
        } else if (response[1].statusCode == 200 &&
            response[0].statusCode != 200) {
          if (context != null) processIndicator.hide(context);
          return {
            'getBody': null,
            'postBody': json.decode(response[0].data),
            'headers': response[0].headers,
            'error_description': null,
          };
        } else {
          if (context != null) processIndicator.hide(context);
          return {
            'postBody': json.decode(response[0].data),
            'getBody': json.decode(response[0].data),
            'headers': response[0].headers,
            'error_description': null,
          };
        }
      } else {
        if (context != null) processIndicator.hide(context);
        return {
          'postBody': null,
          'getBody': null,
          'headers': null,
          'error_description': "Something Went Wrong",
        };
      }
    } catch (e) {
      Map<String, dynamic> responseData = {
        'postBody': null,
        'getBody': null,
        'headers': null,
        'error_description': await _handleError(e, context),
      };
      if (context != null) processIndicator.hide(context);
      return responseData;
    }
  }

  //Sending FormData
  static Future<Map<String, dynamic>> sendingFormDataDioHttpMethod(
      {required BuildContext? context,
      required String url,
      required Map<String, dynamic> data}) async {
    var internet = await check();
    if (internet != null && internet) {
      try {
        if (context != null) processIndicator.show(context);
        FormData formData = new FormData.fromMap(data);
        Response response = await _dio!
            .post("$endPointUrl$url", data: formData, options: _cacheOptions);
        if (response.statusCode == 200) {
          if (context != null) processIndicator.hide(context);
          return {
            'body': json.decode(response.data),
            'headers': response.headers,
            'error_description': null,
          };
        } else {
          if (context != null) processIndicator.hide(context);
          return {
            'body': null,
            'headers': null,
            'error_description': "Something Went Wrong",
          };
        }
      } catch (e) {
        Map<String, dynamic> responseData = {
          'body': null,
          'headers': null,
          'error_description': await _handleError(e, context),
        };
        if (context != null) processIndicator.hide(context);
        return responseData;
      }
    } else {
      Map<String, dynamic> responseData = {
        'body': null,
        'headers': null,
        'error_description': "Internet Error",
      };
      internetError.addOverlayEntry(context);
      return responseData;
      // func(false);
    }
  }

  // Handle Error
  static Future<String> _handleError(error, context) async {
    String errorDescription = "";
    try {
      print("In side try");
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        print("In side internet condition");
        if (error is DioError) {
          // ignore: unnecessary_cast
          DioError dioError = error as DioError;
          switch (dioError.type) {
            case DioErrorType.CANCEL:
              errorDescription = "Request to API server was cancelled";
              print(errorDescription);
              break;
            case DioErrorType.CONNECT_TIMEOUT:
              errorDescription = "Connection timeout with API server";
              print(errorDescription);
              break;
            case DioErrorType.DEFAULT:
              errorDescription =
                  "Connection to API server failed due to internet connection";
              print(errorDescription);
              break;
            case DioErrorType.RECEIVE_TIMEOUT:
              errorDescription =
                  "Receive timeout in connection with API server";
              print(errorDescription);
              break;
            case DioErrorType.RESPONSE:
              errorDescription =
                  "Received invalid status code: ${dioError.response.statusCode}";
              print(errorDescription);
              break;
            case DioErrorType.SEND_TIMEOUT:
              errorDescription = "Send timeout in connection with API server";
              print(errorDescription);
              break;
          }
        } else {
          errorDescription = "Unexpected error occured";
          print(errorDescription);
        }
      }
    } on SocketException catch (_) {
      errorDescription = "Please check your internet connection";
      print(errorDescription);
    }

    if (errorDescription.contains("401")) {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      preferences.clear();
      bool isClear = await preferences.clear();
      if (isClear) {
        print("User is Logging Out");
        CommonMethod().redirectAndRemoveUntil(
          context: context,
          className: LoginScreen(),
        );
      }
    }
    return errorDescription;
  }
}

class NetworkCheck {
  Future<bool> check() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      return true;
    } else if (connectivityResult == ConnectivityResult.wifi) {
      return true;
    }
    return false;
  }

  dynamic checkInternet(bool func) {
    check().then((intenet) {
      if (intenet != null && intenet) {
        return true;
      } else {
        return false;
      }
    });
  }
}
