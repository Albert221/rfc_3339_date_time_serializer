import 'package:rfc_3339_date_time_serializer/rfc_3339_date_time_serializer.dart';
import 'package:test/test.dart';

void main() {
  test('correctly parses RFC 3339 dates', () {
    final serializer = RFC3339DateTimeSerializer();

    final cases = {
      // ISO 8601
      '2019-08-09T06:55:01.896826+05:00': DateTime.utc(2019, 8, 9, 1, 55, 1, 896, 826),
      '2019-08-09T06:55:01.896826Z': DateTime.utc(2019, 8, 9, 6, 55, 1, 896, 826),
      '2019-11-19T01:21:11.021105': DateTime(2019, 11, 19, 1, 21, 11, 021, 105),

      // RFC 3339
      '2019-05-31T10:35:45.347333481Z': DateTime.utc(2019, 5, 31, 10, 35, 45, 347, 333),
      '2018-01-29T18:39:51.396781283+01:00': DateTime.utc(2018, 1, 29, 17, 39, 51, 396, 781),
      '2019-08-09T06:55:01.8968264+00:00': DateTime.utc(2019, 8, 9, 6, 55, 1, 896, 826),
    };

    cases.forEach((serialized, datetime) {
      expect(serializer.deserialize(null, serialized), datetime);
    });
  });
}
