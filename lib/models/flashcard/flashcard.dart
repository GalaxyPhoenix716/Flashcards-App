import 'package:hive/hive.dart';
part 'flashcard.g.dart';

@HiveType(typeId: 0)
class Flashcard extends HiveObject {
  @HiveField(0)
  String question;

  @HiveField(1)
  String answer;

  @HiveField(2)
  bool isCompleted;

  @HiveField(3)
  bool isFavourite;

  Flashcard({
    required this.question,
    required this.answer,
    required this.isCompleted,
    required this.isFavourite,
  });
}
