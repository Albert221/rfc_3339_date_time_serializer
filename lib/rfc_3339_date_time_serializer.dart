library rfc_3339_date_time_serializer;

import 'package:built_value/serializer.dart';

class RFC3339DateTimeSerializer extends PrimitiveSerializer<DateTime> {
  @override
  DateTime deserialize(Serializers serializers, Object serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final serializedString = serialized as String;

    final fixed = serializedString.replaceAllMapped(
      RegExp(r"(.*:\d\d)(\.\d+)(Z|[+-]\d{2}:\d{2})?"),
      (Match match) {
        // #1 capturing group is date and time without a fraction of a second
        // #2 group is `time-secfrac` - if present
        // #3 group is `time-offset`
        String timeSecfrac = match[2] ?? '';
        String timeOffset = match[3] ?? '';

        if (timeSecfrac.length > 7) {
          // 6 is 0th period + (up to) 6 characters accepted by ISO8601
          timeSecfrac = timeSecfrac.substring(0, 7);
        }

        return match[1] + timeSecfrac + timeOffset;
      },
    );

    return DateTime.parse(fixed);
  }

  @override
  Object serialize(Serializers serializers, DateTime dateTime,
      {FullType specifiedType = FullType.unspecified}) {
    return dateTime.toIso8601String();
  }

  @override
  Iterable<Type> get types => <Type>[DateTime];

  @override
  String get wireName => 'DateTime';
}
