import 'package:json_annotation/json_annotation.dart';


part 'refresh_token_response_dto.g.dart';

@JsonSerializable()

class RefreshTokenResponseDto {
  final String? id;

  final String? username;
  final String? email;
  final String? token;

  RefreshTokenResponseDto({
    this.id,
    this.username,
    this.email,
    this.token,
  });

  factory RefreshTokenResponseDto.fromJson(Map<String, dynamic> json) => _$RefreshTokenResponseDtoFromJson(json);

  Map<String, dynamic> toJson() => _$RefreshTokenResponseDtoToJson(this);
}
