import 'package:flutter/material.dart';
import 'package:the_fidibo_project/Review.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:the_fidibo_project/userPrefs/globalTheme.dart';

class ReviewPage extends StatefulWidget {
  final ReviewHandler reviewHandler;
  const ReviewPage({super.key, required this.reviewHandler});

  @override
  State<ReviewPage> createState() => _ReviewPageState();
}

class _ReviewPageState extends State<ReviewPage> {
  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        // Using the same theme as the first page
        return Theme(
          data: globalTheme.get(),
          child: Scaffold(
            appBar: AppBar(),
            body: ListView.builder(
              itemCount: widget.reviewHandler.cnt,
              itemBuilder: (context, index) {
                return Card(
                  child: Column(
                    children: [
                      const SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            widget.reviewHandler.reviews[index].content,
                            style: TextStyle(
                              fontSize: 16.0,
                            ),
                          ),
                        ),
                      ),
                      ListTile(
                        leading: RatingBar.builder(
                          ignoreGestures: true,
                          itemSize: 20,
                          initialRating:
                              widget.reviewHandler.reviews[index].rating / 1.0,
                          minRating: 1,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 5,
                          itemPadding: EdgeInsets.symmetric(horizontal: 1.0),
                          itemBuilder: (context, _) => Icon(
                            Icons.star,
                            color:
                                Theme.of(context).brightness == Brightness.dark
                                    ? Colors.white
                                    : Colors.black,
                          ),
                          onRatingUpdate: (rating) {
                            print(rating);
                          },
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
