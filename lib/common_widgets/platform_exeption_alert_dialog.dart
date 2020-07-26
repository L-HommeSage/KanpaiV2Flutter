import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:kanpai/common_widgets/platform_alert_dialog_widget.dart';
import 'package:kanpai/generated/l10n.dart';

class PlatformExceptionAlertDialog extends PlatformAlertDialog {
  PlatformExceptionAlertDialog({
    @required String title,
    @required PlatformException exception,
  }) : super(
          title: title,
          content: _message(exception),
          defaultActionText: 'OK',
        );

  static String _message(PlatformException exception) {
    print(exception);
    return _errors[exception.code] ?? exception.message;
  }

  static Map<String, String> _errors = {
    'ERROR_WEAK_PASSWORD': S.current.error_weak_password,

    ///  * `Error 7` - Missing on insufficient permissions.
    ///  * `ERROR_INVALID_EMAIL` - If the email address is malformed.
    ///  * `ERROR_EMAIL_ALREADY_IN_USE` - If the email is already in use by a different account.
    ///  * `ERROR_INVALID_EMAIL` - If the [email] address is malformed.
    ///  * `ERROR_WRONG_PASSWORD` - If the [password] is wrong.
    ///  * `ERROR_USER_NOT_FOUND` - If there is no user corresponding to the given [email] address, or if the user has been deleted.
    ///  * `ERROR_USER_DISABLED` - If the user has been disabled (for example, in the Firebase console)
    ///  * `ERROR_TOO_MANY_REQUESTS` - If there was too many attempts to sign in as this user.
    ///  * `ERROR_OPERATION_NOT_ALLOWED` - Indicates that Email & Password accounts are not enabled.
    ///  * `ERROR_INVALID_CREDENTIAL` - If the credential data is malformed or has expired.
    ///  * `ERROR_USER_DISABLED` - If the user has been disabled (for example, in the Firebase console)
    ///  * `ERROR_ACCOUNT_EXISTS_WITH_DIFFERENT_CREDENTIAL` - If there already exists an account with the email address asserted by Google.
    ///       Resolve this case by calling [fetchSignInMethodsForEmail] and then asking the user to sign in using one of them.
    ///       This error will only be thrown if the "One account per email address" setting is enabled in the Firebase console (recommended).
    ///  * `ERROR_OPERATION_NOT_ALLOWED` - Indicates that Google accounts are not enabled.
    ///  * `ERROR_INVALID_ACTION_CODE` - If the action code in the link is malformed, expired, or has already been used.
    ///       This can only occur when using [EmailAuthProvider.getCredentialWithLink] to obtain the credential.
  };
}
