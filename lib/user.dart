import 'dart:ffi';

class User {
  static User loggedIn = new User();
  String name = "";
  String email = "";
  String password = "";
  int accountBalance = 0;
  String userToString() {
    return "name:$name,,username:$email,,password:$password,,acountBalance:$accountBalance";
  }

  void setUserDataFromString(String s) {
    List<String> args = s.split(",,");
    for (var expr in args) {
      int colon = expr.indexOf(':');
      String key = expr.substring(0, colon);
      String value = expr.substring(colon + 1);
      switch (key) {
        case "name":
          name = key;
        case "password":
          password = key;
        case "username" || "email":
          email = key;
        case "accountBalance":
          accountBalance = int.parse(key);
      }
    }
  }
}
