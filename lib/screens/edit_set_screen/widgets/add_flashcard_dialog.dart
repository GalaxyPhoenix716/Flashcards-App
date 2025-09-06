import 'package:flashcards_app/cruds/hive_cruds.dart';
import 'package:flashcards_app/models/flashcard/flashcard.dart';
import 'package:flashcards_app/utils/colors.dart';
import 'package:flashcards_app/widgets/fc_textfield.dart';
import 'package:flutter/material.dart';

class AddNewFlashcardDialog extends StatelessWidget {
  final int setIndex;
  final VoidCallback? onCardAdded;

  const AddNewFlashcardDialog({
    super.key,
    required this.setIndex,
    this.onCardAdded,
  });

  void _addNewFlashcard(String question, String answer) async {
    Flashcard newCard = Flashcard(question: question, answer: answer);

    await FlashcardCruds.addCard(setIndex, newCard);
  }

  @override
  Widget build(BuildContext context) {
    final cardQuestionController = TextEditingController();
    final cardAnswerController = TextEditingController();
    return AlertDialog(
      backgroundColor: FcColors.dialogBackground,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
        side: BorderSide(color: FcColors.dialogBorder, width: 3),
      ),
      title: const Text(
        "Add Flashcard",
        style: TextStyle(
          color: FcColors.dialogTitleColor,
          fontWeight: FontWeight.w600,
        ),
      ),
      content: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Question",
              style: TextStyle(
                color: FcColors.dialogTextColor,
                fontSize: 17,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 5),
            FcTextfield(
              controller: cardQuestionController,
              hintText: "Enter question...",
              keyboardType: TextInputType.text,
            ),

            const SizedBox(height: 15),

            const Text(
              "Answer",
              style: TextStyle(
                color: FcColors.dialogTextColor,
                fontSize: 17,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 5),
            FcTextfield(
              controller: cardAnswerController,
              hintText: "Enter answer...",
              keyboardType: TextInputType.text,
            ),
          ],
        ),
      ),
      actions: [
        Row(
          children: [
            Expanded(
              child: SizedBox(
                height: 50,
                child: OutlinedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: FcColors.dialogBorder),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    "Cancel",
                    style: TextStyle(color: FcColors.dialogBorder),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: SizedBox(
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: FcColors.dialogSelectedOutlineColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () {
                    if (cardQuestionController.text.isNotEmpty &&
                        cardAnswerController.text.isNotEmpty) {
                      _addNewFlashcard(
                        cardQuestionController.text.trim(),
                        cardAnswerController.text.trim(),
                      );

                      if (onCardAdded != null) onCardAdded!(); 

                      Navigator.of(context).pop();
                    }
                  },
                  child: const Text(
                    "Create",
                    style: TextStyle(color: FcColors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
