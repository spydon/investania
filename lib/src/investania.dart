import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flame_riverpod/flame_riverpod.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:investania/src/investania_game.dart';
import 'package:investania/src/screens/about.dart';
import 'package:investania/src/screens/menu.dart';

class Investania extends FlameGame
    with HasComponentRef, HasKeyboardHandlerComponents, HasCollisionDetection {
  Investania(WidgetRef ref) {
    HasComponentRef.widgetRef = ref;
  }

  late final RouterComponent router;

  @override
  Future<void> onLoad() async {
    router = RouterComponent(
      initialRoute: 'menu',
      routes: {
        'menu': OverlayRoute(
          (context, game) => Menu(
            context: context,
            router: router,
          ),
        ),
        'about': OverlayRoute(
          (context, game) => About(
            router: router,
          ),
        ),
        'game': Route(InvestaniaGame.new),
      },
    );
    add(router);
  }
}
