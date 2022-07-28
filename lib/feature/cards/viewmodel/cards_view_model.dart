import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../profile/view/profile_view.dart';
import '../model/card_model.dart';
import '../service/cards_repository.dart';

part 'cards_view_model.g.dart';

class CardsViewModel = _CardsViewModelBase with _$CardsViewModel;

abstract class _CardsViewModelBase with Store {
  @observable
  ObservableList<CardModel> cards = ObservableList();
  @observable
  CardState state = CardState.loading;
  final BuildContext buildContext;
  final CardsRepository cardRepository = CardsRepository.init();

  _CardsViewModelBase(this.buildContext) {
    getCards();
  }

  @action
  Future<void> getCards() async {
    state = CardState.loading;
    // Fake loading to show animation longer on screen
    await Future.delayed(const Duration(seconds: 3));
    final response = await cardRepository.getCards();
    cards = ObservableList.of(response);
    state = CardState.completed;
  }

  @action
  void removeUnlearnedCard(CardModel card) {
    card.hasLearned = false;
    cards.remove(card);
    cardRepository.removeCard(card);

    checkEndOfList();
  }

  @action
  Future<void> removeLearnedCard(CardModel card) async {
    card.hasLearned = true;
    cards.remove(card);
    cardRepository.removeCard(card);

    checkEndOfList();
  }

  @action
  void checkEndOfList() {
    if (cards.isEmpty) {
      state = CardState.endOfList;
    }
  }

  @action
  void getNewCards() {
    getCards();
  }

  void navigateToProfile() {
    Navigator.of(buildContext).push(
      MaterialPageRoute(builder: (ctx) => const ProfileView()),
    );
  }
}

enum CardState {
  loading,
  completed,
  endOfList,
}
