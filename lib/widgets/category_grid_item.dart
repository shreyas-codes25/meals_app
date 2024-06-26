import 'package:flutter/material.dart';
import 'package:meals_app/models/category_model.dart';

class CategoryGridItem extends StatelessWidget {
  const CategoryGridItem({required this.category, super.key,required this.sltCategory});

  final CategoryModel category;

  final void  Function() sltCategory;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap:sltCategory,
      splashColor: Theme.of(context).colorScheme.inversePrimary,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          gradient: LinearGradient(
            colors: [
              category.color.withOpacity(0.55),
              category.color.withOpacity(0.9)
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Text(
          category.title,
          style: Theme.of(context)
              .textTheme
              .titleLarge
              ?.copyWith(color: Colors.white),
        ),
      ),
    );
  }
}
