import 'package:json_annotation/json_annotation.dart';

part 'sign_up_response_dto.g.dart';

@JsonSerializable()
class SignUpResponseDto {
  final String? id;
  final String? username;
  final String? email;
  final List<String>? roles;

  SignUpResponseDto({
    this.id,
    this.username,
    this.email,
    this.roles,
  });

  factory SignUpResponseDto.fromJson(Map<String, dynamic> json) => _$SignUpResponseDtoFromJson(json);

  Map<String, dynamic> toJson() => _$SignUpResponseDtoToJson(this);
}