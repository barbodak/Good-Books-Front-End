import 'package:the_fidibo_project/book.dart';

class utils {
  static bool checkEmail(String s) {
    return RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(s);
  }

  static List<book> parsBookList(String s) {
    List<book> res = [];
    var exprs = s.split('\n');
    for (var expr in exprs) {
      if (expr.isNotEmpty) res.add(book.parsStr(expr));
    }
    return res;
  }

  static bool hasThisBook(List<book> list, book boo) {
    for (var b in list) if (b.id == boo.id) return true;
    return false;
  }
}
