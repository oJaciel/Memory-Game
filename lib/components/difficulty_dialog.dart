import 'package:flutter/material.dart';
import 'package:memory_game/components/difficulty_button.dart';

class DifficultyDialog extends StatelessWidget {
  const DifficultyDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Dialog(
      backgroundColor: Colors.deepPurple.shade50,
      child: Card(
        elevation: 10,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 40.0, horizontal: 24.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Selecione a dificuldade',
                style: theme.textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple,
                ),
              ),
              const SizedBox(height: 12),
              const SizedBox(height: 32),
              Column(spacing: 16, children: [
                DifficultyButton(label: 'Fácil (2 pares)', icon: Icons.mood, cardsQuantity: 2),
                DifficultyButton(label: 'Médio (4 pares)', icon: Icons.sentiment_neutral, cardsQuantity: 4),
                DifficultyButton(label: 'Difícil (8 pares)', icon: Icons.sentiment_very_dissatisfied_rounded, cardsQuantity: 8),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}