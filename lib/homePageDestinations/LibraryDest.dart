import 'package:flutter/material.dart';
import 'package:the_fidibo_project/BookWidget.dart';
import 'package:the_fidibo_project/MediaGrid.dart';
import 'package:the_fidibo_project/book.dart';
import 'package:the_fidibo_project/mediaCard.dart';
import 'package:the_fidibo_project/user.dart';
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
  List<book> myBooks = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    myBooks = User.loggedIn.ownedBooks;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ListTile(
            title: Text(
              selectedMenu == SampleItem.item1
                  ? "Sorted By : Owned Books"
                  : selectedMenu == SampleItem.item2
                      ? "Sorted By : Favorit Books"
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
                selectedMenu = item;
                if (item == SampleItem.item1) {
                  myBooks = User.loggedIn.ownedBooks;
                  print(User.loggedIn.ownedBooks.length);
                } else if (item == SampleItem.item2) {
                  myBooks = User.loggedIn.faveBooks;
                  print(User.loggedIn.faveBooks.length);
                  print(myBooks.length);
                } else if (item == SampleItem.item3) {
                  myBooks = User.loggedIn.ownedBooks;
                } else
                  myBooks = [];
                setState(() {});
              },
              itemBuilder: (BuildContext context) =>
                  <PopupMenuEntry<SampleItem>>[
                const PopupMenuItem<SampleItem>(
                  value: SampleItem.item1,
                  child: Text(
                    'Owned Books',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 17,
                    ),
                  ),
                ),
                const PopupMenuItem<SampleItem>(
                  value: SampleItem.item2,
                  child: Text(
                    'Favorit Books',
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
