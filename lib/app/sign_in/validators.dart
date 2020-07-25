import 'package:kanpai/generated/l10n.dart';

abstract class StringValidator {
  bool isValid(String value);
}

class NonEmptyStringValidator implements StringValidator {
  @override
  bool isValid(String value) {
    return value.isNotEmpty;
  }
}

class EmailAndPasswordValidators {
  final StringValidator emailValidator = NonEmptyStringValidator();
  final StringValidator pwdValidator = NonEmptyStringValidator();
  final String errorTextEmail = S.current.empty_email;
  final String errorTextPassword = S.current.empty_pwd;
}
