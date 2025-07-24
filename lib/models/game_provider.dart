import 'package:flutter/material.dart';
import 'package:memory_game/models/memory_card.dart';
import 'package:memory_game/components/result_dialog.dart';

class GameProvider with ChangeNotifier {
  int pointsCounter = 0;
  MemoryCard? selectedCard1;
  MemoryCard? selectedCard2;

  void selectCard(MemoryCard card, BuildContext context) {
    card.isFaceUp = true;

    //Se carta 1 é nula, atribui valor a ela
    if (selectedCard1 == null) {
      selectedCard1 = card;
    } else {
      //Senão, atribui valor a carta 2 e checa
      selectedCard2 = card;
      Future.delayed(Duration(milliseconds: 800), () {
        checkCards(context);
      });
    }
    notifyListeners();
  }

  void checkCards(BuildContext context) {
    //Se ambas as cartas existirem, checa
    if (selectedCard1 != null && selectedCard2 != null) {
      //Se id forem iguais, aumenta ponto
      if (selectedCard1!.id == selectedCard2!.id) {
        selectedCard1!.isMatched = true;
        selectedCard2!.isMatched = true;
        pointsCounter++;
        notifyListeners();

        //Se acertar todas, mostra o dialog
        if (pointsCounter == 8) {
          showDialog(context: context, builder: (context) => ResultDialog());
          pointsCounter = 0;
        }
        //Senão, não faz nada
      } else {
        selectedCard1!.isFaceUp = false;
        selectedCard2!.isFaceUp = false;
      }

      //Reseta valores depois de checar
      selectedCard1 = null;
      selectedCard2 = null;
      notifyListeners();
    }
  }
}
