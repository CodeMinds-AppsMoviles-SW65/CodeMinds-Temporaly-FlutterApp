import 'package:dio/dio.dart';
import 'package:flutter_project/feaures/auth/data/remote/dto/account_dto.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';

part 'account_service.g.dart';

@RestApi()
abstract class AccountService {
  factory AccountService(Dio dio, {String baseUrl}) = _AccountService;

  @POST("account/{username}")
  Future<HttpResponse<AccountDto>> getAccount(@Path("username") String username);
}