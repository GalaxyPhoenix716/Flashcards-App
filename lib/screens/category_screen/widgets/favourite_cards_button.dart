import 'package:flashcards_app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class FavouriteCardsButton extends StatelessWidget {
  const FavouriteCardsButton({
    super.key,
    required this.noOfCards,
  });

  final int noOfCards;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        height: 120,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: FcColors.tertiary,
          borderRadius: BorderRadius.circular(13),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              Iconsax.star1,
              color: FcColors.secondary,
              size: 45,
            ),
            const SizedBox(height: 10),
            Text(
              "My Favourites",
              style: TextStyle(fontSize: 16),
            ),
            Text(
              "$noOfCards cards",
              style: TextStyle(
                fontSize: 12,
                color: Colors.black.withValues(alpha: 0.4),
              ),
            ),
          ],
        ),
      ),
    );
  }
}