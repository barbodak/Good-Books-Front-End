import 'package:flutter/material.dart';
import 'package:the_fidibo_project/BookWidget.dart';
import 'package:the_fidibo_project/book.dart';
import 'package:the_fidibo_project/Network.dart';
import 'package:the_fidibo_project/mediaCard.dart';
import 'package:the_fidibo_project/user.dart';
import 'package:the_fidibo_project/userPrefs/globalTheme.dart';
import 'package:the_fidibo_project/utils.dart';
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
    var myBooks = book.allBooks;
    return SingleChildScrollView(
      child: Column(
        children: [
          mediaCard(
              BackgroundColor: Colors.white, //colorScheme.tertiaryContainer,
              CardName: 'Reading Now',
              Books: User.loggedIn.ownedBooks),
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
                            Books: myBooks.sublist(0, 4)),
                        mediaCard(
                            BackgroundColor: colorScheme.secondaryContainer,
                            CardName: 'New Release',
                            Books: myBooks.sublist(5, 10)),
                        mediaCard(
                            BackgroundColor: colorScheme.tertiaryContainer,
                            CardName: 'Favorit of GoodBooks',
                            Books: myBooks.sublist(11)),
                      ],
                    ),
                    Column(
                      children: [
                        mediaCard(
                            BackgroundColor: colorScheme.tertiaryContainer,
                            CardName: 'Favorit of GoodBooks',
                            Books: []),
                        mediaCard(
                            BackgroundColor: colorScheme.secondaryContainer,
                            CardName: 'New Release',
                            Books: []),
                        mediaCard(
                            BackgroundColor: colorScheme.primaryContainer,
                            CardName: 'Top Sellers',
                            Books: []),
                      ],
                    )
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
