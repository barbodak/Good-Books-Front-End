import 'package:the_fidibo_project/book.dart';

class User {
  static User loggedIn = new User();
  String name = "";
  String email = "";
  String password = "";
  String ownedBooksStr = "";
  String faveBooksStr = "";
  int accountBalance = 0;
  int primeMonths = 0;
  int darkMode = 0;
  List<book> ownedBooks = [];
  List<book> faveBooks = [];

  String userToString() {
    // String ownedBooksStr1 = "";
    // for (var b in ownedBooks) {
    //   ownedBooksStr += b.id.toString() + "##";
    // }
    // if (ownedBooksStr.isNotEmpty)
    //   ownedBooksStr = ownedBooksStr.substring(0, ownedBooksStr.length - 2);
    // String faveBooksStr = "";
    // for (var b in faveBooks) {
    //   faveBooksStr += b.id.toString() + "##";
    // }
    // if (faveBooksStr.isNotEmpty)
    //   faveBooksStr = faveBooksStr.substring(0, faveBooksStr.length - 2);

    return "name:$name,,username:$email,,password:$password,,acountBalance:$accountBalance,,darkMode:$darkMode,,primeMonths:$primeMonths,,ownedBooks:$ownedBooksStr,,faveBooks:$faveBooksStr";
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
        case "ownedBooks":
          ownedBooksStr = value;
        case "faveBooks":
          faveBooksStr = value;
      }
    }
  }
}
