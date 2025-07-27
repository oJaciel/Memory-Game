import 'package:flutter/material.dart';
import 'package:memory_game/models/cards_provider.dart';
import 'package:memory_game/utils/app_routes.dart';
import 'package:provider/provider.dart';

class DifficultyButton extends StatelessWidget {
  const DifficultyButton({
    super.key,
    required this.label,
    required this.icon,
    required this.cardsQuantity,
  });

  final String label;
  final IconData icon;
  final int cardsQuantity;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 250,
      child: ElevatedButton.icon(
        label: Text(label, style: TextStyle(fontSize: 16, color: Theme.of(context).colorScheme.onSecondary)),
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 24),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          backgroundColor: Theme.of(context).colorScheme.secondary,
          foregroundColor: Theme.of(context).colorScheme.onSecondary,
        ),
        icon: Icon(icon, size: 32, color: Theme.of(context).colorScheme.onSecondary,),
        onPressed: () {
          Provider.of<CardsProvider>(
            context,
            listen: false,
          ).setCardsQuantity(cardsQuantity);
          Navigator.of(context).pop();
          Navigator.of(context).pushNamed(AppRoutes.GAME_PAGE);
        },
      ),
    );
  }
}
