import 'package:flashcards_app/models/flashcard/flashcard.dart';
import 'package:flashcards_app/cruds/hive_cruds.dart'; // for toggleCardFavouriteStatus
import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:flip_card/flip_card.dart';
import 'package:iconsax/iconsax.dart';

class FlashcardStack extends StatelessWidget {
  final List<Flashcard> cards;
  final int setIndex;

  const FlashcardStack({
    super.key,
    required this.cards,
    required this.setIndex,
  });

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
        numberOfCardsDisplayed: visible,
        isLoop: false,
        allowedSwipeDirection: const AllowedSwipeDirection.symmetric(
          horizontal: true,
          vertical: false,
        ),
        onSwipe: (previousIndex, currentIndex, direction) => true,
        cardBuilder: (context, cardIndex, percentX, percentY) {
          return _FlashcardItem(
            card: cards[cardIndex],
            setIndex: setIndex,
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
  late bool starred;
  late bool learned;

  @override
  void initState() {
    super.initState();
    starred = widget.card.isFavourite;
    learned = widget.card.isCompleted;
  }

  Future<void> _toggleStar() async {
    await FlashcardCruds.toggleCardFavouriteStatus(
      widget.setIndex,
      widget.cardIndex,
    );
    setState(() {
      starred = !starred;
    });
  }

  Future<void> _toggleLearned() async {
    await FlashcardCruds.toggleCardCompletionStatus(
      widget.setIndex,
      widget.cardIndex,
    );
    setState(() {
      learned = !learned;
    });
  }

  Widget _flashCardFace(String text, {required bool back}) {
    return Container(
      margin: const EdgeInsets.all(12),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: learned ? Colors.green.shade50 : Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(color: Colors.black.withValues(alpha: 0.1), blurRadius: 10),
        ],
      ),
      child: Stack(
        children: [
          Positioned(
            top: 4,
            right: 4,
            child: InkWell(
              onTap: _toggleStar,
              child: starred
                  ? Icon(Iconsax.star1, color: Colors.orange, size: 30)
                  : Icon(Iconsax.star, color: Colors.orange),
            ),
          ),

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
                child: Icon(Icons.check, color: Colors.white, size: 15, weight: 3,),
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
