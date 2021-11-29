import 'package:flutter/material.dart';
import 'package:meals_app/widgets/categoryItem.dart';
import 'package:meals_app/data/dummyCategoryData.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).canvasColor,
      body: GridView(
        padding: const EdgeInsets.all(20),
        children: [
          ...DUMMY_CATEGORIES
              .map(
                (catData) =>
                    CategoryItem(catData.id, catData.title, catData.color),
              )
              .toList(),
        ],
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 15,
          mainAxisSpacing: 15,
        ),
      ),
    );
  }
}
