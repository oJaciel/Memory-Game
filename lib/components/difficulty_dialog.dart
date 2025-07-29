import 'package:flutter/material.dart';
import 'package:memory_game/components/difficulty_button.dart';

class DifficultyDialog extends StatelessWidget {
  const DifficultyDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Dialog(
      backgroundColor: Theme.of(context).colorScheme.surface,
      child: Card(
        elevation: 10,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        color: Theme.of(context).colorScheme.onSurface,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 40.0, horizontal: 24.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Selecione a dificuldade',
                textAlign: TextAlign.center,
                style: theme.textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              const SizedBox(height: 32),
              Column(
                spacing: 16,
                children: [
                  DifficultyButton(
                    label: 'Fácil (3 pares)',
                    icon: Icons.mood,
                    cardsQuantity: 3,
                  ),
                  DifficultyButton(
                    label: 'Médio (6 pares)',
                    icon: Icons.sentiment_neutral,
                    cardsQuantity: 6,
                  ),
                  DifficultyButton(
                    label: 'Difícil (8 pares)',
                    icon: Icons.sentiment_very_dissatisfied_rounded,
                    cardsQuantity: 8,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
