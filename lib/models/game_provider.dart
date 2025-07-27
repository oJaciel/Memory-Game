import 'package:flutter/material.dart';
import 'package:memory_game/models/cards_provider.dart';
import 'package:memory_game/models/memory_card.dart';
import 'package:provider/provider.dart';

class GameProvider with ChangeNotifier {
  int pointsCounter = 0;
  MemoryCard? selectedCard1;
  MemoryCard? selectedCard2;
  List<MemoryCard> cardList = [];

  void selectCard(MemoryCard card) {
    card.isFaceUp = true;
    //Se carta 1 é nula, atribui valor a ela
    if (selectedCard1 == null) {
      selectedCard1 = card;
    } else {
      //Se não é, atribui valor a carta 2 e checa
      selectedCard2 = card;
      Future.delayed(Duration(milliseconds: 800), () {
        checkCards();
      });
    }
    notifyListeners();
  }

  void checkCards() {
    //Se ambas as cartas existirem, checa
    if (selectedCard1 != null && selectedCard2 != null) {
      //Se id forem iguais, aumenta ponto
      if (selectedCard1!.id == selectedCard2!.id) {
        selectedCard1!.isMatched = true;
        selectedCard2!.isMatched = true;
        pointsCounter++;
        notifyListeners();
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

  void startGame(BuildContext context) {
    final cardsProvider = Provider.of<CardsProvider>(context, listen: false);
    List<MemoryCard> initialList = cardsProvider.createGameCards();
    cardList = CardsProvider().DuplicateAndShuffleList(initialList);
    selectedCard1 = null;
    selectedCard2 = null;
    pointsCounter = 0;

    cardList.forEach((item) => item.isFaceUp = true);

    notifyListeners();

    Future.delayed(Duration(seconds: 1, milliseconds: 500), () {
      cardList.forEach((item) => item.isFaceUp = false);
      notifyListeners();
    });
  }
}
