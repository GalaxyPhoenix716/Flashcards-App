import 'package:flashcards_app/models/card_set/card_set.dart';
import 'package:flashcards_app/screens/edit_set_screen/widgets/edit_screen_upper_clip.dart';
import 'package:flashcards_app/utils/colors.dart';
import 'package:flutter/material.dart';

class EditSetScreen extends StatefulWidget {
  final CardSet set;
  const EditSetScreen({super.key, required this.set});

  @override
  State<EditSetScreen> createState() => _EditSetScreenState();
}

class _EditSetScreenState extends State<EditSetScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Edit Set", style: TextStyle(color: FcColors.white),),backgroundColor: FcColors.primary,foregroundColor: FcColors.white,),
      body: Column(
        children: [
          EditScreenUpperClip(set: widget.set,),
        ],
      ),
    );
  }
}