import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  final String id;
  final String login;
  final int color;
  final String password;

  UserModel({
    required this.id,
    required this.login,
    required this.color,
    required this.password,
  });

  UserModel copyWith({
    String? id,
    String? login,
    int? color,
    String? password,
    bool? isOnline,
  }) =>
      UserModel(
        id: id ?? this.id,
        login: login ?? this.login,
        color: color ?? this.color,
        password: password ?? this.password,
      );

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
