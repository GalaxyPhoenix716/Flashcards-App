import 'package:flashcards_app/models/card_set/card_set.dart';
import 'package:flashcards_app/screens/practice_screen/widgets/appbar.dart';
import 'package:flashcards_app/screens/practice_screen/widgets/flashcard_widget.dart';
import 'package:flashcards_app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class PracticeScreen extends StatefulWidget {
  final CardSet set;
  final VoidCallback onGoBack;
  const PracticeScreen({super.key, required this.set, required this.onGoBack});

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
              percent: cardsShown / widget.set.noOfCards,
              backgroundColor: FcColors.white,
              progressColor: FcColors.progressColor,
              barRadius: const Radius.circular(10),
            ),
            // const SizedBox(height: 40),
            FlashcardStack(cards: widget.set.flashcards),
            // Column(
            //   children: (widget.set.noOfCards == 0)
            //       ? [
            //           Center(
            //             child: const Text(
            //               "No cards in this set",
            //               style: TextStyle(
            //                 fontSize: 22,
            //                 fontWeight: FontWeight.w500,
            //                 color: FcColors.white,
            //               ),
            //             ),
            //           ),
            //         ]
            //       : (widget.set.noOfCards == 1)
            //       ? [
            //           const SizedBox(height: 40),
            //           FlashcardWidget(card: widget.set.flashcards[0]),
            //         ]
            //       : (widget.set.noOfCards == 2)
            //       ? [
            //           const Text(
            //             "Practice in progress",
            //             style: TextStyle(
            //               fontSize: 22,
            //               fontWeight: FontWeight.w500,
            //               color: FcColors.white,
            //             ),
            //           ),
            //         ]
            //       : [],
            // ),
          ],
        ),
      ),
    );
  }
}
