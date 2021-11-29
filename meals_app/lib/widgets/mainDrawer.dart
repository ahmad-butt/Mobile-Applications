import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget buildListTiles(IconData icon, String text, dynamic tapHandler) {
      return ListTile(
        leading: Icon(
          icon,
          size: 26,
        ),
        title: Text(
          text,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            fontFamily: 'RobotoCondensed',
          ),
        ),
        onTap: tapHandler,
      );
    }

    return Drawer(
      child: Column(
        children: [
          Container(
            height: 120,
            color: Theme.of(context).colorScheme.secondary,
            width: double.infinity,
            child: Center(
              child: Text(
                'Cooking Up🥘',
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 30,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          buildListTiles(
            Icons.restaurant,
            'Meals',
            () {
              Navigator.of(context).pushReplacementNamed('/');
            },
          ),
          buildListTiles(
            Icons.settings,
            'Filters',
            () {
              Navigator.of(context).pushReplacementNamed('/filters');
            },
          ),
        ],
      ),
    );
  }
}
