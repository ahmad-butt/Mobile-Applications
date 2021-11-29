import 'package:flutter/material.dart';
import 'package:meals_app/screens/categoriesScreen.dart';
import 'package:meals_app/screens/favouritesScreen.dart';
import 'package:meals_app/widgets/mainDrawer.dart';

class TabsScreen extends StatefulWidget {
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  final List<Map<String, dynamic>> tabScreens = [
    {
      'page': CategoriesScreen(),
      'title': 'Categories',
    },
    {
      'page': FavouritesScreen(),
      'title': 'Your Favourites',
    },
  ];

  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(
      () {
        _selectedPageIndex = index;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    //Top Tab Navigation Bar

    // return DefaultTabController(
    //   length: 2,
    //   child: Scaffold(
    //     appBar: AppBar(
    //       title: Text('Meals'),
    //       bottom: TabBar(
    //         labelColor: Theme.of(context).colorScheme.secondary,
    //         unselectedLabelColor: Colors.white,
    //         tabs: [
    //           Tab(
    //             icon: Icon(Icons.category),
    //           ),
    //           Tab(
    //             icon: Icon(Icons.favorite),
    //           ),
    //         ],
    //       ),
    //     ),
    //     body: TabBarView(
    //       children: [
    //         CategoriesScreen(),
    //         FavouritesScreen(),
    //       ],
    //     ),
    //   ),
    // );

    //Bottom Tab Navigation Bar
    return Scaffold(
      appBar: AppBar(
        title: Text('${tabScreens[_selectedPageIndex]['title']}'),
      ),
      drawer: MainDrawer(),
      body: tabScreens[_selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        backgroundColor: Theme.of(context).colorScheme.primary,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).colorScheme.secondary,
        currentIndex: _selectedPageIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Favourites',
          ),
        ],
      ),
    );
  }
}
