import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import '../screens/filters_screen.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  Widget listTileBuilder(String title, IconData icon, tapHandler) {
    return ListTile(
      leading: Icon(icon),
      title: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 24,
        ),
      ),
      onTap: tapHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          SizedBox(
            height: 150,
            child: DrawerHeader(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondary,
              ),
              child: Text(
                'Cooking Up!',
                style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.w900,
                    fontSize: 36),
              ),
            ),
          ),
          listTileBuilder('Meals', MdiIcons.silverwareForkKnife, () {
            if (ModalRoute.of(context)!.settings.name == '/') {
              return;
            }
            Navigator.of(context).pushReplacementNamed('/');
          }),
          listTileBuilder('Filters', MdiIcons.cog, () {
            if (ModalRoute.of(context)!.settings.name ==
                FilterScreen.routeName) {
              return;
            }
            Navigator.pushReplacementNamed(context, FilterScreen.routeName);
          }),
        ],
      ),
    );
  }
}
