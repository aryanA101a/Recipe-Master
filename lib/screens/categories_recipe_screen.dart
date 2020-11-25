import 'package:chefz_kit/models/meals_ds.dart';

import '../widgets/meals_item.dart';
import 'package:flutter/material.dart';


class CategoryRecipeScreen extends StatelessWidget {
  static const routeName = '/categories';
  final List<Meal> availableMeals;
  final Function toggleFavorite;
  final Function isFavorite;

  CategoryRecipeScreen(
      this.isFavorite, this.toggleFavorite, this.availableMeals);

  @override
  Widget build(BuildContext context) {

    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final categoryTitle = routeArgs['title'];
    final categoryId = routeArgs['id'];
    final categoryMeals = availableMeals.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();
    return Scaffold(
      body: ListView.builder(
        itemBuilder: (context, index) {
          return MealItem(
            isFavorite: isFavorite,
            toggleFavorite: toggleFavorite,
            id: categoryMeals[index].id,
            title: categoryMeals[index].title,
            duration: categoryMeals[index].duration,
            imageUrl: categoryMeals[index].imageUrl,
            affordability: categoryMeals[index].affordability,
            complexity: categoryMeals[index].complexity,
          );
        },
        itemCount: categoryMeals.length,
        scrollDirection: Axis.horizontal,
      ),

//        appBar: AppBar(
//          title: Text(categoryTitle),
//        )
    );
  }
}
