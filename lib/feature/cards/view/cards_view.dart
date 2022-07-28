import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:learn_english_with_cards/feature/cards/viewmodel/cards_view_model.dart';
import 'package:learn_english_with_cards/feature/cards/widgets/word_card.dart';
import 'package:lottie/lottie.dart';

part '../widgets/cards_loading_view.dart';
part '../widgets/get_new_cards_view.dart';

class CardsView extends StatefulWidget {
  const CardsView({Key? key}) : super(key: key);

  @override
  State<CardsView> createState() => _CardsViewState();
}

class _CardsViewState extends State<CardsView> {
  late CardsViewModel viewModel;
  // var cards = List.filled(10, CardModel.example);

  @override
  void initState() {
    super.initState();

    viewModel = CardsViewModel(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kartlarla Öğren'),
        backgroundColor: Colors.black,
        actions: [
          IconButton(
            onPressed: viewModel.navigateToProfile,
            icon: const Icon(Icons.person),
          ),
        ],
      ),
      body: Container(
        // color: const Color(0xffDDDDDD),
        // width: MediaQuery.of(context).size.width,
        // height: MediaQuery.of(context).size.height,
        child: Stack(
          fit: StackFit.expand,
          alignment: AlignmentDirectional.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                'Bildiğiz kelimeleri sağ tarafa, bilmediğiniz kelimeleri sol tarafa kaydırınız.\nKelimenin çevirisini öğrenmek için kartın üzerine tıklayabilirsiniz.',
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            Observer(builder: (context) {
              switch (viewModel.state) {
                case CardState.loading:
                  return const CardsLoadingView().positioned(bottom: 60);
                case CardState.endOfList:
                  return GetNewCardsView(onPressed: viewModel.getNewCards)
                      .positioned(bottom: 60);
                case CardState.completed:
                  return Stack(
                    alignment: AlignmentDirectional.bottomCenter,
                    children: List.generate(viewModel.cards.length, (index) {
                      return WordCard(
                        onSwipedLeft: viewModel.removeUnlearnedCard,
                        onSwipedRight: viewModel.removeLearnedCard,
                        card: viewModel.cards[index],
                      )
                          .cardIgnored(index, viewModel.cards.length)
                          .cardStacked(index, viewModel.cards.length);
                    }),
                  );
                default:
                  return Container();
              }
            }),
          ],
        ),
      ),
    );
  }
}

extension on Widget {
  Positioned cardStacked(int position, int total) {
    var offset = total - position;
    double extraHeight = total * 12;
    return Positioned(
      bottom: offset * -10 + extraHeight,
      child: this,
    );
  }

  IgnorePointer cardIgnored(int index, int total) {
    var ignoring = index != total - 1;
    return IgnorePointer(
      ignoring: ignoring,
      child: this,
    );
  }

  Positioned positioned({
    double? left,
    double? top,
    double? right,
    double? bottom,
  }) {
    return Positioned(
      left: left,
      top: top,
      right: right,
      bottom: bottom,
      child: this,
    );
  }
}
