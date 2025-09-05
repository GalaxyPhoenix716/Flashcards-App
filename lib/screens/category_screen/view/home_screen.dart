import 'package:flashcards_app/widgets/animated_menu_icon.dart';
import 'package:flutter/material.dart';
import 'package:flashcards_app/screens/category_screen/widgets/create_new_set_button.dart';
import 'package:flashcards_app/screens/category_screen/widgets/curved_edges.dart';
import 'package:flashcards_app/screens/category_screen/widgets/favourite_cards_button.dart';
import 'package:flashcards_app/utils/colors.dart';
import 'package:percent_indicator/flutter_percent_indicator.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
  }

  @override
  Widget build(BuildContext context) {
    int noOfCards = 10;
    return Scaffold(
      backgroundColor: FcColors.white,
      body: Column(
        children: [
          ClipPath(
            clipper: FcCurvedEdges(),
            child: Container(
              color: FcColors.primary,
              padding: const EdgeInsets.only(
                left: 20,
                right: 20,
                bottom: 45,
                top: 10,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AnimatedMenuIcon(
                        color: FcColors.white,
                        isOpen: false,
                        animationController: _animationController,
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: FcColors.primaryAccent,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Text('English'),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Categories',
                        style: TextStyle(
                          fontSize: 32,
                          color: FcColors.tertiary,
                        ),
                      ),
                      Text(
                        'Pick a set to practice',
                        style: TextStyle(
                          fontSize: 15,
                          color: FcColors.tertiary,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: FavouriteCardsButton(noOfCards: noOfCards),
                      ),
                      const SizedBox(width: 13),
                      Expanded(flex: 1, child: CreateNewSetButton()),
                    ],
                  ),
                ],
              ),
            ),
          ),

          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: ListView.builder(
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: FcColors.white,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.15),
                          blurRadius: 10,
                          offset: const Offset(0, 5),
                        ),
                      ],
                    ),
                    child: Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(25),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: Text(
                                      "Nouns",
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  LinearPercentIndicator(
                                    animation: true,
                                    animationDuration: 500,
                                    width: 140,
                                    lineHeight: 8,
                                    percent: 0.7,
                                    backgroundColor: FcColors.grey,
                                    progressColor: FcColors.progress,
                                    barRadius: Radius.circular(5),
                                  ),
                                ],
                              ),
                          
                              Column(
                                children: [
                                  const SizedBox(height: 15),
                                  FittedBox(
                                    child: Text(
                                      "15/150",
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),

                        Positioned(
                          top: -5,
                          right: -5,
                          child: IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.more_vert, color: FcColors.grey),
                          ),
                        ),
                      ],
                    ),
                  );
                },
                itemCount: 10,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
