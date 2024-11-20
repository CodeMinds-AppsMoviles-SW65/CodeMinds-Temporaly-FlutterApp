import 'package:flutter_project/core/domain/account.dart';

class LocalAccountEntity {
  final String id;
  final String username;
  final String token;

  LocalAccountEntity({
    required this.id,
    required this.username,
    required this.token,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'username': username,
      'token': token,
    };
  }

  factory LocalAccountEntity.fromMap(Map<String, dynamic> map) {
    return LocalAccountEntity(
      id: map['id'],
      username: map['username'],
      token: map['token'],
    );
  }
}

extension LocalAccountEntityExtension on LocalAccountEntity {
  Account toAccount() {
    return Account(
      username: username,
      token: token,
    );
  }
}