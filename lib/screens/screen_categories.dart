import 'package:meals_app/models/category_model.dart';
import 'package:flutter/material.dart';
import 'package:meals_app/data/dummy_data.dart';
import 'package:meals_app/models/meal_model.dart';
import 'package:meals_app/screens/screen_meals.dart';
import 'package:meals_app/widgets/category_grid_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({required this.availableMeals,required this.onTogFav,super.key});
  final List<Meal> availableMeals;
  final void Function(Meal meal) onTogFav;
  void _selectCategory(BuildContext context,CategoryModel category) {
    List<Meal> availableCategories =    availableMeals.where((meals)=>meals.categories.contains(category.id)).toList();
    Navigator.of(context).push(MaterialPageRoute(
        builder: (ctx) =>
            MealsScreen(onTogFav: onTogFav,title: category.title, availableMeals: availableCategories)));
  }

  @override
  Widget build(BuildContext context) {
    return  GridView(
        padding: const EdgeInsets.all(24),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20),
        children: [
          for (final category in availableCategories)
            CategoryGridItem(
              category: category,
              sltCategory: () {
                _selectCategory(context, category);
              },
            ),
        ],

    );
  }
}
