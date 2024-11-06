import 'package:dio/dio.dart';
import 'package:flutter_project/core/constants/app_constants.dart';
import 'package:flutter_project/core/dio/interceptor/dio_request_interceptor.dart';

class Request {
  static final Request _instance = Request._internal();

  var dio = Dio(BaseOptions(
    headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    },
  ));

  factory Request() {
    return _instance;
  }

  Request._internal() {
    dio.options.baseUrl = AppConstants.baseUrl;
    dio.interceptors
      ..add(LogInterceptor())
      ..add(DioRequestInterceptor())
      ..add(InterceptorsWrapper(
        onError: (DioException error, ErrorInterceptorHandler handler) {
          if (error.response?.statusCode == 400 ||
              error.response?.statusCode == 404) {
            var errorMessage =
                error.response?.data['message'] ?? 'Unknown error';
            return handler.next(DioException(
              requestOptions: error.requestOptions,
              response: Response(
                requestOptions: error.requestOptions,
                statusCode: error.response?.statusCode,
                data: {'message': errorMessage},
              ),
            ));
          }
          return handler.next(error);
        },
      ));
  }
}
