import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:the_fidibo_project/bookPage.dart';
import 'package:the_fidibo_project/book.dart';

class bookWidget extends StatefulWidget {
  final book myBook;
  final double Width;
  final double Hight;
  final double bdis;
  const bookWidget(
      {super.key,
      required this.myBook,
      required this.Width,
      required this.Hight,
      required this.bdis});

  @override
  State<bookWidget> createState() => _bookWidgetState();
}

class _bookWidgetState extends State<bookWidget> {
  @override
  Widget build(BuildContext context) {
    print(widget.myBook.cover);
    return InkWell(
      child: SizedBox(
        width: widget.Width,
        // height: widget.Width + widget.bdis + 200,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: widget.Width,
              child: Image.asset(
                widget
                    .myBook.cover, // use widget.myBook instead of Widget.myBook
                height: widget.Hight,
              ),
              // ),
            ),
            SizedBox(height: widget.bdis),
            SizedBox(
              width: widget.Width,
              child: Text(
                widget
                    .myBook.name, // use widget.myBook instead of Widget.myBook
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  // fontSize: 19,
                ),
              ),
            ),
            SizedBox(
              width: widget.Width,
              child: Text(widget
                  .myBook.author), // use widget.myBook instead of Widget.myBook
            ),
          ],
        ),
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => bookPage(myBook: widget.myBook),
          ),
        ).then((value) {
          // This block runs when you have returned back to the first page from second page
          setState(() {
            // Call setState to refresh the first page
          });
        });
        ;
      },
    );
  }
}
