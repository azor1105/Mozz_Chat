// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MessageModel _$MessageModelFromJson(Map<String, dynamic> json) => MessageModel(
      id: json['id'] as String,
      from: json['from'] as String,
      to: json['to'] as String,
      dateTime: (json['date_time'] as num).toInt(),
      text: json['text'] as String,
      address: json['address'] as String,
    );

Map<String, dynamic> _$MessageModelToJson(MessageModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'from': instance.from,
      'to': instance.to,
      'date_time': instance.dateTime,
      'text': instance.text,
      'address': instance.address,
    };
