import 'package:flutter/material.dart';
import 'package:meals_app/models/meal_model.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen(
      {required this.title, required this.availableMeals, super.key});

  final String title;
  final List<Meal> availableMeals;
  // ListView.builder(itemBuilder: (context, index) {
  // return Text(availableMeals[index].title);
  @override
  Widget build(BuildContext context) {
    Widget content = Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "No meal found!",
            style: Theme.of(context)
                .textTheme
                .headlineLarge!
                .copyWith(color: Theme.of(context).colorScheme.onSecondaryContainer),
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
            "Try Selecting another Category ",
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(color: Theme.of(context).colorScheme.onSecondaryContainer),
          )
        ],
      ),
    );
    if (availableMeals.isNotEmpty) {
      content = ListView.builder(itemCount: availableMeals.length,itemBuilder: (context, index) {
        return Text(availableMeals[index].title);
      });
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: content,
    );
  }
}
