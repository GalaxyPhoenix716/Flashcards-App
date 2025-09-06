import 'package:flashcards_app/models/card_set/card_set.dart';
import 'package:flutter/material.dart';
import 'package:flashcards_app/screens/category_screen/widgets/curved_edges.dart';
import 'package:flashcards_app/utils/colors.dart';
import 'package:iconsax/iconsax.dart';

class EditScreenUpperClip extends StatelessWidget {
  final CardSet _set;
  const EditScreenUpperClip({super.key, required set}) : _set = set;

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: FcCurvedEdges(),
      child: Container(
        color: FcColors.primary,
        padding: const EdgeInsets.only(
          left: 20,
          right: 20,
          bottom: 45,
          top: 10,
        ),
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: FcColors.primaryAccent,
            borderRadius: BorderRadius.circular(15),
          ),
          width: double.infinity,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text(
                        _set.title,
                        style: TextStyle(
                          fontSize: 50,
                          fontWeight: FontWeight.w600,
                          color: FcColors.white,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Iconsax.box_1, color: FcColors.white, size: 25),
                      const SizedBox(width: 5),
                      Text(
                        "${_set.noOfCards} ${(_set.noOfCards == 1) ? "card" : "cards"}",
                        style: TextStyle(fontSize: 20, color: FcColors.white, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
