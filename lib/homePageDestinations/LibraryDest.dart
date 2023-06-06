import 'package:flutter/material.dart';
import 'package:the_fidibo_project/BookWidget.dart';
import 'package:the_fidibo_project/MediaGrid.dart';
import 'package:the_fidibo_project/book.dart';
import 'package:the_fidibo_project/mediaCard.dart';
import 'package:the_fidibo_project/userPrefs/globalTheme.dart';
import 'package:the_fidibo_project/widgetAssets.dart';

class LibraryDest extends StatefulWidget {
  const LibraryDest({super.key});

  @override
  State<LibraryDest> createState() => _LibraryDestState();
}

enum SampleItem { item1, item2, item3, item4 }

class _LibraryDestState extends State<LibraryDest> {
  SampleItem selectedMenu = SampleItem.item1;
  @override
  Widget build(BuildContext context) {
    var myBooks = [
      new book('Harry Potter and the Sorcerer\’s Stone', 'J.K.Rowling',
          'assets/bookCovers/1.jpeg'),
      new book('Harry Potter and the Sorcerer\’s Stone', 'J.K.Rowling',
          'assets/bookCovers/b1.jpg'),
      new book('Harry Potter and the Chamber of Secrets', 'J.K.Rowling',
          'assets/bookCovers/2.jpeg'),
      new book('Harry Potter and the Chamber of Secrets', 'J.K.Rowling',
          'assets/bookCovers/b2.jpg'),
      new book('Harry Potter and the Prisoner of Azkaban', 'J.K.Rowling',
          'assets/bookCovers/3.jpeg'),
      new book('Harry Potter and the Prisoner of Azkaban', 'J.K.Rowling',
          'assets/bookCovers/b3.jpg'),
      new book('Harry Potter and the Goblet of Fire', 'J.K.Rowling',
          'assets/bookCovers/4.jpeg'),
      new book('Harry Potter and the Goblet of Fire', 'J.K.Rowling',
          'assets/bookCovers/b4.jpg'),
      new book('Harry Potter and the Order of the Phoenix ', 'J.K.Rowling',
          'assets/bookCovers/5.jpeg'),
      new book('Harry Potter and the Order of the Phoenix ', 'J.K.Rowling',
          'assets/bookCovers/b5.jpg'),
      new book('Harry Potter and the Half-Blood Prince ', 'J.K.Rowling',
          'assets/bookCovers/6.jpeg'),
      new book('Harry Potter and the Half-Blood Prince ', 'J.K.Rowling',
          'assets/bookCovers/b6.jpg'),
      new book('Harry Potter and the Deathly Hallows ', 'J.K.Rowling',
          'assets/bookCovers/7.jpeg'),
      new book('Harry Potter and the Deathly Hallows ', 'J.K.Rowling',
          'assets/bookCovers/b7.jpg'),
      new book('The Ballad of Songbirds and Snakes', 'Suzanne Collins ',
          'assets/bookCovers/_MG_7911_7.png'),
    ];
    return SingleChildScrollView(
      child: Column(
        children: [
          ListTile(
            title: Text(
              selectedMenu == SampleItem.item1
                  ? "Sorted By : Last Read"
                  : selectedMenu == SampleItem.item2
                      ? "Sorted By : Most Likes"
                      : selectedMenu == SampleItem.item3
                          ? "Sorted By : Ebook"
                          : "Sorted By : Audio Books",
              style: TextStyle(
                fontWeight: FontWeight.w800,
                fontSize: 19,
              ),
            ),
            trailing: PopupMenuButton<SampleItem>(
              icon: Icon(
                Icons.filter_alt,
                size: 35,
              ),
              initialValue: selectedMenu,
              // Callback that sets the selected popup menu item.
              onSelected: (SampleItem item) {
                setState(() {
                  selectedMenu = item;
                });
              },
              itemBuilder: (BuildContext context) =>
                  <PopupMenuEntry<SampleItem>>[
                const PopupMenuItem<SampleItem>(
                  value: SampleItem.item1,
                  child: Text(
                    'Last Read',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 17,
                    ),
                  ),
                ),
                const PopupMenuItem<SampleItem>(
                  value: SampleItem.item2,
                  child: Text(
                    'Most Likes',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 17,
                    ),
                  ),
                ),
                const PopupMenuItem<SampleItem>(
                  value: SampleItem.item3,
                  child: Text(
                    'Ebook',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 17,
                    ),
                  ),
                ),
                const PopupMenuItem<SampleItem>(
                  value: SampleItem.item4,
                  child: Text(
                    'Audio Book',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 17,
                    ),
                  ),
                ),
              ],
            ),
          ),
          GridView.count(
            crossAxisCount: 2, // Two columns
            scrollDirection: Axis.vertical, // Vertical scrolling
            // mainAxisSpacing: 200.0,
            childAspectRatio: 0.6,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            children: List.generate(
              myBooks.length,
              (index) => bookWidget(
                myBook: myBooks[index],
                Hight: 300,
                Width: 200,
                bdis: 10,
              ), // Your custom widget
            ),
          ),
        ],
      ),
    );
  }
}
