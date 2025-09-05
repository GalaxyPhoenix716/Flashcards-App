import 'package:flashcards_app/screens/category_screen/view/category_screen.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class NavigationMenu extends StatefulWidget {
  const NavigationMenu({super.key});

  @override
  State<NavigationMenu> createState() => _NavigationMenuState();
}

class _NavigationMenuState extends State<NavigationMenu> {
  final List<Widget> screens = [
    CategoryScreen(),
    Container(color: Colors.green),
  ];
  int currentScreen = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        height: 70,
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
            icon: Icon(Iconsax.menu_board),
            label: "Practice",
          ),
        ],
      ),
      body: SafeArea(child: screens[currentScreen]),
    );
  }
}
