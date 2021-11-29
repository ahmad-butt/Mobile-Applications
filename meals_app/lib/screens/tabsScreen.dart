import 'package:flutter/material.dart';
import 'package:meals_app/screens/categoriesScreen.dart';
import 'package:meals_app/screens/favouritesScreen.dart';

class TabsScreen extends StatefulWidget {
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Meals'),
          bottom: TabBar(
            labelColor: Theme.of(context).colorScheme.secondary,
            unselectedLabelColor: Colors.white,
            tabs: [
              Tab(
                icon: Icon(Icons.category),
              ),
              Tab(
                icon: Icon(Icons.favorite),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            CategoriesScreen(),
            FavouritesScreen(),
          ],
        ),
      ),
    );
  }
}
