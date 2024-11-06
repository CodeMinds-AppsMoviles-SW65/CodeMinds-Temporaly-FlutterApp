import 'package:json_annotation/json_annotation.dart';

part 'account_dto.g.dart';

@JsonSerializable()
class AccountDto {
  final String? id;
  final String? username;
  final List<String>? names;
  final List<String>? lastNames;

  AccountDto({
    this.id,
    this.username,
    this.names,
    this.lastNames,
  });


  factory AccountDto.fromJson(Map<String, dynamic> json) => _$AccountDtoFromJson(json);

  Map<String, dynamic> toJson() => _$AccountDtoToJson(this);
}