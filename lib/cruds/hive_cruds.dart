import 'package:flashcards_app/models/card_set/card_set.dart';
import 'package:flashcards_app/models/flashcard/flashcard.dart';
import 'package:hive/hive.dart';

class FlashcardCruds {
  static Future<void> createCardSet(CardSet newSet) async {
    var box = Hive.box<CardSet>('cardSets');
    await box.add(newSet);
  }

  static Future<void> addCard(int setIndex, Flashcard card) async {
    var box = Hive.box<CardSet>('cardSets');
    final set = box.getAt(setIndex);
    if (set != null) {
      set.flashcards.add(card);
      set.noOfCards = set.flashcards.length;
      await set.save();
    }
  }

  static List<CardSet> getAllCardSets() {
    var box = Hive.box<CardSet>('cardSets');
    return box.values.toList();
  }

  static Future<void> editCardSet(int setIndex, String newTitle) async {
    var box = Hive.box<CardSet>('cardSets');
    final set = box.getAt(setIndex);
    if (set != null) {
      set.title = newTitle;
      await set.save();
    }
  }

  static Future<void> toggleCardCompletionStatus(
    int setIndex,
    int cardIndex,
  ) async {
    var box = Hive.box<CardSet>('cardSets');
    final set = box.getAt(setIndex);
    if (set != null && cardIndex < set.flashcards.length) {
      final card = set.flashcards[cardIndex];
      card.isCompleted = !card.isCompleted;
      set.cardsCompleted = set.flashcards
          .where((card) => card.isCompleted)
          .length;
      await set.save();
    }
  }

  static Future<void> toggleCardFavouriteStatus(
    int setIndex,
    int cardIndex,
  ) async {
    var box = Hive.box<CardSet>('cardSets');
    final set = box.getAt(setIndex);
    if (set != null && cardIndex < set.flashcards.length) {
      final card = set.flashcards[cardIndex];
      card.isFavourite = !card.isFavourite;
      await set.save();
    }
  }

  static Future<void> editCard(
    int setIndex,
    int cardIndex,
    Flashcard newFlashcard,
  ) async {
    var box = Hive.box<CardSet>('cardSets');
    final set = box.getAt(setIndex);
    if (set != null && cardIndex < set.flashcards.length) {
      set.flashcards[cardIndex] = newFlashcard;
      await set.save();
    }
  }

  static Future<void> deleteCardSet(int setIndex) async {
    var box = Hive.box<CardSet>('cardSets');
    await box.deleteAt(setIndex);
  }

  static Future<void> deleteCard(int setIndex, int cardIndex) async {
    var box = Hive.box<CardSet>('cardSets');
    final set = box.getAt(setIndex);
    if (set != null && cardIndex < set.flashcards.length) {
      set.flashcards.removeAt(cardIndex);
      set.noOfCards = set.flashcards.length;
      set.cardsCompleted = set.flashcards
          .where((card) => card.isCompleted)
          .length;
      await set.save();
    }
  }
}
