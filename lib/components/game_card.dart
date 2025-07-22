import 'package:flutter/material.dart';
import 'package:memory_game/models/memory_card.dart';

class GameCard extends StatelessWidget {
  const GameCard({super.key, required this.card});

  final MemoryCard card;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(8.0)),
      child: IconButton(
        onPressed: () {},
        icon: card.icon,
        color: Colors.white,
        style: ButtonStyle(backgroundColor: WidgetStatePropertyAll(card.color)),
      ),
    );
  }
}
