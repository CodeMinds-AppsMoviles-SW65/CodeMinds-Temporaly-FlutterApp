// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'refresh_token_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RefreshTokenResponseDto _$RefreshTokenResponseDtoFromJson(
        Map<String, dynamic> json) =>
    RefreshTokenResponseDto(
      id: json['id'] as String?,
      username: json['username'] as String?,
      email: json['email'] as String?,
      token: json['token'] as String?,
    );

Map<String, dynamic> _$RefreshTokenResponseDtoToJson(
        RefreshTokenResponseDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'email': instance.email,
      'token': instance.token,
    };
