import 'package:flutter/material.dart';
import '../widgets/custom_drawer.dart';

class FilterScreen extends StatelessWidget {
  static String routeName = '/filters';
  const FilterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Filters'),
      ),
      drawer: const CustomDrawer(),
      body: const Center(child: Text('Filter Screen')),
    );
  }
}
