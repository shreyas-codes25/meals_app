import 'package:flutter/material.dart';
import 'package:meals_app/widgets/meal_item_trait.dart';
import 'package:transparent_image/transparent_image.dart';

import '../models/meal_model.dart';

class MenuItem extends StatelessWidget {
  const MenuItem({required this.sltMeal,required this.meal, super.key});

  final Meal meal;
  String get affordabilityText {
    return meal.affordability.name[0].toUpperCase() + meal.affordability.name.substring(1);
  }
  String get complexityText {
    return meal.complexity.name[0].toUpperCase() + meal.complexity.name.substring(1);
  }
  final void Function(Meal meal) sltMeal;
  @override
  Widget build(BuildContext context) {
    return Card(
        margin: const EdgeInsets.all(8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        clipBehavior: Clip.hardEdge,
        elevation: 2,
        child: InkWell(
            onTap: () {sltMeal(meal);},
            child: Stack(
              children: [
                Hero(
                  tag: meal.id,
                  child: FadeInImage(
                      placeholder: MemoryImage(kTransparentImage),
                      image: NetworkImage(meal.imageUrl),
                      fit: BoxFit.cover,
                      height: 200,
                      width: double.infinity),
                ),
                Positioned(

                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      color: Colors.black54,
                      padding: const EdgeInsets.symmetric(
                        vertical: 6,
                        horizontal: 44,
                      ),
                      child: Column(
                        children: [
                          Text(
                            meal.title,
                            maxLines: 2,
                            textAlign: TextAlign.center,
                            softWrap: true,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              MealItemTrait(icon: Icons.schedule, label: "${meal.duration} min"),
                              const SizedBox(width: 20),
                              MealItemTrait(icon: Icons.work, label:"$complexityText "),
                              const SizedBox(width: 20),
                              MealItemTrait(icon: Icons.attach_money, label: "$affordabilityText "),
                            ],
                          )
                        ],
                      ),
                    ))
              ],
            )));
  }
}
