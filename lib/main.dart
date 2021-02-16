import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qoq_flutter/providers/maps_provider.dart';
import 'package:qoq_flutter/screens/final_screen.dart';
import 'package:qoq_flutter/screens/game_screen.dart';
import 'package:qoq_flutter/screens/player_items_screen.dart';
import 'package:qoq_flutter/screens/start_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<MapsProvider>(
            create: (BuildContext context) => MapsProvider()),
      ],
      child: MaterialApp(
          title: 'Quest for the Orb of Quarkus',
          theme: ThemeData(
            primarySwatch: Colors.grey,
            accentColor: Colors.grey,
          ),
          debugShowCheckedModeBanner: false,
          initialRoute: '/start',
          routes: {
            StartScreen.routeName: (ctx) => StartScreen(),
            GameScreen.routeName: (ctx) => GameScreen(),
            PlayerItemsScreen.routeName: (ctx) => PlayerItemsScreen(),
            FinalScreen.routeName: (ctx) => FinalScreen(),
          }),
    );
  }
}
