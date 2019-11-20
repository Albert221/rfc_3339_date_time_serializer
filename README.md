# rfc_3339_date_time_serializer

An `RFC3339DateTimeSerializer` serializer class for [built_value], created to address [the issue][issue] about Dart's `DateTime.parse` not working with RFC 3339.

## Why is this package needed?

ISO 8601 has a character limit for _time-secfrac_ part equal to 6. RFC 3339 does not have that limit. Thanks to this, datetimes introducing more than 6 characters in _time-secfrac_ are invalid for `DateTime.parse`, because it works only with ISO 8601.

For example, Go's `encoding/json` serializes dates with 7 _time-secfrac_ characters.

## Usage

In your `serializers.dart`:

```dart
import 'rfc_3339_date_time_serializer/rfc_3339_date_time_serializer.dart';

@SerializersFor(const [/* (...) */])
final Serializers modelsSerializers = (_$modelsSerializers.toBuilder()
      ..addPlugin(StandardJsonPlugin())
      ..add(RFC3339DateTimeSerializer())) // this is the line you need to add
    .build();
```


[built_value]: https://pub.dev/packages/built_value
[issue]: https://github.com/dart-lang/sdk/issues/24205