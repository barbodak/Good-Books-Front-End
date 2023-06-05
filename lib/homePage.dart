import 'package:flutter/material.dart';
import 'package:the_fidibo_project/profile/pfpPage.dart';
import 'package:the_fidibo_project/userPrefs/globalTheme.dart';
import 'package:the_fidibo_project/homePageDestinations/homeDest.dart';

class homePage extends StatefulWidget {
  const homePage({super.key});

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  int currentPageIndex = 0;
  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = globalTheme.get().colorScheme;
    return MaterialApp(
      theme: globalTheme.get(),
      home: Scaffold(
        appBar: AppBar(
          leading: Hero(
            tag: '1',
            child: IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const pfpPage(),
                  ),
                );
              },
              icon: const Icon(
                Icons.account_circle_rounded,
                size: 30,
              ),
            ),
          ),
          leadingWidth: 85, // default is 56
          title: const Text(
            "Good Books",
            style: TextStyle(
              fontFamily: 'Switzer',
              fontWeight: FontWeight.w900,
              fontSize: 28.0,
            ),
          ),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.search,
                size: 30,
              ),
            ),
          ],
        ),
        body: <Widget>[
          homeDest(),
          Container(
            color: Colors.green,
            alignment: Alignment.center,
            child: const Text('Page 2'),
          ),
          homeDest(),
        ][currentPageIndex],
        bottomNavigationBar: NavigationBar(
          onDestinationSelected: (int index) {
            setState(
              () {
                currentPageIndex = index;
              },
            );
          },
          selectedIndex: currentPageIndex,
          destinations: const <Widget>[
            NavigationDestination(
              selectedIcon: Icon(Icons.home_filled),
              icon: Icon(
                Icons.home_filled,
                // color: Color.fromARGB(255, 72, 72, 72),
              ),
              label: 'Home',
            ),
            NavigationDestination(
              icon: Icon(Icons.shelves),
              label: 'Library',
            ),
            NavigationDestination(
              selectedIcon: Icon(Icons.storefront_rounded),
              icon: Icon(Icons.storefront_outlined),
              label: 'Shop',
            ),
          ],
        ),
      ),
    );
  }
}
