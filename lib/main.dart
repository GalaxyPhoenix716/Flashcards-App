import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:flashcards_app/models/card_set/card_set.dart';
import 'package:flashcards_app/models/flashcard/flashcard.dart';
import 'package:flashcards_app/widgets/navigation_menu.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // var directory = await getApplicationDocumentsDirectory();
  await Hive.initFlutter();

  Hive.registerAdapter(FlashcardAdapter());
  Hive.registerAdapter(CardSetAdapter());

  if (!Hive.isBoxOpen('cardSets')) {
    await Hive.openBox<CardSet>('cardSets');
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FlashCards App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: NavigationMenu(),
    );
  }
}
