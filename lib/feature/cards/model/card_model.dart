import 'dart:convert';

List<CardModel> cardsFromJson(String str) =>
    List<CardModel>.from(json.decode(str).map((x) => CardModel.fromJson(x)));

CardModel cardFromJson(String str) => CardModel.fromJson(json.decode(str));

class CardModel {
  final String word;
  final String translation;
  bool hasLearned;

  CardModel({
    required this.word,
    required this.translation,
    required this.hasLearned,
  });

  factory CardModel.fromJson(Map<String, dynamic> json) => CardModel(
        word: json["word"],
        translation: json["translation"],
        hasLearned: json["hasLearned"],
      );

  Map<String, dynamic> toJson() {
    return {
      "word": word,
      "translation": translation,
      "hasLearned": hasLearned,
    };
  }

  static final example = CardModel(
    word: "Calendar",
    translation: "Takvim",
    hasLearned: false,
  );
}
