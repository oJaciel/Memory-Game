import 'package:flutter/material.dart';
import 'package:memory_game/models/game_provider.dart';
import 'package:memory_game/models/memory_card.dart';
import 'package:provider/provider.dart';

class GameCard extends StatelessWidget {
  const GameCard({super.key, required this.card});

  final MemoryCard card;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: Material(
        color: card.isFaceUp || card.isMatched ? card.color : Colors.black,
        borderRadius: BorderRadius.circular(10),
        child: InkWell(
          splashColor: card.color,
          borderRadius: BorderRadius.circular(10),
          onTap: card.isMatched
              ? null
              : () => Provider.of<GameProvider>(
                  context,
                  listen: false,
                ).selectCard(card),
          child: Center(
            child: Icon(
              card.isFaceUp || card.isMatched
                  ? card.icon.icon
                  : Icons.help_outline_rounded,
              color: Colors.white,
              size: 32,
            ),
          ),
        ),
      ),
    );
  }
}
