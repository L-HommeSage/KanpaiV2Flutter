import 'package:flutter/foundation.dart';
import 'package:kanpai/app/sign_in/validators.dart';
import 'package:kanpai/generated/l10n.dart';
import 'package:kanpai/services/auth.dart';

enum SignInType { login, register }

class EmailSignInModel with EmailAndPasswordValidators, ChangeNotifier {
  EmailSignInModel({
    @required this.auth,
    this.email = '',
    this.password = '',
    this.signInType = SignInType.register,
    this.isLoading = false,
    this.submitted = false,
  });
  final AuthBase auth;
  String email;
  String password;
  SignInType signInType;
  bool isLoading;
  bool submitted;

  void updateModel({
    String email,
    String password,
    SignInType signInType,
    bool isLoading,
    bool submitted,
  }) {
    this.email = email ?? this.email;
    this.password = password ?? this.password;
    this.signInType = signInType ?? this.signInType;
    this.isLoading = isLoading ?? this.isLoading;
    this.submitted = submitted ?? this.submitted;

    notifyListeners();
  }

  void updateEmail(String email) => updateModel(email: email);
  void updatePassword(String password) => updateModel(password: password);

  Future<void> submit() async {
    updateModel(submitted: true, isLoading: true);
    try {
      if (signInType == SignInType.register) {
        await auth.createUserWithEmail(email, password);
      } else {
        await auth.signInWithEmail(email, password);
      }
    } catch (e) {
      updateModel(isLoading: false);
      rethrow;
    }
  }

  bool get canSubmit {
    return emailValidator.isValid(email) &&
        pwdValidator.isValid(password) &&
        !isLoading;
  }

  String get passwordErrorText {
    bool showErrorText = submitted && !pwdValidator.isValid(password);
    return showErrorText ? errorTextPassword : null;
  }

  String get emailErrorText {
    bool showErrorText = submitted && !emailValidator.isValid(email);
    return showErrorText ? errorTextEmail : null;
  }

  String get secondaryButtonText {
    return signInType == SignInType.login
        ? S.current.need_account
        : S.current.have_account;
  }

  void toggleFormType() {
    final signInType = this.signInType == SignInType.login
        ? SignInType.register
        : SignInType.login;
    updateModel(
      email: '',
      password: '',
      signInType: signInType,
      submitted: false,
      isLoading: false,
    );
  }
}
