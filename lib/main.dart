import 'package:flutter/material.dart';
import 'package:learn_flowers/pages/main_navigation_page.dart';
import 'package:learn_flowers/providers/favorites_provider.dart';
import 'package:learn_flowers/providers/flower_provider.dart';
import 'package:learn_flowers/providers/quiz_provider.dart';
import 'package:learn_flowers/providers/settings_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const LearnFlowersApp());
}

class LearnFlowersApp extends StatelessWidget {
  const LearnFlowersApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => FlowerProvider()),
        ChangeNotifierProvider(create: (_) => FavoritesProvider()),
        ChangeNotifierProvider(create: (_) => QuizProvider()),
        ChangeNotifierProvider(create: (_) => SettingsProvider()),
      ],
      child: Consumer<SettingsProvider>(
        builder: (context, settings, _) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Learn Flowers',
            theme: ThemeData(
              primarySwatch: Colors.lightBlue,
              brightness: settings.isDark ? Brightness.dark : Brightness.light,
            ),
            home: const MainNavigationPage(),
          );
        },
      ),
    );
  }
}