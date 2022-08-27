// ignore: avoid_web_libraries_in_flutter
// ignore_for_file: unused_import

// ignore: avoid_web_libraries_in_flutter

// ignore_for_file: avoid_print

var _user = ["user"];
var _pass = ["pass"];
// ignore: unused_element
int _i = 1;

class Authentication {
  bool fetchCredentials(String user, String pass) {
    for (var i = 0; i < _user.length; i++) {
      if (user == _user[i] && pass == _pass[i]) {
        return true;
      }
    }
    return false;
  }

  bool checkUserRepeat(user) {
    for (var i = 0; i < _user.length; i++) {
      if (user == _user[i]) {
        print(user);
        return true;
      }
    }
    return false;
  }

  void insertCredentials(String user, String pass) {
    _user.add(user);
    _pass.add(pass);
    _i++;
  }

  bool isPassCompliant(String pass, [int minLength = 6]) {
    if (pass.isEmpty) {
      return false;
    }
    bool hasUppercase = pass.contains(RegExp(r'[A-Z]'));
    bool hasDigits = pass.contains(RegExp(r'[0-9]'));
    bool hasLowercase = pass.contains(RegExp(r'[a-z]'));
    bool hasSpecialCharacters =
        pass.contains(RegExp(r'[!@#$%^&*()],.?":{}|<>'));
    bool hasMinLength = pass.length > 6;
    return hasUppercase &&
        hasDigits &&
        hasLowercase &&
        hasSpecialCharacters &&
        hasMinLength;
  }
}
