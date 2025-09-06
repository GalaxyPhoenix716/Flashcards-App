import 'package:flashcards_app/models/card_set/card_set.dart';
import 'package:flashcards_app/screens/practice_screen/widgets/appbar.dart';
import 'package:flashcards_app/screens/practice_screen/widgets/flashcard_widget.dart';
import 'package:flashcards_app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class PracticeScreen extends StatefulWidget {
  final CardSet set;
  final int setIndex;
  final VoidCallback onGoBack;
  const PracticeScreen({
    super.key,
    required this.set,
    required this.onGoBack,
    required this.setIndex,
  });

  @override
  State<PracticeScreen> createState() => _PracticeScreenState();
}

class _PracticeScreenState extends State<PracticeScreen> {
  int cardsShown = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: FcColors.primary,
      appBar: FcAppbar(
        showBackArrow: true,
        title: widget.set.title,
        leadingOnPressed: widget.onGoBack,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Align(
                    alignment: AlignmentGeometry.centerRight,
                    child: Text(
                      "$cardsShown/${widget.set.noOfCards}",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color: FcColors.white,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 5),
                LinearPercentIndicator(
                  lineHeight: 7,
                  percent: widget.set.noOfCards == 0
                      ? 0
                      : cardsShown / widget.set.noOfCards,
                  backgroundColor: FcColors.white,
                  progressColor: FcColors.progressColor,
                  barRadius: const Radius.circular(10),
                ),

                const SizedBox(height: 20),

                FlashcardStack(
                  cards: widget.set.flashcards,
                  setIndex: widget.setIndex,
                  onCardSwiped: (shown) {
                    setState(() {
                      cardsShown = shown;
                    });
                  },
                  onRestart: () {
                    setState(() {
                      cardsShown = 0;
                    });
                  },
                ),
              ],
            ),

            Center(
              child: Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  color: FcColors.secondary,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Icon(Iconsax.eye, color: FcColors.white, size: 30),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
