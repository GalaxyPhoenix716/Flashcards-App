import 'package:flutter/material.dart';
import 'package:flashcards_app/models/card_set/card_set.dart';
import 'package:flashcards_app/utils/colors.dart';
import 'package:iconsax/iconsax.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class SetTile extends StatelessWidget {
  final CardSet set;
  final void Function(CardSet) onGoToPractice;
  const SetTile({super.key, required this.set, required this.onGoToPractice});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onGoToPractice(set),
      child: Container(
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
                          set.title,
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
                        percent: set.cardsCompleted / set.noOfCards,
                        backgroundColor: FcColors.progressGrey,
                        progressColor: FcColors.progressColor,
                        barRadius: Radius.circular(5),
                      ),
                    ],
                  ),

                  Column(
                    children: [
                      const SizedBox(height: 15),
                      FittedBox(
                        child: Text(
                          "${set.cardsCompleted}/${set.noOfCards}",
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
              top: 10,
              right: 25,
              child: InkWell(
                onTap: () {},
                child: Icon(
                  Iconsax.more,
                  weight: 2,
                  size: 25,
                  color: FcColors.progressGrey,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
