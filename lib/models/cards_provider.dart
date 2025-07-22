import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:memory_game/models/memory_card.dart';
import 'package:memory_game/utils/game_utils.dart';

class CardsProvider {
  final List<IconData> iconsList = GameUtils().iconsList;

  final List<Color> colorsList = GameUtils().colorsList;

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

  List<MemoryCard> createGameCards() {
    List<MemoryCard> list = [];

    for (var i = 0; i < 8; i++) {
      // Escolhe ícone e cor
      IconData icon = getRandomIcon();
      Color color = getRandomColor();

      // Cria carta com o ícone e cor escolhidos
      MemoryCard card = MemoryCard(
        id: Random().nextDouble().toString(),
        icon: Icon(icon),
        color: color,
      );

      // Adiciona na lista
      list.add(card);

      // Remove o ícone e a cor para não repetir
      iconsList.remove(icon);
      colorsList.remove(color);
    }

    return list;
  }

  List<MemoryCard> DuplicateAndShuffleList(List<MemoryCard> list) {
    List<MemoryCard> duplicatedList = [...list, ...list.map((card) => MemoryCard(
          id: card.id,
          icon: card.icon,
          color: card.color,
        )),];
    duplicatedList.shuffle(Random());
    return duplicatedList;
  }
}
