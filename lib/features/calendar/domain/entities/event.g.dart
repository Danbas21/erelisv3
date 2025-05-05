// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_EventCalendar _$EventCalendarFromJson(Map<String, dynamic> json) =>
    _EventCalendar(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      startDate: DateTime.parse(json['startDate'] as String),
      isDeadLine: json['isDeadLine'] as bool,
      color: const ColorConverter().fromJson((json['color'] as num).toInt()),
      status: json['status'] as String,
    );

Map<String, dynamic> _$EventCalendarToJson(_EventCalendar instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'startDate': instance.startDate.toIso8601String(),
      'isDeadLine': instance.isDeadLine,
      'color': const ColorConverter().toJson(instance.color),
      'status': instance.status,
    };
