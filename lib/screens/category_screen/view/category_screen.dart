import 'package:flashcards_app/screens/category_screen/widgets/catergory_screen_upper_clip.dart';
import 'package:flutter/material.dart';
import 'package:flashcards_app/screens/category_screen/widgets/set_tile.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:flashcards_app/models/card_set/card_set.dart';
import 'package:flashcards_app/utils/colors.dart';

class CategoryScreen extends StatefulWidget {
  final void Function(CardSet) onGoToPractice;
  const CategoryScreen({super.key, required this.onGoToPractice});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
  }

  @override
  Widget build(BuildContext context) {
    int noOfCards = 10;
    return Scaffold(
      backgroundColor: FcColors.white,
      body: Column(
        children: [
          CategoryScreenUpperClip(
            animationController: _animationController,
            noOfCards: noOfCards,
          ),

          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: ValueListenableBuilder(
                valueListenable: Hive.box<CardSet>('cardSets').listenable(),
                builder: (context, Box<CardSet> box, child) {
                  if (box.isEmpty) {
                    return const Center(
                      child: Text(
                        "No Card Sets",
                        style: TextStyle(fontSize: 16, color: Colors.black),
                      ),
                    );
                  }

                  return ListView.builder(
                    itemCount: box.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      final set = box.getAt(index)!;
                      return SetTile(
                        set: set,
                        onGoToPractice: widget.onGoToPractice,
                      );
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
