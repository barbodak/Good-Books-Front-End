import 'package:flutter/material.dart';
import 'package:the_fidibo_project/BookWidget.dart';
import 'package:the_fidibo_project/book.dart';
import 'package:the_fidibo_project/mediaCard.dart';
import 'package:the_fidibo_project/userPrefs/globalTheme.dart';
import 'package:the_fidibo_project/widgetAssets.dart';

class homeDest extends StatefulWidget {
  const homeDest({super.key});

  @override
  State<homeDest> createState() => _homeDestState();
}

class _homeDestState extends State<homeDest> {
  final ColorScheme colorScheme = globalTheme.getCS();
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
          mediaCard(
              BackgroundColor: Colors.white, //colorScheme.tertiaryContainer,
              CardName: 'Reading Now',
              Books: myBooks),
          Container(
            height: 1250,
            child: DefaultTabController(
              length: 2,
              child: Scaffold(
                appBar: AppBar(
                  toolbarHeight: 0,
                  bottom: TabBar(
                    tabs: [
                      Tab(
                        child: Text(
                          'Ebooks',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 19,
                          ),
                        ),
                      ),
                      Tab(
                        child: Text(
                          'Audio Books',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 19,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                body: TabBarView(
                  children: [
                    Column(
                      children: [
                        mediaCard(
                            BackgroundColor: colorScheme.primaryContainer,
                            CardName: 'Top Sellers',
                            Books: myBooks),
                        mediaCard(
                            BackgroundColor: colorScheme.secondaryContainer,
                            CardName: 'New Release',
                            Books: myBooks),
                        mediaCard(
                            BackgroundColor: colorScheme.tertiaryContainer,
                            CardName: 'Favorit',
                            Books: myBooks),
                      ],
                    ),
                    Column(
                      children: [
                        mediaCard(
                            BackgroundColor: colorScheme.tertiaryContainer,
                            CardName: 'Favorit',
                            Books: myBooks),
                        mediaCard(
                            BackgroundColor: colorScheme.secondaryContainer,
                            CardName: 'New Release',
                            Books: myBooks),
                        mediaCard(
                            BackgroundColor: colorScheme.primaryContainer,
                            CardName: 'Top Sellers',
                            Books: myBooks),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
