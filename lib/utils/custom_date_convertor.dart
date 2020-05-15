import 'package:json_annotation/json_annotation.dart';

import 'package:intl/intl.dart';

class CustomDateTimeConverter implements JsonConverter<DateTime, String> {
  const CustomDateTimeConverter();

  @override
  DateTime fromJson(String json) => DateFormat("MMM d, yyyy HH:mm:ss a").parse(json);


  @override
  String toJson(DateTime json) => json.toIso8601String();
}