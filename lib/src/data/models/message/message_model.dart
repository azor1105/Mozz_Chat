import 'package:json_annotation/json_annotation.dart';

part 'message_model.g.dart';

@JsonSerializable()
class MessageModel {
  final String id;
  final String from;
  final String to;
  @JsonKey(name: 'date_time')
  final int dateTime;
  final String text;
  final String address;

  MessageModel({
    required this.id,
    required this.from,
    required this.to,
    required this.dateTime,
    required this.text,
    required this.address,
  });

  factory MessageModel.fromJson(Map<String, dynamic> json) =>
      _$MessageModelFromJson(json);

  Map<String, dynamic> toJson() => _$MessageModelToJson(this);
}
