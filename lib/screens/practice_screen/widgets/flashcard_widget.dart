import 'package:flashcards_app/models/flashcard/flashcard.dart';
import 'package:flashcards_app/cruds/hive_cruds.dart';
import 'package:flashcards_app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:flip_card/flip_card.dart';
import 'package:iconsax/iconsax.dart';

class FlashcardStack extends StatefulWidget {
  final List<Flashcard> cards;
  final int setIndex;
  final Function(int currentIndex)? onCardSwiped;
  final VoidCallback? onRestart;

  const FlashcardStack({
    super.key,
    required this.cards,
    required this.setIndex,
    this.onCardSwiped,
    this.onRestart,
  });

  @override
  State<FlashcardStack> createState() => _FlashcardStackState();
}

class _FlashcardStackState extends State<FlashcardStack> {
  bool finished = false;

  void _restart() {
    setState(() {
      finished = false;
    });
    if (widget.onRestart != null) {
      widget.onRestart!();
    }
  }

  @override
  Widget build(BuildContext context) {
    if (widget.cards.isEmpty) {
      return const Center(child: Text("No cards"));
    }

    if (finished) {
      return Center(
        child: Center(
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.5,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Cards Completed!\nRevise again?",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: FcColors.white,
                  ),
                ),
                const SizedBox(height: 20),
                IconButton(
                  icon: const Icon(
                    Icons.refresh,
                    color: FcColors.white,
                    size: 40,
                  ),
                  onPressed: _restart,
                ),
              ],
            ),
          ),
        ),
      );
    }

    final visible = widget.cards.length >= 3 ? 3 : widget.cards.length;

    return SizedBox(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.5,
      child: CardSwiper(
        cardsCount: widget.cards.length,
        numberOfCardsDisplayed: visible,
        isLoop: false,
        allowedSwipeDirection: const AllowedSwipeDirection.symmetric(
          horizontal: true,
          vertical: false,
        ),
        onSwipe: (previousIndex, currentIndex, direction) {
          if (widget.onCardSwiped != null && currentIndex != null) {
            widget.onCardSwiped!(currentIndex);
          }
          return true;
        },
        onEnd: () {
          setState(() {
            finished = true;
          });
          if (widget.onCardSwiped != null) {
            widget.onCardSwiped!(widget.cards.length);
          }
        },
        cardBuilder: (context, cardIndex, percentX, percentY) {
          return _FlashcardItem(
            card: widget.cards[cardIndex],
            setIndex: widget.setIndex,
            cardIndex: cardIndex,
          );
        },
      ),
    );
  }
}

class _FlashcardItem extends StatefulWidget {
  final Flashcard card;
  final int setIndex;
  final int cardIndex;

  const _FlashcardItem({
    required this.card,
    required this.setIndex,
    required this.cardIndex,
  });

  @override
  State<_FlashcardItem> createState() => _FlashcardItemState();
}

class _FlashcardItemState extends State<_FlashcardItem> {
  // Local state is no longer needed for starred/learned
  Future<void> _toggleStar() async {
    HapticFeedback.lightImpact();
    await FlashcardCruds.toggleCardFavouriteStatus(
      widget.setIndex,
      widget.cardIndex,
    );
    setState(() {}); // rebuild to reflect updated Hive value
  }

  Future<void> _toggleLearned() async {
    HapticFeedback.selectionClick();
    await FlashcardCruds.toggleCardCompletionStatus(
      widget.setIndex,
      widget.cardIndex,
    );
    setState(() {}); // rebuild to reflect updated Hive value
  }

  Widget _flashCardFace(String text, {required bool back}) {
    final starred = widget.card.isFavourite;
    final learned = widget.card.isCompleted;

    return Container(
      margin: const EdgeInsets.all(12),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: learned ? Colors.green.shade50 : Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 10),
        ],
      ),
      child: Stack(
        children: [
          // Star Icon
          Positioned(
            top: 4,
            right: 4,
            child: InkWell(
              onTap: _toggleStar,
              child: starred
                  ? const Icon(Iconsax.star1, color: Colors.orange, size: 30)
                  : const Icon(Iconsax.star, color: Colors.orange),
            ),
          ),

          // Question/Answer Text
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

          // Learned Check Icon
          Positioned(
            bottom: 8,
            right: 8,
            child: InkWell(
              onTap: _toggleLearned,
              borderRadius: BorderRadius.circular(30),
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: learned ? Colors.green : Colors.grey.shade300,
                ),
                child: const Icon(
                  Icons.check,
                  color: Colors.white,
                  size: 15,
                  weight: 3,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FlipCard(
      direction: FlipDirection.HORIZONTAL,
      front: _flashCardFace(widget.card.question, back: false),
      back: _flashCardFace(widget.card.answer, back: true),
    );
  }
}
