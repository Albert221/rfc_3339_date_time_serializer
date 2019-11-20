import 'package:flutter_test/flutter_test.dart';

import 'package:rfc_3339_date_time_serializer/rfc_3339_date_time_serializer.dart';

void main() {
  test('adds one to input values', () {
    final calculator = Calculator();
    expect(calculator.addOne(2), 3);
    expect(calculator.addOne(-7), -6);
    expect(calculator.addOne(0), 1);
    expect(() => calculator.addOne(null), throwsNoSuchMethodError);
  });
}
