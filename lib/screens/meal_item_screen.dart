import 'package:delimeals/models/meal.dart';
import 'package:flutter/material.dart';
import '../dummy_data.dart';

class MealItemScreen extends StatelessWidget {
  const MealItemScreen({Key? key}) : super(key: key);

  static String routeName = '/meal-item';

  @override
  Widget build(BuildContext context) {
    final routeArg = ModalRoute.of(context)?.settings.arguments;

    final Meal meal =
        DUMMY_MEALS.firstWhere((element) => element.id == routeArg);

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(
          Icons.star_outline,
          color: Colors.black,
        ),
      ),
      appBar: AppBar(
        title: Text(meal.title),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Image.network(
            meal.imageUrl,
            fit: BoxFit.cover,
            width: double.infinity,
            height: 300,
          ),
          Container(
            margin: const EdgeInsets.only(top: 15, bottom: 30),
            child: Text(
              'Ingredients',
              style: Theme.of(context).textTheme.headline1,
            ),
          ),
          Container(
            height: 175,
            margin: const EdgeInsets.symmetric(horizontal: 50),
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: Colors.grey),
                color: Colors.white),
            child: ListView.builder(
              itemBuilder: (context, index) => Container(
                margin: const EdgeInsets.symmetric(vertical: 5),
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.secondary,
                    borderRadius: BorderRadius.circular(4)),
                child: Text(
                  meal.ingredients[index],
                  style: const TextStyle(fontSize: 16),
                ),
              ),
              itemCount: meal.ingredients.length,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 15, bottom: 15),
            child: Text(
              'Steps',
              style: Theme.of(context).textTheme.headline1,
            ),
          ),
          Container(
            height: 175,
            margin: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: Colors.grey),
              color: Colors.white,
            ),
            child: ListView.builder(
              itemBuilder: (context, index) => Column(
                children: [
                  ListTile(
                    contentPadding: const EdgeInsets.symmetric(vertical: 15),
                    leading: CircleAvatar(
                      foregroundColor: Colors.white,
                      child: Text('# ${index + 1}'),
                      backgroundColor: Theme.of(context).colorScheme.primary,
                    ),
                    title: Text(meal.steps[index]),
                  ),
                  const Divider(),
                ],
              ),
              itemCount: meal.steps.length,
            ),
          )
        ]),
      ),
    );
  }
}
