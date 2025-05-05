import 'package:flutter/material.dart' show Color;

import 'package:freezed_annotation/freezed_annotation.dart';

part 'event.freezed.dart';
part 'event.g.dart';

@freezed
sealed class EventCalendar with _$EventCalendar {
  const factory EventCalendar({
    required String id,
    required String title,
    required String description,
    required DateTime startDate,
    required bool isDeadLine,
    @ColorConverter() required Color color,
    required String status,
  }) = _EventCalendar;

  factory EventCalendar.fromJson(Map<String, dynamic> json) =>
      _$EventCalendarFromJson(json);
}

class ColorConverter implements JsonConverter<Color, int> {
  const ColorConverter();

  @override
  Color fromJson(int json) => Color(json);

  @override
  int toJson(Color color) => color.a.toInt();
}
