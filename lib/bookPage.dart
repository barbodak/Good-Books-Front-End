import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:the_fidibo_project/ReviewPage.dart';
import 'package:the_fidibo_project/userPrefs/globalTheme.dart';
import 'package:the_fidibo_project/book.dart';
import 'package:the_fidibo_project/widgetAssets.dart';

class bookPage extends StatefulWidget {
  final book myBook;
  const bookPage({super.key, required this.myBook});

  @override
  State<bookPage> createState() => _bookPageState();
}

class _bookPageState extends State<bookPage> {
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        // Using the same theme as the first page
        return Theme(
          data: globalTheme.get(),
          child: Scaffold(
            appBar: AppBar(),
            body: Center(
              child: ListView(
                children: [
                  Image.asset(
                    widget.myBook.cover,
                    height: 500,
                  ),
                  const SizedBox(height: 40),
                  Text(
                    widget.myBook.name,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 28.0,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    widget.myBook.author,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 22.0,
                    ),
                  ),
                  const SizedBox(height: 40),
                  ListTile(
                    leading: InkWell(
                      child: Column(
                        children: [
                          RatingBar.builder(
                            ignoreGestures: true,
                            itemSize: 30,
                            initialRating: widget.myBook.reviewHandler.avr,
                            minRating: 1,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemCount: 5,
                            itemPadding: EdgeInsets.symmetric(horizontal: 1.0),
                            itemBuilder: (context, _) => Icon(
                              Icons.star,
                              color: Theme.of(context).brightness ==
                                      Brightness.dark
                                  ? Colors.white
                                  : Colors.black,
                            ),
                            onRatingUpdate: (rating) {
                              print(rating);
                            },
                          ),
                          Text(
                            "${widget.myBook.reviewHandler.cnt} : Reviews",
                            style: TextStyle(fontSize: 14.5),
                          ),
                        ],
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ReviewPage(
                                reviewHandler: widget.myBook.reviewHandler),
                          ),
                        );
                      },
                    ),
                    trailing: SizedBox(
                      width: 195,
                      height: 50,
                      child: FilledButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.resolveWith<Color?>(
                            (Set<MaterialState> states) {
                              // Use white color if the theme is dark, otherwise use black color
                              return Theme.of(context).brightness ==
                                      Brightness.dark
                                  ? Colors.white
                                  : Colors.black;
                            },
                          ),
                          foregroundColor:
                              MaterialStateProperty.resolveWith<Color?>(
                            (Set<MaterialState> states) {
                              // Use white color if the theme is dark, otherwise use black color
                              return Theme.of(context).brightness ==
                                      Brightness.dark
                                  ? Colors.black
                                  : Colors.white;
                            },
                          ),
                        ),
                        onPressed: () {},
                        child: Row(
                          children: [
                            Icon(Icons.add),
                            SizedBox(width: 5),
                            Text(
                              "Want To Read",
                              style: TextStyle(
                                fontSize: 17.5,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 420,
                        height: 55,
                        child: FilledButton(
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.resolveWith<Color?>(
                              (Set<MaterialState> states) {
                                // Use white color if the theme is dark, otherwise use black color
                                return Theme.of(context).brightness ==
                                        Brightness.dark
                                    ? Colors.white
                                    : Colors.black;
                              },
                            ),
                            foregroundColor:
                                MaterialStateProperty.resolveWith<Color?>(
                              (Set<MaterialState> states) {
                                // Use white color if the theme is dark, otherwise use black color
                                return Theme.of(context).brightness ==
                                        Brightness.dark
                                    ? Colors.black
                                    : Colors.white;
                              },
                            ),
                          ),
                          onPressed: () {},
                          child: Text("BUY | \$15"),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 30),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: Text(
                      widget.myBook.desc,
                      style: TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
