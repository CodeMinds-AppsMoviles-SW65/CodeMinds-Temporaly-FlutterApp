import 'package:dio/dio.dart';
import 'package:flutter_project/core/data/local/dao/local_account_dao.dart';
import 'package:flutter_project/core/data/local/entity/local_account_entity.dart';

class DioRequestInterceptor extends Interceptor {
  DioRequestInterceptor();

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    // create a list of the endpoints where you don't need to pass a token.
    final listOfPaths = <String>[
      '/authentication/sign-up',
      '/authentication/sign-in',
      '/authentication/sign-in',
      '/authentication/refresh-token',
    ];

    // Check if the requested endpoint match in the
    if (listOfPaths.contains(options.path.toString())) {
      // if the endpoint is matched then skip adding the token.
      return handler.next(options);
    }

    LocalAccountEntity? account = await LocalAccountDao().getAccount();

    if (account == null) {
      return handler.next(options);
    }

    var token = account.token;

    var authToken = 'Bearer $token';
    options.headers.addAll({'Authorization': authToken});
    return handler.next(options);
  }

  // You can also perform some actions in the response or onError.
  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    return handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    return handler.next(err);
  }
}
