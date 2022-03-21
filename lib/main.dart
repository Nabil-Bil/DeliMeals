import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import './screens/meal_item_screen.dart';
import 'screens/category_meals_screen.dart';
import 'screens/navigation_screen.dart';
import 'screens/filters_screen.dart';

main() async {
  await Future.delayed(const Duration(seconds: 1,milliseconds: 500));
  return runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
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
        CategoryMealsScreen.routeName: (context) => const CategoryMealsScreen(),
        MealItemScreen.routeName: (context) => const MealItemScreen(),
        FilterScreen.routeName: (context) => const FilterScreen(),
      },
    ));
  }
}
