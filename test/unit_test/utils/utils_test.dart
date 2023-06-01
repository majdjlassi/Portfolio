import 'package:flutter_test/flutter_test.dart';
import 'package:portfolio/utils/utils.dart';


void main() {
  test('convertDate converts date in "dd-MM-yyyy" format to "MMM yyyy" format', () {

    const date = '31-05-2023';
    const expectedOutput = 'May 2023';

    final result = convertDate(date);

    expect(result, expectedOutput);
  });

  test('convertDate returns an empty string for invalid input', () {

    const date = '2023.05.31';
    const expectedOutput = '';

    final result = convertDate(date);

    expect(result, expectedOutput);
  });
}
