import 'package:flutter_project/core/dio/request.dart';
import 'package:flutter_project/feaures/auth/data/remote/auth_service.dart';
import 'package:flutter_project/feaures/auth/data/remote/dto/refresh_token_response_dto.dart';
import 'package:flutter_project/feaures/auth/data/remote/dto/sign_in_request_dto.dart';
import 'package:flutter_project/feaures/auth/data/remote/dto/sign_in_response_dto.dart';
import 'package:flutter_project/feaures/auth/data/remote/dto/sign_up_request_dto.dart';
import 'package:flutter_project/feaures/auth/data/remote/dto/sign_up_response_dto.dart';

class AuthRepository {
  static final AuthRepository _instance = AuthRepository._internal();

  factory AuthRepository() {
    return _instance;
  }

  AuthRepository._internal();

  final AuthService _authService = AuthService(Request().dio);

  Future<SignInResponseDto?> signIn(String email, String password) async {
    try {
      final response = await _authService.signIn(SignInRequestDto(
        usernameOrEmail: email,
        password: password,
      ));
      return response.data;
    }  catch (e) {
      return null;
    }
  }

  Future<SignUpResponseDto?> signUp(
      String usename, String email, String password) async {
    try {
      final response = await _authService.signUp(SignUpRequestDto(
        username: usename,
        email: email,
        password: password,
      ));
      return response.data;
    } catch (e) {
      return null;
    }
  }

  Future<RefreshTokenResponseDto?> refreshToken(String refreshToken) async {
    try {
      final response = await _authService.refreshToken(refreshToken);
      return response.data;
    } catch (e) {
      return null;
    }
  }
}
