class ValidationMixin {
  String validateEmail(String val) {
    RegExp mailExp = new RegExp(
        r"^([a-zA-Z0-9_\-\.]+)@([a-zA-Z0-9_\-\.]+)\.([a-zA-Z]{2,5})$",
        caseSensitive: false,
        multiLine: false);
    if (!mailExp.hasMatch(val)) {
      return 'Please enter a valid email';
    }
    return null;
  }

  String valiDatePassword(String val) {
    RegExp lowerCase =
        new RegExp(r"^(?=.*[a-z])", caseSensitive: true, multiLine: false);
    if (!lowerCase.hasMatch(val))
      return 'Please enter a password that contains atleast 1 lowercase letter';
    RegExp upperCase =
        new RegExp(r"(?=.*[A-Z])", caseSensitive: true, multiLine: false);
    if (!upperCase.hasMatch(val))
      return 'Please enter a password that contains atleast 1 uppercase letter';
    RegExp numbers =
        new RegExp(r"(?=.*[0-9])", caseSensitive: false, multiLine: false);
    if (!numbers.hasMatch(val))
      return 'Please enter a password that contains atleast 1 numeric character';
    RegExp specialChar = new RegExp(r"(?=.*[!@#\$%\^&\*])",
        caseSensitive: false, multiLine: false);
    if (!specialChar.hasMatch(val))
      return 'Please enter a password that contains atleast special character';
    if (!(val.length >= 6)) return 'Password must be longer than 6 characters';
    return null;
  }
}
