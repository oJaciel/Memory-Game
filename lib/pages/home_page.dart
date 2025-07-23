import 'package:flutter/material.dart';
import 'package:memory_game/utils/app_routes.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: Colors.deepPurple.shade50,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Card(
            elevation: 10,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
            ),
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 60,
                horizontal: 36,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Jogo da Memória',
                    style: theme.textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.deepPurple,
                      fontSize: 36,
                    ),
                  ),

                  SizedBox(
                    height: 120,
                    width: 120,
                    child: Stack(
                      children: [
                        Positioned(
                          left: 20,
                          top: 20,
                          child: Icon(
                            Icons.extension,
                            size: 80,
                            color: Colors.deepPurple,
                          ),
                        ),
                        Positioned(
                          right: 0,
                          bottom: 0,
                          child: Icon(
                            Icons.extension_outlined,
                            size: 80,
                            color: Colors.amber.shade800,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 32),
                  IconButton(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 40,
                        vertical: 12,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      backgroundColor: Colors.deepPurple,
                      foregroundColor: Colors.white,
                    ),
                    onPressed: () {
                      Navigator.of(context).pushNamed(AppRoutes.GAME_PAGE);
                    },
                    icon: const Icon(Icons.play_arrow_outlined),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
