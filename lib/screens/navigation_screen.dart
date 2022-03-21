import '../widgets/custom_drawer.dart';
import 'package:flutter/material.dart';
import './categories_screen.dart';
import 'favorites_meal_screen.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({Key? key}) : super(key: key);

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  int _selectedIndex = 0;

  final List<Map<String, dynamic>> widgetOptions = [
    {
      'page': const CategoriesScreen(),
      'title': 'Meals',
    },
    {
      'page': const FavoritesMealScreen(),
      'title': 'Favorites',
    },
  ];

  void selectNavigationBarItem(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return (Scaffold(
      appBar: AppBar(title: Text(widgetOptions[_selectedIndex]['title'])),
      drawer: const CustomDrawer(),
      body: widgetOptions[_selectedIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Favorites',
          ),
        ],
        backgroundColor: Theme.of(context).colorScheme.primary,
        unselectedItemColor: Colors.white,
        currentIndex: _selectedIndex,
        selectedItemColor: Theme.of(context).colorScheme.secondary,
        onTap: selectNavigationBarItem,
      ),
    ));
  }
}
