import 'package:delimeals/widgets/meal_item.dart';
import 'package:flutter/material.dart';
import '../models/category.dart';
import '../dummy_data.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const routeName = '/categoriy-meals';
  const CategoryMealsScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final category = ModalRoute.of(context)?.settings.arguments as Category;
    final categoryMeals = DUMMY_MEALS
        // ignore: iterable_contains_unrelated_type
        .where((meal) => meal.categories.contains(category.id))
        .toList();

    return Scaffold(
       
        appBar: AppBar(
          title: Text(category.title),
        ),
        body: ListView.builder(
          itemBuilder: ((context, index) => MealItem(
                id: categoryMeals[index].id,
                title: categoryMeals[index].title,
                imageUrl: categoryMeals[index].imageUrl,
                complexity: categoryMeals[index].complexity,
                affordability: categoryMeals[index].affordability,
                duration: categoryMeals[index].duration,
              )),
          itemCount: categoryMeals.length,
        ));
  }
}
