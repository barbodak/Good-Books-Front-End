import 'package:flutter/material.dart';
import 'package:the_fidibo_project/bookPage.dart';
import 'package:the_fidibo_project/book.dart';

class bookWidget extends StatefulWidget {
  final book myBook;
  const bookWidget({super.key, required this.myBook});

  @override
  State<bookWidget> createState() => _bookWidgetState();
}

class _bookWidgetState extends State<bookWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: SizedBox(
        width: 150,
        child: Column(
          children: [
            SizedBox(
              width: 150,
              child: Image.asset(
                widget
                    .myBook.cover, // use widget.myBook instead of Widget.myBook
                height: 200,
              ),
              // ),
            ),
            SizedBox(height: 10),
            SizedBox(
              width: 150,
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
              width: 150,
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
        );
      },
    );
  }
}
