import 'package:flutter/material.dart';
import '../widgets/game_area.dart';

class GameScreen extends StatelessWidget {
  const GameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: GameArea(),
      ),
    );
  }
}