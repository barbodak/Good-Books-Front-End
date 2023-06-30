class User {
  static User loggedIn = new User();
  String name = "";
  String email = "";
  String password = "";
  int accountBalance = 0;
  int primeMonths = 0;
  int darkMode = 0;
  String userToString() {
    return "name:$name,,username:$email,,password:$password,,acountBalance:$accountBalance,,darkMode:$darkMode,,primeMonths:$primeMonths";
  }

  void setUserDataFromString(String s) {
    List<String> args = s.split(",,");
    for (var expr in args) {
      int colon = expr.indexOf(':');
      String key = expr.substring(0, colon);
      String value = expr.substring(colon + 1);
      switch (key) {
        case "name":
          name = value;
        case "password":
          password = value;
        case "username" || "email":
          email = value;
        case "acountBalance":
          accountBalance = int.parse(value);
        case "darkMode":
          darkMode = int.parse(value);
        case "primeMonths":
          primeMonths = int.parse(value);
      }
    }
  }
}
