import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:the_fidibo_project/ReviewPage.dart';
import 'package:the_fidibo_project/user.dart';
import 'package:the_fidibo_project/userPrefs/globalTheme.dart';
import 'package:the_fidibo_project/book.dart';
import 'package:the_fidibo_project/Network.dart';
import 'package:the_fidibo_project/utils.dart';
import 'package:the_fidibo_project/widgetAssets.dart';

class bookPage extends StatefulWidget {
  final book myBook;
  const bookPage({super.key, required this.myBook});

  @override
  State<bookPage> createState() => _bookPageState();
}

class _bookPageState extends State<bookPage> {
  bool owns = false;
  bool faves = false;
  Widget build(BuildContext context) {
    owns = utils.hasThisBook(User.loggedIn.ownedBooks, widget.myBook);
    faves = utils.hasThisBook(User.loggedIn.faveBooks, widget.myBook);
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
                        ).then((value) {
                          // This block runs when you have returned back to the first page from second page
                          setState(() {
                            // Call setState to refresh the first page
                          });
                        });
                        ;
                      },
                    ),
                    trailing: SizedBox(
                      width: 200,
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
                        onPressed: () async {
                          if (faves) {
                            User.loggedIn.faveBooksStr = "";
                            for (var b in User.loggedIn.faveBooks) {
                              if (b.id == widget.myBook.id)
                                User.loggedIn.faveBooks.remove(b);
                              else
                                User.loggedIn.faveBooksStr +=
                                    b.id.toString() + "##";
                            }
                            if (User.loggedIn.faveBooksStr.length > 2) {
                              User.loggedIn.faveBooksStr =
                                  User.loggedIn.faveBooksStr.substring(
                                      0, User.loggedIn.faveBooksStr.length - 2);
                            }
                            setState(() {});
                            return;
                          }
                          if (User.loggedIn.faveBooks.length == 0)
                            User.loggedIn.faveBooksStr +=
                                widget.myBook.id.toString();
                          else
                            User.loggedIn.faveBooksStr +=
                                "##" + widget.myBook.id.toString();
                          User.loggedIn.faveBooks.add(widget.myBook);
                          setState(() {});
                        },
                        child: faves
                            ? Row(
                                children: [
                                  Icon(
                                    Icons.favorite,
                                    color: Colors.red,
                                  ),
                                  SizedBox(width: 5),
                                  Text(
                                    "      Favorited",
                                    style: TextStyle(
                                      fontSize: 17.5,
                                    ),
                                  ),
                                ],
                              )
                            : Row(
                                children: [
                                  Icon(Icons.favorite),
                                  SizedBox(width: 5),
                                  Text(
                                    "Add to Favorits",
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
                          onPressed: () async {
                            if (owns) {
                              return;
                            }
                            if (User.loggedIn.accountBalance >= 10) {
                              User.loggedIn.accountBalance -= 10;
                              if (User.loggedIn.ownedBooks.length == 0)
                                User.loggedIn.ownedBooksStr +=
                                    widget.myBook.id.toString();
                              else
                                User.loggedIn.ownedBooksStr +=
                                    "##" + widget.myBook.id.toString();
                              User.loggedIn.ownedBooks.add(widget.myBook);
                              setState(() {});
                            }
                          },
                          child: owns ? Text("Read Now") : Text("BUY | \$15"),
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
