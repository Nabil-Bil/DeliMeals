import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../widgets/custom_drawer.dart';

class FilterScreen extends StatefulWidget {
  static String routeName = '/filters';
  final Function(Map<String, bool>) handler;
  final Map<String, bool> filters;
  const FilterScreen({Key? key, required this.handler, required this.filters})
      : super(key: key);

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  late bool _glutenFree;

  late bool _vegetarian;

  late bool _vegan;

  late bool _lactoseFree;

  @override
  void initState() {
    _vegetarian = widget.filters['vegetarian']!;
    _glutenFree = widget.filters['gluten']!;
    _vegan = widget.filters['vegan']!;
    _lactoseFree = widget.filters['lactose']!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Your Filters'),
          actions: [
            IconButton(
                onPressed: () {
                  setState(() {
                    widget.handler({
                      "gluten": _glutenFree,
                      'lactose': _lactoseFree,
                      'vegetarian': _vegetarian,
                      'vegan': _vegan,
                    });
                  });
                },
                icon: const Icon(Icons.save))
          ],
        ),
        drawer: const CustomDrawer(),
        body: Column(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(vertical: 20),
              child: Text(
                "Adjust your meal selection",
                style: Theme.of(context).textTheme.headline2,
              ),
              alignment: Alignment.center,
            ),
            Expanded(
                child: ListView(
              children: [
                SwitchListTile(
                  value: _glutenFree,
                  onChanged: (val) {
                    setState(() {
                      _glutenFree = val;

                      SharedPreferences.getInstance().then(
                          (value) => value.setBool('gluten', _glutenFree));
                    });
                  },
                  title: const Text("Gluten-free"),
                  subtitle: const Text("Only include gluten-free meals"),
                  activeColor: Theme.of(context).colorScheme.secondary,
                ),
                SwitchListTile(
                  value: _vegetarian,
                  onChanged: (val) {
                    setState(() {
                      _vegetarian = val;
                      SharedPreferences.getInstance().then(
                          (value) => value.setBool('vegetarian', _vegetarian));
                    });
                  },
                  title: const Text("Vegetarian"),
                  subtitle: const Text("Only include vegetarian meals"),
                  activeColor: Theme.of(context).colorScheme.secondary,
                ),
                SwitchListTile(
                  value: _vegan,
                  onChanged: (val) {
                    setState(() {
                      _vegan = val;
                      SharedPreferences.getInstance()
                          .then((value) => value.setBool('vegan', _vegan));
                    });
                  },
                  title: const Text("Vegan"),
                  subtitle: const Text("Only include vegan meals"),
                  activeColor: Theme.of(context).colorScheme.secondary,
                ),
                SwitchListTile(
                  value: _lactoseFree,
                  onChanged: (val) {
                    setState(() {
                      _lactoseFree = val;
                      SharedPreferences.getInstance().then(
                          (value) => value.setBool('lactose', _lactoseFree));
                    });
                  },
                  title: const Text("Lactose-free"),
                  subtitle: const Text("Only include lactose-free meals"),
                  activeColor: Theme.of(context).colorScheme.secondary,
                )
              ],
            ))
          ],
        ));
  }
}
