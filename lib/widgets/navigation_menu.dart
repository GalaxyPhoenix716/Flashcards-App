import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class NavigationMenu extends StatefulWidget {
  const NavigationMenu({super.key});

  @override
  State<NavigationMenu> createState() => _NavigationMenuState();
}

class _NavigationMenuState extends State<NavigationMenu> {
  final List<Widget> screens = [Container(color: Colors.blue,), Container(color: Colors.green,)];
  int currentScreen = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        elevation: 0,
        selectedIndex: currentScreen,
        onDestinationSelected: (index) {
          setState(() {
            currentScreen = index;
          });
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Iconsax.category),
            label: "Categories",
          ),
          NavigationDestination(
            icon: Icon(Iconsax.cards), 
            label: "Practice"
          ),
        ], 
      ),
      body: screens[currentScreen],
    );
  }
}
