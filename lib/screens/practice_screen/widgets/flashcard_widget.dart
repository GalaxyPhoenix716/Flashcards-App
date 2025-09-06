// import 'package:flashcards_app/models/flashcard/flashcard.dart';
// import 'package:flashcards_app/screens/practice_screen/view/practice_screen.dart';
// import 'package:flashcards_app/utils/colors.dart';
// import 'package:flutter/material.dart';
// import 'package:iconsax/iconsax.dart';

// class FlashcardWidget extends StatelessWidget {
//   final Flashcard card;
//   const FlashcardWidget({
//     super.key,
//     required this.card
//   });

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       width: double.infinity,
//       height: MediaQuery.of(context).size.height * 0.5,
//       child: Card(
//         color: FcColors.white,
//         child: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: SizedBox(
//             child: Stack(
//               children: [
//                 Align(
//                   alignment: Alignment.topRight,
//                   child: IconButton(
//                     onPressed: () {},
//                     icon: const Icon(
//                       Iconsax.star,
//                       color: FcColors.secondary,
//                       size: 30,
//                     ),
//                   ),
//                 ),
//                 Center(
//                   child: FittedBox(
//                     child: Text(
//                       card.question,
//                       style: const TextStyle(
//                         fontSize: 50,
//                         fontWeight: FontWeight.w500,
//                         color: Colors.black,
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flashcards_app/models/flashcard/flashcard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:flip_card/flip_card.dart';
import 'package:iconsax/iconsax.dart';

// Use this inside your PracticeScreen, passing the list of flashcards.
class FlashcardStack extends StatelessWidget {
  final List<Flashcard> cards; // your model

  const FlashcardStack({super.key, required this.cards});

  @override
  Widget build(BuildContext context) {
    if (cards.isEmpty) {
      return const Center(child: Text("No cards"));
    }

    final visible = cards.length >= 3 ? 3 : cards.length;

    return SizedBox(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.5,
      child: CardSwiper(
        cardsCount: cards.length,
        numberOfCardsDisplayed: visible, // shows the stack (up to 3)
        isLoop: false,
        allowedSwipeDirection: const AllowedSwipeDirection.symmetric(
          horizontal: true,
          vertical: false,
        ),
        onSwipe: (previousIndex, currentIndex, direction) {
          // return true to accept the swipe
          // you can update progress here if you want
          return true;
        },
        cardBuilder: (context, index, percentX, percentY) {
          final c = cards[index];
          return FlipCard(
            direction: FlipDirection.HORIZONTAL,
            front: _flashCardFace(text: c.question, starred: c.isFavourite),
            back: _flashCardFace(
              text: c.answer,
              starred: c.isFavourite,
              back: true,
            ),
          );
        },
      ),
    );
  }

  Widget _flashCardFace({
    required String text,
    bool starred = false,
    bool back = false,
  }) {
    return Container(
      margin: const EdgeInsets.all(12),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(color: Colors.black.withValues(alpha: 0.1), blurRadius: 10),
        ],
      ),
      child: Stack(
        children: [
          Center(
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w600,
                color: back ? Colors.deepPurple : Colors.black,
              ),
            ),
          ),
          Positioned(
            top: 4,
            right: 4,
            child: InkWell(
              onTap: () async { 
              },
              child: Icon(
                starred ? Iconsax.star1 : Iconsax.star,
                color: Colors.orange,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
