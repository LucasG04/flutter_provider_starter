import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_provider_starter/utils/validator.dart';

void main() {
  group('E-Mail', () {
    test('email without \'at\' is invalid', () {
      String email = 'test.de';
      expect(Validator.email(email), false);
    });

    test('email without name is invalid', () {
      String email = '@test.de';
      expect(Validator.email(email), false);
    });

    test('email without TLD is invalid', () {
      String email = 'mail.test@';
      expect(Validator.email(email), false);
    });

    test('correct email is valid', () {
      String email = 'mail.test@gmail.com';
      expect(Validator.email(email), true);
    });
  });

  group('notEmpty', () {
    test('empty string is empty', () {
      String string = '';
      expect(Validator.notEmpty(string), false);
    });

    test('string with content is valid', () {
      String string = 'test';
      expect(Validator.notEmpty(string), true);
    });
  });
}
