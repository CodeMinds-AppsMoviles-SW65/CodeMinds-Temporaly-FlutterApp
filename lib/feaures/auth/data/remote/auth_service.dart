import 'package:dio/dio.dart';
import 'package:flutter_project/feaures/auth/data/remote/dto/refresh_token_response_dto.dart';
import 'package:flutter_project/feaures/auth/data/remote/dto/sign_in_request_dto.dart';
import 'package:flutter_project/feaures/auth/data/remote/dto/sign_in_response_dto.dart';
import 'package:flutter_project/feaures/auth/data/remote/dto/sign_up_request_dto.dart';
import 'package:flutter_project/feaures/auth/data/remote/dto/sign_up_response_dto.dart';
import 'package:retrofit/retrofit.dart';

part 'auth_service.g.dart';

@RestApi()
abstract class AuthService {
  factory AuthService(Dio dio, {String baseUrl}) = _AuthService;

  @POST("authentication/sign-up")
  Future<HttpResponse<SignUpResponseDto>> signUp(
      @Body() SignUpRequestDto signUpRequestDto);

  @POST("authentication/sign-in")
  Future<HttpResponse<SignInResponseDto>> signIn(
      @Body() SignInRequestDto signInRequestDto);

  @POST("authentication/refresh-token/{refreshToken}")
  Future<HttpResponse<RefreshTokenResponseDto>> refreshToken(
      @Path("refreshToken") String refreshToken);
}
