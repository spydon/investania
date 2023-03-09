import 'package:flame/experimental.dart';
import 'package:flame/game.dart';

import 'package:investania/src/investania_game.dart';

class Investania extends FlameGame {
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
