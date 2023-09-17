import 'package:flutter/material.dart';

import 'package:meals/models/meal.dart';
import 'package:meals/screens/meal_details.dart';
import 'package:meals/widgets/meal_item.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({
    Key? key,
    this.title,
    required this.onToggleFavourite,
    required this.meals,
  }) : super(key: key);

  final String? title;
    final void Function(Meal meal) onToggleFavourite;

  final List<Meal> meals;

  void selectMeal(BuildContext context, Meal meal) {
    Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => MealDetailsScreen(meal: meal,onToggleFavourite: onToggleFavourite,)));
  }

  @override
  Widget build(BuildContext context) {
    Widget content = Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Nothing here...',
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          const SizedBox(height: 16),
          Text(
            'Try selecting some different category!',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ],
      ),
    );
    if (meals.isNotEmpty) {
      content = ListView.builder(
        itemCount: meals.length,
        padding: const EdgeInsets.all(12),
        itemBuilder: (ctx, index) => MealItem(
          meal: meals[index],
          onSelectMeal: (meal) {
            selectMeal(context, meal);
          },
        ),
      );
    }

    if (title == null) {
      return content;
    }

    return Scaffold(
        appBar: AppBar(
          elevation: 10,
          title: Text(title!),
        ),
        body: content);
  }
}
