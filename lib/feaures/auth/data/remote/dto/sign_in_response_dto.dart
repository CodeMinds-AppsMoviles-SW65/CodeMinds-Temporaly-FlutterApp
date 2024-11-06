import 'package:json_annotation/json_annotation.dart';

part 'sign_in_response_dto.g.dart';

@JsonSerializable()
class SignInResponseDto {
  final String? id;
  final String? username;
  final String? email;
  final String? token;

  SignInResponseDto({
    this.id,
    this.username,
    this.email,
    this.token,
  });

  factory SignInResponseDto.fromJson(Map<String, dynamic> json) => _$SignInResponseDtoFromJson(json);

  Map<String, dynamic> toJson() => _$SignInResponseDtoToJson(this);
}