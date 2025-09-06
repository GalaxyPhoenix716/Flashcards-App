import 'package:flashcards_app/models/card_set/card_set.dart';
import 'package:flashcards_app/screens/category_screen/view/category_screen.dart';
import 'package:flashcards_app/screens/practice_screen/view/practice_screen.dart';
import 'package:flashcards_app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class NavigationMenu extends StatefulWidget {
  const NavigationMenu({super.key});

  @override
  State<NavigationMenu> createState() => _NavigationMenuState();
}

class _NavigationMenuState extends State<NavigationMenu> {
  final PageController _pageController = PageController();
  int currentScreen = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void goToPractice(CardSet set) {
    _pageController.jumpToPage(1);
    setState(() {
      currentScreen = 1;
    });

    _screens[1] = PracticeScreen(set: set, onGoBack: goToCategories);
  }

  void goToCategories() {
    _pageController.jumpToPage(0);
    setState(() {
      currentScreen = 0;
      _screens[1] = const Center(child: Text("Pick a set to start practicing"));
    });
  }

  final List<Widget> _screens = [const SizedBox(), const SizedBox()];

  @override
  void initState() {
    super.initState();
    _screens[0] = CategoryScreen(onGoToPractice: goToPractice);
    _screens[1] = const Center(child: Text("Pick a set to start practicing"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: FcColors.primary,
      body: SafeArea(
        child: PageView(
          controller: _pageController,
          physics: const NeverScrollableScrollPhysics(),
          children: _screens,
        ),
      ),
      bottomNavigationBar: NavigationBar(
        height: 70,
        selectedIndex: currentScreen,
        onDestinationSelected: (index) {
          setState(() => currentScreen = index);
          _pageController.jumpToPage(index);
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
    );
  }
}
