import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:memory_game/models/cards_provider.dart';
import 'package:memory_game/models/game_provider.dart';
import 'package:memory_game/pages/game_page.dart';
import 'package:memory_game/pages/home_page.dart';
import 'package:memory_game/utils/app_routes.dart';
import 'package:memory_game/utils/app_theme.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CardsProvider()),
        ChangeNotifierProvider(create: (_) => GameProvider()),
      ],
      child: MaterialApp(
        title: 'Memory Game',
        debugShowCheckedModeBanner: false,
        routes: {
          AppRoutes.HOME_PAGE: (ctx) => HomePage(),
          AppRoutes.GAME_PAGE: (ctx) => GamePage(),
        },
        theme: AppTheme().appTheme,
        home: HomePage(),
      ),
    );
  }
}
