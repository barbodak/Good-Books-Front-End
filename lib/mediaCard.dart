import 'package:flutter/material.dart';
import 'package:the_fidibo_project/BookWidget.dart';
import 'package:the_fidibo_project/book.dart';
import 'package:the_fidibo_project/userPrefs/globalTheme.dart';
import 'package:the_fidibo_project/widgetAssets.dart';
import 'package:the_fidibo_project/MediaGrid.dart';

class mediaCard extends StatefulWidget {
  final Color BackgroundColor;
  final String CardName;
  final List<book> Books;
  const mediaCard(
      {super.key,
      required this.BackgroundColor,
      required this.CardName,
      required this.Books});

  @override
  State<mediaCard> createState() => _mediaCardState();
}

class _mediaCardState extends State<mediaCard> {
  @override
  Widget build(BuildContext context) {
    widget.Books.shuffle();
    final Color c = widget.BackgroundColor;
    return Container(
      height: 400,
      // width: 200,
      // decoration: myBoxDecoration.get(colorScheme.tertiary),
      // decoration: BoxDecoration(color: widget.BackgroundColor.withOpacity(0.2)),
      child: Column(
        children: [
          ListTile(
            // tileColor: widget.BackgroundColor,
            title: Text(
              widget.CardName,
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 19,
              ),
            ),
            trailing: Icon(
              Icons.arrow_forward_ios_outlined,
              size: 20,
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Builder(
                    builder: (context) {
                      // Using the same theme as the first page
                      return Theme(
                        data: globalTheme.get().copyWith(
                              appBarTheme: AppBarTheme(
                                  // color: widget.BackgroundColor, // Use any color
                                  ),
                            ),
                        child: Scaffold(
                          appBar: AppBar(
                            title: Text(
                              widget.CardName,
                              style: TextStyle(
                                fontWeight: FontWeight.w900,
                                fontSize: 25,
                              ),
                            ),
                          ),
                          body: MediaGrid(Books: widget.Books),
                        ),
                      );
                    },
                  ),
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
          SizedBox(
            height: 10,
          ),
          SizedBox(
            height: 300,
            child: ListView.builder(
              itemCount: widget.Books.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Row(
                  children: [
                    SizedBox(
                      width: 10,
                    ),
                    bookWidget(
                      myBook: widget.Books[index],
                      Width: 150,
                      Hight: 200,
                      bdis: 10,
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
