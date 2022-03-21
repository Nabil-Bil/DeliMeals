import 'package:delimeals/screens/meal_item_screen.dart';
import 'package:flutter/material.dart';
import '../models/meal.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class MealItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  final int duration;
  final Affordability affordability;
  final Complexity complexity;

  const MealItem({
    Key? key,
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.duration,
    required this.affordability,
    required this.complexity,
  }) : super(key: key);

  String get complexityText {
    if (complexity == Complexity.Simple) {
      return 'Simple';
    } else if (complexity == Complexity.Challenging) {
      return 'Challenging';
    } else if (complexity == Complexity.Hard) {
      return 'Hard';
    } else {
      return 'Unknown';
    }
  }

  String get affordabilityText {
    if (affordability == Affordability.Affordable) {
      return 'Affordable';
    } else if (affordability == Affordability.Pricey) {
      return 'Pricey';
    } else if (affordability == Affordability.Luxurious) {
      return 'Luxurious';
    } else {
      return 'Unknown';
    }
  }

  void selectMeal(BuildContext context) {
    Navigator.of(context).pushNamed(MealItemScreen.routeName, arguments: id);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          selectMeal(context);
        },
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          elevation: 4,
          margin: const EdgeInsets.all(10),
          child: Column(children: [
            Stack(
              children: [
                ClipRRect(
                  child: Image.network(
                    imageUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20)),
                ),
                Positioned(
                  right: 10,
                  bottom: 20,
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                    color: Colors.black54,
                    width: 300,
                    child: Text(
                      title,
                      style: const TextStyle(
                        fontSize: 24,
                        color: Colors.white70,
                      ),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.schedule),
                      Text('$duration min')
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(MdiIcons.briefcase),
                      Text(complexityText)
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(MdiIcons.currencyUsd),
                      Text(affordabilityText)
                    ],
                  ),
                ],
              ),
            )
          ]),
        ));
  }
}
