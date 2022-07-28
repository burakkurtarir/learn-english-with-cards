// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cards_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CardsViewModel on _CardsViewModelBase, Store {
  late final _$cardsAtom =
      Atom(name: '_CardsViewModelBase.cards', context: context);

  @override
  ObservableList<CardModel> get cards {
    _$cardsAtom.reportRead();
    return super.cards;
  }

  @override
  set cards(ObservableList<CardModel> value) {
    _$cardsAtom.reportWrite(value, super.cards, () {
      super.cards = value;
    });
  }

  late final _$stateAtom =
      Atom(name: '_CardsViewModelBase.state', context: context);

  @override
  CardState get state {
    _$stateAtom.reportRead();
    return super.state;
  }

  @override
  set state(CardState value) {
    _$stateAtom.reportWrite(value, super.state, () {
      super.state = value;
    });
  }

  late final _$getCardsAsyncAction =
      AsyncAction('_CardsViewModelBase.getCards', context: context);

  @override
  Future<void> getCards() {
    return _$getCardsAsyncAction.run(() => super.getCards());
  }

  late final _$removeLearnedCardAsyncAction =
      AsyncAction('_CardsViewModelBase.removeLearnedCard', context: context);

  @override
  Future<void> removeLearnedCard(CardModel card) {
    return _$removeLearnedCardAsyncAction
        .run(() => super.removeLearnedCard(card));
  }

  late final _$_CardsViewModelBaseActionController =
      ActionController(name: '_CardsViewModelBase', context: context);

  @override
  void removeUnlearnedCard(CardModel card) {
    final _$actionInfo = _$_CardsViewModelBaseActionController.startAction(
        name: '_CardsViewModelBase.removeUnlearnedCard');
    try {
      return super.removeUnlearnedCard(card);
    } finally {
      _$_CardsViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void checkEndOfList() {
    final _$actionInfo = _$_CardsViewModelBaseActionController.startAction(
        name: '_CardsViewModelBase.checkEndOfList');
    try {
      return super.checkEndOfList();
    } finally {
      _$_CardsViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void getNewCards() {
    final _$actionInfo = _$_CardsViewModelBaseActionController.startAction(
        name: '_CardsViewModelBase.getNewCards');
    try {
      return super.getNewCards();
    } finally {
      _$_CardsViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
cards: ${cards},
state: ${state}
    ''';
  }
}
