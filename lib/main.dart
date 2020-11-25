import 'package:chefz_kit/dummy_data.dart';
import 'package:chefz_kit/screens/favourites_screen.dart';
import 'package:chefz_kit/screens/filter_screen.dart';
import 'package:chefz_kit/screens/meal_screen.dart';
import './models/meals_ds.dart';
import './screens/categories_recipe_screen.dart';
import 'package:flutter/material.dart';
import './screens/categories_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Meal> availableMeals = DUMMY_MEALS;
  List<Meal> favoriteItems = [];

  Map<String, bool> filters = {
    'gluten': false,
    'lactose': false,
    'vegetarian': false,
    'vegan': false
  };

  void setFilters(Map<String, bool> filterData) {
    filters = filterData;
    availableMeals = DUMMY_MEALS.where((meal) {
      if (filters['gluten'] && !meal.isGlutenFree) {
        return false;
      }
      if (filters['lactose'] && !meal.isLactoseFree) {
        return false;
      }
      if (filters['vegetarian'] && !meal.isVegetarian) {
        return false;
      }
      if (filters['vegan'] && !meal.isVegan) {
        return false;
      }
      return true;
    }).toList();
  }

  void toggleFavorite(String mealId) {
    final existingIndex = favoriteItems.indexWhere((meal) => meal.id == mealId);
    if (existingIndex >= 0) {
      setState(() {
        favoriteItems.removeAt(existingIndex);
      });
    } else {
      setState(() {
        favoriteItems.add(DUMMY_MEALS.firstWhere((meal) => meal.id == mealId));
      });
    }
  }
  bool isMealFavorite(String id){
    return favoriteItems.any((meal)=>meal.id==id);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
      ),
      title: 'Master Recipies',
      color: Colors.deepOrange,
      routes: {
        FilterScreen.routeName: (ctx) => FilterScreen(filters, setFilters),
        MealScreen.routeName: (ctx) => MealScreen(),
        CategoryRecipeScreen.routeName: (ctx) =>
            CategoryRecipeScreen(isMealFavorite,toggleFavorite,availableMeals),
        '/': (ctx) => CategoriesScreen(favoriteItems)
      },
    );
  }
}
