import 'package:flutter/material.dart';
import 'package:meals_app/widgets/mainDrawer.dart';

class FilterScreen extends StatelessWidget {
  const FilterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).canvasColor,
      appBar: AppBar(
        title: Text('Filters'),
      ),
      body: Center(
        child: Text('Filters Screen'),
      ),
      drawer: MainDrawer(),
    );
  }
}
