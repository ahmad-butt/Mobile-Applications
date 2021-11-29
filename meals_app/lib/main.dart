import 'package:flutter/material.dart';
import 'package:meals_app/screens/categoriesScreen.dart';
import 'package:meals_app/screens/categoryMealsScreen.dart';
import 'package:meals_app/screens/filterScreen.dart';
import 'package:meals_app/screens/mealDetailScreen.dart';
import 'package:meals_app/screens/tabsScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = ThemeData();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Meals Hub',
      theme: theme.copyWith(
        colorScheme: theme.colorScheme.copyWith(
          primary: Colors.deepPurple,
          secondary: Colors.amber,
        ),
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: TextStyle(
                fontFamily: 'Raleway',
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              bodyText2: TextStyle(
                fontFamily: 'Raleway',
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              headline1: TextStyle(
                fontFamily: 'RobotoCondensed',
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
        appBarTheme: theme.appBarTheme.copyWith(
          titleTextStyle: TextStyle(
            fontFamily: 'Raleway',
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      home: TabsScreen(),
      routes: {
        '/category-meals': (context) => CategoryMealsScreen(),
        '/meal-detail': (context) => MealDetails(),
        '/filters': (context) => FilterScreen(),
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(
          builder: (ctx) {
            return CategoriesScreen();
          },
        );
      },
    );
  }
}
