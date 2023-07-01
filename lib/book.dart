import 'dart:io';
import 'dart:convert';
import 'dart:math';
import 'package:the_fidibo_project/Review.dart';

class book {
  String name = " ";
  String author = " ";
  String id = "";
  String desc =
      "The boy wizard Harry Potter has been casting a spell over young readers and their families ever since 1997. Now the first book in this unmissable series celebrates 25 years in print! The paperback edition of the tale that introduced us to Harry, Ron and Hermione has been updated and dressed in silver to mark the occasion. It's time to take the magical journey of a lifetime .\n\nHarry Potter has never even heard of Hogwarts when the letters start dropping on the doormat at number four, Privet Drive. Addressed in green ink on yellowish parchment with a purple seal, they are swiftly confiscated by his grisly aunt and uncle. Then, on Harry's eleventh birthday, a great beetle-eyed giant of a man called Rubeus Hagrid bursts in with some astonishing news: Harry Potter is a wizard, and he has a place at Hogwarts School of Witchcraft and Wizardry. An incredible adventure is about to begin!\n\nThese editions of the classic and internationally bestselling Harry Potter series feature thrilling jacket artwork by award-winning illustrator Jonny Duddle. They are the perfect starting point for anyone who's ready to lose themselves in the greatest children's story of all time. Available for one year only, Harry's first adventure - Harry Potter and the Philosopher's Stone - has been emblazoned in silver and refreshed with extra content including a new Hogwarts crest illustration and Q&A with Jonny Duddle, plus fun facts exploring the origins of names such as Albus Dumbledore, Hedwig and other favourite characters.";
  String cover = " ";
  static List<book> allBooks = [
    new book('Harry Potter and the Sorcerer\’s Stone', 'J.K.Rowling',
        'assets/bookCovers/1.jpeg', '0'),
    new book('Harry Potter and the Sorcerer\’s Stone', 'J.K.Rowling',
        'assets/bookCovers/b1.jpg', '1'),
    new book('Harry Potter and the Chamber of Secrets', 'J.K.Rowling',
        'assets/bookCovers/2.jpeg', '2'),
    new book('Harry Potter and the Chamber of Secrets', 'J.K.Rowling',
        'assets/bookCovers/b2.jpg', '3'),
    new book('Harry Potter and the Prisoner of Azkaban', 'J.K.Rowling',
        'assets/bookCovers/3.jpeg', '4'),
    new book('Harry Potter and the Prisoner of Azkaban', 'J.K.Rowling',
        'assets/bookCovers/b3.jpg', '5'),
    new book('Harry Potter and the Goblet of Fire', 'J.K.Rowling',
        'assets/bookCovers/4.jpeg', '6'),
    new book('Harry Potter and the Goblet of Fire', 'J.K.Rowling',
        'assets/bookCovers/b4.jpg', '7'),
    new book('Harry Potter and the Order of the Phoenix ', 'J.K.Rowling',
        'assets/bookCovers/5.jpeg', '8'),
    new book('Harry Potter and the Order of the Phoenix ', 'J.K.Rowling',
        'assets/bookCovers/b5.jpg', '9'),
    new book('Harry Potter and the Half-Blood Prince ', 'J.K.Rowling',
        'assets/bookCovers/6.jpeg', '10'),
    new book('Harry Potter and the Half-Blood Prince ', 'J.K.Rowling',
        'assets/bookCovers/b6.jpg', '11'),
    new book('Harry Potter and the Deathly Hallows ', 'J.K.Rowling',
        'assets/bookCovers/7.jpeg', '12'),
    new book('Harry Potter and the Deathly Hallows ', 'J.K.Rowling',
        'assets/bookCovers/b7.jpg', '13'),
    new book('The Ballad of Songbirds and Snakes', 'Suzanne Collins ',
        'assets/bookCovers/_MG_7911_7.png', '14'),
  ];
  ReviewHandler reviewHandler = ReviewHandler();
  book(String n, String a, String c, String i) {
    name = n;
    author = a;
    cover = c;
    id = i;
    reviewHandler.addReview(Review(1, "shit book", 0, 5));
    reviewHandler.addReview(Review(1, "shit book", 0, 5));
    reviewHandler.addReview(Review(1, "shit book", 0, 5));
    reviewHandler.addReview(Review(1, "shit book", 0, 5));
    reviewHandler.addReview(Review(1, "shit book", 0, 5));
    reviewHandler.addReview(Review(2, "eh", 0, 3));
    reviewHandler.addReview(Review(2, "eh", 0, 3));
    reviewHandler.addReview(Review(2, "eh", 0, 3));
    reviewHandler.addReview(Review(2, "eh", 0, 3));
    reviewHandler.addReview(Review(3, "mid", 0, 0));
    reviewHandler.addReview(Review(3, "mid", 0, 0));
    reviewHandler.addReview(Review(3, "mid", 0, 0));
    reviewHandler.addReview(Review(4, "i liked", 10, 3));
    reviewHandler.addReview(Review(4, "i liked", 10, 3));
    reviewHandler.addReview(Review(5, "babyyyyy", 10000, 0));
  }
  static book parsStr(String s) {
    book res = book("", "", "", "");
    List<String> args = s.split(",,");
    for (var expr in args) {
      print(expr);
      int colon = expr.indexOf(':');
      print(colon);
      String key = expr.substring(0, colon);
      String value = expr.substring(colon + 1);
      switch (key) {
        case "name":
          res.name = value;
        case "author":
          res.author = value;
        case "id":
          res.id = value;
        case "path":
          res.cover = value;
      }
    }
    res.reviewHandler.addReview(Review(1, "shit book", 0, 5));
    res.reviewHandler.addReview(Review(1, "shit book", 0, 5));
    res.reviewHandler.addReview(Review(1, "shit book", 0, 5));
    res.reviewHandler.addReview(Review(1, "shit book", 0, 5));
    res.reviewHandler.addReview(Review(1, "shit book", 0, 5));
    res.reviewHandler.addReview(Review(2, "eh", 0, 3));
    res.reviewHandler.addReview(Review(2, "eh", 0, 3));
    res.reviewHandler.addReview(Review(2, "eh", 0, 3));
    res.reviewHandler.addReview(Review(2, "eh", 0, 3));
    res.reviewHandler.addReview(Review(3, "mid", 0, 0));
    res.reviewHandler.addReview(Review(3, "mid", 0, 0));
    res.reviewHandler.addReview(Review(3, "mid", 0, 0));
    res.reviewHandler.addReview(Review(4, "i liked", 10, 3));
    res.reviewHandler.addReview(Review(4, "i liked", 10, 3));
    res.reviewHandler.addReview(Review(5, "babyyyyy", 10000, 0));
    return res;
  }
}
