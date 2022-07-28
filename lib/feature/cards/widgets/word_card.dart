import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:learn_english_with_cards/feature/cards/model/card_model.dart';

class WordCard extends StatefulWidget {
  final CardModel card;
  final Function(CardModel card)? onSwipedLeft;
  final Function(CardModel card)? onSwipedRight;

  const WordCard({
    Key? key,
    required this.card,
    this.onSwipedLeft,
    this.onSwipedRight,
  }) : super(key: key);

  @override
  State<WordCard> createState() => _WordCardState();
}

class _WordCardState extends State<WordCard> {
  var offset = Offset.zero;
  var angle = 0.0;
  var showTranslation = false;

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      key: widget.key,
      offset: offset,
      child: Transform.rotate(
        angle: math.pi * angle / 1440,
        child: GestureDetector(
          onTap: _onTap,
          onHorizontalDragUpdate: _onHorizontalDragUpdate,
          onHorizontalDragEnd: _onHorizontalDragEnd,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            width: 280,
            decoration: boxDecoration,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 40),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    widget.card.word,
                    style: Theme.of(context).textTheme.headline4,
                  ),
                  AnimatedOpacity(
                    opacity: showTranslation ? 1 : 0,
                    duration: const Duration(milliseconds: 200),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Text(
                        widget.card.translation,
                        style: Theme.of(context).textTheme.headline5,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _onTap() {
    setState(() {
      showTranslation = !showTranslation;
    });
  }

  void _onHorizontalDragEnd(details) {
    if (offset.dx > 50) {
      widget.onSwipedRight?.call(widget.card);
    } else if (offset.dx < -50) {
      widget.onSwipedLeft?.call(widget.card);
    } else {
      setState(() {
        offset = Offset.zero;
        angle = 0;
      });
    }
  }

  void _onHorizontalDragUpdate(details) {
    setState(() {
      offset += details.delta;
      angle += details.delta.dx;
    });
  }

  Color? get backgroundColor {
    if (offset.dx > 50) {
      return Colors.green;
    } else if (offset.dx < -50) {
      return Colors.red;
    } else {
      return Colors.grey[200];
    }
  }

  BoxDecoration get boxDecoration {
    return BoxDecoration(
      color: backgroundColor,
      borderRadius: BorderRadius.circular(12),
      boxShadow: const [
        BoxShadow(
          color: Colors.grey,
          offset: Offset(0, 0),
          blurRadius: 4,
          spreadRadius: 2,
        ),
      ],
    );
  }
}
