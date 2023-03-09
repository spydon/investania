import 'package:flame/game.dart';
import 'package:flame_riverpod/flame_riverpod.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:investania/src/investania_game.dart';

class Investania extends FlameGame with HasComponentRef {
  Investania(WidgetRef ref) {
    HasComponentRef.widgetRef = ref;
  }

  late final RouterComponent router;

  @override
  Future<void> onLoad() async {
    router = RouterComponent(
      initialRoute: 'game',
      routes: {
        'game': Route(InvestaniaGame.new),
      },
    );
    add(router);
  }
}
