import 'package:flame/game.dart';
import 'package:flame_riverpod/flame_riverpod.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:investania/src/investania_game.dart';
import 'package:investania/src/screens/highscore_screen.dart';

class Investania extends FlameGame with HasComponentRef {
  Investania(WidgetRef ref) {
    HasComponentRef.widgetRef = ref;
  }

  late final RouterComponent router;

  @override
  Future<void> onLoad() async {
    router = RouterComponent(
      initialRoute: 'highscore',
      routes: {
        'game': Route(InvestaniaGame.new),
        'highscore': OverlayRoute(
          (context, game) => Highscore(game: this),
        )
      },
    );
    add(router);
  }

  void reset() {
    router.pushOverlay('highscore');
  }
}
