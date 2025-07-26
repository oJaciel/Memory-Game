import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:memory_game/models/memory_card.dart';
import 'package:memory_game/utils/game_utils.dart';

class CardsProvider with ChangeNotifier {
  final List<IconData> iconsList = GameUtils().iconsList;

  final List<Color> colorsList = GameUtils().colorsList;
  int? cardsQuantity;

  IconData getRandomIcon() {
    return iconsList[Random().nextInt(iconsList.length)];
  }

  Color getRandomColor() {
    return colorsList[Random().nextInt(colorsList.length)];
  }

  MemoryCard createCard() {
    return MemoryCard(
      id: Random().nextDouble().toString(),
      icon: Icon(getRandomIcon()),
      color: getRandomColor(),
    );
  }

  void setCardsQuantity(int quantity) {
    cardsQuantity = quantity;
    notifyListeners();
  }

  List<MemoryCard> createGameCards() {
    List<MemoryCard> list = [];
    List<IconData> tempIcons = List.from(iconsList);
    List<Color> tempColors = List.from(colorsList);

    for (var i = 0; i < cardsQuantity!; i++) {
      IconData icon = tempIcons.removeAt(Random().nextInt(tempIcons.length));
      Color color = tempColors.removeAt(Random().nextInt(tempColors.length));

      MemoryCard card = MemoryCard(
        id: Random().nextDouble().toString(),
        icon: Icon(icon),
        color: color,
      );

      list.add(card);
    }
    return list;
  }

  List<MemoryCard> DuplicateAndShuffleList(List<MemoryCard> list) {
    List<MemoryCard> duplicatedList = [
      ...list,
      ...list.map(
        (card) => MemoryCard(id: card.id, icon: card.icon, color: card.color),
      ),
    ];
    duplicatedList.shuffle(Random());
    return duplicatedList;
  }
}
