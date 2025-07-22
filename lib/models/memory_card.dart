import 'package:flutter/material.dart';

class MemoryCard {
  String id;
  Icon icon;
  Color color;
  bool isFaceUp;
  bool isMatched;

  MemoryCard({
    required this.id,
    required this.icon,
    required this.color,
    this.isFaceUp = false,
    this.isMatched = false,
  });
}
