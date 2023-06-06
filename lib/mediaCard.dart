import 'package:flutter/material.dart';
import 'package:the_fidibo_project/BookWidget.dart';
import 'package:the_fidibo_project/book.dart';
import 'package:the_fidibo_project/userPrefs/globalTheme.dart';
import 'package:the_fidibo_project/widgetAssets.dart';

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
    widget..Books.shuffle();
    return Container(
      height: 400,
      // width: 200,
      // decoration: myBoxDecoration.get(colorScheme.tertiary),
      // decoration: BoxDecoration(color: widget.BackgroundColor.withOpacity(0.2)),
      child: Column(
        children: [
          ListTile(
            title: Text(
              widget.CardName,
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 19,
              ),
            ),
            trailing: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.arrow_forward_ios_outlined,
                size: 15,
              ),
            ),
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
                //
                return Row(
                  children: [
                    SizedBox(
                      width: 10,
                    ),
                    bookWidget(myBook: widget.Books[index]),
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
