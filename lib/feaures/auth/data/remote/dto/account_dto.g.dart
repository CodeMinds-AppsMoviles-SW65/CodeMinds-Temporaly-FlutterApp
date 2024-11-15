// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AccountDto _$AccountDtoFromJson(Map<String, dynamic> json) => AccountDto(
      id: json['id'] as String?,
      username: json['username'] as String?,
      names:
          (json['names'] as List<dynamic>?)?.map((e) => e as String).toList(),
      lastNames: (json['lastNames'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$AccountDtoToJson(AccountDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'names': instance.names,
      'lastNames': instance.lastNames,
    };
