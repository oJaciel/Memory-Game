import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:memory_game/models/memory_card.dart';
import 'package:memory_game/utils/game_utils.dart';

class GameProvider {
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
      list.add(createCard());
    }
    return list;
  }

  List<MemoryCard> DuplicateAndShuffleList(List<MemoryCard> list) {
    List<MemoryCard> duplicatedList = [...list, ...list];
    duplicatedList.shuffle(Random());
    return duplicatedList;
  }
}
