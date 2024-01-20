class FormValidation {
  static String? stringValidation(String? string) =>
      string!.isEmpty ? 'Field cannot be empty' : null;

  static String? emailValidation(String? email) {
    bool validateEmail = RegExp(
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(email!);
    return validateEmail ? null : 'Enter valid email';
  }

  static String? passwordValidation(String? password) {
    bool validatePassword =
    RegExp(r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d@$!%*#?&]{8,}$')
        .hasMatch(password!);
    bool validateLength = password.length < 6;
    if (!validatePassword && !validateLength) {
      return 'Password must contain at least one uppercase, one lowercase and special character and 8 character long';
    }
    return null;
  }

  static String? phoneValidation(String? phone) =>
      phone!.length < 10 ? 'Enter a valid phone number ' : null;

  static String? passwordMatchValidation(
      String? password, String passwordOne) =>
      password != passwordOne ? "Passwords do not match" : null;
}
