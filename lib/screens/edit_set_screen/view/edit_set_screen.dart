import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:flashcards_app/models/card_set/card_set.dart';
import 'package:flashcards_app/screens/edit_set_screen/widgets/add_flashcard_dialog.dart';
import 'package:flashcards_app/screens/edit_set_screen/widgets/edit_screen_upper_clip.dart';
import 'package:flashcards_app/screens/edit_set_screen/widgets/flashcard_tile.dart';
import 'package:flashcards_app/utils/colors.dart';

class EditSetScreen extends StatefulWidget {
  final CardSet set;
  final int setIndex;
  const EditSetScreen({super.key, required this.set, required this.setIndex});

  @override
  State<EditSetScreen> createState() => _EditSetScreenState();
}

class _EditSetScreenState extends State<EditSetScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: FcColors.white,
      appBar: AppBar(
        title: const Text("Edit Set", style: TextStyle(color: FcColors.white)),
        backgroundColor: FcColors.primary,
        foregroundColor: FcColors.white,
      ),
      body: Column(
        children: [
          EditScreenUpperClip(set: widget.set),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Cards",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),

                IconButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AddNewFlashcardDialog(
                          setIndex: widget.setIndex,
                          onCardAdded: () {
                            setState(() {});
                          },
                        );
                      },
                    );
                  },
                  icon: Icon(Iconsax.add, color: FcColors.secondary),
                  iconSize: 30,
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          (widget.set.flashcards.isEmpty)
              ? const Padding(
                  padding: EdgeInsets.all(20),
                  child: Text(
                    "No Flashcards",
                    style: TextStyle(fontSize: 16, color: Colors.black),
                  ),
                )
              : Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: ListView.builder(
                      itemCount: widget.set.noOfCards,
                      shrinkWrap: true,
                      itemBuilder: (context, cardIndex) {
                        return FlashcardListTile(
                          flashcard: widget.set.flashcards[cardIndex],
                          setIndex: widget.setIndex,
                          cardIndex: cardIndex,
                          onCardDeleted: () {
                            setState(() {});
                          },
                        );
                      },
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}
