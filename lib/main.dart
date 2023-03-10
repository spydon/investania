import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:investania/src/investania.dart';

void main() async {
  runApp(const ProviderScope(child: _GameApp()));
}

class _GameApp extends ConsumerWidget {
  const _GameApp();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.dark,
      home: GameWidget<Investania>.controlled(
        gameFactory: () => Investania(ref),
      ),
    );
  }
}
