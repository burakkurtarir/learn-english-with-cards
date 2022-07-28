part of '../view/cards_view.dart';

class GetNewCardsView extends StatelessWidget {
  final VoidCallback onPressed;

  const GetNewCardsView({Key? key, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        textStyle: Theme.of(context).textTheme.headline5,
        primary: Colors.black,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      child: const Text('Yeni Kartları Yükle'),
    );
  }
}
