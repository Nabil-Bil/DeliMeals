import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../main.dart';
import '../widgets/meal_item.dart';
import '../models/meal.dart';

class FavoritesMealScreen extends StatefulWidget {
  const FavoritesMealScreen({Key? key}) : super(key: key);

  @override
  State<FavoritesMealScreen> createState() => _FavoritesMealScreenState();
}

class _FavoritesMealScreenState extends State<FavoritesMealScreen> {
  List<Meal> listMeal = [];

  @override
  Widget build(BuildContext context) {
    listMeal = Provider.of<Favorites>(context, listen: true).getFavoriteMeals;
    return ListView.builder(
      itemBuilder: (context, index) {
        return MealItem(
            id: listMeal[index].id,
            title: listMeal[index].title,
            imageUrl: listMeal[index].imageUrl,
            duration: listMeal[index].duration,
            affordability: listMeal[index].affordability,
            complexity: listMeal[index].complexity);
      },
      itemCount: listMeal.length,
    );
  }
}
