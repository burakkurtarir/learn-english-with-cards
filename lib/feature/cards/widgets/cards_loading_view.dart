part of '../view/cards_view.dart';

class CardsLoadingView extends StatelessWidget {
  const CardsLoadingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Lottie.asset(
          "assets/json/loading-cards.json",
          width: 280,
        ),
        const SizedBox(height: 16),
        Text(
          'Yeni kartlar yükleniyor',
          style: Theme.of(context).textTheme.headline5,
        ),
      ],
    );
  }
}
