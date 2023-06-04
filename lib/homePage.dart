import 'package:flutter/material.dart';
import 'package:the_fidibo_project/profile/pfpPage.dart';
import 'package:the_fidibo_project/userPrefs/globalTheme.dart';

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
            "Home",
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
          ListView.builder(
            itemCount: 25,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                tileColor: colorScheme.primary.withOpacity(0.6),
                title: Text('do $index'),
              );
            },
          ),
          Container(
            color: Colors.green,
            alignment: Alignment.center,
            child: const Text('Page 2'),
          ),
          CustomScrollView(
            slivers: <Widget>[
              SliverAppBar(
                backgroundColor: colorScheme.secondary,
                pinned: true,
                snap: true,
                floating: true,
                expandedHeight: 60.0,
                flexibleSpace: const FlexibleSpaceBar(
                  title: Text('SliverAppBar'),
                  // background: FlutterLogo(,
                ),
              ),
              const SliverToBoxAdapter(
                child: SizedBox(
                  height: 20,
                  child: Center(
                    child: Text('Scroll to see the SliverAppBar in effect.'),
                  ),
                ),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    return Container(
                      color: index.isOdd ? Colors.white : Colors.black12,
                      height: 100.0,
                      child: Center(
                        child: Text('$index', textScaleFactor: 5),
                      ),
                    );
                  },
                  childCount: 20,
                ),
              ),
            ],
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
