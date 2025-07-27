import 'package:flutter/material.dart';
import 'package:memory_game/components/game_card.dart';
import 'package:memory_game/components/result_dialog.dart';
import 'package:memory_game/models/cards_provider.dart';
import 'package:memory_game/models/game_provider.dart';
import 'package:provider/provider.dart';

class GamePage extends StatefulWidget {
  const GamePage({super.key});

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<GameProvider>(context, listen: false).startGame(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    int setColumnQuantity() {
      final cardsQuantity = Provider.of<CardsProvider>(context).cardsQuantity;
      if (cardsQuantity! <= 3) {
        return 2;
      } else if (cardsQuantity <= 6) {
        return 3;
      } else if (cardsQuantity <= 8) {
        return 4;
      } else {
        return 4;
      }
    }

    double setAspectRatio() {
      final columnQuantity = setColumnQuantity();
      if (columnQuantity == 2) {
        return 4 / 3;
      } else if (columnQuantity == 3) {
        return 1 / 1;
      } else if (columnQuantity == 4) {
        return 3 / 4;
      }
      return 1;
    }

    final provider = Provider.of<GameProvider>(context);

    // Detectando vitória e mostra o diálogo
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final totalCards = Provider.of<CardsProvider>(
        context,
        listen: false,
      ).cardsQuantity;
      if (provider.pointsCounter == totalCards) {
        showDialog(context: context, builder: (_) => ResultDialog());
        provider.pointsCounter == 0;
      }
    });

    return Scaffold(
      appBar: AppBar(title: Text('Encontre os pares!')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Center(
            child: GridView.builder(
              shrinkWrap: true,
              itemCount: provider.cardList.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: setColumnQuantity(),
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
                childAspectRatio: setAspectRatio(),
              ),
              itemBuilder: (ctx, i) => GameCard(card: provider.cardList[i]),
            ),
          ),
        ),
      ),
    );
  }
}
