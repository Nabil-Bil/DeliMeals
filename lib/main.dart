import 'package:delimeals/dummy_data.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import './screens/meal_item_screen.dart';
import 'models/meal.dart';
import 'screens/category_meals_screen.dart';
import 'screens/navigation_screen.dart';
import 'screens/filters_screen.dart';

main() async {
  return runApp(ChangeNotifierProvider(
    create: (context) => Favorites(),
    child: const MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> filters = {
    'gluten': false,
    'lactose': false,
    'vegetarian': false,
    'vegan': false,
  };

  List<Meal> _availableMeals = DUMMY_MEALS;

  void _setFilters(Map<String, bool> newFilters) {
    filters = newFilters;
    _availableMeals = DUMMY_MEALS.where((element) {
      if (filters['gluten']! && !element.isGlutenFree) {
        return false;
      }
      if (filters['lactose']! && !element.isLactoseFree) {
        return false;
      }
      if (filters['vegetarian']! && !element.isVegetarian) {
        return false;
      }
      if (filters['vegan']! && !element.isVegan) {
        return false;
      }
      return true;
    }).toList();
  }

  @override
  void initState() {
    SharedPreferences.getInstance().then((value) {
      filters = {
        'gluten': value.getBool('gluten') ?? false,
        'lactose': value.getBool('lactose') ?? false,
        'vegetarian': value.getBool('vegetarian') ?? false,
        'vegan': value.getBool('key') ?? false,
      };
    }).then((value) {
      _availableMeals = DUMMY_MEALS.where((element) {
        if (filters['gluten']! && !element.isGlutenFree) {
          return false;
        }
        if (filters['lactose']! && !element.isLactoseFree) {
          return false;
        }
        if (filters['vegetarian']! && !element.isVegetarian) {
          return false;
        }
        if (filters['vegan']! && !element.isVegan) {
          return false;
        }
        return true;
      }).toList();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return (MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'DeliMeals',
      initialRoute: '/',
      theme: ThemeData(
        canvasColor: const Color.fromRGBO(255, 254, 229, 1),
        drawerTheme: DrawerThemeData(
          backgroundColor: Colors.amber[50],
        ),
        fontFamily: GoogleFonts.raleway().fontFamily,
        textTheme: GoogleFonts.ralewayTextTheme(const TextTheme()).copyWith(
          bodyText1: const TextStyle(
            color: Color.fromRGBO(20, 51, 51, 1),
          ),
          bodyText2: const TextStyle(
            color: Color.fromRGBO(20, 51, 51, 1),
          ),
          headline1: GoogleFonts.robotoCondensed(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
          headline2: GoogleFonts.robotoCondensed(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.pink)
            .copyWith(secondary: Colors.amber),
      ),
      routes: {
        '/': (context) => const NavigationScreen(),
        CategoryMealsScreen.routeName: (context) => CategoryMealsScreen(
              availableMeals: _availableMeals,
            ),
        MealItemScreen.routeName: (context) => const MealItemScreen(),
        FilterScreen.routeName: (context) =>
            FilterScreen(handler: _setFilters, filters: filters),
      },
    ));
  }
}

class Favorites extends ChangeNotifier {
  final List<Meal> _mealList = [];

  Future<void> addMeal(Meal meal) async {
    _mealList.add(meal);

    notifyListeners();
  }

  Future<void> removeMeal(Meal meal) async {
    _mealList.remove(meal);

    notifyListeners();
  }

  List<Meal> get getFavoriteMeals {
    return _mealList;
  }
}
