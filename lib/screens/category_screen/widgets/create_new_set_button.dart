import 'package:flashcards_app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class CreateNewSetButton extends StatelessWidget {
  const CreateNewSetButton({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text("Create New Set"),
              content: Text("Functionality to create a new set goes here."),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text("Close"),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text("Add"),
                ),
              ],
            );
          },
        );
      },
      child: Container(
        height: 120,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: FcColors.tertiary,
          borderRadius: BorderRadius.circular(13),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Iconsax.add_circle5, color: FcColors.secondary, size: 50),
            const SizedBox(height: 5),
            Text("New Set", style: TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
