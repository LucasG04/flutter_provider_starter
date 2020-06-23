class Validator {
  Validator._();

  static bool email(String value) {
    Pattern pattern = r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+';
    RegExp regex = new RegExp(pattern);
    if (regex.hasMatch(value))
      return true;
    else
      return false;
  }

  static bool notEmpty(String value) {
    Pattern pattern = r'^\S+$';
    RegExp regex = new RegExp(pattern);
    if (regex.hasMatch(value))
      return true;
    else
      return false;
  }
}
