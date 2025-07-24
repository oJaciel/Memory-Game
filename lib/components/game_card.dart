import 'package:flutter/material.dart';
import 'package:memory_game/models/game_provider.dart';
import 'package:memory_game/models/memory_card.dart';
import 'package:provider/provider.dart';

class GameCard extends StatefulWidget {
  const GameCard({super.key, required this.card});

  final MemoryCard card;

  @override
  State<GameCard> createState() => _GameCardState();
}

class _GameCardState extends State<GameCard> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<GameProvider>(context);

    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(8.0)),
      child: IconButton(
        onPressed: () {
          widget.card.isMatched ? null : provider.selectCard(widget.card, context);
        },
        icon: widget.card.isFaceUp || widget.card.isMatched
            ? widget.card.icon
            : Icon(Icons.help_outline_sharp),
        color: Colors.white,
        style: ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(
            widget.card.isFaceUp || widget.card.isMatched
                ? widget.card.color
                : Colors.black,
          ),
        ),
      ),
    );
  }
}
