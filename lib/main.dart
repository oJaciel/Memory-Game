import 'package:flutter/material.dart';
import 'package:memory_game/models/game_provider.dart';
import 'package:memory_game/pages/game_page.dart';
import 'package:memory_game/pages/home_page.dart';
import 'package:memory_game/utils/app_routes.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => GameProvider())],
      child: MaterialApp(
        title: 'Memory Game',
        debugShowCheckedModeBanner: false,
        routes: {
          AppRoutes.HOME_PAGE: (ctx) => HomePage(),
          AppRoutes.GAME_PAGE: (ctx) => GamePage(),
        },
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        home: HomePage(),
      ),
    );
  }
}
