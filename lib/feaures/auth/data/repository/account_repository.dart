import 'package:flutter_project/core/dio/request.dart';
import 'package:flutter_project/core/domain/account.dart';
import 'package:flutter_project/feaures/auth/data/remote/account_service.dart';
import 'package:flutter_project/feaures/auth/data/remote/dto/account_dto.dart';

class AccountRepository {

  static final AccountRepository _instance = AccountRepository._internal();

  factory AccountRepository() {
    return _instance;
  }

  AccountRepository._internal();

  final AccountService _accountService = AccountService(Request().dio);

  Future<Account?> getAccount(String username) async {
    try {
      final response = await _accountService.getAccount(username);
      return response.data.toAccount();
    } catch (e) {
      return null;
    }
  }
}