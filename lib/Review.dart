import 'dart:ffi';
import 'dart:io';

class ReviewHandler {
  List<int> star = [0, 0, 0, 0, 0, 0];
  int cnt = 0;
  double sum = 0;
  double avr = 0;
  List<Review> reviews = [];
  void addReview(Review r) {
    star[r.rating]++;
    sum += r.rating;
    avr = sum / cnt;
    cnt++;
    reviews.add(r);
  }
}

class Review {
  // TODO user
  int rating = 0;
  int like = 0;
  int dislike = 0;
  String content = "";

  Review(int r, String c, int l, int dl) {
    content = c;
    rating = r;
    like = l;
    dislike = dl;
  }
}
