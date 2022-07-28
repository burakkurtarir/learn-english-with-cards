import 'package:flutter/services.dart';
import 'package:learn_english_with_cards/feature/cards/model/card_model.dart';

class CardsRepository {
  static final CardsRepository _instance = CardsRepository.init();

  factory CardsRepository() {
    return _instance;
  }

  CardsRepository.init() {
    // initialization logic
  }

  List<CardModel> cards = [];

  Future<List<CardModel>> getCards() async {
    final responseString =
        await rootBundle.loadString("assets/json/words.json");
    final response = cardsFromJson(responseString);
    cards = response;
    return cards;
  }

  void removeCard(CardModel card) {
    cards.remove(card);
  }
}
