import 'package:hive/hive.dart';
import 'package:flashcards_app/models/flashcard/flashcard.dart';
part 'card_set.g.dart';

@HiveType(typeId: 1)
class CardSet extends HiveObject {
  @HiveField(0)
  String title;

  @HiveField(1)
  int noOfCards;

  @HiveField(2)
  int cardsCompleted;

  @HiveField(3)
  List<Flashcard> flashcards;

  CardSet({
    required this.title,
    required this.noOfCards,
    required this.cardsCompleted,
    required this.flashcards,
  });
}