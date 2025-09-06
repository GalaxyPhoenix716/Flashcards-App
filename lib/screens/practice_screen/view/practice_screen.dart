import 'package:flashcards_app/models/card_set/card_set.dart';
import 'package:flashcards_app/screens/practice_screen/widgets/appbar.dart';
import 'package:flashcards_app/utils/colors.dart';
import 'package:flutter/material.dart';

class PracticeScreen extends StatefulWidget {
  final CardSet set;
  final VoidCallback onGoBack;
  const PracticeScreen({super.key, required this.set, required this.onGoBack});

  @override
  State<PracticeScreen> createState() => _PracticeScreenState();
}

class _PracticeScreenState extends State<PracticeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: FcColors.primary,
      appBar: FcAppbar(showBackArrow: true, title: widget.set.title, leadingOnPressed: widget.onGoBack,),
    );
  }
}
