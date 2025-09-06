import 'package:flashcards_app/models/flashcard/flashcard.dart';
import 'package:flashcards_app/screens/edit_set_screen/widgets/delete_flashcard_dialog.dart';
import 'package:flashcards_app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class FlashcardListTile extends StatelessWidget {
  final Flashcard flashcard;
  final int setIndex;
  final int cardIndex;
  final VoidCallback? onCardDeleted;
  const FlashcardListTile({
    super.key,
    required this.flashcard,
    required this.setIndex,
    required this.cardIndex,
    this.onCardDeleted,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: FcColors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  flashcard.question,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  flashcard.answer,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontSize: 14, color: Colors.black),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return DeleteFlashcardDialog(
                          setIndex: setIndex,
                          cardIndex: cardIndex,
                          onCardDeleted: onCardDeleted,
                        );
                      },
                    );
                  },
                  icon: const Icon(Iconsax.trash, color: Colors.red, size: 20),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Iconsax.edit,
                    color: FcColors.primary,
                    size: 20,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
