import 'package:flutter/material.dart';
import 'package:the_fidibo_project/bookWidget.dart';
import 'package:the_fidibo_project/book.dart';

class MediaGrid extends StatefulWidget {
  final List<book> Books;
  const MediaGrid({super.key, required this.Books});

  @override
  State<MediaGrid> createState() => _MediaGridState();
}

class _MediaGridState extends State<MediaGrid> {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2, // Two columns
      scrollDirection: Axis.vertical, // Vertical scrolling
      // mainAxisSpacing: 200.0,
      childAspectRatio: 0.6,
      shrinkWrap: true,
      children: List.generate(
        widget.Books.length,
        (index) => bookWidget(
          myBook: widget.Books[index],
          Hight: 300,
          Width: 200,
          bdis: 10,
        ), // Your custom widget
      ),
    );
    // ListView.builder(
    //   itemCount: widget.Books.length,
    //   itemBuilder: (context, index) {
    //     return Row(
    //       children: [
    //         SizedBox(
    //           width: 10,
    //         ),
    //         bookWidget(
    //           myBook: widget.Books[index],
    //           Hight: 300,
    //           Width: 200,
    //           bdis: 10,
    //         ),
    //       ],
    //     );
    //   },
    // );
  }
}
