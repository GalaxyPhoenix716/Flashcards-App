import 'package:flashcards_app/screens/category_screen/widgets/create_new_set_button.dart';
import 'package:flashcards_app/screens/category_screen/widgets/curved_edges.dart';
import 'package:flashcards_app/screens/category_screen/widgets/favourite_cards_button.dart';
import 'package:flashcards_app/utils/colors.dart';
import 'package:flashcards_app/widgets/animated_menu_icon.dart';
import 'package:flutter/material.dart';

class CategoryScreenUpperClip extends StatelessWidget {
  const CategoryScreenUpperClip({
    super.key,
    required AnimationController animationController,
    required this.noOfCards,
  }) : _animationController = animationController;

  final AnimationController _animationController;
  final int noOfCards;

  @override
  Widget build(BuildContext context) {
    return ClipPath(
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
                  style: TextStyle(fontSize: 32, color: FcColors.tertiary),
                ),
                Text(
                  'Pick a set to practice',
                  style: TextStyle(fontSize: 15, color: FcColors.tertiary),
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
    );
  }
}
