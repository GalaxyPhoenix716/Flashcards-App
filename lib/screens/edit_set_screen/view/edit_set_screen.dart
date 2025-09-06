import 'package:flashcards_app/cruds/hive_cruds.dart';
import 'package:flashcards_app/models/card_set/card_set.dart';
import 'package:flashcards_app/screens/edit_set_screen/widgets/edit_screen_upper_clip.dart';
import 'package:flashcards_app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

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
                  onPressed: () {},
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
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    widget.set.flashcards[cardIndex].question,
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black,
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  Text(
                                    widget.set.flashcards[cardIndex].answer,
                                    style: const TextStyle(
                                      fontSize: 14,
                                      color: Colors.black54,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      showDialog(
                                        context: context,
                                        builder: (context) {
                                          return AlertDialog(
                                            title: const Text(
                                              "Delete Flashcard",
                                            ),
                                            content: const Text(
                                              "Are you sure you want to delete this flashcard?",
                                            ),
                                            actions: [
                                              TextButton(
                                                onPressed: () {
                                                  Navigator.of(context).pop();
                                                },
                                                child: const Text("Cancel"),
                                              ),
                                              TextButton(
                                                onPressed: () {
                                                  setState(() async {
                                                    await FlashcardCruds.deleteCard(
                                                      widget.setIndex,
                                                      cardIndex,
                                                    );
                                                  });
                                                  Navigator.of(context).pop();
                                                },
                                                child: const Text(
                                                  "Delete",
                                                  style: TextStyle(
                                                    color: Colors.red,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          );
                                        },
                                      );
                                    },
                                    icon: const Icon(
                                      Iconsax.trash,
                                      color: Colors.red,
                                      size: 20,
                                    ),
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
                            ],
                          ),
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
