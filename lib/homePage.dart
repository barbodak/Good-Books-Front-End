import 'package:flutter/material.dart';

class homePage extends StatefulWidget {
  const homePage({super.key});

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  int currentPageIndex = 0;
  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    return MaterialApp(
      theme: ThemeData(
        colorSchemeSeed: Color(0xff6750a4),
        useMaterial3: true,
      ),
      home: Scaffold(
        appBar: AppBar(
          elevation: 4,
        ),
        body: <Widget>[
          ListView.builder(
            itemCount: 25,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                tileColor: colorScheme.primary,
                title: Text('do $index'),
              );
            },
          ),
          Container(
            color: Colors.green,
            alignment: Alignment.center,
            child: const Text('Page 2'),
          ),
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
              icon: Icon(Icons.home_filled,
                  color: Color.fromARGB(255, 72, 72, 72)),
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
