import 'package:flashcards_app/cruds/hive_cruds.dart';
import 'package:flutter/material.dart';

class DeleteFlashcardDialog extends StatelessWidget {
  final int setIndex;
  final int cardIndex;
  final VoidCallback? onCardDeleted;
  const DeleteFlashcardDialog({
    super.key,
    required this.setIndex,
    required this.cardIndex,
    this.onCardDeleted,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Delete Flashcard"),
      content: const Text("Are you sure you want to delete this flashcard?"),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text("Cancel"),
        ),
        TextButton(
          onPressed: () async {
            await FlashcardCruds.deleteCard(setIndex, cardIndex);
            if (onCardDeleted != null) onCardDeleted!();
            Navigator.of(context).pop();
          },
          child: const Text("Delete", style: TextStyle(color: Colors.red)),
        ),
      ],
    );
  }
}
