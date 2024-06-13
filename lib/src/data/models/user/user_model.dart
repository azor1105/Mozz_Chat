import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  final String id;
  final String login;
  final String color;
  @JsonKey(name: 'is_online')
  final bool isOnline;

  UserModel({
    required this.id,
    required this.login,
    required this.color,
    required this.isOnline,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);
  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}