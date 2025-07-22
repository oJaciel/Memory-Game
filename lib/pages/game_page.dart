import 'package:flutter/material.dart';
import 'package:memory_game/components/game_card.dart';
import 'package:memory_game/models/cards_provider.dart';
import 'package:memory_game/models/memory_card.dart';

class GamePage extends StatefulWidget {
  const GamePage({super.key});

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  List<MemoryCard> cardList = [];
  late List<MemoryCard> doubleList = CardsProvider().DuplicateAndShuffleList(
    cardList,
  );

  @override
  void initState() {
    super.initState();
    cardList = CardsProvider().createGameCards();
  }

  @override
  Widget build(BuildContext context) {
    

    return Scaffold(
      appBar: AppBar(title: Text('Jogo da Memória')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          itemCount: doubleList.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4, // 4 colunas
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
          ),
          itemBuilder: (ctx, i) => GameCard(card: doubleList[i]),
        ),
      ),
    );
  }
}
