import 'dart:async';

import 'dart:io';

import 'package:best_stories/Models/StoriesModel.dart';
import 'package:best_stories/Models/error_response.dart';
import 'package:dio/dio.dart' as dio;

import 'api_constant.dart';

enum RequestTypeDio {
  GetStories,
}

dynamic getRequestBody(String requestBody) {
  return requestBody;
}

String genericHandleErrorResponse(ErrorResponse errorResponse) {
  logD(errorResponse.message.toString() + errorResponse.key.toString());

  if (errorResponse.message == CODE_1) {
    return "There is no internet connection!";
  } else if (errorResponse.message == CODE_2) {
    return 'Server error check with Adminstrator! \n' + errorResponse.error;
  } else if (errorResponse.code == CODE_401) {
    return 'token Expired';
  } else {
    return 'Invalid error ,try Again later ';
  }
}

Future<dynamic> getCallServiceDio(String url, RequestTypeDio requestType,
    {Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? header}) async {
  var dioRequest = dio.Dio();
  logD('get url $url');
  try {
    final result = await InternetAddress.lookup('google.com');
    if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
      try {
        final response = await dioRequest
            .get(
              url,
              queryParameters: queryParameters,
              options: dio.Options(headers: header),

              //{ HttpHeaders.contentTypeHeader: 'application/json',
              // if (headerToken != null)
              //   HttpHeaders.authorizationHeader: 'Bearer $headerToken',}
            )
            .timeout(const Duration(seconds: 120));
        final statusCode = response.statusCode;
        logD('statusCode $statusCode');
        logD('response ${response.data}');
        if (statusCode != 200) {
          logD('error response ${response.data}');
          if (statusCode != null && statusCode > 500 && statusCode < 599) {
            throw ErrorResponse(
                message: CODE_2,
                error: "statusCode:" + statusCode.toString(),
                code: '',
                key: '');
          } else if (statusCode == 401) {
            var errorResponse = errorResponseFromJson(response.data);
            throw ErrorResponse(
                code: CODE_401,
                key: errorResponse.key,
                message: errorResponse.message,
                error: errorResponse.error);
          } else {
            var errorResponse = errorResponseFromJson(response.data);
            throw ErrorResponse(
                code: errorResponse.code,
                key: errorResponse.key,
                message: errorResponse.message,
                error: errorResponse.error);
          }
        }
        switch (requestType) {
          case RequestTypeDio.GetStories:
            return getStoriesResponse(response.data);

          // break;

          default:
            {}
        }
      } on NoSuchMethodError catch (e) {
        logD('error here $e');

        throw ErrorResponse(
            message: CODE_2,
            error: e.toString() + " NoSuchMethodError",
            code: '',
            key: '');
      } on SocketException catch (e) {
        logD('error here $e');
        throw ErrorResponse(
            message: CODE_2,
            error: e.message + " SocketException",
            code: '',
            key: '');
      } on TimeoutException catch (e) {
        logD('error here $e');
        throw ErrorResponse(
            message: CODE_2,
            error: e.message ?? '' + " TimeoutException",
            code: '',
            key: '');
      } on HandshakeException catch (e) {
        logD('error here $e');
        throw ErrorResponse(
            message: CODE_2,
            error: e.message + " HandshakeException",
            code: '',
            key: '');
      } on TypeError catch (e) {
        logD('error here $e');
        throw ErrorResponse(
            message: CODE_2,
            error: '${e.toString()} TypeError',
            code: '',
            key: '');
      } on FormatException catch (e) {
        logD('error here $e');
        throw ErrorResponse(
            message: CODE_2,
            error: e.message + "formatException",
            code: '',
            key: '');
      }
    }
  } on SocketException catch (e) {
    print('aaaa');
    logD('error here $e');
    throw ErrorResponse(message: CODE_1, code: '', error: '', key: '');
  }
}
