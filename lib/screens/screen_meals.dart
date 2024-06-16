import 'package:flutter/material.dart';
import 'package:meals_app/models/meal_model.dart';
import 'package:meals_app/widgets/meal_item.dart';

import 'meal_details.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen(
      {this.title, required this.availableMeals, super.key});

  final String? title;
  final List<Meal> availableMeals;
  void selectMeal(BuildContext context, Meal meal) {
    Navigator.of(context).push(
        MaterialPageRoute(builder: (ctx) => MealDetailsScreen(meal: meal)));
  }

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
            style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                color: Theme.of(context).colorScheme.onSecondaryContainer),
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
            "Try Selecting another Category ",
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.onSecondaryContainer),
          )
        ],
      ),
    );
    if (availableMeals.isNotEmpty) {
      content = ListView.builder(
          itemCount: availableMeals.length,
          itemBuilder: (context, index) => MenuItem(
                meal: availableMeals[index],
                sltMeal: (meal) {
                  selectMeal(context, meal);
                }
                ,
              ));
    }
    if(title ==null){
      return content;
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(title!),
      ),
      body: content,
    );
  }
}
