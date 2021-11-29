import 'package:flutter/material.dart';
import 'package:meals_app/data/dummyCategoryData.dart';

class MealDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final mealID = ModalRoute.of(context)?.settings.arguments as String;
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealID);
    return Scaffold(
      backgroundColor: Theme.of(context).canvasColor,
      appBar: AppBar(
        title: Text('${selectedMeal.title}'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(
              '${selectedMeal.imageUrl}',
              height: 300,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 15),
            Text(
              'Ingridients',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.all(10),
              height: 150,
              width: 300,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: Colors.black,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: ListView.builder(
                itemBuilder: (ctx, index) {
                  return Card(
                    color: Theme.of(context).colorScheme.secondary,
                    child: Padding(
                      padding: EdgeInsets.all(5),
                      child: Text(
                        '${selectedMeal.ingredients[index]}',
                        style: TextStyle(),
                      ),
                    ),
                  );
                },
                itemCount: selectedMeal.ingredients.length,
              ),
            ),
            SizedBox(height: 15),
            Text(
              'Steps',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.all(10),
              height: 150,
              width: 300,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: Colors.black,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: ListView.builder(
                itemBuilder: (ctx, index) {
                  return Row(
                    children: [
                      Container(
                        width: 50,
                        height: 50,
                        margin: EdgeInsets.all(10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '${index + 1}#',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.primary,
                          border: Border.all(
                            color: Colors.black,
                          ),
                          borderRadius: BorderRadius.circular(200),
                        ),
                      ),
                      Container(
                        width: 200,
                        margin: EdgeInsets.only(bottom: 5),
                        child: Text(
                          '${selectedMeal.steps[index]}',
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ],
                  );
                },
                itemCount: selectedMeal.steps.length,
              ),
            ),
            SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}
